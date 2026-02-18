# Implementation Tasks: Dioxus Native + Vello Architecture Integration

## Phase 1: Foundation Setup
- [x] **Rust Project Initialization**: Create `systems/visual_cortex/` as a Cargo workspace with Dioxus Native
- [x] **Dependency Vendor**: Add `dioxus`, `dioxus-native`, `vello`, `wgpu`, `naga`, `parley` to Cargo.toml
- [x] **Shader Import**: Create `systems/visual_cortex/shaders/` and populate with core Vello WGSL scripts (`flatten.wgsl`, `binning.wgsl`, `fine.wgsl`)
- [x] **Pipeline Initialization**: Create `systems/visual_cortex/render_context.rs` to initialize the `wgpu` device and queue

## Phase 2: Dioxus Visual Cortex
- [x] **Dioxus App Structure**: Create `systems/visual_cortex/src/main.rs` with Dioxus Native app entry point
- [x] **Vello Renderer Integration**: Implement `VelloRenderer` class that accepts a display list and encodes GPU commands
- [x] **Text Integration**: Integrate `Parley` for Rust-based text shaping and rendering
- [x] **Windowing**: Create `winit` surface binding for Dioxus Native window
- [x] **Component Library**: Create reusable Dioxus components for Geometry OS UI elements

## Phase 3: Bionic Bridge (Python ↔ Rust)
- [x] **Shared Memory Interface**: Extend `systems/health/software_shm.py` to support Rust-Python state synchronization
- [x] **FFI Bindings**: Create `systems/visual_cortex/ffi/` with PyO3 bindings for Python-Rust communication
- [x] **State Sync Protocol**: Define protocol for Python Neural Cortex to drive Rust Visual Cortex at 60Hz

## Phase 4: Subsecond Hot-Patching
- [x] **Dioxus Hot Reload**: Enable Dioxus Subsecond Hot-Patching for live component updates
- [x] **Shader Watcher**: Implement `ShaderReloader` in `systems/visual_cortex/hot_reload.rs`
- [x] **Pipeline Rebuild**: Ensure `RenderPipeline` is recreated seamlessly when shaders change
- [x] **Crash Resilience**: Wrap shader compilation in try/catch to prevent OS crash on syntax error
- [x] **Visual Feedback**: Implement "glitch" or "shimmer" effect during hot-patch events

## Phase 5: WGSL Compute Shaders
- [x] **Path Reduction**: Implement `path_reduce.wgsl` for bounding box calculations
- [x] **Path Scan**: Implement `path_scan.wgsl` for parallel prefix sum sorting
- [x] **Tile Allocation**: Implement `tile_alloc.wgsl` for segment-to-tile assignment
- [x] **Fine Rasterization**: Implement `fine_enhanced.wgsl` for coverage and winding number per pixel
- [x] **Neural Shaders**: Create "Neural Shaders" that live inside UI components

## Phase 6: Integration
- [x] **PixelRTS Hook**: Connect the final `TextureView` output to the `PixelRTS` input buffer
- [x] **Evolution Daemon Integration**: Connect Evolution Daemon to hot-patching system for real-time mutations
- [x] **Demo Scene**: Create `demo_dioxus_ui.rs` showing a high-performance animated UI (e.g., 1000 bouncing circles or a complex gradient path)
- [x] **Performance Benchmarking**: Measure and verify 120+ FPS for complex vector scenes
- [x] **PAS Verification**: Implement Phase Alignment Stability verification for Hilbert Curve mapping

## Phase 7: Documentation & Testing
- [x] **Architecture Documentation**: Document the Bionic Architecture layers and their interactions
- [x] **API Documentation**: Document Python-Rust FFI API and state synchronization protocol
- [x] **Unit Tests**: Create comprehensive tests for rendering pipeline, hot-patching, and bridge
- [x] **Integration Tests**: Test end-to-end flow from Python state to Rust rendering
