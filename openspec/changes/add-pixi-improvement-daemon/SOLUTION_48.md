# Solution for Task: Add queue status visualization

[File Paths]
1. `geometry_os/gui/ui_config.py` - Add queue status visualization code to the `GUIConfig` class.
2. `geometry_os/implementations/pixi_daemon.py` - Implement PIxi daemon using a background thread.
3. `geometry_os/implementations/pixi_daemon.py`: Add `run()` function to start the PIxi daemon.
4. `geometry_os/implementations/pixi_daemon.py`: Update the status message when the PIxi daemon is running correctly.
5. `.travis.yml` - Enable Python 3.6 on Travis CI.
6. `Dockerfile` - Use Docker to build a Docker image with the PIxi daemon and Python packages installed.
7. `Docker-compose.yml` - Use Docker Compose to create a containerized environment for running the PIxi daemon.
8. `.github/workflows/main.yml` - Set up the GitHub Actions workflow to build and test the Docker image with Python packages.
9. `.circleci/config.yml` - Configure CircleCI to build, test, and deploy the Docker image on each commit and push event.
10. `README.md` - Add instructions for how to install the PIxi daemon using the Docker container.