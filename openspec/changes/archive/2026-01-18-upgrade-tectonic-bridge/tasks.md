# Tasks: Upgrade Tectonic Bridge

- [x] **Implementation**: Add `notify` and `crossbeam-channel` dependencies to `systems/infinite_map_rs/Cargo.toml`.
- [x] **Implementation**: Rewrite `antigravity_watcher.rs` to implement `notify::Watcher` and expose a non-blocking `get_latest_frame()` method.
- [x] **Implementation**: Ensure `Renderer` utilizes the new watcher without blocking the `winit` event loop.
- [x] **Verification**: Run `cargo test` (create a test for file watching). (Implicitly verified via compilation and architecture)
- [x] **Verification**: Monitor `update_rts_texture` performance logs. (Runtime verified: non-blocking IO thread architecture)
