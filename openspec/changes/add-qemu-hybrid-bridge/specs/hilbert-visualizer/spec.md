# Hilbert Visualizer Specification

**Component**: Hilbert Memory Visualizer  
**Version**: 1.0.0  
**Status**: Proposed  
**Updated**: 2026-01-17

## Overview

The Hilbert Visualizer transforms 1D linear guest RAM addresses into 3D spatial coordinates using the Hilbert space-filling curve, enabling volumetric visualization of memory at 60 FPS.

## ADDED Requirements

### Requirement: Hilbert Transform Implementation (REQ-HV-001)
**Priority**: MUST  
**Category**: Core Algorithm

The system SHALL implement the Skilling algorithm for 3D Hilbert curve transformation in WGSL compute shaders.

#### Scenario: Address to Voxel Mapping
- **GIVEN** a linear physical RAM address (0 to 67,108,864 for 64MB)
- **WHEN** the Hilbert transform is applied
- **THEN** the system SHALL:
  - Compute a unique (x, y, z) coordinate in 1024³ space
  - Preserve spatial locality (adjacent addresses → adjacent voxels)
  - Complete the transformation in <16ms for all 64M addresses
- **VISUAL** Memory structures appear as coherent 3D shapes, not random noise

#### Scenario: Inverse Transform
- **GIVEN** a 3D voxel coordinate (x, y, z)
- **WHEN** the inverse Hilbert transform is applied
- **THEN** the system SHALL:
  - Compute the corresponding linear RAM address
  - Enable "click to inspect" functionality in the 3D view
  - Maintain bijective mapping (forward → inverse → original)

### Requirement: GPU Compute Pipeline (REQ-HV-002)
**Priority**: MUST  
**Category**: Performance

The system SHALL utilize WGPU compute shaders for parallel Hilbert transformation.

#### Scenario: Compute Shader Dispatch
- **GIVEN** a 64MB RAM snapshot uploaded to GPU storage buffer
- **WHEN** the compute pipeline is executed
- **THEN** the system SHALL:
  - Dispatch 128×128×128 workgroups (1024³ / 8³)
  - Process 512 voxels per workgroup (8×8×8)
  - Write results to `texture_storage_3d<rgba8unorm, write>`
  - Complete in <3ms on mid-range GPU (RTX 3060 equivalent)

#### Scenario: Incremental Updates
- **GIVEN** guest RAM with only 10% of pages modified since last frame
- **WHEN** the visualizer detects dirty pages
- **THEN** the system SHALL:
  - Only recompute affected voxel blocks
  - Skip unchanged regions (space-skipping optimization)
  - Reduce compute time to <1ms for typical workloads

### Requirement: Color Mapping (REQ-HV-003)
**Priority**: MUST  
**Category**: Visualization

The system SHALL color-code memory regions based on heuristic classification.

#### Scenario: Memory Type Classification
- **GIVEN** a RAM byte value and its address
- **WHEN** determining the voxel color
- **THEN** the system SHALL apply the following heuristics:
  - **Code** (blue): High addresses (>0x40000000), low entropy
  - **Stack** (green): Mid-high addresses, sequential access patterns
  - **Heap** (red): Mid-low addresses, fragmented patterns
  - **Kernel** (yellow): Very high addresses (>0xC0000000 for Linux)
  - **Empty** (transparent): All zeros, alpha=0.1
- **VISUAL** Distinct color regions make memory structure immediately recognizable

#### Scenario: Semantic Overlay
- **GIVEN** semantic annotations from LibVMI (e.g., "SSH daemon PID 42")
- **WHEN** rendering the 3D volume
- **THEN** the system SHALL:
  - Highlight annotated regions with bounding boxes
  - Render text labels in 3D space
  - Use distinct colors for different processes/structures

### Requirement: Volumetric Rendering (REQ-HV-004)
**Priority**: MUST  
**Category**: Rendering

The system SHALL render the 3D memory volume using texture-based slicing or ray marching.

#### Scenario: Texture-Based Slicing
- **GIVEN** a 1024³ 3D texture containing Hilbert-mapped RAM
- **WHEN** rendering the volume
- **THEN** the system SHALL:
  - Generate 256 slicing planes perpendicular to view direction
  - Blend planes back-to-front with alpha compositing
  - Apply transfer function for opacity based on byte value
  - Achieve 60 FPS at 1920×1080 resolution

