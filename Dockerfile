FROM node:slim

ENV DEBIAN_FRONTEND noninteractive
  
RUN apt-get update && \
  apt-get install -y \
  chromium \
  xvfb \
  libgconf-2-4 \
  libexif12 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN npm install -g protractor && webdriver-manager update

VOLUME ["/project"]
WORKDIR /project

CMD ["/bin/sh", "-c", "xvfb-run protractor"]
