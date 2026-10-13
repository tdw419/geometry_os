//! AMDGPU DRM ioctl definitions
//!
//! Direct kernel interface for AMDGPU command submission.
//! These structures correspond to the amdgpu kernel driver's uapi.

use std::os::unix::io::RawFd;

/// DRM ioctl direction flags
const DRM_IOC_WRITE: u64 = 1;
const DRM_IOC_READ: u64 = 2;
const DRM_IOC_READWRITE: u64 = DRM_IOC_READ | DRM_IOC_WRITE;

/// DRM base for ioctl numbers
const DRM_COMMAND_BASE: u64 = 0x40;

/// AMDGPU DRM ioctl command offsets
const DRM_AMDGPU_GEM_CREATE: u64 = 0x00;
const DRM_AMDGPU_GEM_MMAP: u64 = 0x01;
const DRM_AMDGPU_GEM_WAIT_IDLE: u64 = 0x04;
const DRM_AMDGPU_GEM_VA: u64 = 0x08;
const DRM_AMDGPU_CS: u64 = 0x09;
const DRM_AMDGPU_INFO: u64 = 0x0A;
const DRM_AMDGPU_GEM_METADATA: u64 = 0x0B;
const DRM_AMDGPU_GEM_USERPTR: u64 = 0x0E;
const DRM_AMDGPU_WAIT_CS: u64 = 0x10;
const DRM_AMDGPU_CTX: u64 = 0x02;
const DRM_AMDGPU_GEM_FIND: u64 = 0x14;
const DRM_AMDGPU_GEM_VA_UNMAP: u64 = 0x18;

/// Compute number of bits for ioctl encoding
const fn ioc_bits(direction: u64, size: usize) -> u64 {
    // Linux ioctl encoding: direction(2) | size(14) | type(8) | nr(8)
    (direction << 30) | ((size as u64 & 0x3FFF) << 16) | (b'd' as u64) << 8
}

/// Build an IOW DRM ioctl number
const fn drm_iow(nr: u64, size: usize) -> u64 {
    DRM_COMMAND_BASE | ioc_bits(DRM_IOC_WRITE, size) | nr
}

/// Build an IOR DRM ioctl number
const fn drm_ior(nr: u64, size: usize) -> u64 {
    DRM_COMMAND_BASE | ioc_bits(DRM_IOC_READ, size) | nr
}

/// Build an IOWR DRM ioctl number
const fn drm_iowr(nr: u64, size: usize) -> u64 {
    DRM_COMMAND_BASE | ioc_bits(DRM_IOC_READWRITE, size) | nr
}

// ---- GEM Create ----

/// GEM buffer object creation flags
pub mod gem_domain {
    pub const CPU: u64 = 1 << 0;
    pub const GTT: u64 = 1 << 1;
    pub const VRAM: u64 = 1 << 2;
    pub const GDS: u64 = 1 << 3;
    pub const GPU_READONLY: u64 = 1 << 4;
    pub const VRAM_CONTIGUOUS: u64 = 1 << 5;
}

/// GEM buffer object creation parameters
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuGemCreateIn {
    /// Requested buffer size in bytes
    pub size: u64,
    /// Initial GPU domain (GTT, VRAM, etc.)
    pub domain: u64,
    /// Buffer creation flags
    pub flags: u64,
}

/// GEM buffer object creation result
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuGemCreateOut {
    /// GEM handle for the created buffer
    pub handle: u32,
    pub _pad: u32,
}

/// Combined GEM create ioctl argument
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuGemCreateArgs {
    pub r#in: AmdgpuGemCreateIn,
    pub out: AmdgpuGemCreateOut,
}

// ---- GEM MMAP ----

/// GEM mmap parameters
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuGemMmapIn {
    /// GEM handle to map
    pub handle: u32,
    pub _pad: u32,
}

/// GEM mmap result
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuGemMmapOut {
    /// CPU virtual address offset for mmap
    pub addr_ptr: u64,
}

/// Combined GEM mmap ioctl argument
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuGemMmapArgs {
    pub r#in: AmdgpuGemMmapIn,
    pub out: AmdgpuGemMmapOut,
}

// ---- GEM VA (Virtual Address) ----

/// GEM VA operation types
pub mod gem_va_op {
    pub const MAP: u32 = 0;
    pub const UNMAP: u32 = 1;
    pub const REPLACE: u32 = 2;
}

/// GEM VA mapping parameters
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuGemVa {
    /// GEM handle
    pub handle: u32,
    /// Operation type (map/unmap/replace)
    pub operation: u32,
    /// GPU virtual address
    pub va_address: u64,
    /// Offset within the BO
    pub offset_in_bo: u64,
    /// Mapping size
    pub map_size: u64,
    /// Flags
    pub flags: u32,
    pub _pad: u32,
}

