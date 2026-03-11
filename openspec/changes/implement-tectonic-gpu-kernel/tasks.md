# Tasks: Implement Tectonic GPU Kernel

- [x] **Implementation**: Create `systems/infinite_map_rs/src/shaders/tectonic_kernel.wgsl` with `update_system` entry point implementing the "Starvation/Healing/Decay" logic.
- [x] **Implementation**: Modify `InfiniteMapApp` struct in `app.rs` to include `compute_pipeline` and `bind_groups` for the simulation.
- [x] **Implementation**: Implement the "Ping-Pong" double buffering for the state texture (Texture A -> Compute -> Texture B -> Render -> Texture A).
- [x] **Verification**: Visual confirmation of "Green/Red" pixels evolving and moving on the map.
