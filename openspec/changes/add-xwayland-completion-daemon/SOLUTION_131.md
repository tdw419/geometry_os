# Solution for Task: Tab navigation support

[Meta Data]
- Proposaal ID: `add-xwayland-completion-daemon`
- Status: Draft
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

[Overview]
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon will use Smithay compositors for input focus coordination and surface mapping.

[Problem Statement]
The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
- XwmHandler trait - X11 window management callbacks
- Windoing decoration rendering - Title bars, borders, buttons
- Input focus coordination - Keyboard/mouse routing
- Surface mapping - X11 surfaces → Wayland surfaces → Window particles.
This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

[Problem Statement]
The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
- XwmHandler trait - X11 window management callbacks
- Windoing decoration rendering - Title bars, borders, buttons
- Input focus coordination - Keyboard/mouse routing
- Surface mapping - X11 surfaces → Wayland surfaces → Window particles.
This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

[Proposal]
Here is a proposed solution to meet the problem statement:

- The daemon will create or modify files as necessary, e.g.:
  - A file for XwmHandler trait implementation
  - A script that runs `python3 xwmhandler.py` (to generate the trait)

The daemon will also provide a 'Next Step' command to the user:
- For XwmHandler trait implementation, the user can run `python3 xwmhandler.py -t` to create a new file for this task.
- For Windoing decoration rendering, the user can run `python3 wm_decorator.py -c` to modify an existing file.
- For Input focus coordination, the user can run `python3 wm_focus_coordination.py` to create a new file or modify an existing one.
- For Surface mapping, the user can run `python3 surface_mapping.py -l x11` (to generate the LM Studio code) or `python3 surface_mapping.py -c` (to modify an existing surface).

To complete the daemon, the following steps will be taken:
- Smithay Compositor integration: Create a new Python module that complements Smithay's existing compositor modules, providing additional functionality for XWayland integration.
- LM Studio integration: Add support for Smithay's AI-powered compositors in LM Studio to generate the missing code.
- X11 and Wayland integration: Create a Python script that takes care of the input focus coordination and surface mapping tasks, using the generated Smithay Compositor modules as needed.

[Next Step]
The user will be provided with a brief snippet of the Python or Rust code required for the task at hand. They can then run this command to generate the missing code:
```bash
python3 {script_name} -t
```
This will create a new file (if necessary) or modify an existing one, depending on the task being completed.

[Next Step]
To complete the integration, the user can use the `next_step` command to run the daemon's script with the correct arguments:
```bash
python3 {daemon_script} -t
```
This will generate the missing code for XWayland/Ubuon integration tasks.

[Next Step]
The user can also use the `additional_step` command to run additional scripts or modules that are not included in the daemon's script:
```bash
python3 {daemon_script} -t -c
```
This will generate the missing code for XWayland/Ubuon integration tasks, along with Smithay Compositor modules.

[Next Step]
To ensure that the daemon is working as expected, the user can use `check_step` to run a test script and get feedback:
```bash
python3 {daemon_script} -t -c -t
```
This will generate the missing code for XWayland/Ubuon integration tasks, along with Smithay Compositor modules. The daemon's check step will return a success message if everything is working as expected.

[Next Step]
To run the daemon in a Docker container, the user can use `docker-compose` to create and run a simple environment:
```bash
docker-compose up -d
```
This will create a Docker environment that includes the Smithay Compositor modules, LM Studio integration, and the XWayland/Ubuon daemon. The daemon's script will be run inside the container.

[Next Step]
To run the daemon on a system with specific requirements, the user can use `docker-machine` to create an SSH tunnel to the Docker environment:
```bash
docker-machine ssh dockerized
```
This will connect the user's SSH client to the Docker daemon running inside the Docker container. The daemon's script will be run outside of the container and the results will be transferred back to the host machine.

[Next Step]
To run the daemon on multiple systems, the user can use `docker-compose` to create a multi-machine environment:
```bash
docker-compose -f docker-compose.yml up -d --remove-orphans
```
This will create a Docker environment that includes the Smithay Compositor modules, LM Studio integration, and the XWayland/Ubuon daemon. The daemon's script will be run on each machine in the environment.