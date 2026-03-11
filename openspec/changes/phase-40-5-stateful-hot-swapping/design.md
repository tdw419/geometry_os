# Design: Phase 40.5 - Stateful Hot Swapping

## Architecture

### 1. The Vat (State Management)
We will introduce a `Vat` system (inspired by capability-based naming). Each active tile on the map will have an associated `Vat` ID in the **Shared Memory (Software SHM)**.
- **Location**: `systems/health/state_vats/`
- **Format**: Protobuf or raw binary with a version-aligned header.

### 2. The Dynamic Bridge (Rust)
The compositor will use a `ModuleManager` to handle the lifecycle of hot-swappable components.
- **Reloader**: A file watcher that triggers on `.so` or `.rts.png` updates.
- **Entry Points**:
    - `module_init(vat_ptr: *mut u8)`
    - `module_update()`
    - `module_suspend(vat_ptr: *mut u8)`

### 3. Visual transition Shader
A new WGSL shader will be added to the `Renderer` to handle "Morphing" states.
- **Effect**: A pixelation-to-fluid transition (Metaballs effect) centered on the swapping tile.
- **Duration**: ~500ms (to mask the load latency).

## Data Flow
1. **Foundry** completes a build and generates `new_module.so`.
2. **Compositor** detects the change.
3. **Compositor** calls `old_module.module_suspend()`.
4. **Old Module** packs its state into `VAT_{ID}`.
5. **Compositor** replaces the module handle.
6. **Compositor** calls `new_module.module_init(VAT_{ID})`.
7. **New Module** resumes from the exact state of the predecessor.
