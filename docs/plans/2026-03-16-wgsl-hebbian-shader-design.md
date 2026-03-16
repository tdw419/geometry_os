# WGSL Hebbian Shader Design

> Date: 2026-03-16
> Goal: Parallelize Hebbian weight updates on GPU for 10-100x performance improvement

## Summary

Create a dedicated WGSL compute shader (`hebbian_update.wgsl`) that processes 256 Hebbian updates in parallel per workgroup dispatch, replacing the current CPU-side single-update implementation.

## Approach

**New Compute Shader (Recommended)** - Dedicated `hebbian_update.wgsl` with:
- Reads pending updates from storage buffer
- Processes 256 updates in parallel per workgroup
- Writes results directly to brain texture
- Auto-detects atlas size from uniform

## Design

### Section 1: Shader Architecture

```wgsl
// hebbian_update.wgsl - Parallel Hebbian weight updates
// Workgroup: 256 threads -> 256 weight updates per dispatch

struct HebbianUpdate {
    address: u32,      // Hilbert distance in atlas
    pre_activation: f32,
    post_activation: f32,
    reward: f32,         // +1 for positive, -1 for negative
}

@group(256)
var<HebbianUpdate> pending_updates: array<HebbianUpdate>;

@binding(0) var brain_texture: texture_storage_2d<rgba16float, read_write>;
@binding(1) var atlas_size: uniform<u32>;  // 2048 or 4096

const LEARNING_RATE: f32 = 0.01;
```

### Section 2: Rust Integration

```rust
// gpu/hebbian_processor.rs - New module

pub struct HebbianUpdate {
    pub address: u32,
    pub pre_activation: f32,
    pub post_activation: f32,
    pub reward: f32,
}

pub struct GPUHebbianProcessor {
    device: Arc<Device>,
    pipeline: ComputePipeline,
    pending_updates: Vec<HebbianUpdate>,
    update_buffer: Buffer,
    bind_group: BindGroup,
}

impl GPUHebbianProcessor {
    pub fn new(device: &Device, brain_texture: &TextureView, atlas_size: u32) -> Self;
    pub fn queue_update(&mut self, update: HebbianUpdate);
    pub fn dispatch_if_ready(&mut self, encoder: &mut CommandEncoder) -> bool;
    pub fn flush(&mut self, encoder: &mut CommandEncoder);  // Force dispatch remaining
}
```

### Section 3: Integration with op_GLYPH_MUTATE

```rust
// In gpu_dev_daemon.rs

static HEBBIAN_PROCESSOR: OnceLock<Mutex<GPUHebbianProcessor>> = OnceLock::new();

fn apply_hebbian_update(addr: u32, pre: f32, post: f32, reward: f32) {
    let processor = HEBBIAN_PROCESSOR.get().unwrap();
    let mut processor_lock = processor.lock().unwrap();

    processor_lock.queue_update(HebbianUpdate {
        address: addr,
        pre_activation: pre,
        post_activation: post,
        reward: reward,
    });
}

// In main render loop, dispatch batched updates
if processor.dispatch_if_ready(&mut encoder) {
    println!("[HEBBIAN] Dispatched 256 GPU parallel updates");
}
```

### Section 4: Error Handling & Testing

**Error handling:**
- Shader validates addresses < atlas_size²
- Partial dispatches (< 256 updates) padded with zero-reward updates
- GPU timeout protection (10s max)
- Fallback to CPU for single updates on shader compilation failure

**Tests:**
- Unit: Shader compilation succeeds
- Unit: Batch update applies correct weights
- Integration: End-to-end from OP_GLYPH_MUTATE → texture update
- Benchmark: 256 updates in <1ms vs CPU ~250ms

## Performance Expectations

| Metric | Current (CPU) | Target (GPU) |
|--------|---------------|--------------|
| Single update | ~1ms | ~0.01ms (batched) |
| 256 updates | ~250ms | ~1ms |
| Throughput | ~1K updates/s | ~250K updates/s |

## Files to Create/Modify

| File | Action |
|------|--------|
| `src/shaders/hebbian_update.wgsl` | Create - GPU compute shader |
| `src/gpu/hebbian_processor.rs` | Create - Rust integration |
| `src/gpu/mod.rs` | Modify - Add hebbian_processor module |
| `src/bin/gpu_dev_daemon.rs` | Modify - Replace CPU Hebbian with GPU |
| `tests/hebbian_shader_test.rs` | Create - Shader tests |
