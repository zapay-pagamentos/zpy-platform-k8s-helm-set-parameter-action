FROM 071032557399.dkr.ecr.sa-east-1.amazonaws.com/dockerhub/alpine:3.18

LABEL "com.github.actions.name"="Helm Set Image Tag Action"
LABEL "com.github.actions.description"="A Github Action for automatically updating a Helm template image tag"
LABEL "com.github.actions.icon"="arrow-up"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/Nextdoor/helm-set-image-tag-action"
LABEL "homepage"="https://github.com/Nextdoor/helm-set-image-tag-action"

RUN apk --no-cache add bash yq git patch py-pip py3-ruamel.yaml gcc musl-dev python3-dev
RUN pip install pybump yamale yamllint pyyaml

COPY --from=071032557399.dkr.ecr.sa-east-1.amazonaws.com/dockerhub/alpine/helm:latest /usr/bin/helm /usr/bin/helm
COPY --from=071032557399.dkr.ecr.sa-east-1.amazonaws.com/dockerhub/jnorwood/helm-docs:v1.11.3 /usr/bin/helm-docs /usr/bin/helm-docs

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]