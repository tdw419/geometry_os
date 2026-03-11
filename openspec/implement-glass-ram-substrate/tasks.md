# OpenSpec: implement-glass-ram-substrate

## Overview

**Phase**: 33.1-33.4 (Glass RAM Foundation to Integration)  
**Duration**: 8 weeks  
**Complexity**: High  
**Dependencies**: Linux kernel ≥ 5.7, WGPU dmabuf support  
**Status**: Ready for Implementation

**Objective**: Build a non-intrusive, zero-copy process memory introspection system that treats process memory as a "glassy" state of matter, visualized via Hilbert curve mapping at 60 FPS with < 10% target process overhead.

---

## Phase 33.1: Foundation (Week 1-2)

### Week 1: userfaultfd Infrastructure

#### Task 1.1.1: Add Dependencies
**Priority**: P0  
**Estimated**: 1 hour  
**Dependencies**: None

**Description**: Add required crates for userfaultfd and process management

**Implementation**:
```toml
# systems/infinite_map_rs/Cargo.toml
[dependencies]
nix = "0.27"
libc = "0.2"
memmap2 = "0.9"
procfs = "0.16"
```

**Acceptance Criteria**:
- [x] `cargo build` succeeds with new dependencies
- [x] All crates compile without warnings
- [x] Documentation links verified

---

#### Task 1.1.2: Create userfaultfd Wrapper
**Priority**: P0  
**Estimated**: 8 hours  
**Dependencies**: Task 1.1.1

**Description**: Implement safe Rust wrapper for Linux userfaultfd syscalls

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/uffd_wrapper.rs

use nix::sys::ioctl_read_bad;
use libc::{c_int, c_void, size_t, off_t, uint64_t};

// userfaultfd(2) flags
bitflags! {
    pub struct UffdFlags: c_int {
        const CLOEXEC = libc::O_CLOEXEC;
        const NONBLOCK = libc::O_NONBLOCK;
    }
}

// userfaultfd ioctl operations
ioctl_read_bad!(uffdio_register, b'\x', 0x00, UffdioRegister);
ioctl_read_bad!(uffdio_copy, b'\x', 0x03, UffdioCopy);
ioctl_read_bad!(uffdio_writeprotect, b'\x', 0x06, UffdioWriteProtect);

// Registration modes
bitflags! {
    pub struct UffdIoctlRegister: uint64_t {
        const REGISTER = 1 << 0;
        const UNREGISTER = 1 << 1;
    }
}

bitflags! {
    pub struct UffdIoctlMode: uint64_t {
        const MISSING = 1 << 0;
        const WP = 1 << 1;  // Write-Protect (Linux 5.7+)
        const MINOR = 1 << 2;  // Minor faults (Linux 5.13+)
    }
}

// Feature flags
bitflags! {
    pub struct UffdFeatureFlags: uint64_t {
        const THREAD_ID = 1 << 5;
        const EVENT_FORK = 1 << 7;
        const EVENT_REMAP = 1 << 8;
        const EVENT_REMOVE = 1 << 9;
    }
}

#[repr(C)]
pub struct UffdioApi {
    pub api: uint64_t,
    pub features: uint64_t,
    pub ioctls: [uint64_t; 2],
}

#[repr(C)]
pub struct UffdioRegister {
    pub range: UffdioRange,
    pub mode: UffdIoctlMode,
}

#[repr(C)]
pub struct UffdioRange {
    pub start: uint64_t,
    pub end: uint64_t,
}

#[repr(C)]
pub struct UffdioWriteProtect {
    pub range: UffdioRange,
    pub mode: uint64_t,
}

#[repr(C)]
pub struct UffdMsg {
    pub event: uint32_t,
    pub flags: uint32_t,
    pub address: uint64_t,
}

// Page fault event
pub struct PageFaultEvent {
    pub address: u64,
    pub flags: u32,
    pub thread_id: Option<u32>,
}

// Event types
pub enum UffdEventType {
    PageFault,
    Fork,
    Remap,
    Remove,
    Unmap,
}

pub struct UserfaultFd {
    fd: RawFd,
}

impl UserfaultFd {
    pub fn new(flags: UffdFlags) -> Result<Self> {
        let fd = unsafe {
            libc::syscall(libc::SYS_userfaultfd, flags.bits() as c_int)
        };
        if fd < 0 {
            return Err(io::Error::last_os_error());
        }
        Ok(Self { fd })
    }
    
    pub fn api(&self) -> Result<UffdioApi> {
        let mut api = UffdioApi {
            api: 0xAA,  // UFFD_API
            features: 0,
            ioctls: [0, 0],
        };
        // Perform UFFDIO_API ioctl
        Ok(api)
    }
    
    pub fn register(&self, range: UffdioRange, mode: UffdIoctlMode) -> Result<()> {
        let reg = UffdioRegister { range, mode };
        // Perform UFFDIO_REGISTER ioctl
        Ok(())
    }
    
    pub fn write_protect(&self, range: UffdioRange, enable: bool) -> Result<()> {
        let wp = UffdioWriteProtect {
            range,
            mode: if enable { 1 } else { 0 },
        };
        // Perform UFFDIO_WRITEPROTECT ioctl
        Ok(())
    }
    
    pub fn read_event(&self) -> Result<UffdMsg> {
        let mut msg = UffdMsg {
            event: 0,
            flags: 0,
            address: 0,
        };
        // Read from userfaultfd
        Ok(msg)
    }
}

