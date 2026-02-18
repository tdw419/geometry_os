# Capability Specification: memory.glass

## Overview

**Capability ID**: `memory.glass`  
**Phase**: 33  
**Status**: Proposed  
**Complexity**: High  
**Dependencies**: Linux kernel ≥ 5.7, WGPU dmabuf support

**Description**: Non-intrusive, zero-copy process memory introspection that treats process memory as a "glassy" state of matter, visualized via Hilbert curve mapping at 60 FPS with < 10% target process overhead.

---

## Capability Definition

### Primary Function

```rust
/// Glass RAM memory introspection capability
pub trait GlassRamCapability {
    /// Attach to target process and begin monitoring
    fn attach(&mut self, pid: u32) -> Result<()>;
    
    /// Detach from target process
    fn detach(&mut self) -> Result<()>;
    
    /// Get current fault telemetry
    fn telemetry(&self) -> &GlassRamTelemetry;
    
    /// Get reconstructed density map
    fn density_map(&self) -> &Array2<f32>;
    
    /// Set visualization mode
    fn set_visualization_mode(&mut self, mode: GlassRamVisualizationMode);
}
```

### Sub-Capabilities

#### 1. userfaultfd Integration

**ID**: `memory.glass.uffd`  
**Purpose**: Linux kernel-level page fault interception

**Features**:
- Non-cooperative process attachment
- Write-protect (WP) mode for real-time mutation tracking
- Thread ID attribution (UFFD_FEATURE_THREAD_ID)
- Fork/remap/unmap event handling

**API**:
```rust
pub trait UffdCapability {
    /// Create userfaultfd with specified features
    fn create(features: UffdFeatureFlags) -> Result<UserfaultFd>;
    
    /// Register memory region with userfaultfd
    fn register(&self, range: UffdioRange, mode: UffdIoctlMode) -> Result<()>;
    
    /// Enable/disable write-protect on region
    fn write_protect(&self, range: UffdioRange, enable: bool) -> Result<()>;
    
    /// Read fault event
    fn read_event(&self) -> Result<UffdMsg>;
}
```

**Requirements**:
- Linux kernel ≥ 5.7 (for WP mode)
- CAP_SYS_PTRACE capability or root
- Target process must be stopped or attached non-cooperatively

**Performance Targets**:
- Fault event latency: < 1ms
- Event throughput: > 10,000 events/sec
- CPU overhead: < 5%

---

#### 2. Hilbert Curve Mapping

**ID**: `memory.glass.hilbert`  
**Purpose**: Efficient bidirectional transformation between 1D linear addresses and 2D spatial coordinates

**Features**:
- Skilling's method for optimal performance
- Configurable order (1-12)
- GPU-accelerated batch transformation
- Locality preservation verification

**API**:
```rust
pub trait HilbertCapability {
    /// Create Hilbert mapper with specified order
    fn new(order: u32) -> Self;
    
    /// Convert linear index to (x, y) coordinates
    fn d2xy(&self, index: u32) -> (u32, u32);
    
    /// Convert (x, y) coordinates to linear index
    fn xy2d(&self, x: u32, y: u32) -> u32;
    
    /// Verify locality preservation
    fn verify_locality(&self, tolerance: f32) -> bool;
}
```

**Requirements**:
- None (pure mathematical operation)

**Performance Targets**:
- CPU transformation: > 1M ops/sec
- GPU transformation: > 10M ops/sec
- Locality preservation: > 95% adjacent indices within distance 3

---

#### 3. Compressed Sensing

**ID**: `memory.glass.compressed_sensing`  
**Purpose**: Reconstruct full memory state from sparse fault samples (10% Nyquist)

**Features**:
- L1 minimization solver
- Hilbert locality prior
- Adaptive order adjustment
- Confidence metrics

**API**:
```rust
pub trait CompressedSensingCapability {
    /// Create reconstructor with specified parameters
    fn new(hilbert_order: u32, sparsity_threshold: f32) -> Self;
    
    /// Reconstruct density map from sparse faults
    fn reconstruct(&mut self, faults: &[FaultEvent]) -> Result<Array2<f32>>;
    
    /// Get reconstruction accuracy
    fn accuracy(&self) -> f32;
    
    /// Adjust sampling rate based on accuracy
    fn adjust_sampling_rate(&mut self, accuracy: f32);
}
```

**Requirements**:
- Sparse signal (memory access patterns are clustered)
- Hilbert locality as reconstruction prior
- 10% Nyquist sampling constraint

**Performance Targets**:
- Reconstruction time: < 10ms
- Accuracy: > 98% (sparsity-dependent)
- Adaptive adjustment: < 1ms

---

#### 4. dmabuf Zero-Copy

