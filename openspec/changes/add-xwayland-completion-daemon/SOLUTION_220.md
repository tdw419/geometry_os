# Solution for Task: Architecture diagrams

#### Meta Data
- Proposaal ID: `add-xwayland-completion-daemon`
- Status: Drafter
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

#### Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should use Python or Rust to create this code, and provide a clear step-by-step guide for users to follow.

#### Problem Statement
The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
- XwmHandler trait - X11 window management callbacks
- Windoow decoration rendering - Title bars, borders, buttons
- Input focus coordination - Keyboard/mouse routing
- Surface mapping - X11 surfaces → Wayland surfaces → Window particles.

#### Proposal
Here are the file paths and Python or Rust code required for this task:

1. `XwmHandler`: This trait defines the function signature that is called by LM Studio when it spawns a new window. The trait requires two parameters, the parent window (`Window`), and the child window (`Window`). The XWayland implementation of this trait takes care of creating the window and setting up its properties (such as title bar, border, buttons).
   ```python
   from lm_studio.wm import XwmHandler
   
   class MyXwmHandler(XwmHandler):
       def __init__(self, parent: Window, child: Window):
           super().__init__(parent)
           
       def _create_window(self, window: Window) -> None:
           # Create window and set up its properties.
   ```
   2. `WindoerDecoration`: This trait defines the function signature that is called by LM Studio when it renders a surface (i.e. A window particle). The trait requires two parameters, the surface (`Surface`), and a dictionary of settings (`settings`). The XWayland implementation of this trait takes care of painting the window's decorations and setting their properties.
   ```python
   from lm_studio.wm import WindoerDecoration
   
   class MyWinDoerDecorator(WindoerDecoration):
       def __init__(self, surface: Surface, settings: dict):
           super().__init__(surface)
           
       def _draw_decoration(self, dc: GraphicsContext):
           # Paint window decorations.
   ```
   3. `InputFocusCoordination`: This trait defines the function signature that is called by LM Studio when it receives input focus. The trait requires two parameters, the parent window (`Window`), and the current focused window (`Window`). The XWayland implementation of this trait takes care of ensuring that only one window (the current focused window) has keyboard/mouse focus at a time.
   ```python
   from lm_studio.wm import InputFocusCoordination
   
   class MyInputFocusCoordinator(InputFocusCoordination):
       def __init__(self, parent: Window, focused: Window):
           super().__init__(parent)
           
       def _on_focus_change(self, new_focused: Window) -> None:
           # Handle input focus change.
   ```
   4. `SurfaceMapping`: This trait defines the function signature that is called by LM Studio when it maps a surface to another window (e.g. A button to a window particle). The trait requires two parameters, the source surface (`Surface`), and a destination window (`Window`). The XWayland implementation of this trait takes care of updating the source surface's properties based on the destination window's settings.
   ```python
   from lm_studio.wm import SurfaceMapping
   
   class MySurfaceMapping(SurfaceMapping):
       def __init__(self, source: Surface, dest: Window):
           super().__init__(source)
           
       def _map_surface(self, surface: Surface) -> None:
           # Update source surface's properties based on destination window settings.
   ```

#### Next Steps
- [ ] Create a directory `xwayland` in your project root directory.
- [ ] Add the following lines to your `README.md`:
  - A brief snippet of what this daemon does.
  - Links to the Geometry OS repo and the Ubuunt integration issue tracker.
  
#### Step-By-Step Guide for Users
1. Follow the steps in the [Geometry OS repo](https://github.com/geometry-os/GeometryOS#building) to build a GeometryOS image for your environment. This should include installing Rust, Python, and all necessary dependencies (such as LibX11, X11R6, and LM Studio).
2. Create an SSH connection between the host machine and the Geometry OS image.
3. Log in to the host machine and navigate to the `xwayland` directory.
4. Run the `make` command to create a new daemon executable:
   ```shell
   cd xwayland
   make
   ```
5. Navigate to the `out/bin` directory, and run the daemon with the `-h` flag for help:
   ```shell
   ./out/xwayland -h
   ```
6. Run the daemon with the desired command (e.g. `add-lm-studio-compositor-completion-daemon`) and specify the Python or Rust code to be created by adding a comment at the start of the file:
   ```shell
   ./out/xwayland add-lm-studio-compositor-completion-daemon -c my_code.py
   ```
7. Once the daemon has been started, you can create a new XWayland window using your preferred compositing tool of choice (such as LM Studio or Wayfire). 
8. You should now have an XWayland/Ubuuntu integration code that automatically generates missing X11 window management callbacks for missing LM Studio features, such as Title bars, Border, and Buttons.
9. If you want to learn more about LM Studio, you can refer to their [documentation](https://lm-studio.readthedocs.io/en/latest/) or try out their [Ubuunt integration tutorial](https://www.youtube.com/watch?v=c3784pRq2b0).
10. If you need help with any other Geometry OS software, feel free to ask in the Geometry OS issue tracker: https://github.com/geometry-os/GeometryOS/issues
