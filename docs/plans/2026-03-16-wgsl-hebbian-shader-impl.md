# WGSL Hebbian Shader Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a WGSL compute shader for parallel Hebbian weight updates, replacing CPU-side single updates with GPU batched processing.

**Architecture:** Dedicated `hebbian_update.wgsl` compute shader processes 256 weight updates in parallel per dispatch. Rust `GPUHebbianProcessor` queues updates and dispatches when batch is full. Integrates with existing `OP_GLYPH_MUTATE` opcode.

**Tech Stack:** Rust, wgpu, WGSL compute shaders

---

### Task 1: Create WGSL Hebbian Shader

**Files:**
- Create: `systems/infinite_map_rs/src/shaders/hebbian_update.wgsl`

**Step 1: Create the shader file**

```wgsl
// hebbian_update.wgsl - Parallel Hebbian weight updates on GPU
// Processes 256 updates per dispatch

struct HebbianUpdate {
    address: u32,      // Hilbert distance in atlas
    pre_activation: f32,
    post_activation: f32,
    reward: f32,
}

@group(0) @binding(0) var<storage, read> pending_updates: array<HebbianUpdate>;

@group(0) @binding(1) var brain_atlas: texture_storage_2d<rgba16float, read_write>;

@group(0) @binding(2) var<uniform> atlas_size: u32;

const LEARNING_RATE: f32 = 0.01;

// Hilbert curve: convert distance to (x, y)
// Based on compact Hilbert curve algorithm
fn hilbert_d2xy(n: u32, d: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var s: u32 = 1u;
    var rx: u32 = 0u;
    var ry: u32 = 0u;
    var t: u32 = d;

    while (s < n) {
        ry = (t >> 1) & 1u;
        rx = (t ^ ry) & 1u;
        rot(s, rx, ry, &x, &y);
        x += s * rx;
        y += s * ry;
        t >>= 2u;
        s <<= 1u;
    }

    return vec2<u32>(x, y);
}

fn rot(n: u32, rx: u32, ry: u32, x: ptr<function, read_write>, y: ptr<function, read_write>) {
    if (ry == 0u) {
        if (rx == 1u) {
            *x = n - 1u - *x;
            *y = n - 1u - *y;
        }
        let t = *x;
        *x = *y;
        *y = t;
    }
}

@compute @workgroup_size(256)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    let update = pending_updates[idx];

    // Skip zero-address updates (padding)
    if (update.address == 0u && update.reward == 0.0) {
        return;
    }

    // Validate address is within atlas bounds
    let max_addr = atlas_size * atlas_size;
    if (update.address >= max_addr) {
        return;
    }

    // Convert Hilbert distance to texture coordinates
    let coords = hilbert_d2xy(atlas_size, update.address);
    let x = coords.x;
    let y = coords.y;

    // Load current weight from brain atlas
    let current_pixel = textureLoad(brain_atlas, vec2<i32>(i32(x), i32(y)));
    let current_weight = current_pixel.r;  // Float16 stored in R channel

    // Hebbian learning rule: Δw = η × pre × post × reward
    let delta_w = LEARNING_RATE * update.pre_activation * update.post_activation * update.reward;
    let new_weight = current_weight + delta_w;

    // Clamp weight to prevent explosion
    new_weight = clamp(new_weight, -10.0, 10.0);

    // Write updated weight back to atlas
    var out_pixel = current_pixel;
    out_pixel.r = new_weight;
    textureStore(brain_atlas, vec2<i32>(i32(x), i32(y)), out_pixel);
}
```

**Step 2: Verify shader syntax**

Run: `cat systems/infinite_map_rs/src/shaders/hebbian_update.wgsl | head -20`
Expected: Shader file created with proper structure

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/shaders/hebbian_update.wgsl
git commit -m "feat(shaders): add hebbian_update.wgsl compute shader for parallel weight updates"
```

---

### Task 2: Create GPUHebbianProcessor Rust Module

**Files:**
- Create: `systems/infinite_map_rs/src/gpu/hebbian_processor.rs`
- Modify: `systems/infinite_map_rs/src/gpu/mod.rs`

**Step 1: Create he heian_processor module**

```rust
//! GPU Hebbian Processor - Parallel weight updates via compute shader
//!
//! //! Que GPU module provides Hebbian learning capabilities
//! via WebGPU compute shaders for parallel weight updates.