// ---- Command Submission (CS) ----

/// Chunk types for CS submission
pub mod cs_chunk_type {
    /// Indirect buffer (IB) commands
    pub const IB: u32 = 0;
    /// Fence parameters
    pub const FENCE: u32 = 1;
    /// Dependencies (fences to wait for)
    pub const DEPENDENCIES: u32 = 2;
    /// Sync objects
    pub const SYNCOBJ_IN: u32 = 3;
    pub const SYNCOBJ_OUT: u32 = 4;
    /// BO handles
    pub const BO_HANDLES: u32 = 5;
}

/// CS chunk descriptor
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuCsChunk {
    /// Chunk type (IB, FENCE, etc.)
    pub chunk_id: u32,
    /// Size of chunk data in bytes
    pub length_dw: u32,
    /// Pointer to chunk data (cast to appropriate type)
    pub chunk_data: u64,
}

/// IB (Indirect Buffer) entry for CS
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuCsIbInfo {
    /// GEM handle of the command buffer
    pub ib_mc_address: u64,
    /// Size in dwords
    pub ib_size: u32,
    /// Flags (e.g., PREAMBLE, PREEMPT)
    pub flags: u32,
    /// IP type (e.g., AMDGPU_HW_IP_COMPUTE)
    pub ip_type: u32,
    /// IP instance
    pub ip_instance: u32,
    /// Ring index
    pub ring: u32,
}

/// Fence return value
#[repr(C)]
#[derive(Debug, Clone, Default)]
pub struct AmdgpuCsFence {
    /// Context handle
    pub context: u32,
    /// IP type
    pub ip_type: u32,
    /// IP instance
    pub ip_instance: u32,
    /// Ring index
    pub ring: u32,
    /// Sequence number
    pub seq_no: u32,
}

/// CS submission flags
pub mod cs_flags {
    /// Force 64-bit fence
    pub const FENCE64: u64 = 1 << 0;
    /// Use GTT for ring buffer
    pub const GTT: u64 = 1 << 1;
}

/// Full CS submission arguments
#[repr(C)]
#[derive(Debug)]
pub struct AmdgpuCsIn {
    /// Context handle
    pub ctx_id: u32,
    /// Number of chunks
    pub num_chunks: u32,
    /// Submission flags
    pub flags: u64,
    /// Pointer to array of chunk pointers
    pub chunks_ptr: u64,
}

/// CS submission result
#[repr(C)]
#[derive(Debug)]
pub struct AmdgpuCsOut {
    /// Fence handle (64-bit)
    pub handle: u64,
}

/// Combined CS ioctl argument
#[repr(C)]
#[derive(Debug)]
pub struct AmdgpuCsArgs {
    pub r#in: AmdgpuCsIn,
    pub out: AmdgpuCsOut,
}

// ---- Context Creation ----

/// Context creation ioctl argument
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuCtxPriv {
    pub flags: u32,
    pub priority: u32,
    pub ctx_id: u32,
    pub _pad: u32,
}

// ---- Context Management ----

/// Context operation types
pub mod ctx_op {
    pub const CREATE: u32 = 0;
    pub const DESTROY: u32 = 1;
    pub const QUERY: u32 = 2;
}

/// Context priority levels
pub mod ctx_priority {
    pub const LOW: u32 = -128i32 as u32;
    pub const NORMAL: u32 = 0;
    pub const HIGH: u32 = 128;
}

/// Context creation/destruction/query arguments
#[repr(C)]
#[derive(Debug, Clone)]
pub struct AmdgpuCtxArg {
    /// Context ID (set by kernel on CREATE, provided by user on DESTROY/QUERY)
    pub ctx_id: u32,
    /// Padding
    pub _pad: u32,
}

/// Context query: fence status result
#[repr(C)]
#[derive(Debug, Clone, Default)]
pub struct AmdgpuCtxFenceStatus {
    /// Error code from fence (0 = success)
    pub error: u32,
    /// Context ID
    pub ctx_id: u32,
}

// ---- Wait CS ----

/// Wait for CS completion arguments
#[repr(C)]
#[derive(Debug)]
pub struct AmdgpuWaitCsIn {
    /// Context handle
    pub ctx_id: u32,
    /// IP type
    pub ip_type: u32,
    /// IP instance
    pub ip_instance: u32,
    /// Ring index
    pub ring: u32,
    /// Sequence number to wait for
    pub seq_no: u32,
    /// Padding
    pub _pad: u32,
    /// Timeout in nanoseconds
    pub timeout: u64,
    /// Last queued sequence number (set by kernel on return)
    pub queued_seq_no: u64,
}

