FROM node:alpine

RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main/" > /etc/apk/repositories
RUN apk update && apk add python make tzdata \
    && rm -f /etc/localtime \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY . .
#  为了快
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install --only=production

CMD [ "node","video.js"]