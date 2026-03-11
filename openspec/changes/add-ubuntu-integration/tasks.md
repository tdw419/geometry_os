# Tasks: Ubuntu Substrate Integration

- [x] **Infrastructure Update**
    - [x] Add `xwayland` feature to `smithay` dependency in `systems/infinite_map_rs/Cargo.toml`.
    - [x] Update `compositor_state.rs` to include XWayland state handlers.
- [x] **Protocol Implementation**
    - [x] Implement `XWaylandHandler` in the Rust compositor.
    - [x] Create `UbuntuIntegrationAgent` in `systems/agents/`.
- [x] **Visual Mapping**
    - [x] Define default "Ubuntu District" coordinates on the infinite map (e.g., `-2000, -2000`).
    - [x] Implement texture mapping for XWayland buffers.
- [x] **Validation**
    - [x] Test launching `xclock` inside Geometry OS.
    - [x] Test launching `gnome-terminal`.
