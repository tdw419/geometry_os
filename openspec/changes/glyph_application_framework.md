# Glyph Application Framework (GAF) - Unify First Strategy

## Objective
Design and implement the **Glyph Application Framework (GAF)** as a unified Rust crate (`systems/glyph_framework_rs`). This crate will serve as the standardized application layer for Geometry OS, abstracting over three distinct execution backends: Python (simulation), WebGPU (browser), and Bare Metal (DRM/AMDGPU). 

## Architecture
By taking the **"Unify First"** approach, we ensure that Glyph programs written once can seamlessly execute in any environment, scaling from rapid prototyping (Python) to production-grade native GPU execution (Bare Metal).

### Core Components
1. **The Component Model (Intent Templates)**
   - Applications define their structure via a standardized set of Glyph templates (`WindowComponent`, `PanelComponent`, etc.).
   - GAF translates these semantic structures into spatial allocations on the Infinite Map.

2. **The Unified API**
   - `spawn_app(name, x, y, w, h) -> AppId`
   - `set_state(app_id, addr, value)`
   - `send_intent(app_id, intent_type, payload)`
   - `draw(app_id, glyph_id, local_x, local_y)`

3. **Backend Abstraction Layer**
   The framework dynamically routes API calls to the chosen backend:
   - **`backend::Python`**: Calls into `glyph_vm.py` over FFI/IPC.
   - **`backend::WebGPU`**: Compiles execution down to WGSL and syncs via WebSockets/WASM.
   - **`backend::BareMetal` (The Truth)**: Directly allocates DMA-BUFs and schedules native AMDGPU compute shaders for zero-copy execution.

4. **Spatial Memory & State**
   - Memory is strictly modeled as 2D spatial buffers. In Bare Metal mode, these buffers map directly to shared CPU/GPU memory, bypassing serialization overhead.

## Implementation Plan

### Phase 1: Rust Crate Initialization & Interfaces
- [ ] Initialize `systems/glyph_framework_rs` using `cargo new --lib`.
- [ ] Define the core traits `AppCoordinator`, `ExecutionBackend`, and `MemorySubstrate`.
- [ ] Implement the `Unified API` structures.

### Phase 2: Backend Shims
- [ ] Implement `backend::Python` using PyO3 or IPC to connect to the existing `glyph_vm.py`.
- [ ] Implement `backend::WebGPU` focusing on WGSL synchronization.
- [ ] Skeleton `backend::BareMetal` with placeholders for DRM interactions.

### Phase 3: The Multi-App Desktop
- [ ] Use GAF to write the first "Desktop App" that spawns child windows (Counter, Terminal).
- [ ] Verify execution consistency across Python and WebGPU backends.

## Next Steps
Initialize the `systems/glyph_framework_rs` crate and set up the trait architecture.