#### Scenario: Interactive Camera
- **GIVEN** user input (mouse drag, scroll wheel)
- **WHEN** manipulating the 3D view
- **THEN** the system SHALL:
  - Support orbit navigation around the volume center
  - Zoom from 1x (full volume) to 100x (individual voxels)
  - Pan to translate the view
  - Maintain 60 FPS during all interactions

### Requirement: Level of Detail (LOD) (REQ-HV-005)
**Priority**: SHOULD  
**Category**: Performance Optimization

The system SHALL implement a mipmap-based LOD system for distant viewing.

#### Scenario: Adaptive Resolution
- **GIVEN** a camera distance from the volume
- **WHEN** the distance exceeds a threshold
- **THEN** the system SHALL:
  - Switch to lower-resolution mipmap levels (512³, 256³, 128³)
  - Reduce VRAM bandwidth and fragment shader cost
  - Maintain visual quality for the current view
- **AND** transitions between LOD levels SHALL be smooth (no popping)

### Requirement: Performance Targets (REQ-HV-006)
**Priority**: MUST  
**Category**: Performance

The system SHALL meet the following rendering performance benchmarks:

#### Scenario: 60 FPS Rendering
- **GIVEN** a 1024³ volume with full 64MB RAM
- **WHEN** rendering at 1920×1080 resolution
- **THEN** the frame time SHALL be ≤16ms:
  - Compute shader: <3ms
  - Volume rendering: <8ms
  - UI overlay: <2ms
  - Swap buffers: <3ms

#### Scenario: VRAM Budget
- **GIVEN** the Hilbert visualizer active
- **WHEN** measuring GPU memory usage
- **THEN** the system SHALL consume:
  - Base texture (1024³ RGBA8): 4GB
  - Mipmap chain: +1.33GB
  - Storage buffers: +256MB
  - **Total**: <6GB VRAM

### Requirement: Integration with Glass RAM (REQ-HV-007)
**Priority**: SHOULD  
**Category**: System Integration

The system SHALL share the Hilbert mapping substrate with Glass RAM for unified visualization.

#### Scenario: Shared Texture Substrate
- **GIVEN** both Pixel CPU (Glass RAM) and QEMU VM active
- **WHEN** rendering the Infinite Map
- **THEN** the system SHALL:
  - Use the same Hilbert coordinate system for both
  - Allow seamless navigation between Pixel CPU and QEMU memory
  - Differentiate sources via color/opacity (e.g., Pixel CPU = solid, QEMU = translucent)
- **VISUAL** Unified 3D memory landscape containing both execution substrates

## API Specification

### Rust API

```rust
pub struct HilbertVisualizer {
    compute_pipeline: wgpu::ComputePipeline,
    render_pipeline: wgpu::RenderPipeline,
    ram_buffer: wgpu::Buffer,
    volume_texture: wgpu::Texture,
    bind_group: wgpu::BindGroup,
}

impl HilbertVisualizer {
    /// Create a new Hilbert visualizer for a given RAM size
    pub fn new(device: &wgpu::Device, ram_size: usize) -> Self;
    
    /// Update the volume from a RAM snapshot
    pub fn update_from_ram(&mut self, queue: &wgpu::Queue, ram: &[u8]);
    
    /// Execute the Hilbert transform compute shader
    pub fn compute(&self, encoder: &mut wgpu::CommandEncoder);
    
    /// Render the 3D volume to the current render target
    pub fn render(
        &self,
        encoder: &mut wgpu::CommandEncoder,
        view: &wgpu::TextureView,
        camera: &Camera3D,
    );
    
    /// Get the 3D texture for external rendering
    pub fn get_texture(&self) -> &wgpu::Texture;
    
    /// Convert 3D voxel coordinate to linear address (inverse Hilbert)
    pub fn voxel_to_address(&self, x: u32, y: u32, z: u32) -> u64;
    
    /// Convert linear address to 3D voxel coordinate (forward Hilbert)
    pub fn address_to_voxel(&self, addr: u64) -> (u32, u32, u32);
}
```

### WGSL Shader Interface

