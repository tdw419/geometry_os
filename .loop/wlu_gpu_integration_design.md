# WLU GPU Integration Design

**Status**: DESIGN (Attempt 1)
**Complexity**: 4
**Impact**: HIGH
**Created**: 2026-03-18

## Problem

The App struct uses CPU-based `WaveLogicUnit` for wave simulation, but a complete GPU implementation exists in `backend/drm/wlu_compute.rs` (10/10 tests passing). Need to integrate GPU version for performance.

## Architecture Mismatch

**Current State**:
- App uses **wgpu** for rendering (portable, high-level)
- WluGpuResources uses **DRM/GBM** for compute (Linux-specific, low-level)
- No bridge between the two backends

**Challenge**: DrmDevice (required by WluGpuResources) is not available in App's wgpu context.

## Integration Options

### Option A: wgpu Compute Implementation (Recommended)
- Create `WluWgpuResources` using wgpu compute shaders
- Reuse WGSL shader from `wave_propagation.wgsl`
- Direct integration with App's existing wgpu device
- **Pros**: Native integration, portable, simpler
- **Cons**: Duplicates some DRM work

### Option B: Backend Bridge
- Share GPU memory between DRM and wgpu
- Use Vulkan interop or DMA buffers
- **Pros**: Reuses DRM implementation
- **Cons**: Complex, Linux-only, fragile

### Option C: Trait Abstraction
- Define `WaveLogicBackend` trait
- Implement for CPU (WaveLogicUnit), DRM (WluGpuResources), and wgpu (new)
- App uses trait object, switches at runtime
- **Pros**: Most flexible
- **Cons**: Most work

## Recommended Path

**Phase 1**: Create `WaveLogicBackend` trait
```rust
pub trait WaveLogicBackend {
    fn update(&mut self, dt: f32);
    fn get_sensor_value(&self) -> f32;
    fn set_oscillator_frequency(&mut self, index: usize, freq: f32);
    // ... common methods
}
```

**Phase 2**: Implement trait for existing CPU `WaveLogicUnit`

**Phase 3**: Create wgpu-based `WluWgpuResources`:
- Port WGSL compute shader to wgpu
- Use App's existing device/queue
- Implement trait

**Phase 4**: Update App to use trait:
```rust
pub wave_logic_unit: Option<Box<dyn WaveLogicBackend>>,
```

**Phase 5**: Runtime backend selection based on GPU capabilities

## Files to Modify

1. `systems/infinite_map_rs/src/wave_logic_unit.rs` - Add trait, impl for CPU
2. `systems/infinite_map_rs/src/backend/wgpu/wlu_wgpu.rs` - New file
3. `systems/infinite_map_rs/src/app.rs` - Use trait, add GPU backend
4. `systems/infinite_map_rs/src/main.rs` - Backend selection logic

## Success Criteria

- [ ] Trait defined with all common operations
- [ ] CPU implementation passes existing tests
- [ ] wgpu implementation created and tested
- [ ] App can switch between backends
- [ ] Performance improvement measured

## Notes

- DRM implementation is valuable for bare-metal scenarios (Phase 51)
- wgpu implementation better for current App architecture
- Both can coexist with trait abstraction
- Start with trait definition as lowest-risk first step

## Next Action

Define `WaveLogicBackend` trait in `wave_logic_unit.rs` with methods matching current CPU API.