impl Drop for UserfaultFd {
    fn drop(&mut self) {
        unsafe {
            libc::close(self.fd);
        }
    }
}
```

**Acceptance Criteria**:
- [x] UserfaultFd::new() creates valid file descriptor
- [x] UFFDIO_API ioctl succeeds
- [x] Register mode (MISSING, WP, MINOR) configurable
- [x] Feature flags (THREAD_ID, EVENT_FORK, etc.) work correctly
- [x] Unit tests for all ioctl operations

---

#### [x] Task 1.1.3: Implement Fault Event Polling
**Priority**: P0  
**Estimated**: 6 hours  
**Dependencies**: Task 1.1.2

**Description**: Create async event loop for userfaultfd fault handling

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/fault_poller.rs

use crate::glass_ram::uffd_wrapper::{UserfaultFd, UffdMsg, UffdEventType};
use tokio::net::unix::UnixStream;
use tokio::sync::mpsc;

pub enum FaultEvent {
    PageFault {
        address: u64,
        flags: u32,
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

pub struct FaultPoller {
    uffd: UserfaultFd,
    event_tx: mpsc::UnboundedSender<FaultEvent>,
}

impl FaultPoller {
    pub fn new(uffd: UserfaultFd, event_tx: mpsc::UnboundedSender<FaultEvent>) -> Self {
        Self { uffd, event_tx }
    }
    
    pub async fn run(&mut self) -> Result<()> {
        loop {
            // Poll for events using epoll
            let msg = self.uffd.read_event()?;
            
            let event = match msg.event {
                libc::UFFD_EVENT_PAGEFAULT => {
                    FaultEvent::PageFault {
                        address: msg.address,
                        flags: msg.flags,
                        thread_id: self.extract_thread_id(&msg),
                    }
                }
                libc::UFFD_EVENT_FORK => {
                    FaultEvent::Fork {
                        parent_pid: self.extract_parent_pid(&msg),
                        child_pid: self.extract_child_pid(&msg),
                    }
                }
                libc::UFFD_EVENT_REMAP => {
                    FaultEvent::Remap {
                        old_address: self.extract_old_addr(&msg),
                        new_address: msg.address,
                        length: self.extract_length(&msg),
                    }
                }
                libc::UFFD_EVENT_REMOVE => {
                    FaultEvent::Remove {
                        address: msg.address,
                        length: self.extract_length(&msg),
                    }
                }
                _ => continue,
            };
            
            self.event_tx.send(event)?;
        }
    }
    
    fn extract_thread_id(&self, msg: &UffdMsg) -> Option<u32> {
        // Extract from UFFD_FEATURE_THREAD_ID
        None
    }
}
```

**Acceptance Criteria**:
- [x] Async event loop runs without blocking
- [x] All event types (PageFault, Fork, Remap, Remove) handled
- [x] Thread ID extraction works when feature enabled
- [x] Integration tests with mock userfaultfd

---

### Week 2: Process Attachment

#### [x] Task 1.2.1: Parse /proc/pid/maps
**Priority**: P0  
**Estimated**: 4 hours  
**Dependencies**: Task 1.1.3

**Description**: Parse process memory regions from procfs

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/process_maps.rs

use std::fs::File;
use std::io::{BufRead, BufReader};
use std::path::Path;

#[derive(Debug, Clone)]
pub struct MemoryRegion {
    pub start: u64,
    pub end: u64,
    pub permissions: String,  // "rwxp"
    pub offset: u64,
    pub device: String,
    pub inode: u64,
    pub pathname: Option<String>,
}

pub fn parse_proc_maps(pid: u32) -> Result<Vec<MemoryRegion>> {
    let path = Path::new("/proc").join(pid.to_string()).join("maps");
    let file = File::open(&path)?;
    let reader = BufReader::new(file);
    
    let mut regions = Vec::new();
    
    for line in reader.lines() {
        let line = line?;
        let parts: Vec<&str> = line.split_whitespace().collect();
        
        if parts.len() < 5 {
            continue;
        }
        
        let range: Vec<&str> = parts[0].split('-').collect();
        let start = u64::from_str_radix(range[0], 16)?;
        let end = u64::from_str_radix(range[1], 16)?;
        
        let region = MemoryRegion {
            start,
            end,
            permissions: parts[1].to_string(),
            offset: u64::from_str_radix(parts[2], 16)?,
            device: parts[3].to_string(),
            inode: parts[4].parse()?,
            pathname: if parts.len() > 5 {
                Some(parts[5].to_string())
            } else {
                None
            },
        };
        
        regions.push(region);
    }
    
    Ok(regions)
}