/// Wait CS result
#[repr(C)]
#[derive(Debug)]
pub struct AmdgpuWaitCsOut {
    /// Set to 1 if CS completed
    pub completed: u64,
}

/// Combined wait CS ioctl argument
#[repr(C)]
#[derive(Debug)]
pub struct AmdgpuWaitCsArgs {
    pub r#in: AmdgpuWaitCsIn,
    pub out: AmdgpuWaitCsOut,
}

// ---- AMDGPU Info ----

/// Info request types
pub mod info_type {
    pub const VRAM_SIZE: u32 = 0x00;
    pub const VRAM_GTT_LIMIT: u32 = 0x01;
    pub const ASIC_ID: u32 = 0x04;
    pub const NUM_BYTES_MOVED: u32 = 0x06;
    pub const DEVICE_ID: u32 = 0x14;
    pub const VIS_VRAM_LIMIT: u32 = 0x15;
    pub const NUM_VRAM_CPU_PAGE_FAULTS: u32 = 0x1A;
    pub const VRAM_LOST_COUNTER: u32 = 0x1C;
}

/// Hardware IP types
pub mod hw_ip_type {
    pub const GFX: u32 = 0;
    pub const COMPUTE: u32 = 1;
    pub const DMA: u32 = 2;
    pub const UVD: u32 = 3;
    pub const VCE: u32 = 4;
    pub const UVD_ENC: u32 = 5;
    pub const VCN_DEC: u32 = 6;
    pub const VCN_ENC: u32 = 7;
    pub const VCN_JPEG: u32 = 8;
}

/// Info query structure
#[repr(C)]
#[derive(Debug)]
pub struct AmdgpuInfo {
    /// Request type
    pub request: u32,
    /// Size of return data
    pub return_size: u32,
    /// Pointer to return data
    pub return_pointer: u64,
}

// ---- GEM Wait Idle ----

/// GEM wait idle parameters
#[repr(C)]
#[derive(Debug)]
pub struct AmdgpuGemWaitIdle {
    /// GEM handle
    pub handle: u32,
    pub _pad: u32,
    /// Timeout (ns), MAX_UINT64 for infinite
    pub timeout: u64,
    /// Set to 1 if BO is idle after call
    pub status: u64,
}

/// Perform a DRM ioctl call on an AMDGPU device fd.
///
/// # Safety
/// Caller must ensure `fd` is a valid AMDGPU DRM file descriptor.
pub unsafe fn drm_ioctl(fd: RawFd, request: u64, arg: *mut std::ffi::c_void) -> std::io::Result<()> {
    let ret = libc::ioctl(fd, request as _, arg);
    if ret < 0 {
        Err(std::io::Error::last_os_error())
    } else {
        Ok(())
    }
}

/// Get the ioctl number for AMDGPU_GEM_CREATE
pub const fn ioctl_gem_create() -> u64 {
    drm_iowr(DRM_AMDGPU_GEM_CREATE, std::mem::size_of::<AmdgpuGemCreateArgs>())
}

/// Get the ioctl number for AMDGPU_GEM_MMAP
pub const fn ioctl_gem_mmap() -> u64 {
    drm_iowr(DRM_AMDGPU_GEM_MMAP, std::mem::size_of::<AmdgpuGemMmapArgs>())
}

/// Get the ioctl number for AMDGPU_CS
pub const fn ioctl_cs() -> u64 {
    drm_iowr(DRM_AMDGPU_CS, std::mem::size_of::<AmdgpuCsArgs>())
}

/// Get the ioctl number for AMDGPU_GEM_VA
pub const fn ioctl_gem_va() -> u64 {
    drm_iow(DRM_AMDGPU_GEM_VA, std::mem::size_of::<AmdgpuGemVa>())
}

/// Get the ioctl number for AMDGPU_INFO
pub const fn ioctl_info() -> u64 {
    drm_iowr(DRM_AMDGPU_INFO, std::mem::size_of::<AmdgpuInfo>())
}

/// Get the ioctl number for AMDGPU_GEM_WAIT_IDLE
pub const fn ioctl_gem_wait_idle() -> u64 {
    drm_iowr(DRM_AMDGPU_GEM_WAIT_IDLE, std::mem::size_of::<AmdgpuGemWaitIdle>())
}

