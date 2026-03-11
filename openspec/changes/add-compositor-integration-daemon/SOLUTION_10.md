# Solution for Task: Add daemon configuration file

[Title: Geometry OS Implementation Agent]

Your task is to provide a concise implementation plan or code solution for the following OpenSpec task:

Change ID: add-compositor-integration-daemon

Context:
The Geometry OS project aims to create a desktop application for geometric geometry. The daemon configuration file will be required to enable and configure the Compositor integration feature on the desktop application.

1. File paths that need to be created or modified
   - `/etc/xdg`: Path to XDG base directory for applications.
   - `/usr/share/applications`: Path to geosktop-compositor.desktop file.

2. A brief snippet of Python code required
   ```python
   from gdk_compositor import Compositor
   # configure the compositor
   c = Compositor()
   c.set_mode(Compositor.MODE_FULLSCREEN)
   c.set_geometry(640, 480, 0)
   ```

3. A "Next Step" command for the user (e.g. Create a file or run a script)
   - Create a file `/etc/xdg/geosktop-compositor.desktop` with the above Python code snippet as the contents.

Format:

1. Title: Geometry OS Implementation Agent
2. Background image: A high-quality image of the GEOS logo or any other suitable graphic related to your project.
3. Introductory paragraph: A brief introduction of what you will be doing and why it's important for the community.
4. Objective: Provide a clear objective for your implementation plan, highlighting the specific tasks and their deadlines.
5. Task 1: Change ID: add-compositor-integration-daemon
6. Task 2: Snippet of Python code required
7. Task 3: Code snippet with "Next Step" command for user (e.g. Create file or run script)
8. Format as clear Markdown