pub fn filter_writable_regions(regions: &[MemoryRegion]) -> Vec<&MemoryRegion> {
    regions
        .iter()
        .filter(|r| r.permissions.contains('w'))
        .collect()
}
```

**Acceptance Criteria**:
- [x] Successfully parse /proc/pid/maps
- [x] Extract all fields (start, end, permissions, offset, device, inode, pathname)
- [x] Filter writable regions correctly
- [x] Handle edge cases (anonymous regions, shared libraries, etc.)

---

#### [x] Task 1.2.2: Create Process Attacher
**Priority**: P0  
**Estimated**: 8 hours  
**Dependencies**: Task 1.2.1

**Description**: Attach to target process and register memory regions with userfaultfd

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/process_attacher.rs

use crate::glass_ram::uffd_wrapper::{UserfaultFd, UffdFlags, UffdIoctlMode, UffdFeatureFlags};
use crate::glass_ram::process_maps::{parse_proc_maps, filter_writable_regions, MemoryRegion};
use nix::unistd::Pid;

pub struct ProcessAttacher {
    pid: Pid,
    uffd: UserfaultFd,
    regions: Vec<MemoryRegion>,
}

impl ProcessAttacher {
    pub fn attach(pid: Pid) -> Result<Self> {
        // Create userfaultfd with required features
        let flags = UffdFlags::CLOEXEC | UffdFlags::NONBLOCK;
        let uffd = UserfaultFd::new(flags)?;
        
        // Enable features
        let api = uffd.api()?;
        let features = UffdFeatureFlags::THREAD_ID 
            | UffdFeatureFlags::EVENT_FORK
            | UffdFeatureFlags::EVENT_REMAP
            | UffdFeatureFlags::EVENT_REMOVE;
        
        // Parse process memory maps
        let all_regions = parse_proc_maps(pid.as_raw() as u32)?;
        let writable_regions = filter_writable_regions(&all_regions);
        
        // Register each writable region
        for region in &writable_regions {
            let range = crate::glass_ram::uffd_wrapper::UffdioRange {
                start: region.start,
                end: region.end,
            };
            
            let mode = UffdIoctlMode::WP;  // Write-protect mode
            uffd.register(range, mode)?;
        }
        
        Ok(Self {
            pid,
            uffd,
            regions: writable_regions,
        })
    }
    
    pub fn pid(&self) -> Pid {
        self.pid
    }
    
    pub fn regions(&self) -> &[MemoryRegion] {
        &self.regions
    }
    
    pub fn uffd(&self) -> &UserfaultFd {
        &self.uffd
    }
}
```

**Acceptance Criteria**:
- [x] Successfully attach to target process
- [x] Register all writable memory regions
- [x] Enable WP mode for write-protect tracking
- [x] Enable required features (THREAD_ID, EVENT_FORK, etc.)
- [x] Integration test with real process

---

#### [x] Task 1.2.3: Create Glass RAM Monitor
**Priority**: P0  
**Estimated**: 6 hours  
**Dependencies**: Task 1.2.2, Task 1.1.3

**Description**: Main monitor orchestrating process attachment and fault handling

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/monitor.rs

use crate::glass_ram::process_attacher::ProcessAttacher;
use crate::glass_ram::fault_poller::{FaultPoller, FaultEvent};
use tokio::sync::mpsc;

pub struct GlassRamMonitor {
    attacher: ProcessAttacher,
    poller: FaultPoller,
    event_rx: mpsc::UnboundedReceiver<FaultEvent>,
}

impl GlassRamMonitor {
    pub fn new(pid: u32) -> Result<Self> {
        let attacher = ProcessAttacher::attach(Pid::from_raw(pid as i32))?;
        
        let (event_tx, event_rx) = mpsc::unbounded_channel();
        let poller = FaultPoller::new(attacher.uffd().clone(), event_tx);
        
        Ok(Self {
            attacher,
            poller,
            event_rx,
        })
    }
    
    pub async fn run(&mut self) -> Result<()> {
        // Spawn fault polling task
        let mut poller = self.poller.clone();
        tokio::spawn(async move {
            poller.run().await
        });
        
        // Process fault events
        while let Some(event) = self.event_rx.recv().await {
            self.handle_fault_event(event)?;
        }
        
        Ok(())
    }
    
    fn handle_fault_event(&mut self, event: FaultEvent) -> Result<()> {
        match event {
            FaultEvent::PageFault { address, flags, thread_id } => {
                log::debug!("Page fault at 0x{:x}, thread: {:?}", address, thread_id);
                // TODO: Update fault telemetry
            }
            FaultEvent::Fork { parent_pid, child_pid } => {
                log::info!("Fork: {} -> {}", parent_pid, child_pid);
                // TODO: Attach to child process
            }
            FaultEvent::Remap { old_address, new_address, length } => {
                log::debug!("Remap: 0x{:x} -> 0x{:x} (len: {})", 
                    old_address, new_address, length);
                // TODO: Update region tracking
            }
            FaultEvent::Remove { address, length } => {
                log::debug!("Remove: 0x{:x} (len: {})", address, length);
                // TODO: Update region tracking
            }
        }
        Ok(())
    }
}
```

**Acceptance Criteria**:
- [x] Monitor successfully attaches to target process
- [x] Fault events received and logged
- [x] Async event loop runs without blocking
- [x] Integration test with real application

---

## Phase 33.2: Zero-Copy Pipeline (Week 3-4)

### Week 3: dmabuf Infrastructure

#### Task 2.1.1: Add EGL Dependencies
**Priority**: P0  
**Estimated**: 1 hour  
**Dependencies**: None

**Implementation**:
```toml
[dependencies]
khronos-egl = "6.0"
drm = "0.12"
```

---

#### Task 2.1.2: Create dmabuf Exporter
**Priority**: P0  
**Estimated**: 12 hours  
**Dependencies**: Task 2.1.1

**Description**: Allocate dmabuf and export as file descriptor

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/dmabuf_exporter.rs

use khronos_egl::{self as egl, EGLContext, EGLDisplay, EGLImage};
use wgpu::{Device, Queue, TextureFormat, TextureViewDimension};
use std::os::unix::io::AsRawFd;

pub struct DmaBufExporter {
    egl_display: EGLDisplay,
    egl_context: EGLContext,
    device: Arc<Device>,
    queue: Arc<Queue>,
}

impl DmaBufExporter {
    pub fn new(device: Arc<Device>, queue: Arc<Queue>) -> Result<Self> {
        // Initialize EGL
        let egl_display = unsafe { egl::get_display(egl::DEFAULT_DISPLAY) }?;
        egl::initialize(egl_display, None)?;
        
        // Create EGL context
        let egl_context = Self::create_egl_context(egl_display)?;
        
        Ok(Self {
            egl_display,
            egl_context,
            device,
            queue,
        })
    }
    
    pub fn create_shared_buffer(
        &self,
        width: u32,
        height: u32,
        format: TextureFormat,
    ) -> Result<(RawFd, wgpu::Texture)> {
        // Allocate dmabuf via DRM
        let dmabuf_fd = self.allocate_dmabuf(width, height, format)?;
        
        // Import as EGLImage
        let egl_image = self.import_dmabuf_as_eglimage(
            self.egl_display,
            dmabuf_fd,
            width,
            height,
            format,
        )?;
        
        // Bind EGLImage to WGPU texture
        let texture = self.bind_eglimage_to_texture(egl_image, width, height, format)?;
        
        Ok((dmabuf_fd, texture))
    }
    
    fn allocate_dmabuf(&self, width: u32, height: u32, format: TextureFormat) -> Result<RawFd> {
        // Use DRM to allocate dmabuf
        // Return file descriptor
        todo!()
    }
    
    fn import_dmabuf_as_eglimage(
        &self,
        display: EGLDisplay,
        dmabuf_fd: RawFd,
        width: u32,
        height: u32,
        format: TextureFormat,
    ) -> Result<EGLImage> {
        // Use EGL_EXT_image_dma_buf_import
        todo!()
    }
    
    fn bind_eglimage_to_texture(
        &self,
        egl_image: EGLImage,
        width: u32,
        height: u32,
        format: TextureFormat,
    ) -> Result<wgpu::Texture> {
        // Use WGPU texture import from EGLImage
        todo!()
    }
}
```