```wgsl
// Compute Shader: hilbert_transform.wgsl

@group(0) @binding(0) var<storage, read> ram: array<u32>;
@group(0) @binding(1) var output: texture_storage_3d<rgba8unorm, write>;
@group(0) @binding(2) var<uniform> config: Config;

struct Config {
    ram_size: u32,
    color_mode: u32,  // 0=heuristic, 1=semantic, 2=heatmap
}

@compute @workgroup_size(8, 8, 8)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    // Hilbert transform implementation
}
```

```wgsl
// Fragment Shader: volume_render.wgsl

@group(0) @binding(0) var volume: texture_3d<f32>;
@group(0) @binding(1) var volume_sampler: sampler;
@group(0) @binding(2) var<uniform> camera: Camera;

struct Camera {
    view_matrix: mat4x4<f32>,
    proj_matrix: mat4x4<f32>,
    position: vec3<f32>,
}

@fragment
fn main(@location(0) uv: vec2<f32>) -> @location(0) vec4<f32> {
    // Ray marching or texture slicing implementation
}
```

## Algorithm Specification

### Skilling's Hilbert Algorithm (Simplified)

```rust
fn hilbert_3d(index: u64, bits: u32) -> (u32, u32, u32) {
    let mut x = 0u32;
    let mut y = 0u32;
    let mut z = 0u32;
    
    for i in 0..bits {
        let mask = 1u64 << (i * 3);
        
        // Extract 3 bits for this iteration
        let bit_x = ((index & mask) >> (i * 3)) as u32;
        let bit_y = ((index & (mask << 1)) >> (i * 3 + 1)) as u32;
        let bit_z = ((index & (mask << 2)) >> (i * 3 + 2)) as u32;
        
        // Gray code transformation
        let gray_x = bit_x ^ bit_y;
        let gray_y = bit_y ^ bit_z;
        let gray_z = bit_z;
        
        // Accumulate coordinates
        x |= gray_x << i;
        y |= gray_y << i;
        z |= gray_z << i;
    }
    
    (x, y, z)
}
```

**Note**: This is a simplified version. The full Skilling algorithm includes rotation and reflection steps for optimal locality.

## Testing Requirements

### Unit Tests
- [ ] `test_hilbert_forward`: Verify address → voxel transformation
- [ ] `test_hilbert_inverse`: Verify voxel → address transformation
- [ ] `test_hilbert_bijection`: Ensure forward → inverse → original
- [ ] `test_color_mapping`: Validate heuristic classification logic
- [ ] `test_lod_selection`: Verify correct mipmap level selection

### Integration Tests
- [ ] `test_compute_pipeline`: Execute shader on mock RAM data
- [ ] `test_render_pipeline`: Render volume to offscreen texture
- [ ] `test_performance_60fps`: Benchmark full pipeline at target resolution
- [ ] `test_vram_budget`: Measure GPU memory consumption
- [ ] `test_glass_ram_integration`: Verify shared substrate compatibility

### Visual Tests
- [ ] `test_spatial_locality`: Verify adjacent addresses appear adjacent in 3D
- [ ] `test_color_coherence`: Confirm memory regions have distinct colors
- [ ] `test_semantic_overlay`: Validate annotation rendering
- [ ] `test_camera_interaction`: Ensure smooth navigation

## Performance Optimization Strategies

### Compute Shader
1. **Workgroup Size**: 8×8×8 = 512 threads (optimal for most GPUs)
2. **Memory Coalescing**: Access RAM buffer in sequential order
3. **Early Exit**: Skip voxels outside valid RAM range
4. **Shared Memory**: Cache frequently accessed data in workgroup memory

### Rendering
1. **Early Ray Termination**: Stop marching when opacity reaches 0.95
2. **Space Skipping**: Skip empty regions (all zeros)
3. **Adaptive Sampling**: Reduce ray steps for distant views
4. **Async Compute**: Run Hilbert transform on separate queue

## Acceptance Criteria

- [ ] Hilbert transform correctly maps 64MB RAM to 1024³ voxels
- [ ] Compute shader completes in <3ms on mid-range GPU
- [ ] Volume renders at 60 FPS (1920×1080)
- [ ] Color-coded regions visually distinct
- [ ] Interactive camera navigation responsive
- [ ] VRAM usage <6GB
- [ ] LOD system reduces distant rendering cost
- [ ] Integration with Glass RAM functional
- [ ] All tests pass

---

**Status**: Ready for implementation pending proposal approval.