**ID**: `memory.glass.dmabuf`  
**Purpose**: Zero-copy buffer sharing between CPU and GPU

**Features**:
- dmabuf allocation via DRM
- EGLImage import
- WGPU texture binding
- DMA fence synchronization

**API**:
```rust
pub trait DmaBufCapability {
    /// Create dmabuf exporter
    fn new(device: Arc<Device>, queue: Arc<Queue>) -> Result<Self>;
    
    /// Allocate dmabuf and import as WGPU texture
    fn create_shared_buffer(&self, width: u32, height: u32, format: TextureFormat) 
        -> Result<(RawFd, wgpu::Texture)>;
    
    /// Synchronize CPU writes and GPU reads
    fn sync_before_gpu_read(&self, fence: &DmaFence, timeout_ms: u32) -> Result<()>;
    
    /// Signal fence after CPU write
    fn signal_cpu_write(&self, fence: &DmaFence) -> Result<()>;
}
```

**Requirements**:
- DRM/KMS support
- EGL_EXT_image_dma_buf_import extension
- WGPU dmabuf support (experimental)

**Performance Targets**:
- Allocation time: < 5ms
- Zero-copy verified: No memcpy in profiling
- Sync latency: < 1ms

---

#### 5. Process Attachment

**ID**: `memory.glass.attach`  
**Purpose**: Attach to target process and discover memory regions

**Features**:
- /proc/pid/maps parsing
- Memory region classification
- Writable region filtering
- Fork event handling

**API**:
```rust
pub trait ProcessAttachCapability {
    /// Attach to target process
    fn attach(pid: u32) -> Result<Self>;
    
    /// Get all memory regions
    fn regions(&self) -> &[MemoryRegion];
    
    /// Get writable regions only
    fn writable_regions(&self) -> Vec<&MemoryRegion>;
    
    /// Handle fork event
    fn handle_fork(&mut self, child_pid: u32) -> Result<()>;
}
```

**Requirements**:
- Target process must be running
- /proc filesystem must be mounted
- CAP_SYS_PTRACE or root

**Performance Targets**:
- Attachment time: < 100ms
- Region parsing: < 10ms for 1000 regions
- Fork handling: < 50ms

---

#### 6. Visualization

**ID**: `memory.glass.visualization`  
**Purpose**: Render memory state as visual patterns

**Features**:
- Heatmap (fault density)
- Thread kinetic energy
- Phase transition detection
- Memory avalanche visualization

**API**:
```rust
pub trait VisualizationCapability {
    /// Create visualizer with specified mode
    fn new(mode: GlassRamVisualizationMode) -> Self;
    
    /// Render density map to texture
    fn render(&self, density_map: &Array2<f32>) -> wgpu::Texture;
    
    /// Set visualization mode
    fn set_mode(&mut self, mode: GlassRamVisualizationMode);
    
    /// Get current mode
    fn mode(&self) -> GlassRamVisualizationMode;
}
```

**Requirements**:
- WGPU device and queue
- dmabuf texture (optional)
- 4K resolution support

**Performance Targets**:
- Render time: < 16ms (60 FPS)
- Resolution: 4096x4096
- Color mapping: 32-bit RGBA

---

## Data Structures

### Memory Region

```rust
#[derive(Debug, Clone)]
pub struct MemoryRegion {
    pub start: u64,           // Start virtual address
    pub end: u64,             // End virtual address
    pub permissions: String,    // "rwxp"
    pub offset: u64,           // File offset
    pub device: String,         // "fd:00"
    pub inode: u64,            // File inode
    pub pathname: Option<String>, // "/usr/lib/libc.so.6" or None
}
```

### Fault Event

```rust
pub enum FaultEvent {
    PageFault {
        address: u64,
        flags: u32,           // READ/WRITE/EXECUTE
        thread_id: Option<u32>,
    },
    Fork {
        parent_pid: u32,
        child_pid: u32,
    },
    Remap {
        old_address: u64,
        new_address: u64,
        length: u64,
    },
    Remove {
        address: u64,
        length: u64,
    },
}
```

### Glass RAM Telemetry

```rust
#[derive(Debug, Clone)]
pub struct GlassRamTelemetry {
    pub fault_rate: f64,              // faults per second
    pub active_threads: u32,          // unique thread IDs
    pub memory_avalanche_detected: bool,
    pub phase_transition_detected: bool,
    pub reconstruction_accuracy: f32,
    pub hilbert_order: u32,
    pub sampling_rate: f64,           // percentage of Nyquist
}
```

### Density Map

```rust
pub type DensityMap = Array2<f32>;  // 2D array of fault densities

// Dimensions: (2^order) x (2^order)
// Values: 0.0 (inactive) to 1.0 (highly active)
```

---

## Configuration

### Hilbert Order

