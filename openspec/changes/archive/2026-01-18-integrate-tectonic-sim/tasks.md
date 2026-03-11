# Tasks: Integrate Tectonic Sim

- [x] **Implementation**: Add `inject_qemu_ram` method to `TectonicSimulator` to update specific texture regions (Outer Ring) with raw bytes.
- [x] **Implementation**: Initialize `SharedMemoryBridge` in `InfiniteMapApp` and call `inject_qemu_ram` in the update loop.
- [x] **Implementation**: Implement `kill_pixel` in `TectonicSimulator` (queue write to single pixel).
- [x] **Implementation**: Handle `MouseInput` in `app.rs` to trigger `kill_pixel`.
- [x] **Verification**: Boot QEMU (or mock), see new texture data in Outer Ring.
- [x] **Verification**: Click a pixel, watch it die (turn black/spread entropy).
