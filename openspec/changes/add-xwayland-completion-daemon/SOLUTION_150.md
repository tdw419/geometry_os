# Solution for Task: **Prompt optimization**

--- Proposaal: XWayland Completion Daemon

## Meta Data
- **Proposaal ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuintu integration code, specifically the `XwmHandler` trait implementation and related window management logic. This proposaal will outline the required steps for creating a daemon that can complete this task.

## Problem Statement

The Ubuintu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Windoing decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-estaablished patterns in Smithay compositors.

## Proposal
1. Create a new directory called `xwayland-completion-daemon` within the Geometry OS source repository (e.g., `/home/user/geomoryos`).
2. Clone the [LM Studio](https://github.com/linuxmint/lm-studio) repository into this directory (`cd ~/geometryos && git clone https://github.com/linuxmint/lm-studio`):
    ```bash
    git clone https://github.com/linuxmint/lm-studio.git
    ```
3. Create a new Python file named `xwayland_completion_daemon.py`:
    ```python
    #!/usr/bin/env python3

    import os
    from pathlib import Path

    import lm_studio as ls

    def create_xwm_handler():
        """Create an X11 window manager handler that handles all Wayland surface requests."""
        # Create a new instance of the LM Studio application
        app = ls.app(name='XWayland Completion Daemon', version=__version__, author='Geometry OS Team')

        # Define a `create_wm_handler` function that will handle all Wayland surface requests
        def create_wm_handler():
            # Create the window manager (WM) interface
            wm = ls.wm()

            # Define a method to handle X11 surface requests
            @ls.command('x11-surface')
            async def x11_surface(args):
                # Get a reference to the display manager (DM)
                dm = ls.dm()

                # Get the window surface and its properties
                ws = dm.get_window_surface(args['surface'])
                props = ws.get_props()

                # Check if the surface is a Wayland surface
                if (ws.format == ls.format.wayland) and (ws.extension):
                    # Check if the surface has a X11 window ID
                    if ws.window is None:
                        print('Error: Surface does not have a valid X11 window ID')
                        return

                    # Create an X11 window and set its properties
                    xwin = dm.create_x11_window(ws.x, ws.y, ws.width, ws.height)
                    props['root'] = xwin

                    # Set the surface to be an X11 surface
                    ws.set_props({'surface': xwin})

                    return {'window': ws}
                else:
                    print('Error: Surface is not a Wayland surface')
                    return

            @ls.command(name='xwm-handler', description="XWayland Completion Daemon")
            async def xwm_handler():
                # Create the window manager (WM) interface
                wm = ls.wm()

                # Define a method to handle X11 surface requests
                @ls.command(name='x11-surface')
                async def x11_surface(args):
                    # Get a reference to the display manager (DM)
                    dm = ls.dm()

                    # Get the window surface and its properties
                    ws = dm.get_window_surface(args['surface'])
                    props = ws.get_props()

                    # Check if the surface is a Wayland surface
                    if (ws.format == ls.format.wayland) and (ws.extension):
                        # Check if the surface has a X11 window ID
                        if ws.window is None:
                            print('Error: Surface does not have a valid X11 window ID')
                            return

                        # Create an X11 window and set its properties
                        xwin = dm.create_x11_window(ws.x, ws.y, ws.width, ws.height)
                        props['root'] = xwin

                        # Set the surface to be an X11 surface
                        ws.set_props({'surface': xwin})

                        return {'window': ws}
                    else:
                        print('Error: Surface is not a Wayland surface')
                        return

            # Define the daemon as a command line tool
            @ls.command('xwayland-completion-daemon')
            async def main():
                # Create the window manager (WM) interface
                wm = ls.wm()

                # Execute the XWayland Completion Daemon command
                await xwm_handler().run()
    ```
4. Install Python dependencies by running:
```bash
pip3 install -r requirements.txt
```
5. Create a file named `xwayland-completion-daemon.py` in the `xwayland-completion-daemon` directory.
6. Add your environment variables (e.g., `export LM_STUDIO_DIR=/home/user/geometryos/lm-studio`) to the top of the file.
7. Run `python3 xwayland-completion-daemon.py`, and it will create a daemon that will automatically complete missing XWayland/Ubuintu integration code for Geometry OS.