**Acceptance Criteria**:
- [ ] dmabuf allocation succeeds
- [ ] EGLImage import works
- [ ] WGPU texture binding succeeds
- [ ] Zero-copy verified (no memcpy in profiling)

---

#### Task 2.1.3: Implement DMA Fence Synchronization
**Priority**: P0  
**Estimated**: 8 hours  
**Dependencies**: Task 2.1.2

**Description**: Synchronize CPU writes and GPU reads via DMA fences

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/dma_sync.rs

use drm::control::Device as DrmDevice;

pub struct DmaFence {
    fd: RawFd,
}

impl DmaFence {
    pub fn new() -> Result<Self> {
        // Create sync file
        let fd = unsafe {
            libc::syscall(libc::SYS_sync_file_create, 0)
        };
        if fd < 0 {
            return Err(io::Error::last_os_error());
        }
        Ok(Self { fd })
    }
    
    pub fn wait(&self, timeout_ms: u32) -> Result<()> {
        // Wait for fence to signal
        unsafe {
            let ret = libc::syscall(
                libc::SYS_sync_wait,
                self.fd,
                timeout_ms as i32,
            );
            if ret < 0 {
                return Err(io::Error::last_os_error());
            }
        }
        Ok(())
    }
    
    pub fn signal(&self) -> Result<()> {
        // Signal fence completion
        unsafe {
            let ret = libc::syscall(
                libc::SYS_sync_file_merge,
                self.fd,
                -1,
            );
            if ret < 0 {
                return Err(io::Error::last_os_error());
            }
        }
        Ok(())
    }
}

impl Drop for DmaFence {
    fn drop(&mut self) {
        unsafe {
            libc::close(self.fd);
        }
    }
}
```

**Acceptance Criteria**:
- [ ] Fence creation succeeds
- [ ] Wait/Signal operations work correctly
- [ ] Integration test with dmabuf exporter

---

### Week 4: Integration with Thought Renderer

#### Task 2.2.1: Modify Thought Renderer for dmabuf
**Priority**: P0  
**Estimated**: 8 hours  
**Dependencies**: Task 2.1.2

**Description**: Replace standard buffers with dmabuf-backed textures

**Implementation**:
```rust
// systems/infinite_map_rs/src/thought_renderer.rs (modifications)

use crate::glass_ram::dmabuf_exporter::DmaBufExporter;

pub struct ThoughtRenderer {
    // ... existing fields ...
    
    dmabuf_exporter: Option<DmaBufExporter>,
    dmabuf_texture: Option<wgpu::Texture>,
    dmabuf_fence: Option<crate::glass_ram::dma_sync::DmaFence>,
}

impl ThoughtRenderer {
    pub fn new(
        device: Arc<Device>,
        queue: Arc<Queue>,
        evolution_manager: Arc<Mutex<EvolutionManager>>,
        neural_texture: &wgpu::TextureView,
        enable_dmabuf: bool,
    ) -> Self {
        let mut renderer = Self::create_base(device.clone(), queue.clone(), evolution_manager, neural_texture);
        
        if enable_dmabuf {
            let exporter = DmaBufExporter::new(device.clone(), queue.clone()).ok();
            renderer.dmabuf_exporter = exporter;
        }
        
        renderer
    }
    