```rust
pub struct HilbertConfig {
    pub order: u32,              // 1-12 (default: 8)
    pub size: u32,               // 2^order
    pub adaptive: bool,           // Enable adaptive adjustment
    pub min_order: u32,           // Minimum order (default: 4)
    pub max_order: u32,           // Maximum order (default: 12)
}
```

**Trade-offs**:
- Higher order: More resolution, more memory, slower reconstruction
- Lower order: Less resolution, less memory, faster reconstruction

### Sampling Rate

```rust
pub struct SamplingConfig {
    pub nyquist_fraction: f32,     // 0.05-0.5 (default: 0.1)
    pub adaptive: bool,             // Enable adaptive adjustment
    pub min_rate: f32,             // Minimum rate (default: 0.05)
    pub max_rate: f32,             // Maximum rate (default: 0.5)
}
```

**Trade-offs**:
- Higher rate: Better accuracy, higher overhead
- Lower rate: Lower accuracy, lower overhead

### Visualization

```rust
pub struct VisualizationConfig {
    pub mode: GlassRamVisualizationMode,
    pub color_palette: ColorPalette,
    pub enable_glow: bool,         // Bloom effect
    pub enable_animation: bool,      // Time-based animation
    pub enable_kms_scanout: bool,  // Direct display controller access
}
```

---

## Error Handling

### Error Types

```rust
pub enum GlassRamError {
    /// Kernel version too old
    KernelVersionTooOld { required: String, detected: String },
    
    /// Feature not supported
    FeatureNotSupported { feature: String },
    
    /// Process not found
    ProcessNotFound { pid: u32 },
    
    /// Permission denied (need CAP_SYS_PTRACE or root)
    PermissionDenied { pid: u32 },
    
    /// userfaultfd operation failed
    UffdError { operation: String, errno: i32 },
    
    /// dmabuf allocation failed
    DmaBufAllocationFailed { reason: String },
    
    /// Reconstruction failed
    ReconstructionFailed { accuracy: f32 },
    
    /// Visualization failed
    VisualizationFailed { reason: String },
}
```

### Error Recovery

```rust
impl GlassRamCapability for GlassRamSystem {
    fn attach(&mut self, pid: u32) -> Result<()> {
        match self.try_attach(pid) {
            Ok(()) => Ok(()),
            Err(GlassRamError::KernelVersionTooOld { .. }) => {
                log::warn!("Kernel too old, falling back to MISSING mode");
                self.fallback_to_missing_mode();
                self.try_attach(pid)
            }
            Err(GlassRamError::FeatureNotSupported { .. }) => {
                log::warn!("Feature not supported, disabling");
                self.disable_feature();
                self.try_attach(pid)
            }
            Err(e) => Err(e),
        }
    }
}
```

---

## Performance Metrics

### Fault Handling

```rust
pub struct FaultMetrics {
    pub events_per_second: f64,      // Target: > 10,000
    pub average_latency_ms: f64,      // Target: < 1ms
    pub peak_latency_ms: f64,        // Target: < 5ms
    pub cpu_overhead_percent: f64,    // Target: < 5%
}
```

### Reconstruction

```rust
pub struct ReconstructionMetrics {
    pub time_ms: f64,               // Target: < 10ms
    pub accuracy: f32,               // Target: > 98%
    pub sparsity: f32,              // Actual sparsity
    pub iterations: u32,             // Solver iterations
}
```

### Rendering

```rust
pub struct RenderingMetrics {
    pub fps: f64,                   // Target: 60 FPS
    pub frame_time_ms: f64,           // Target: < 16ms
    pub resolution: (u32, u32),       // Target: 4096x4096
    pub zero_copy: bool,               // Must be true
}
```

### Target Process

```rust
pub struct TargetMetrics {
    pub overhead_percent: f64,        // Target: < 10%
    pub slow_down_factor: f64,        // Target: < 1.1
    pub memory_overhead_mb: f64,      // Target: < 50MB
}
```

---

## Testing

### Unit Tests

```rust
#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_hilbert_roundtrip() {
        let hilbert = HilbertSkilling::new(8);
        for i in 0..65536 {
            let (x, y) = hilbert.d2xy(i);
            let i2 = hilbert.xy2d(x, y);
            assert_eq!(i, i2);
        }
    }
    
    #[test]
    fn test_compressed_sensing_accuracy() {
        let reconstructor = CompressedSensingReconstructor::new(8, 0.1);
        let sparse_faults = generate_sparse_faults(1000, 65536);
        let reconstructed = reconstructor.reconstruct(&sparse_faults).unwrap();
        assert!(reconstructor.accuracy() > 0.98);
    }
    
    #[test]
    fn test_dmabuf_zero_copy() {
        let exporter = DmaBufExporter::new(device, queue).unwrap();
        let (fd, texture) = exporter.create_shared_buffer(
            4096, 4096, wgpu::TextureFormat::Rgba8UnormSrgb
        ).unwrap();
        // Verify no memcpy in profiling
        assert!(verify_zero_copy(fd, texture));
    }
}
```

