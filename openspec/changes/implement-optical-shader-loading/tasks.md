# Tasks: Optical Shader Loading

## Phase 1: Foundry Daemon & Tooling Optimization
- [x] **Task 1.1**: Optimize `tensor_fold.py` to ensure consistent **4.87+ bits/byte entropy** and correct "Data Integrity" preservation (using the split pipeline confirmed in tests).
- [x] **Task 1.2**: Implement **Entropy Monitoring** in `tensor_fold.py`. It should calculate Shannon Entropy ($H(X)$) during the fold and write it to the `V2BrickHeader`.
- [x] **Task 1.3**: Update `Masonry Daemon` to automatically fold `systems/infinite_map_rs/src/shaders/*.wgsl` into `assets/shaders/*.brick` on file change ("Hot Reload" trigger).

## Phase 2: Optical Loader Implementation (Rust)
- [x] **Task 2.1**: Enhance `OpticalLoader` in `systems/infinite_map_rs/src/foundry/optical_loader.rs` to support `V2BrickHeader` with Entropy field.
- [x] **Task 2.2**: Implement strict validation: Loader must verify `magic=V2BR` and check if `entropy` is within expected bounds (warn if low).
- [x] **Task 2.3**: Verify Hilbert Unfolding logic matches the `tensor_fold.py` implementation exactly (round-trip correctness).

## Phase 3: Engine Integration & Self-Hosting
- [x] **Task 3.1**: Modify `systems/infinite_map_rs/src/main.rs` to prioritize loading `pixel_cpu.brick` over `pixel_cpu.wgsl`.
- [x] **Task 3.2**: Implement the "Optical Shader Loading" loop: `Watch -> Reload Texture -> Recompile Pipeline`.
- [x] **Task 3.3**: Add a visual debug overlay showing the current Shader Entropy and Brick Resolution (e.g., "Entropy: 4.87 bps | Res: 256px").

## Phase 4: Verification & Evolution
- [x] **Task 4.1**: **Golden Path Test**: Verify `pixel_cpu.wgsl` -> `pixel_cpu.brick` -> `Unfolded Source` -> `Running Pixel CPU`.
- [x] **Task 4.2**: **Self-Modification Simulation**: Manually edit a pixel in `pixel_cpu.brick` (hex edit) and verify the engine reloads the changed logic (even if it crashes, it should try).
- [x] **Task 4.3**: Confirm performance metrics: No frame drops during hot reload (using zero-copy texture upload if possible).