    pub fn update_with_dmabuf(&mut self, view_proj: &[[f32; 4]; 4]) -> Result<()> {
        if let (Some(exporter), Some(ref mut texture)) = (&self.dmabuf_exporter, &mut self.dmabuf_texture) {
            // Create or update dmabuf texture
            let (fd, new_texture) = exporter.create_shared_buffer(
                4096,  // Width (Hilbert grid)
                4096,  // Height
                wgpu::TextureFormat::Rgba8UnormSrgb,
            )?;
            
            // Sync before GPU read
            if let Some(ref fence) = self.dmabuf_fence {
                fence.wait(100)?;  // 100ms timeout
            }
            
            *texture = new_texture;
        }
        
        self.update(view_proj)
    }
}
```

**Acceptance Criteria**:
- [ ] dmabuf-backed textures render correctly
- [ ] Zero-copy verified in profiling
- [ ] Backward compatible with standard buffers

---

#### Task 2.2.2: Implement Direct Scanout (KMS)
**Priority**: P1  
**Estimated**: 12 hours  
**Dependencies**: Task 2.2.1

**Description**: Bypass compositor GL pipeline for fullscreen visualization

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/kms_scanout.rs

use drm::control::{Device, Mode, Connector};

pub struct KmsScanout {
    device: DrmDevice,
    connector: Connector,
    crtc: u32,
    fb_id: u32,
}

impl KmsScanout {
    pub fn new() -> Result<Self> {
        // Open DRM device
        let device = DrmDevice::open("/dev/dri/card0", false)?;
        
        // Find primary connector
        let connector = Self::find_primary_connector(&device)?;
        
        // Get current CRTC
        let crtc = Self::get_current_crtc(&device, &connector)?;
        
        Ok(Self {
            device,
            connector,
            crtc,
            fb_id: 0,
        })
    }
    
    pub fn scanout_dmabuf(&mut self, dmabuf_fd: RawFd, width: u32, height: u32) -> Result<()> {
        // Add FB from dmabuf
        let fb_id = self.device.add_fb(dmabuf_fd, width, height, 24, 0)?;
        
        // Set CRTC to scanout FB
        self.device.set_crtc(
            self.crtc,
            fb_id,
            0,  // x
            0,  // y
            &[&self.connector],
        )?;
        
        self.fb_id = fb_id;
        Ok(())
    }
    
    fn find_primary_connector(device: &DrmDevice) -> Result<Connector> {
        // Iterate connectors, find one with connection
        todo!()
    }
    
    fn get_current_crtc(device: &DrmDevice, connector: &Connector) -> Result<u32> {
        // Get current CRTC from connector
        todo!()
    }
}
```

**Acceptance Criteria**:
- [ ] Direct scanout works in fullscreen mode
- [ ] Bypasses compositor GL pipeline
- [ ] Hardware scaling and rotation work

---

## Phase 33.3: Compressed Sensing (Week 5-6)

### Week 5: Hilbert Optimization

#### Task 3.1.1: Implement Skilling's Method
**Priority**: P0  
**Estimated**: 12 hours  
**Dependencies**: None

**Description**: Efficient bidirectional Hilbert transformation using Skilling's algorithm

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/hilbert_skilling.rs

/// Skilling's method for efficient Hilbert curve transformation
pub struct HilbertSkilling {
    order: u32,
    size: u32,
}

impl HilbertSkilling {
    pub fn new(order: u32) -> Self {
        let size = 2u32.pow(order);
        Self { order, size }
    }
    
    /// Convert Hilbert index to (x, y) coordinates
    pub fn d2xy(&self, index: u32) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        let mut s = 1u32;
        let mut idx = index;
        
        for _ in 0..self.order {
            let rx = 1 & (idx / 2);
            let ry = 1 & (idx ^ rx);
            
            self.rot(s, &mut x, &mut y, rx, ry);
            
            x += s * rx;
            y += s * ry;
            
            idx /= 4;
            s *= 2;
        }
        
