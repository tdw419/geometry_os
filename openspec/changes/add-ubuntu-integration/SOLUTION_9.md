# Solution for Task: **Visual Mapping**

Introduction:

The OpenSpec task "Ubuntu Substrate Integration" aims to enable Ubuntu integration into the Geometry OS Infinite Map Compositor. This is done through implementing the following objectives:

1. XWayland implementation for handling legacy X11 applications;
2. Standard desktop wrapper for Ubuntu's GNOME/apps;
3. Spatial mapping of Ubuntu apps to specific coordinates on the infinite Hilbert plane; and
4. Visual continuity between Host (Ubuntu) and Guest (Geometry OS).

Technical Requirements:

1. Compiler: `systems/infinite_map_rs` is required for compiling the InfinitE Map Compositor source code.
2. Display Connection: `WAYLAND_DISPLAY=geometry-0` is needed to initialize XWayland on Ubuntu, which enables Geometry OS integration.
3. Coordination: `UbuntuIntegrationAgent` (New Area Agent) is required for coordination between the Rusht compositor and Ubuntu's X11 applications.

Success Criteria:

1. XWayland is initialized successfully by the Rusht compositor.
2. A standard Ubuntu app (e.g., `gnome-terminal`) renders a specific coordinate on the infinite Hilbert plane.

Technical Requirements for Success Criteria 1:

1. Compiler: `systems/infinite_map_rs` is required for compiling the InfinitE Map Compositor source code.
2. Display Connection: `WAYLAND_DISPLAY=geometry-0` is needed to initialize XWayland on Ubuntu, which enables Geometry OS integration.
3. Coordination: `UbuntuIntegrationAgent` (New Area Agent) is required for coordination between the Rusht compositor and Ubuntu's X11 applications.

Success Criteria 2:

1. A standard Ubuntu app (e.g., `gnome-terminal`) renders a specific coordinate on the infinite Hilbert plane.

Technical Requirements for Success Criteria 2:

1. Compiler: `systems/infinite_map_rs` is required for compiling the InfinitE Map Compositor source code.
2. Display Connection: `WAYLAND_DISPLAY=geometry-0` is needed to initialize XWayland on Ubuntu, which enables Geometry OS integration.
3. Coordination: `UbuntuIntegrationAgent` (New Area Agent) is required for coordination between the Rusht compositor and Ubuntu's X11 applications.

Successful Testing Strategy:

1. Compile the InfinitE Map Compositor source code.
2. Run the InfinitE Map Compositor with `WAYLAND_DISPLAY=geometry-0` as the display connection.
3. Use a standard Ubuntu app (e.g., `gnome-terminal`) to render a specific coordinate on the infinite Hilbert plane.
4. Record the rendered image and analyze its features, such as text or shapes, using visual recognition tools like OCR or ImageMagick.
5. Compare the recorded image with the rendered image from Ubuntu's X11 application to ensure continuity between Host (Ubuntu) and Guest (Geometry OS).
6. Evaluate the success of the integration by verifying that the rendered image from a standard Ubuntu app renders a specific coordinate on the infinite Hilbert plane.