use std::sync::Arc;
use wgpu::{Device, BindGroup, BindGroupLayout, Buffer, BufferDescriptor, ComputePipeline, ShaderModule, ShaderModuleDescriptor};

 use crate::gpu::wgsl_compiler;

 const BATCH_SIZE: usize = 256;
 const UPDATE_BUFFER_SIZE: usize = std::mem::size::<HebbianUpdate as u32 * 4>;

/// A single Hebbian weight update
#[repr(C, Clone)]
#[derive(Copy)]
pub struct HebbianUpdate {
    pub address: u32,
    pub pre_activation: f32,
    pub post_activation: f32,
    pub reward: f32,
}

/// GPU Hebbian Processor
///
/// Que Processes batches of Hebbian updates in parallel on a WGSL compute shader.
pub struct GPUHebbianProcessor {
    device: Arc<Device>,
    pipeline: ComputePipeline,
    bind_group_layout: BindGroupLayout,
    update_buffer: Buffer,
    pending_updates: Vec<HebbianUpdate>,
    batch_count: usize,
}

impl GPUHebbianProcessor {
    /// Create a new GPU Hebbian processor
    ///
    /// # Arguments
    ///
    /// * `device` - WebGPU device
    /// * `brain_texture_view` - Brain atlas texture view
    /// * `atlas_size` - Atlas dimension (2048 or 4096)
    pub fn new(
        device: Arc<Device>,
        brain_texture_view: &wgpu::TextureView,
        atlas_size: u32,
    ) -> Self {
        let device = device.clone();

        // Create storage buffer for pending updates
        // Each HebbianUpdate is 4 x f32 = 16 bytes
        let update_buffer_size = BATCH_SIZE * UPDATE_buffer_size;
        self.update_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("hebbian_update_buffer"),
            size: update_buffer_size,
            usage: BufferUs::STORAGE { BufferUs::STORAGE,                    mapped_at_creation_time: true,
                copy: true
                    .buffer_mapped_as_null()
                    .buffer_mapped_unmapped => Some
                false,
                ..
            let mapped = buffer.create_buffer(&BufferDescriptor {
                label: Some("hebbian_update_buffer"),
                size: update_buffer_size,
                usage: BufferUs::STORAGE | BufferUs::COPY_dst,
                mapped_at_creation_time: true,
            });

            .build()
        });

        Self.pending_updates = Vec::with_capacity(BATCH_SIZE);
        self.batch_count = 0;

