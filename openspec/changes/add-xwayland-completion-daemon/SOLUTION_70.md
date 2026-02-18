# Solution for Task: Create prompt with property context

[MetaData]
- Proposaal ID: add-xwayland-completion-daemon
- Status: Draft
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: [add-lm-studio-compositor-completion-daemon](../add-lm-studio-compositor-completion-daemon), [add-ubuntu-integration](../add-ubuntu-integration)

[Overview]
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuxt integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should use Smithay compositors' existing patterns in creating window decoration rendering, keyboard/mouse routing, and surface mapping logic.

[Problem Statement]
The Ubuxt integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. XwmHandler trait - X11 window management callbacks
2. Windoing decoration rendering - Title bars, borders, buttons
3. Input focus coordination - Keyboard/mouse routing
4. Surface mapping - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-established patterns in Smithay compositors.

[Proposed Solution]
To create the required AI-powered daemon, follow these steps:
1. Create a Python file with the following contents:
```python
import smithay_wayland_compositor
from smithay_wayland_compositor import XwmHandler
from smithay_wayland_compositor.input_manager import InputManager

# Initialize our Wayland Compositor with custom XWayland/Ubuxt integration
wc = smithay_wayland_compositor.Compositor()
wc.init(XwmHandler())

# Create a new X Window Manager instance using the Compositor's window manager
xcm = smithay_wayland_compositor.X11WindowManager(wc)

# Create a new input manager instance to handle X11 keypresses and mouse clicks
input_manager = smithay_wayland_compositor.InputManager(xcm)
```
2. Next, create a shell script that runs this Python file:
```bash
#!/bin/sh
python3 -m smithay_wayland_completion_daemon \
  --file-paths="path1 path2 ..." \
  --script-args='--smithay-compositor=Wayland' \
  --command="XwmHandler()"
```
3. Add the `add-xwayland-completion-daemon` draft to your existing OpenSpec tasks list, and add the Python file path to the `file_paths` array:
```
Proposaal: XWayland Completion Daemon
    ...
    Next Step: Create Python file with contents:
        import smithay_wayland_compositor
        from smithay_wayland_compositor import XwmHandler
        from smithay_wayland_compositor.input_manager import InputManager
    
        # Initialize our Wayland Compositor with custom XWayland/Ubuxt integration
        wc = smithay_wayland_compositor.Compositor()
        wc.init(XwmHandler())
        
        # Create a new X Window Manager instance using the Compositor's window manager
        xcm = smithay_wayland_compositor.X11WindowManager(wc)
    
        # Create a new input manager instance to handle X11 keypresses and mouse clicks
        input_manager = smithay_wayland_compositor.InputManager(xcm)
        
    ...
```
4. Run the shell script with the `add-xwayland-completion-daemon` draft in your existing OpenSpec tasks list, and provide the Python file path to the `file_paths` array:
```
Adding XWayland Completion Daemon to OpenSpec Tasks
    ...
    Next Step: Create Python file with contents:
        import smithay_wayland_compositor
        from smithay_wayland_compositor import XwmHandler
        from smithay_wayland_compositor.input_manager import InputManager
    
        # Initialize our Wayland Compositor with custom XWayland/Ubuxt integration
        wc = smithay_wayland_compositor.Compositor()
        wc.init(XwmHandler())
        
        # Create a new X Window Manager instance using the Compositor's window manager
        xcm = smithay_wayland_compositor.X11WindowManager(wc)
    
        # Create a new input manager instance to handle X11 keypresses and mouse clicks
        input_manager = smithay_wayland_compositor.InputManager(xcm)
        
    ...
```
5. Test your daemon with the shell script, providing the Python file path as an argument:
```
python3 -m smithay_wayland_completion_daemon --file-paths="path1 path2 ..."
```
6. Once you have a working daemon, follow the same steps to create a `Next Step` command for the user that prompts them to provide the Python file path. The script should prompt the user to select or enter the filename of the Python file, and then run it with the necessary arguments.