/// Get the ioctl number for AMDGPU_CTX (context create/destroy/query)
pub const fn ioctl_ctx() -> u64 {
    drm_iowr(DRM_AMDGPU_CTX, std::mem::size_of::<AmdgpuCtxArg>())
}

/// Get the ioctl number for AMDGPU_WAIT_CS
pub const fn ioctl_wait_cs() -> u64 {
    drm_iowr(DRM_AMDGPU_WAIT_CS, std::mem::size_of::<AmdgpuWaitCsArgs>())
}

/// Helper to build a CS chunk
impl AmdgpuCsChunk {
    pub fn new(chunk_id: u32, data: *const u8, len_bytes: usize) -> Self {
        Self {
            chunk_id,
            length_dw: (len_bytes / 4) as u32,
            chunk_data: data as u64,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ioctl_numbers_nonzero() {
        assert!(ioctl_gem_create() > 0);
        assert!(ioctl_gem_mmap() > 0);
        assert!(ioctl_cs() > 0);
        assert!(ioctl_gem_va() > 0);
        assert!(ioctl_info() > 0);
        assert!(ioctl_gem_wait_idle() > 0);
    }

    #[test]
    fn test_gem_create_struct_layout() {
        assert_eq!(std::mem::size_of::<AmdgpuGemCreateArgs>(), 32);
    }

    #[test]
    fn test_gem_mmap_struct_layout() {
        // AmdgpuGemMmapIn(8) + AmdgpuGemMmapOut(8) = 16
        // (no padding needed since both sub-structs are naturally aligned)
        assert_eq!(std::mem::size_of::<AmdgpuGemMmapArgs>(), 16);
    }

    #[test]
    fn test_gem_va_struct_layout() {
        assert_eq!(std::mem::size_of::<AmdgpuGemVa>(), 40);
    }

    #[test]
    fn test_cs_ib_info_layout() {
        // u64 + 5*u32 = 28 bytes, but Rust aligns to u64 (8 bytes) -> 32 with padding
        assert_eq!(std::mem::size_of::<AmdgpuCsIbInfo>(), 32);
    }

    #[test]
    fn test_cs_chunk_layout() {
        assert_eq!(std::mem::size_of::<AmdgpuCsChunk>(), 16);
    }

    #[test]
    fn test_gem_domain_flags() {
        assert_eq!(gem_domain::CPU, 1);
        assert_eq!(gem_domain::GTT, 2);
        assert_eq!(gem_domain::VRAM, 4);
        assert_eq!(gem_domain::VRAM_CONTIGUOUS, 32);
    }

    #[test]
    fn test_hw_ip_types() {
        assert_eq!(hw_ip_type::COMPUTE, 1);
    }

    #[test]
    fn test_cs_chunk_builder() {
        let ib = AmdgpuCsIbInfo {
            ib_mc_address: 0x1000_0000,
            ib_size: 64,
            flags: 0,
            ip_type: hw_ip_type::COMPUTE,
            ip_instance: 0,
            ring: 0,
        };
        let chunk = AmdgpuCsChunk::new(
            cs_chunk_type::IB,
            &ib as *const _ as *const u8,
            std::mem::size_of::<AmdgpuCsIbInfo>(),
        );
        assert_eq!(chunk.chunk_id, cs_chunk_type::IB);
        assert!(chunk.length_dw > 0);
    }

    #[test]
    fn test_ctx_arg_layout() {
        assert_eq!(std::mem::size_of::<AmdgpuCtxArg>(), 8);
    }

    #[test]
    fn test_ctx_ioctl_number() {
        assert!(ioctl_ctx() > 0);
    }

    #[test]
    fn test_wait_cs_ioctl_number() {
        assert!(ioctl_wait_cs() > 0);
    }

    #[test]
    fn test_wait_cs_args_layout() {
        assert!(std::mem::size_of::<AmdgpuWaitCsIn>() > 0);
        assert!(std::mem::size_of::<AmdgpuWaitCsOut>() > 0);
    }

    #[test]
    fn test_cs_chunk_public_fields() {
        let ib = AmdgpuCsIbInfo {
            ib_mc_address: 0xDEAD_BEEF,
            ib_size: 32,
            flags: 0,
            ip_type: hw_ip_type::COMPUTE,
            ip_instance: 0,
            ring: 1,
        };
        let chunk = AmdgpuCsChunk {
            chunk_id: cs_chunk_type::IB,
            length_dw: 7,
            chunk_data: &ib as *const _ as u64,
        };
        assert_eq!(chunk.chunk_id, cs_chunk_type::IB);
        assert_eq!(chunk.length_dw, 7);
        assert!(chunk.chunk_data > 0);
    }
}