### Integration Tests

```rust
#[tokio::test]
async fn test_full_pipeline() {
    // Spawn target process
    let mut child = Command::new("python3")
        .arg("-c")
        .arg("data = [0] * 1000000; time.sleep(5)")
        .spawn()
        .unwrap();
    
    // Attach Glass RAM
    let mut system = GlassRamSystem::new(child.id(), device, queue).unwrap();
    
    // Run for 3 seconds
    tokio::time::sleep(Duration::from_secs(3)).await;
    
    // Verify metrics
    assert!(system.telemetry().fault_rate > 0.0);
    assert!(system.telemetry().reconstruction_accuracy > 0.98);
    assert!(system.telemetry().target_overhead < 0.1);
    
    // Cleanup
    child.kill().await.unwrap();
}
```

### Performance Tests

```rust
#[test]
fn benchmark_fault_throughput() {
    let mut monitor = GlassRamMonitor::new(target_pid).unwrap();
    let start = Instant::now();
    
    for _ in 0..10000 {
        let event = generate_fault_event();
        monitor.handle_fault(event).unwrap();
    }
    
    let duration = start.elapsed();
    let throughput = 10000.0 / duration.as_secs_f64();
    assert!(throughput > 10000.0);
}

#[test]
fn benchmark_reconstruction() {
    let mut reconstructor = CompressedSensingReconstructor::new(8, 0.1);
    let sparse_faults = generate_sparse_faults(1000, 65536);
    
    let start = Instant::now();
    let _ = reconstructor.reconstruct(&sparse_faults).unwrap();
    let duration = start.elapsed();
    
    assert!(duration.as_millis() < 10);
}
```

---

## Security Considerations

### Privilege Requirements

```rust
pub struct SecurityConfig {
    pub require_root: bool,           // Default: true
    pub allow_ptrace: bool,          // Default: true
    pub sandboxed: bool,             // Default: false
    pub anonymize_addresses: bool,     // Default: false
}
```

### Process Isolation

- Monitor runs in separate address space
- No code injection into target
- Read-only access to memory
- No ptrace dependency

### Data Privacy

- Fault telemetry contains memory addresses
- No memory content captured
- Optional address anonymization
- Audit logging

---

## Future Enhancements

### Memory Disaggregation

```rust
pub trait MemoryDisaggregationCapability {
    /// Enable remote memory paging
    fn enable_remote_paging(&mut self, remote_endpoint: &str) -> Result<()>;
    
    /// Migrate memory region to remote node
    fn migrate_region(&mut self, region: &MemoryRegion) -> Result<()>;
}
```

### Sharing-Aware Live Migration

```rust
pub trait SharingAwareMigrationCapability {
    /// Identify shared COW pages
    fn find_shared_pages(&self) -> Result<Vec<Page>>;
    
    /// Transfer ownership instead of content
    fn transfer_ownership(&mut self, pages: &[Page]) -> Result<()>;
}
```

### Advanced Visualization

```rust
pub trait AdvancedVisualizationCapability {
    /// 3D volumetric rendering
    fn render_3d(&self, density_map: &Array3<f32>) -> wgpu::Texture;
    
    /// Time-series animation
    fn render_time_series(&self, history: &[DensityMap]) -> wgpu::Texture;
    
    /// Interactive exploration
    fn enable_interactive(&mut self, enabled: bool);
}
```

---

## Compliance

### Kernel Requirements

- Linux kernel ≥ 5.7 (for WP mode)
- userfaultfd support (kernel 4.3+)
- UFFD_FEATURE_THREAD_ID (kernel 4.14+)

### GPU Requirements

- DRM/KMS support
- EGL_EXT_image_dma_buf_import extension
- WGPU dmabuf support (experimental)

### System Requirements

- CAP_SYS_PTRACE capability or root
- /proc filesystem mounted
- Sufficient memory for dmabuf allocation

---

## References

1. **PHASE_33_TECHNICAL_SYNTHESIS.md** - Theoretical foundation
2. **PHASE_33_ARCHITECTURAL_ALIGNMENT_ANALYSIS.md** - Codebase analysis
3. **Linux userfaultfd(2) man page** - Kernel API documentation
4. **Linux dma-buf documentation** - Zero-copy buffer sharing
5. **Skilling's Method** - Efficient Hilbert transformation

---

**Document Version**: 1.0  
**Last Updated**: 2026-01-17  
**Status**: Specification Complete