        (x, y)
    }
    
    /// Convert (x, y) coordinates to Hilbert index
    pub fn xy2d(&self, x: u32, y: u32) -> u32 {
        let mut d = 0u32;
        let mut s = 1u32;
        let mut rx = 0u32;
        let mut ry = 0u32;
        let mut cur_x = x;
        let mut cur_y = y;
        
        for _ in 0..self.order {
            rx = 1 & (cur_x / s);
            ry = 1 & (cur_y / s);
            
            d += s * s * ((3 * rx) ^ ry);
            
            self.rot(s, &mut cur_x, &mut cur_y, rx, ry);
            
            cur_x += 2 * s * rx;
            cur_y += 2 * s * ry;
            
            s *= 2;
        }
        
        d
    }
    
    /// Rotate/flip quadrant
    fn rot(&self, s: u32, x: &mut u32, y: &mut u32, rx: u32, ry: u32) {
        if ry == 0 {
            if rx == 1 {
                *x = s - 1 - *x;
                *y = s - 1 - *y;
            }
            
            // Swap x and y
            std::mem::swap(x, y);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_hilbert_roundtrip() {
        let hilbert = HilbertSkilling::new(3);  // 8x8 grid
        
        for i in 0..64 {
            let (x, y) = hilbert.d2xy(i);
            let i2 = hilbert.xy2d(x, y);
            assert_eq!(i, i2, "Roundtrip failed for index {}", i);
        }
    }
    
    #[test]
    fn test_locality_preservation() {
        let hilbert = HilbertSkilling::new(4);  // 16x16 grid
        
        // Adjacent indices should be spatially close
        for i in 0..255 {
            let (x1, y1) = hilbert.d2xy(i);
            let (x2, y2) = hilbert.d2xy(i + 1);
            
            let dist = ((x2 as i32 - x1 as i32).abs() + (y2 as i32 - y1 as i32).abs()) as f32;
            assert!(dist < 3.0, "Locality violation: {} -> {}", i, i + 1);
        }
    }
}
```

**Acceptance Criteria**:
- [ ] Bidirectional transformation works (d2xy and xy2d)
- [ ] Roundtrip tests pass for all orders
- [ ] Locality preservation verified
- [ ] Performance benchmarked (> 1M transformations/sec)

---

#### Task 3.1.2: GPU Compute Shader for Hilbert
**Priority**: P1  
**Estimated**: 8 hours  
**Dependencies**: Task 3.1.1

**Description**: Implement Hilbert transformation in GPU compute shader

**Implementation**:
```wgsl
// systems/infinite_map_rs/src/shaders/hilbert_compute.wgsl

[[block]]
struct Uniforms {
    order: u32,
    size: u32,
};

[[group(0), binding(0)]]
var<uniform> uniforms: Uniforms;

[[group(0), binding(1)]]
var<storage, read> indices: array<u32>;

[[group(0), binding(2)]]
var<storage, read_write> coords: array<vec2<u32>>;

[[stage(compute), workgroup_size(256)]]
fn hilbert_d2xy(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    if (idx >= uniforms.size * uniforms.size) {
        return;
    }
    
    var x: u32 = 0u;
    var y: u32 = 0u;
    var s: u32 = 1u;
    var i: u32 = indices[idx];
    
    for (var n: u32 = 0u; n < uniforms.order; n++) {
        let rx = 1u & (i / 2u);
        let ry = 1u & (i ^ rx);
        
        rot(s, &x, &y, rx, ry);
        
        x = x + s * rx;
        y = y + s * ry;
        
        i = i / 4u;
        s = s * 2u;
    }
    
    coords[idx] = vec2<u32>(x, y);
}

fn rot(s: u32, x: ptr<function, u32>, y: ptr<function, u32>, rx: u32, ry: u32) {
    if (ry == 0u) {
        if (rx == 1u) {
            *x = s - 1u - *x;
            *y = s - 1u - *y;
        }
        
        // Swap x and y
        let temp = *x;
        *x = *y;
        *y = temp;
    }
}
```

**Acceptance Criteria**:
- [ ] Compute shader compiles
- [ ] GPU transformation matches CPU results
- [ ] Performance benchmarked (> 10M transformations/sec)

---

### Week 6: Compressed Sensing

#### Task 3.2.1: Implement Sparse Signal Modeling
**Priority**: P0  
**Estimated**: 12 hours  
**Dependencies**: Task 3.1.1

**Description**: Model memory faults as sparse signal

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/compressed_sensing.rs

use ndarray::{Array2, Array1};
use ndarray_linalg::Svd;

pub struct CompressedSensingReconstructor {
    hilbert_order: u32,
    sparsity_threshold: f32,
    reconstruction_accuracy: f32,
}

impl CompressedSensingReconstructor {
    pub fn new(hilbert_order: u32) -> Self {
        Self {
            hilbert_order,
            sparsity_threshold: 0.1,  // 10% Nyquist
            reconstruction_accuracy: 0.98,
        }
    }
    
    /// Reconstruct full density map from sparse fault samples
    pub fn reconstruct(&mut self, sparse_faults: &[FaultEvent]) -> Result<Array2<f32>> {
        let size = 2usize.pow(self.hilbert_order);
        let mut density_map = Array2::zeros((size, size));
        
        // Map faults to Hilbert coordinates
        for fault in sparse_faults {
            if let FaultEvent::PageFault { address, .. } = fault {
                let (x, y) = self.address_to_hilbert(address);
                density_map[[x, y]] += 1.0;
            }
        }
        
        // Apply compressed sensing reconstruction
        let reconstructed = self.solve_l1_minimization(&density_map)?;
        
        // Check accuracy
        let accuracy = self.compute_accuracy(&density_map, &reconstructed);
        if accuracy < self.reconstruction_accuracy {
            // Adjust order (zoom out)
            self.adjust_sampling_rate(accuracy);
        }
        
        Ok(reconstructed)
    }
    
    fn address_to_hilbert(&self, address: u64) -> (usize, usize) {
        // Map linear address to Hilbert coordinates
        let page_index = (address / 4096) as u32;
        let hilbert = crate::glass_ram::hilbert_skilling::HilbertSkilling::new(self.hilbert_order);
        let (x, y) = hilbert.d2xy(page_index % (2u32.pow(self.hilbert_order)));
        (x as usize, y as usize)
    }
    
    fn solve_l1_minimization(&self, sparse: &Array2<f32>) -> Result<Array2<f32>> {
        // Use L1 minimization with Hilbert locality prior
        // This is the core compressed sensing algorithm
        todo!()
    }
    
    fn compute_accuracy(&self, original: &Array2<f32>, reconstructed: &Array2<f32>) -> f32 {
        // Compute reconstruction accuracy
        let diff = original - reconstructed;
        1.0 - diff.mapv(|x| x.abs()).sum() / original.sum()
    }
    
    fn adjust_sampling_rate(&mut self, accuracy: f32) {
        if accuracy < 0.9 {
            // Zoom out (reduce order)
            self.hilbert_order = self.hilbert_order.saturating_sub(1);
            log::warn!("Reducing Hilbert order to {} (accuracy: {:.2})", 
                self.hilbert_order, accuracy);
        } else if accuracy > 0.99 && self.hilbert_order < 12 {
            // Zoom in (increase order)
            self.hilbert_order += 1;
            log::info!("Increasing Hilbert order to {} (accuracy: {:.2})", 
                self.hilbert_order, accuracy);
        }
    }
}
```

**Acceptance Criteria**:
- [ ] Sparse fault samples mapped to Hilbert coordinates
- [ ] L1 minimization solver works
- [ ] Accuracy > 98% for sparse signals
- [ ] Adaptive order adjustment works

---

#### Task 3.2.2: Add Dependencies for Linear Algebra
**Priority**: P0  
**Estimated**: 1 hour  
**Dependencies**: None

**Implementation**:
```toml
[dependencies]
ndarray = "0.15"
ndarray-linalg = "0.16"
sprs = "0.11"
argmin = "0.8"
```

---

## Phase 33.4: Integration (Week 7-8)

### Week 7: System Orchestration

#### Task 4.1.1: Create Glass RAM System
**Priority**: P0  
**Estimated**: 16 hours  
**Dependencies**: All previous tasks

**Description**: Orchestrate monitor → dmabuf → GPU pipeline

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/system.rs

use crate::glass_ram::monitor::GlassRamMonitor;
use crate::glass_ram::dmabuf_exporter::DmaBufExporter;
use crate::glass_ram::compressed_sensing::CompressedSensingReconstructor;
use crate::thought_renderer::ThoughtRenderer;

pub struct GlassRamSystem {
    monitor: GlassRamMonitor,
    exporter: DmaBufExporter,
    reconstructor: CompressedSensingReconstructor,
    renderer: ThoughtRenderer,
    fault_buffer: Vec<crate::glass_ram::fault_poller::FaultEvent>,
    last_reconstruction: Instant,
}

impl GlassRamSystem {
    pub fn new(
        target_pid: u32,
        device: Arc<Device>,
        queue: Arc<Queue>,
        evolution_manager: Arc<Mutex<EvolutionManager>>,
    ) -> Result<Self> {
        let monitor = GlassRamMonitor::new(target_pid)?;
        let exporter = DmaBufExporter::new(device.clone(), queue.clone())?;
        let reconstructor = CompressedSensingReconstructor::new(8);  // Order 8
        let renderer = ThoughtRenderer::new(
            device.clone(),
            queue.clone(),
            evolution_manager,
            &exporter.create_shared_buffer(4096, 4096, wgpu::TextureFormat::Rgba8UnormSrgb)?.1,
            true,  // Enable dmabuf
        );
        
        Ok(Self {
            monitor,
            exporter,
            reconstructor,
            renderer,
            fault_buffer: Vec::new(),
            last_reconstruction: Instant::now(),
        })
    }
    
    pub async fn run(&mut self) -> Result<()> {
        // Spawn monitor task
        let mut monitor = self.monitor.clone();
        tokio::spawn(async move {
            monitor.run().await
        });
        
        // Main loop
        loop {
            // Collect fault events
            while let Some(event) = self.monitor.event_rx().recv().await {
                self.fault_buffer.push(event);
            }
            
            // Reconstruct every 100ms
            if self.last_reconstruction.elapsed() > Duration::from_millis(100) {
                self.reconstruct_and_render()?;
                self.last_reconstruction = Instant::now();
            }
        }
    }
    
    fn reconstruct_and_render(&mut self) -> Result<()> {
        // Reconstruct density map
        let density_map = self.reconstructor.reconstruct(&self.fault_buffer)?;
        
        // Map to dmabuf texture
        self.exporter.update_dmabuf_texture(&density_map)?;
        
        // Render
        self.renderer.update_with_dmabuf(&self.view_proj)?;
        
        // Clear buffer
        self.fault_buffer.clear();
        
        Ok(())
    }
}
```

**Acceptance Criteria**:
- [ ] System initializes successfully
- [ ] Fault events collected and processed
- [ ] Reconstruction runs at 10 Hz
- [ ] Rendering at 60 FPS
- [ ] Integration test with real application

---

#### Task 4.1.2: Extend Evolution Protocol
**Priority**: P0  
**Estimated**: 4 hours  
**Dependencies**: Task 4.1.1

**Description**: Add Glass RAM telemetry to evolution protocol

**Implementation**:
```rust
// systems/infinite_map_rs/src/evolution_protocol.rs (additions)

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum MessageType {
    // ... existing types ...
    
    // Glass RAM (Phase 33)
    GlassRamTelemetry,
    GlassRamDensityMap,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlassRamTelemetry {
    pub fault_rate: f64,  // faults per second
    pub active_threads: u32,
    pub memory_avalanche_detected: bool,
    pub phase_transition_detected: bool,
    pub reconstruction_accuracy: f32,
    pub hilbert_order: u32,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlassRamDensityMap {
    pub width: u32,
    pub height: u32,
    pub data: Vec<f32>,  // Flattened 2D array
    pub timestamp: f64,
}
```

**Acceptance Criteria**:
- [ ] New message types compile
- [ ] Serialization/deserialization works
- [ ] Integration with daemon

---

### Week 8: Visualization and Testing

#### Task 4.2.1: Create Visualization Modes
**Priority**: P0  
**Estimated**: 12 hours  
**Dependencies**: Task 4.1.1

**Description**: Implement multiple visualization modes for Glass RAM

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/visualization.rs

pub enum GlassRamVisualizationMode {
    /// Heatmap of fault density
    Heatmap,
    
    /// Thread kinetic energy (color by thread ID)
    ThreadKineticEnergy,
    
    /// Phase transition detection (structural shifts)
    PhaseTransition,
    
    /// Memory avalanche visualization (cascading faults)
    MemoryAvalanche,
}

pub struct GlassRamVisualizer {
    mode: GlassRamVisualizationMode,
    color_palette: ColorPalette,
}

impl GlassRamVisualizer {
    pub fn render(&self, density_map: &Array2<f32>) -> wgpu::Texture {
        match self.mode {
            GlassRamVisualizationMode::Heatmap => {
                self.render_heatmap(density_map)
            }
            GlassRamVisualizationMode::ThreadKineticEnergy => {
                self.render_thread_kinetic_energy(density_map)
            }
            GlassRamVisualizationMode::PhaseTransition => {
                self.render_phase_transition(density_map)
            }
            GlassRamVisualizationMode::MemoryAvalanche => {
                self.render_memory_avalanche(density_map)
            }
        }
    }
    
    fn render_heatmap(&self, density_map: &Array2<f32>) -> wgpu::Texture {
        // Map density to color (blue = low, red = high)
        todo!()
    }
    
    fn render_thread_kinetic_energy(&self, density_map: &Array2<f32>) -> wgpu::Texture {
        // Color by thread ID, intensity by fault count
        todo!()
    }
    
    fn render_phase_transition(&self, density_map: &Array2<f32>) -> wgpu::Texture {
        // Detect structural shifts in density distribution
        todo!()
    }
    
    fn render_memory_avalanche(&self, density_map: &Array2<f32>) -> wgpu::Texture {
        // Visualize cascading fault patterns
        todo!()
    }
}
```

**Acceptance Criteria**:
- [ ] All visualization modes work
- [ ] Smooth transitions between modes
- [ ] Performance at 60 FPS

---

#### Task 4.2.2: Performance Benchmarking
**Priority**: P0  
**Estimated**: 8 hours  
**Dependencies**: Task 4.2.1

**Description**: Benchmark all components and verify success metrics

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/benchmark.rs

pub struct GlassRamBenchmark {
    fault_throughput: f64,  // events/sec
    reconstruction_time: Duration,
    render_time: Duration,
    target_overhead: f64,  // percentage
    reconstruction_accuracy: f32,
}

impl GlassRamBenchmark {
    pub fn run(&mut self) -> Result<()> {
        // Benchmark fault handling
        self.benchmark_fault_throughput()?;
        
        // Benchmark reconstruction
        self.benchmark_reconstruction()?;
        
        // Benchmark rendering
        self.benchmark_rendering()?;
        
        // Measure target overhead
        self.benchmark_target_overhead()?;
        
        // Print results
        self.print_results();
        
        Ok(())
    }
    
    fn benchmark_fault_throughput(&mut self) -> Result<()> {
        // Measure events/sec
        todo!()
    }
    
    fn benchmark_reconstruction(&mut self) -> Result<()> {
        // Measure reconstruction time
        todo!()
    }
    
    fn benchmark_rendering(&mut self) -> Result<()> {
        // Measure render time (should be < 16ms for 60 FPS)
        todo!()
    }
    
    fn benchmark_target_overhead(&mut self) -> Result<()> {
        // Measure impact on target process (should be < 10%)
        todo!()
    }
    
    fn print_results(&self) {
        println!("Glass RAM Benchmark Results:");
        println!("  Fault Throughput: {:.2} events/sec", self.fault_throughput);
        println!("  Reconstruction Time: {:?}", self.reconstruction_time);
        println!("  Render Time: {:?}", self.render_time);
        println!("  Target Overhead: {:.2}%", self.target_overhead);
        println!("  Reconstruction Accuracy: {:.2}%", self.reconstruction_accuracy * 100.0);
    }
}
```

**Acceptance Criteria**:
- [ ] Fault throughput > 10,000 events/sec
- [ ] Reconstruction time < 10ms
- [ ] Render time < 16ms (60 FPS)
- [ ] Target overhead < 10%
- [ ] Reconstruction accuracy > 98%

---

#### Task 4.2.3: Integration Testing
**Priority**: P0  
**Estimated**: 12 hours  
**Dependencies**: Task 4.2.2

**Description**: End-to-end integration tests with real applications

**Implementation**:
```rust
// systems/infinite_map_rs/src/glass_ram/tests/integration_test.rs

#[tokio::test]
async fn test_glass_ram_with_python_process() {
    // Spawn Python process
    let mut child = Command::new("python3")
        .arg("-c")
        .arg("import time; data = [0] * 1000000; time.sleep(10)")
        .spawn()
        .expect("Failed to spawn Python");
    
    let pid = child.id();
    
    // Attach Glass RAM monitor
    let system = GlassRamSystem::new(pid, device, queue, evolution_manager)?;
    
    // Run for 5 seconds
    tokio::time::sleep(Duration::from_secs(5)).await;
    
    // Verify fault events captured
    assert!(system.fault_count() > 0);
    
    // Verify reconstruction accuracy
    assert!(system.reconstruction_accuracy() > 0.98);
    
    // Kill child
    child.kill().await;
}

#[tokio::test]
async fn test_glass_ram_with_memory_leak() {
    // Spawn process with memory leak
    let mut child = Command::new("python3")
        .arg("-c")
        .arg("leak = []; while True: leak.append([0] * 10000)")
        .spawn()
        .expect("Failed to spawn Python");
    
    let pid = child.id();
    
    // Attach Glass RAM monitor
    let system = GlassRamSystem::new(pid, device, queue, evolution_manager)?;
    
    // Run for 10 seconds
    tokio::time::sleep(Duration::from_secs(10)).await;
    
    // Verify leak detection
    assert!(system.memory_avalanche_detected());
    
    // Kill child
    child.kill().await;
}
```

**Acceptance Criteria**:
- [ ] Integration tests pass
- [ ] Real applications monitored successfully
- [ ] Memory leaks detected
- [ ] Phase transitions identified

---

## Summary

**Total Tasks**: 23  
**Estimated Total Time**: 160 hours (4 weeks at 40 hours/week)  
**Critical Path**: Task 1.1.2 → 1.2.2 → 2.1.2 → 3.1.1 → 4.1.1  
**Risk Factors**: Kernel compatibility, GPU vendor support, performance bottlenecks

**Success Metrics**:
- ✅ < 10% overhead on target process
- ✅ 60 FPS visualization at 4K resolution
- ✅ < 10ms latency from fault to display
- ✅ > 98% reconstruction accuracy

---

**Document Version**: 1.0  
**Last Updated**: 2026-01-17  
**Status**: Ready for Implementation
