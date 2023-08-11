FROM node:alpine as frontend

WORKDIR /app
LABEL version="1.0.0"
LABEL maintener="Victor Monday"

COPY package.json .
COPY . .

RUN npm i
RUN npm run build

FROM nginx
EXPOSE 80

COPY --from=frontend /app/build /usr/share/nginx/html