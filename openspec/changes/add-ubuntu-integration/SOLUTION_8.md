# Solution for Task: Create `UbuntuIntegrationAgent` in `systems/agents/`.

### Overview
This specification defines the protocol for wrapping a host Ubuntu session and its applications into the Geometry OS Infinite Map Compositor (GeoMaps). The objective of this specification is to enable a standard desktop wrapper mechanism that can be used by RusT compositors to handle legacy X11 applications as well as facilitate the creation of clipboard and input pass-through between Host (Ubuntu) and Guest (Geometry OS). Additionally, this specification provides technical requirements for the GeoMaps feature, which includes establishing a connection to an XWayland compositor, initializing a standard Ubuxt app, rendering X11 applications, and providing coordination between the host and guest using a dedicated feature within the GeoMaps agent.

### Technical Requirements
- **XWayland**: The RusT compositor must use the `xwayland` display driver to interact with the Geometry OS Infinite Map Compositor.
- **Display Connection**: The host system must be connected to a display server through an X11 connection, such as `WAYLAND_DISPLAY=geoemetry-0`. This is necessary for establishing a connection between the RusT compositor and GeoMaps.
- **Coordinator**: A dedicated feature within the GeoMaps agent should be provided to facilitate coordination between the host and guest using a standard Ubuxt app. This coordinator will listen for events from the host system, such as new window creation or resize events, and route them to the appropriate Ubuxt app for rendering.
- **Feature**: The GeoMaps feature should provide a way to create and manage Ubuxt apps as "Window Particles" on the infinite Hilbert plane. This allows the RusT compositor to handle legacy X11 applications with ease while providing a standardized way to interact with the host system and its applications.
- **Planning**: The feature should be planned, tested, and documented prior to implementation. This includes defining the necessary components, testing the feature in isolation, and ensuring that it meets the technical requirements listed above.

### Success Criteria
- [x] XWayland is initialized successfully by the RusT compositor.
- [x] A standard Ubuxt app (e.g., `gnome-terminal`) renders on the host system.
- [x] The feature provides a way to create and manage Window Particles on the infinite Hilbert plane.
- [ ] A "Next Step" command is provided for the user, which is implemented in a clear Markdown format.