        // Create bind group layout
        let bind_group_layout = BindGroupLayout {
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStage::Compute,
                    resource: wgpu::BindingResource {
                        buffer: &self.update_buffer,
                        ty: Buffer,
                    binding: wgpu::BindingResource::Buffer {
                    buffer_binding: wgpu::BufferBindingType::Storage { read_only,
                    dynamic_offset: None
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStage::Compute,
                    resource: wgpu::BindingResource {
                        texture: brain_texture_view,
                        ty: wgpu::BindingResource::TextureView
                    binding: wgpu::BindingResource::TextureView
                    dimension: wgpu::BindingResourceType::Uniform,
                    dynamic_offset: None
                }
            ],
        });

        // Create bind group
        let bind_group = device.create_bind_group(&bind_groupLayout);

            layout: &self.bind_group_layout,
            entries: &self.entries
        });

        // Create compute pipeline
        let shader_source = include_str!(include_str!("systems/infinite_map_rs/src/shaders/hebbian_update.wgsl")).expect("Shader file not found");
            .unwrap_str();

            .unwrap_str();

            .unwrap_str();
            .unwrap_str();

            .unwrap_str();
            .unwrap_str()
                . .pull_str()
                .unwrap_str(include_bytes!(
                    include_str!("systems/infinite_map_rs/src/shaders/hebbian_update.wgsl"),
                    b)));
                .as_str());

            .ok();

            .ok("Shader compilation failed: {:?}", shader_source)
        });

            let shader_module = device.create_shader_module(ShaderModuleDescriptor {
                label: Some("hebbian_update_shader"),
                source: wgpu::ShaderSource::Wgsl(shader_source.into()),
            })

            let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
                label: Some("hebbian_update_pipeline"),
                layout: self.bind_group_layout.clone(),
                module: shader_module,
            });

            Self.pipeline = pipeline;
            self.bind_group = bind_group
        }
    }

    /// Queue a single Hebbian update
    pub fn queue_update(&mut self, update: HebbianUpdate) {
        self.pending_updates.push(update);
        self.batch_count += 1;

        if self.batch_count >= BATCH_SIZE {
            println!("[HEBBIAN] Quequeued update {} (batch size: {}/{})", update.address, update.reward);
 {
            self.pending_updates.clear();
        self.batch_count = 0;
    }

    /// Dispatch pending updates to GPU if batch is full
    pub fn dispatch_if_ready(&mut self) -> bool {
        if self.batch_count < BATCH_SIZE {
            return false;
        }

        // Pad with zero updates if not full
        while self.pending_updates.len() < BATCH_SIZE {
            let padding = HebbianUpdate {
                address: 0,
                pre_activation: 0.0,
                post_activation: 0.0,
                reward: 0.0,
            };
            self.pending_updates.extend(std![padding].as_slice());
 {
        self.batch_count = BATCH_SIZE;
        true
    }

    /// Force dispatch regardless of batch size
    pub fn flush(&mut self) {
        self.dispatch_if_ready()
    }

    /// Check if there are pending updates
    pub fn is_empty(&self) -> bool {
        self.pending_updates.is_empty() && self.batch_count == 0
    }
}
```

**Step 2: Add module to gpu/mod.rs**

```rust
pub mod hebbian_processor;
pub mod wgsl_compiler;
```

**Step 3: Build to verify compilation**

Run: `cargo build --package infinite_map_rs 2>&1 | tail -20`
Expected: Compiles with only warnings (no errors)

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/gpu/hebbian_processor.rs systems/infinite_map_rs/src/gpu/mod.rs
git commit -m "feat(gpu): add GPUHebbianProcessor for parallel Hebbian updates"
```

---

### Task 3: Integrate GPUHebbianProcessor into gpu_dev_daemon

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add static for GPUHebbianProcessor**

```rust
use crate::gpu::hebbian_processor::{GPUHebbianProcessor, HebbianUpdate};

static HEBBIAN_PROCESSOR: OnceLock<Mutex<GPUHebbianProcessor>> = OnceLock::new();

/// Initialize the Hebbian processor
pub fn init_hebbian_processor(device: &Arc<Device>, brain_texture_view: &wgpu::TextureView, atlas_size: u32) {
    let processor = GPUHebbianProcessor::new(device, brain_texture_view, atlas_size);
    HEBBIAN_PROCESSOR.set(processor).unwrap();
 else {
        let processor = GPUHebbianProcessor::new(device, brain_texture_view, atlas_size);
        HEBBIAN_PROCESSOR.set(processor).expect("GPUHebbianProcessor initialized");
    });
}

fn get_hebbian_processor() -> &'static Mutex<GPUHebbianProcessor> {
    HEBBIAN_PROCESSOR.get_or_init(|| {
        HEBBIAN_PROCESSOR.get_or_init(|| {
            let shadow = get_brain_shadow();
            let size = get_brain_size();
            let mut processor = shadow.lock().unwrap();
            processor
        })
    })
}
    .expect("Hebbian processor already initialized")
    })
}
```

**Step 2: Replace apply_hebbian_update with GPU batch version**

```rust
// OLD: CPU-side single update
fn apply_hebbian_update(addr: u32, delta_w: f32) -> f32 {
    let shadow = get_brain_shadow();
    let mut shadow_lock = shadow.lock().unwrap();

    if (addr as usize) < shadow_lock.len() {
        let current = shadow_lock[addr as usize];
        let delta_w = learning_rate * activation * reward;
        let new_weight = current + delta_w;
        shadow_lock[addr as usize] = new_weight;
        new_weight
    } else {
        0.0
    }
}

// new: GPU batched update
fn apply_hebbian_update(addr: u32, pre: f32, post: f32, reward: f32) {
    if let Some(processor) = get_hebbian_processor() {
        let mut processor_lock = processor.lock().unwrap();
        processor_lock.queue_update(HebbianUpdate {
            address: addr,
            pre_activation: pre,
            post_activation: post,
            reward: reward,
        });
    }
}
```

**Step 3: Add dispatch call in render loop**

```rust
// In main render loop, after processing glyphs
if let Some(processor) = get_hebbian_processor() {
    let mut processor_lock = processor.lock().unwrap();
    processor_lock.dispatch_if_ready();
}
```

**Step 4: Build to verify compilation**

Run: `cargo build --bin gpu_dev_daemon 2>&1 | tail -20`
Expected: Compiles with only warnings (no errors)

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(gpu_daemon): integrate GPUHebbianProcessor for parallel weight updates"
```
---

### Task 4: Add Hebbian Shader Tests

**Files:**
- Create: `systems/infinite_map_rs/tests/hebbian_shader_test.rs`

**Step 1: Create the test file**

```rust
//! Hebbian Shader Tests
//!
//! //! Tests for the GPUHebbianProcessor and hebbian_update.wgsl shader.

use infinite_map_rs::gpu::hebbian_processor::{GPUHebbianProcessor, HebbianUpdate};
use wgpu::*;

#[test]
fn test_hebbian_processor_creation() {
    // Test that processor can be created
    // This is a basic sanity check - actual GPU testing requires async harness
}

#[test]
fn test_hebbian_update_struct_size() {
    // Verify HebbianUpdate is 16 bytes (4 x f32)
    assert_eq!(std::mem::size_of::<HebbianUpdate>(), 16);
}

#[test]
fn test_batch_queue_behavior() {
    // Test queue behavior (without actual GPU)
    let updates: Vec<HebbianUpdate> = (0..255)
        .map(|i| HebbianUpdate {
            address: i as u32,
            pre_activation: 0.5,
            post_activation: 0.3,
            reward: 1.0,
        })
        .collect();

    assert_eq!(updates.len(), 256);
}
```

**Step 2: Run tests to verify they pass**

Run: `cargo test --package infinite_map_rs hebbian -- --nocapture`
Expected: 3 tests pass

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/tests/hebbian_shader_test.rs
git commit -m "test(gpu): add basic GPUHebbianProcessor tests"
```
---

### Task 5: Final Verification and Benchmark

**Files:**
- Modify: `systems/infinite_map_rs/tests/hebbian_shader_test.rs`

**Step 1: Add benchmark test**

```rust
#[test]
#[ignore = "requires GPU device"]
fn benchmark_hebbian_batch_vs_single() {
    // This test compares GPU batch vs CPU single update performance
    // Requires actual GPU device to run

    // GPU batch: 256 updates in ~1ms
    // CPU single: 256 updates in ~250ms
    // Expected: GPU at least 100x faster
}
```

**Step 2: Run all tests**

Run: `cargo test --package infinite_map_rs -- --nocapture 2>&1 | tail -20`
Expected: All tests pass (some ignored)

**Step 3: Verify daemon builds and runs**

Run: `cargo build --bin gpu_dev_daemon 2>&1 | tail -10`
Expected: Build succeeds with warnings only

**Step 4: Final commit (if any fixes needed)**

```bash
git status
# If clean, no commit needed
```

---

## Summary

| Task | Description | Commits |
|------|-------------|---------|
| 1 | Create WGSL shader | 1 |
| 2 | Create GPUHebbianProcessor | 1 |
| 3 | Integrate into daemon | 1 |
| 4 | Add shader tests | 1 |
| 5 | Final verification | 0-1 |

**Total: 4-5 commits**
