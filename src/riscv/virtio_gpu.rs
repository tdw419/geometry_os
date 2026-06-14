// riscv/virtio_gpu.rs -- VirtIO GPU device (Phase 287)
//
// Minimal VirtIO GPU implementation supporting 2D framebuffer display.
// Implements the VirtIO GPU protocol (device ID 16) with MMIO transport.
//
// Supported operations:
//   - VIRTIO_GPU_CMD_GET_DISPLAY_INFO: Query display configuration
//   - VIRTIO_GPU_CMD_RESOURCE_CREATE_2D: Allocate a 2D resource
//   - VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING: Attach host-visible memory
//   - VIRTIO_GPU_CMD_SET_SCANOUT: Map a resource to a scanout (display)
//   - VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D: Copy data from guest to resource
//   - VIRTIO_GPU_CMD_FLUSH: Flush scanout to display
//   - VIRTIO_GPU_CMD_UPDATE_CURSOR: Update cursor position (minimal)
//   - VIRTIO_GPU_CMD_RESOURCE_UNREF: Destroy a resource
//
// The framebuffer is exposed as a linear pixel buffer (ARGB/XRGB8888).
// Resolution defaults to 640x480 (standard minimal Linux framebuffer).

use std::collections::HashMap;

// ---------------------------------------------------------------------------
// VirtIO MMIO transport constants (shared with virtio_blk)
// ---------------------------------------------------------------------------

/// VirtIO MMIO magic value.
pub const VIRTIO_MAGIC: u32 = 0x7472_6976;
/// VirtIO version (legacy = 1, modern = 2).
pub const VIRTIO_VERSION: u32 = 2;
/// VirtIO GPU device ID.
pub const VIRTIO_GPU_ID: u32 = 16;

/// VirtIO status bits.
pub const VIRTIO_STATUS_ACKNOWLEDGE: u32 = 1;
pub const VIRTIO_STATUS_DRIVER: u32 = 2;
pub const VIRTIO_STATUS_DRIVER_OK: u32 = 4;
pub const VIRTIO_STATUS_FEATURES_OK: u32 = 8;
pub const VIRTIO_STATUS_FAILED: u32 = 128;

/// VirtIO feature bits for GPU.
pub const VIRTIO_GPU_F_VIRGL: u64 = 0; // Not supported
pub const VIRTIO_GPU_F_EDID: u64 = 1; // Not supported
pub const VIRTIO_GPU_F_RESOURCE_UUID: u64 = 2; // Not supported

/// Interrupt status bits.
pub const VIRTIO_INT_USED_RING: u32 = 1;
pub const VIRTIO_INT_CONFIG: u32 = 2;

// ---------------------------------------------------------------------------
// VirtIO MMIO register offsets
// ---------------------------------------------------------------------------

pub const MAGIC: usize = 0x00;
pub const VERSION: usize = 0x04;
pub const DEVICE_ID: usize = 0x08;
pub const VENDOR_ID: usize = 0x0C;
pub const DEVICE_FEATURES: usize = 0x10;
pub const DEVICE_FEATURES_SEL: usize = 0x14;
pub const DRIVER_FEATURES: usize = 0x20;
pub const DRIVER_FEATURES_SEL: usize = 0x24;
pub const QUEUE_SEL: usize = 0x30;
pub const QUEUE_NUM_MAX: usize = 0x34;
pub const QUEUE_NUM: usize = 0x38;
pub const QUEUE_READY: usize = 0x44;
pub const QUEUE_NOTIFY: usize = 0x50;
pub const INTERRUPT_STATUS: usize = 0x60;
pub const INTERRUPT_ACK: usize = 0x64;
pub const STATUS: usize = 0x70;
pub const CONFIG: usize = 0x100; // Device-specific config space

// Queue address registers
pub const QUEUE_DESC_LOW: usize = 0x80;
pub const QUEUE_DESC_HIGH: usize = 0x84;
pub const QUEUE_AVAIL_LOW: usize = 0x90;
pub const QUEUE_AVAIL_HIGH: usize = 0x94;
pub const QUEUE_USED_LOW: usize = 0xA0;
pub const QUEUE_USED_HIGH: usize = 0xA4;

// ---------------------------------------------------------------------------
// VirtIO GPU command types
// ---------------------------------------------------------------------------

pub const VIRTIO_GPU_CMD_GET_DISPLAY_INFO: u32 = 0x100;
pub const VIRTIO_GPU_CMD_RESOURCE_CREATE_2D: u32 = 0x101;
pub const VIRTIO_GPU_CMD_RESOURCE_UNREF: u32 = 0x102;
pub const VIRTIO_GPU_CMD_SET_SCANOUT: u32 = 0x103;
pub const VIRTIO_GPU_CMD_RESOURCE_FLUSH: u32 = 0x104;
pub const VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D: u32 = 0x105;
pub const VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING: u32 = 0x106;
pub const VIRTIO_GPU_CMD_UPDATE_CURSOR: u32 = 0x107;
pub const VIRTIO_GPU_CMD_MOVE_CURSOR: u32 = 0x108;

/// VirtIO GPU control queue response types.
pub const VIRTIO_GPU_RESP_OK_NODATA: u32 = 0x1100;
pub const VIRTIO_GPU_RESP_OK_DISPLAY_INFO: u32 = 0x1101;
pub const VIRTIO_GPU_RESP_ERR_UNSPEC: u32 = 0x1200;
pub const VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY: u32 = 0x1201;
pub const VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID: u32 = 0x1202;
pub const VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID: u32 = 0x1203;
pub const VIRTIO_GPU_RESP_ERR_INVALID_CONTEXT_ID: u32 = 0x1204;

// ---------------------------------------------------------------------------
// VirtIO GPU configuration space (host-visible)
// ---------------------------------------------------------------------------

/// VirtIO GPU config structure (in MMIO config space).
/// Events are reported via interrupt; we keep the config minimal.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuConfig {
    pub events_read: u32,
    pub events_clear: u32,
    pub num_scanouts: u32,
    pub reserved: u32,
}

// ---------------------------------------------------------------------------
// VirtIO GPU command structures
// ---------------------------------------------------------------------------

/// Header shared by all GPU control commands.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuCtrlHdr {
    pub hdr_type: u32,
    pub flags: u32,
    pub fence_id: u64,
    pub ctx_id: u32,
    pub padding: u32,
}

/// VIRTIO_GPU_CMD_GET_DISPLAY_INFO response.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuRespDisplayInfo {
    pub hdr: VirtioGpuCtrlHdr,
    /// One per scanout (we support 1).
    pub pmodes: [VirtioGpuDisplayOne; 1],
}

#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuDisplayOne {
    pub enabled: u32,
    pub r: VirtioGpuRect,
    pub flags: u32,
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
}

#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuRect {
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
}

/// VIRTIO_GPU_CMD_RESOURCE_CREATE_2D.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuResourceCreate2D {
    pub hdr: VirtioGpuCtrlHdr,
    pub resource_id: u32,
    pub format: u32,
    pub width: u32,
    pub height: u32,
}

/// VIRTIO_GPU_CMD_RESOURCE_UNREF.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuResourceUnref {
    pub hdr: VirtioGpuCtrlHdr,
    pub resource_id: u32,
    pub padding: u32,
}

/// VIRTIO_GPU_CMD_SET_SCANOUT.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuSetScanout {
    pub hdr: VirtioGpuCtrlHdr,
    pub r: VirtioGpuRect,
    pub scanout_id: u32,
    pub resource_id: u32,
}

/// VIRTIO_GPU_CMD_RESOURCE_FLUSH.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuResourceFlush {
    pub hdr: VirtioGpuCtrlHdr,
    pub r: VirtioGpuRect,
    pub resource_id: u32,
    pub padding: u32,
}

/// VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuTransferToHost2D {
    pub hdr: VirtioGpuCtrlHdr,
    pub r: VirtioGpuRect,
    pub offset: u64,
    pub resource_id: u32,
    pub padding: u32,
}

/// VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuResourceAttachBacking {
    pub hdr: VirtioGpuCtrlHdr,
    pub resource_id: u32,
    pub nr_entries: u32,
}

/// Entry for attach backing (variable-length array follows the struct).
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuMemEntry {
    pub addr: u64,
    pub length: u32,
    pub padding: u32,
}

/// VIRTIO_GPU_CMD_UPDATE_CURSOR.
#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuUpdateCursor {
    pub hdr: VirtioGpuCtrlHdr,
    pub pos: VirtioGpuCursorPos,
    pub resource_id: u32,
    pub hot_x: u32,
    pub hot_y: u32,
}

#[derive(Clone, Copy, Debug, Default)]
#[repr(C)]
pub struct VirtioGpuCursorPos {
    pub scanout_id: u32,
    pub x: u32,
    pub y: u32,
    pub padding: u32,
}

// ---------------------------------------------------------------------------
// Pixel format
// ---------------------------------------------------------------------------

/// VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM (standard 32-bit BGRA).
pub const VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM: u32 = 1;
/// VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM (32-bit BGRX, no alpha).
pub const VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM: u32 = 2;
/// VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM (32-bit RGBA).
pub const VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM: u32 = 4;
/// VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM (32-bit XRGB).
pub const VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM: u32 = 3;

// ---------------------------------------------------------------------------
// Default configuration
// ---------------------------------------------------------------------------

/// Default framebuffer width.
pub const DEFAULT_WIDTH: u32 = 640;
/// Default framebuffer height.
pub const DEFAULT_HEIGHT: u32 = 480;
/// Default bytes per pixel.
pub const BYTES_PER_PIXEL: u32 = 4;
/// Maximum number of VirtIO queues (controlq + cursorq).
pub const MAX_QUEUES: usize = 2;
/// Queue 0: control queue.
pub const CONTROL_QUEUE: usize = 0;
/// Queue 1: cursor queue.
pub const CURSOR_QUEUE: usize = 1;
/// VirtIO queue size.
pub const QUEUE_SIZE: u32 = 64;

// ---------------------------------------------------------------------------
// MMIO address range
// ---------------------------------------------------------------------------

/// VirtIO GPU MMIO base address (0x1000_3000, after virtio-blk and virtio-net).
pub const VIRTIO_GPU_BASE: u64 = 0x1000_3000;
/// VirtIO GPU MMIO size.
pub const VIRTIO_GPU_SIZE: u64 = 0x1000;

// ---------------------------------------------------------------------------
// VirtioQueue
// ---------------------------------------------------------------------------

/// A single VirtIO split virtqueue.
#[derive(Clone, Copy, Debug)]
pub struct VirtioQueue {
    /// Maximum queue size.
    pub size: u32,
    /// Whether the queue is ready (driver has set QUEUE_READY).
    pub ready: bool,
    /// Guest-physical address of the descriptor table.
    pub desc_addr: u64,
    /// Guest-physical address of the available ring.
    pub avail_addr: u64,
    /// Guest-physical address of the used ring.
    pub used_addr: u64,
    /// Last index we've processed in the available ring.
    pub last_avail_idx: u16,
    /// Last index we've written in the used ring.
    pub last_used_idx: u16,
}

impl Default for VirtioQueue {
    fn default() -> Self {
        Self {
            size: QUEUE_SIZE,
            ready: false,
            desc_addr: 0,
            avail_addr: 0,
            used_addr: 0,
            last_avail_idx: 0,
            last_used_idx: 0,
        }
    }
}

// ---------------------------------------------------------------------------
// GPU Resource
// ---------------------------------------------------------------------------

/// A 2D GPU resource (framebuffer or texture).
#[derive(Clone, Debug)]
pub struct GpuResource {
    /// Resource ID assigned by the guest.
    pub resource_id: u32,
    /// Pixel width.
    pub width: u32,
    /// Pixel height.
    pub height: u32,
    /// Pixel format (one of VIRTIO_GPU_FORMAT_*).
    pub format: u32,
    /// Pixel data buffer (width * height * bytes_per_pixel).
    pub data: Vec<u8>,
    /// Guest memory entries for this resource's backing store.
    pub backing: Vec<VirtioGpuMemEntry>,
}

// ---------------------------------------------------------------------------
// Scanout
// ---------------------------------------------------------------------------

/// A display scanout (output target).
#[derive(Clone, Copy, Debug)]
pub struct GpuScanout {
    /// Whether this scanout is enabled.
    pub enabled: bool,
    /// Resource currently displayed (resource ID).
    pub resource_id: u32,
    /// Position within the resource to display.
    pub x: u32,
    pub y: u32,
    /// Display width.
    pub width: u32,
    pub height: u32,
}

impl Default for GpuScanout {
    fn default() -> Self {
        Self {
            enabled: false,
            resource_id: 0,
            x: 0,
            y: 0,
            width: DEFAULT_WIDTH,
            height: DEFAULT_HEIGHT,
        }
    }
}

// ---------------------------------------------------------------------------
// VirtioGpu -- the main device
// ---------------------------------------------------------------------------

/// VirtIO GPU device state.
pub struct VirtioGpu {
    // -- VirtIO transport state --
    /// Device status register.
    pub status: u32,
    /// Acknowledged feature bits (driver_features).
    pub driver_features: u64,
    /// Feature select register.
    pub features_sel: u32,
    /// Interrupt status.
    pub int_status: u32,
    /// Selected queue index.
    pub queue_sel: u32,
    /// VirtIO queues (control + cursor).
    pub queues: [VirtioQueue; MAX_QUEUES],
    /// Device-specific config.
    pub config: VirtioGpuConfig,

    // -- GPU-specific state --
    /// 2D resources indexed by resource ID.
    pub resources: HashMap<u32, GpuResource>,
    /// Scanouts (we support 1).
    pub scanouts: [GpuScanout; 1],
    /// Next available resource ID for internal use.
    pub next_resource_id: u32,
    /// Display width.
    pub width: u32,
    /// Display height.
    pub height: u32,
    /// The actual framebuffer pixels (width * height * 4 bytes).
    /// This is the "physical display" -- what the host sees.
    pub framebuffer: Vec<u32>,
    /// Cursor position (scanout_id, x, y).
    pub cursor_pos: (u32, u32, u32),
    /// Whether the framebuffer has been modified since last read.
    pub dirty: bool,
    /// Count of successfully processed commands.
    pub commands_processed: u32,
    /// Count of failed commands.
    pub commands_failed: u32,
}

impl VirtioGpu {
    /// Create a new VirtIO GPU device with default 640x480 display.
    pub fn new() -> Self {
        let fb_size = (DEFAULT_WIDTH * DEFAULT_HEIGHT) as usize;
        Self {
            status: 0,
            driver_features: 0,
            features_sel: 0,
            int_status: 0,
            queue_sel: 0,
            queues: [VirtioQueue::default(); MAX_QUEUES],
            config: VirtioGpuConfig {
                events_read: 0,
                events_clear: 0,
                num_scanouts: 1,
                reserved: 0,
            },
            resources: HashMap::new(),
            scanouts: [GpuScanout::default()],
            next_resource_id: 1,
            width: DEFAULT_WIDTH,
            height: DEFAULT_HEIGHT,
            framebuffer: vec![0u32; fb_size],
            cursor_pos: (0, 0, 0),
            dirty: false,
            commands_processed: 0,
            commands_failed: 0,
        }
    }

    /// Create a GPU device with custom resolution.
    pub fn with_resolution(width: u32, height: u32) -> Self {
        let mut gpu = Self::new();
        gpu.width = width;
        gpu.height = height;
        gpu.framebuffer = vec![0u32; (width * height) as usize];
        gpu.scanouts[0].width = width;
        gpu.scanouts[0].height = height;
        gpu
    }

    // -- MMIO transport interface --

    /// Check if an address falls within this device's MMIO range.
    pub fn contains(addr: u64) -> bool {
        (VIRTIO_GPU_BASE..VIRTIO_GPU_BASE + VIRTIO_GPU_SIZE).contains(&addr)
    }

    /// Create a new VirtIO GPU device with default 640x480 display.
    /// Returns `Some(value)` for recognized registers, `None` for unmapped.
    pub fn read(&self, offset: usize) -> Option<u32> {
        match offset {
            MAGIC => Some(VIRTIO_MAGIC),
            VERSION => Some(VIRTIO_VERSION),
            DEVICE_ID => Some(VIRTIO_GPU_ID),
            VENDOR_ID => Some(0), // No specific vendor
            DEVICE_FEATURES => {
                let features = if self.features_sel == 0 {
                    0u32 // No features in low 32 bits
                } else if self.features_sel == 1 {
                    0u32 // No features in high 32 bits
                } else {
                    0u32
                };
                Some(features)
            },
            QUEUE_NUM_MAX => Some(QUEUE_SIZE),
            QUEUE_NUM => Some(self.current_queue().size),
            QUEUE_READY => Some(if self.current_queue().ready { 1 } else { 0 }),
            INTERRUPT_STATUS => Some(self.int_status),
            STATUS => Some(self.status),
            _ if offset >= CONFIG && offset <= CONFIG + 63 => {
                // Config space is little-endian, read 32-bit chunks
                let config_bytes = self.config_to_le_bytes();
                let idx = (offset - CONFIG) / 4;
                if idx < config_bytes.len() / 4 {
                    Some(u32::from_le_bytes([
                        config_bytes[idx * 4],
                        config_bytes[idx * 4 + 1],
                        config_bytes[idx * 4 + 2],
                        config_bytes[idx * 4 + 3],
                    ]))
                } else {
                    Some(0)
                }
            },
            QUEUE_DESC_LOW => Some(self.current_queue().desc_addr as u32),
            QUEUE_DESC_HIGH => Some((self.current_queue().desc_addr >> 32) as u32),
            QUEUE_AVAIL_LOW => Some(self.current_queue().avail_addr as u32),
            QUEUE_AVAIL_HIGH => Some((self.current_queue().avail_addr >> 32) as u32),
            QUEUE_USED_LOW => Some(self.current_queue().used_addr as u32),
            QUEUE_USED_HIGH => Some((self.current_queue().used_addr >> 32) as u32),
            _ => None,
        }
    }

    /// Write a 32-bit register to the VirtIO MMIO transport.
    /// Returns `Some(queue_idx)` if the write was to QUEUE_NOTIFY, `None` otherwise.
    pub fn write(&mut self, offset: usize, value: u32) -> Option<u32> {
        match offset {
            STATUS => {
                self.status = value;
                if value == 0 {
                    self.reset();
                }
                None
            },
            DEVICE_FEATURES_SEL => {
                self.features_sel = value;
                None
            },
            DRIVER_FEATURES => {
                if self.features_sel == 0 {
                    self.driver_features =
                        (self.driver_features & 0xFFFF_FFFF_0000_0000) | (value as u64);
                } else if self.features_sel == 1 {
                    self.driver_features =
                        (self.driver_features & 0x0000_0000_FFFF_FFFF) | ((value as u64) << 32);
                }
                None
            },
            DRIVER_FEATURES_SEL => {
                self.features_sel = value;
                None
            },
            QUEUE_SEL => {
                self.queue_sel = value;
                None
            },
            QUEUE_NUM => {
                let max = QUEUE_SIZE;
                if (value as usize) < MAX_QUEUES {
                    let q = &mut self.queues[value as usize];
                    q.size = if value > max && value != 0 {
                        max
                    } else {
                        value
                    };
                }
                None
            },
            QUEUE_READY => {
                if self.queue_sel < MAX_QUEUES as u32 {
                    self.queues[self.queue_sel as usize].ready = value != 0;
                }
                None
            },
            QUEUE_DESC_LOW => {
                let q = &mut self.current_queue_mut();
                q.desc_addr = (q.desc_addr & 0xFFFF_FFFF_0000_0000) | (value as u64);
                None
            },
            QUEUE_DESC_HIGH => {
                let q = &mut self.current_queue_mut();
                q.desc_addr = (q.desc_addr & 0x0000_0000_FFFF_FFFF) | ((value as u64) << 32);
                None
            },
            QUEUE_AVAIL_LOW => {
                let q = &mut self.current_queue_mut();
                q.avail_addr = (q.avail_addr & 0xFFFF_FFFF_0000_0000) | (value as u64);
                None
            },
            QUEUE_AVAIL_HIGH => {
                let q = &mut self.current_queue_mut();
                q.avail_addr = (q.avail_addr & 0x0000_0000_FFFF_FFFF) | ((value as u64) << 32);
                None
            },
            QUEUE_USED_LOW => {
                let q = &mut self.current_queue_mut();
                q.used_addr = (q.used_addr & 0xFFFF_FFFF_0000_0000) | (value as u64);
                None
            },
            QUEUE_USED_HIGH => {
                let q = &mut self.current_queue_mut();
                q.used_addr = (q.used_addr & 0x0000_0000_FFFF_FFFF) | ((value as u64) << 32);
                None
            },
            QUEUE_NOTIFY => {
                Some(value) // Return queue index for the bus to process
            },
            INTERRUPT_ACK => {
                self.int_status &= !value;
                None
            },
            CONFIG => {
                // Config writes: events_clear
                self.config.events_clear = value;
                self.config.events_read &= !value;
                None
            },
            _ => None,
        }
    }

    /// Reset the device to initial state.
    fn reset(&mut self) {
        self.status = 0;
        self.driver_features = 0;
        self.features_sel = 0;
        self.int_status = 0;
        self.queue_sel = 0;
        self.queues = [VirtioQueue::default(); MAX_QUEUES];
        self.resources.clear();
        self.scanouts = [GpuScanout::default()];
        self.scanouts[0].width = self.width;
        self.scanouts[0].height = self.height;
        self.next_resource_id = 1;
        self.framebuffer.fill(0);
        self.dirty = false;
        self.commands_processed = 0;
        self.commands_failed = 0;
    }

    /// Get a reference to the currently selected queue.
    fn current_queue(&self) -> &VirtioQueue {
        &self.queues[self.queue_sel as usize]
    }

    /// Get a mutable reference to the currently selected queue.
    fn current_queue_mut(&mut self) -> &mut VirtioQueue {
        &mut self.queues[self.queue_sel as usize]
    }

    // -- Config serialization --

    fn config_to_le_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::with_capacity(16);
        bytes.extend_from_slice(&self.config.events_read.to_le_bytes());
        bytes.extend_from_slice(&self.config.events_clear.to_le_bytes());
        bytes.extend_from_slice(&self.config.num_scanouts.to_le_bytes());
        bytes.extend_from_slice(&self.config.reserved.to_le_bytes());
        bytes
    }

    // -- Command processing --

    /// Process a control queue request.
    /// `data` contains the raw bytes from the virtqueue descriptor chain.
    /// Returns response bytes to write back to the guest.
    pub fn process_control(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < 24 {
            // Need at least the header (24 bytes)
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd_type = u32::from_le_bytes([data[0], data[1], data[2], data[3]]);

        match cmd_type {
            VIRTIO_GPU_CMD_GET_DISPLAY_INFO => self.cmd_get_display_info(data),
            VIRTIO_GPU_CMD_RESOURCE_CREATE_2D => self.cmd_resource_create_2d(data),
            VIRTIO_GPU_CMD_RESOURCE_UNREF => self.cmd_resource_unref(data),
            VIRTIO_GPU_CMD_SET_SCANOUT => self.cmd_set_scanout(data),
            VIRTIO_GPU_CMD_RESOURCE_FLUSH => self.cmd_resource_flush(data),
            VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D => self.cmd_transfer_to_host_2d(data),
            VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING => self.cmd_resource_attach_backing(data),
            VIRTIO_GPU_CMD_UPDATE_CURSOR => self.cmd_update_cursor(data),
            VIRTIO_GPU_CMD_MOVE_CURSOR => self.cmd_move_cursor(data),
            _ => {
                self.commands_failed += 1;
                self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC)
            },
        }
    }

    /// Handle GET_DISPLAY_INFO command.
    fn cmd_get_display_info(&mut self, _data: &[u8]) -> Vec<u8> {
        let mut resp = VirtioGpuRespDisplayInfo::default();
        resp.hdr.hdr_type = VIRTIO_GPU_RESP_OK_DISPLAY_INFO;
        resp.pmodes[0].enabled = 1;
        resp.pmodes[0].r.x = 0;
        resp.pmodes[0].r.y = 0;
        resp.pmodes[0].r.width = self.width;
        resp.pmodes[0].r.height = self.height;
        resp.pmodes[0].flags = 0;
        resp.pmodes[0].x = 0;
        resp.pmodes[0].y = 0;
        resp.pmodes[0].width = self.width;
        resp.pmodes[0].height = self.height;
        self.commands_processed += 1;
        struct_to_le_bytes(&resp)
    }

    /// Handle RESOURCE_CREATE_2D command.
    fn cmd_resource_create_2d(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < std::mem::size_of::<VirtioGpuResourceCreate2D>() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd: VirtioGpuResourceCreate2D = parse_struct(data);
        let resource_id = cmd.resource_id;
        let width = cmd.width;
        let height = cmd.height;
        let format = cmd.format;

        if width == 0 || height == 0 {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        // Allocate pixel buffer (4 bytes per pixel for all supported formats)
        let size = (width as usize) * (height as usize) * (BYTES_PER_PIXEL as usize);
        let resource = GpuResource {
            resource_id,
            width,
            height,
            format,
            data: vec![0u8; size],
            backing: Vec::new(),
        };
        self.resources.insert(resource_id, resource);
        self.commands_processed += 1;
        self.make_ok_response(&cmd.hdr)
    }

    /// Handle RESOURCE_UNREF command.
    fn cmd_resource_unref(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < std::mem::size_of::<VirtioGpuResourceUnref>() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd: VirtioGpuResourceUnref = parse_struct(data);
        if self.resources.remove(&cmd.resource_id).is_none() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID);
        }

        // Also clear any scanout referencing this resource
        for scanout in &mut self.scanouts {
            if scanout.resource_id == cmd.resource_id {
                scanout.enabled = false;
                scanout.resource_id = 0;
            }
        }

        self.commands_processed += 1;
        self.make_ok_response(&cmd.hdr)
    }

    /// Handle SET_SCANOUT command.
    fn cmd_set_scanout(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < std::mem::size_of::<VirtioGpuSetScanout>() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd: VirtioGpuSetScanout = parse_struct(data);

        if cmd.scanout_id != 0 {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID);
        }

        if cmd.resource_id == 0 {
            // Disable scanout
            self.scanouts[0].enabled = false;
            self.scanouts[0].resource_id = 0;
            self.commands_processed += 1;
            return self.make_ok_response(&cmd.hdr);
        }

        if !self.resources.contains_key(&cmd.resource_id) {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID);
        }

        self.scanouts[0].enabled = true;
        self.scanouts[0].resource_id = cmd.resource_id;
        self.scanouts[0].x = cmd.r.x;
        self.scanouts[0].y = cmd.r.y;
        self.scanouts[0].width = cmd.r.width;
        self.scanouts[0].height = cmd.r.height;
        self.commands_processed += 1;
        self.make_ok_response(&cmd.hdr)
    }

    /// Handle RESOURCE_FLUSH command.
    /// Copies resource pixels to the host framebuffer.
    fn cmd_resource_flush(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < std::mem::size_of::<VirtioGpuResourceFlush>() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd: VirtioGpuResourceFlush = parse_struct(data);

        // Flush the current scanout resource to the framebuffer
        let scanout = self.scanouts[0];
        if scanout.enabled {
            let resource_id = scanout.resource_id;
            if let Some(resource) = self.resources.get(&resource_id).cloned() {
                self.blit_to_framebuffer(&resource, &scanout);
            }
        }

        self.commands_processed += 1;
        self.make_ok_response(&cmd.hdr)
    }

    /// Handle TRANSFER_TO_HOST_2D command.
    /// Guest provides pixel data; we store it in the resource's backing memory.
    /// The actual data transfer is handled by the bus walking the descriptor chain
    /// and providing the backing data. Here we just acknowledge.
    fn cmd_transfer_to_host_2d(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < std::mem::size_of::<VirtioGpuTransferToHost2D>() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd: VirtioGpuTransferToHost2D = parse_struct(data);

        if !self.resources.contains_key(&cmd.resource_id) {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID);
        }

        self.commands_processed += 1;
        self.make_ok_response(&cmd.hdr)
    }

    /// Handle RESOURCE_ATTACH_BACKING command.
    fn cmd_resource_attach_backing(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < std::mem::size_of::<VirtioGpuResourceAttachBacking>() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd: VirtioGpuResourceAttachBacking = parse_struct(data);

        if let Some(resource) = self.resources.get_mut(&cmd.resource_id) {
            let entry_start = std::mem::size_of::<VirtioGpuResourceAttachBacking>();
            let entries_needed = cmd.nr_entries as usize;
            let entries_available =
                (data.len() - entry_start) / std::mem::size_of::<VirtioGpuMemEntry>();

            let count = entries_needed.min(entries_available);
            for i in 0..count {
                let offset = entry_start + i * std::mem::size_of::<VirtioGpuMemEntry>();
                if offset + std::mem::size_of::<VirtioGpuMemEntry>() <= data.len() {
                    let entry: VirtioGpuMemEntry = parse_struct(
                        &data[offset..offset + std::mem::size_of::<VirtioGpuMemEntry>()],
                    );
                    resource.backing.push(entry);
                }
            }
            self.commands_processed += 1;
            self.make_ok_response(&cmd.hdr)
        } else {
            self.commands_failed += 1;
            self.make_error_response(VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID)
        }
    }

    /// Handle UPDATE_CURSOR command.
    fn cmd_update_cursor(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < std::mem::size_of::<VirtioGpuUpdateCursor>() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd: VirtioGpuUpdateCursor = parse_struct(data);
        self.cursor_pos = (cmd.pos.scanout_id, cmd.pos.x, cmd.pos.y);
        self.commands_processed += 1;
        self.make_ok_response(&cmd.hdr)
    }

    /// Handle MOVE_CURSOR command.
    fn cmd_move_cursor(&mut self, data: &[u8]) -> Vec<u8> {
        if data.len() < std::mem::size_of::<VirtioGpuUpdateCursor>() {
            self.commands_failed += 1;
            return self.make_error_response(VIRTIO_GPU_RESP_ERR_UNSPEC);
        }

        let cmd: VirtioGpuUpdateCursor = parse_struct(data);
        self.cursor_pos = (cmd.pos.scanout_id, cmd.pos.x, cmd.pos.y);
        self.commands_processed += 1;
        self.make_ok_response(&cmd.hdr)
    }

    // -- Framebuffer blitting --

    /// Blit a resource to the host framebuffer based on scanout parameters.
    pub fn blit_to_framebuffer(&mut self, resource: &GpuResource, scanout: &GpuScanout) {
        let src_w = resource.width as usize;
        let dst_w = self.width as usize;
        let dst_h = self.height as usize;
        let copy_w = scanout.width.min(resource.width) as usize;
        let copy_h = scanout.height.min(resource.height) as usize;
        let src_x = scanout.x as usize;
        let src_y = scanout.y as usize;

        for row in 0..copy_h {
            for col in 0..copy_w {
                let sx = src_x + col;
                let sy = src_y + row;
                if sx >= src_w || sy >= (resource.height as usize) {
                    continue;
                }
                let dx = col;
                let dy = row;
                if dx >= dst_w || dy >= dst_h {
                    continue;
                }

                let src_offset = (sy * src_w + sx) * (BYTES_PER_PIXEL as usize);
                let pixel_bytes =
                    &resource.data[src_offset..src_offset + (BYTES_PER_PIXEL as usize)];
                // Convert BGRA to native u32 (little-endian on RISC-V)
                let pixel = u32::from_le_bytes([
                    pixel_bytes[0],
                    pixel_bytes[1],
                    pixel_bytes[2],
                    pixel_bytes[3],
                ]);

                self.framebuffer[dy * dst_w + dx] = pixel;
            }
        }
        self.dirty = true;
    }

    // -- Response helpers --

    fn make_ok_response(&self, hdr: &VirtioGpuCtrlHdr) -> Vec<u8> {
        let mut resp = VirtioGpuCtrlHdr::default();
        resp.hdr_type = VIRTIO_GPU_RESP_OK_NODATA;
        resp.flags = hdr.flags;
        resp.fence_id = hdr.fence_id;
        resp.ctx_id = hdr.ctx_id;
        struct_to_le_bytes(&resp)
    }

    fn make_error_response(&self, error_type: u32) -> Vec<u8> {
        let resp = VirtioGpuCtrlHdr { hdr_type: error_type, ..Default::default() };
        struct_to_le_bytes(&resp)
    }

    // -- Framebuffer access for the host --

    /// Read the raw framebuffer pixel data as &[u32].
    pub fn framebuffer_data(&self) -> &[u32] {
        &self.framebuffer
    }

    /// Get a pixel from the framebuffer at (x, y).
    pub fn get_pixel(&self, x: u32, y: u32) -> u32 {
        if x < self.width && y < self.height {
            self.framebuffer[(y as usize) * (self.width as usize) + (x as usize)]
        } else {
            0
        }
    }

    /// Set a pixel in the framebuffer at (x, y).
    pub fn set_pixel(&mut self, x: u32, y: u32, color: u32) {
        if x < self.width && y < self.height {
            self.framebuffer[(y as usize) * (self.width as usize) + (x as usize)] = color;
            self.dirty = true;
        }
    }

    /// Clear the framebuffer to a solid color.
    pub fn clear_framebuffer(&mut self, color: u32) {
        self.framebuffer.fill(color);
        self.dirty = true;
    }

    /// Write pixel data directly into a resource's data buffer.
    /// This is used by the bus when processing TRANSFER_TO_HOST_2D
    /// with the actual descriptor chain data.
    pub fn write_resource_data(&mut self, resource_id: u32, offset: u64, data: &[u8]) -> bool {
        if let Some(resource) = self.resources.get_mut(&resource_id) {
            let offset = offset as usize;
            let end = (offset + data.len()).min(resource.data.len());
            if offset >= resource.data.len() {
                return false;
            }
            resource.data[offset..end].copy_from_slice(&data[..end - offset]);
            self.dirty = true;
            true
        } else {
            false
        }
    }

    /// Check if a resource exists.
    pub fn has_resource(&self, resource_id: u32) -> bool {
        self.resources.contains_key(&resource_id)
    }

    /// Get the number of active resources.
    pub fn resource_count(&self) -> usize {
        self.resources.len()
    }
}

// ---------------------------------------------------------------------------
// Helper functions for struct serialization
// ---------------------------------------------------------------------------

/// Convert a Copy struct to little-endian bytes.
fn struct_to_le_bytes<T: Copy>(val: &T) -> Vec<u8> {
    let size = std::mem::size_of::<T>();
    let ptr = val as *const T as *const u8;
    let bytes = unsafe { std::slice::from_raw_parts(ptr, size) };
    bytes.to_vec()
}

/// Parse a Copy struct from little-endian bytes.
fn parse_struct<T: Copy + Default>(data: &[u8]) -> T {
    let size = std::mem::size_of::<T>();
    let mut val = T::default();
    let ptr = &mut val as *mut T as *mut u8;
    let count = size.min(data.len());
    unsafe {
        std::ptr::copy_nonoverlapping(data.as_ptr(), ptr, count);
    }
    val
}

// ---------------------------------------------------------------------------
// Descriptor and queue processing
// ---------------------------------------------------------------------------

/// A single virtqueue descriptor (16 bytes).
#[derive(Debug, Clone, Copy, Default)]
struct VirtDesc {
    addr: u64,  // Guest physical address of buffer
    len: u32,   // Buffer length
    flags: u16, // VIRTQ_DESC_F_* flags
    next: u16,  // Next descriptor index (if VIRTQ_DESC_F_NEXT)
}

const VIRTQ_DESC_F_NEXT: u16 = 1;
const VIRTQ_DESC_F_WRITE: u16 = 2;

impl VirtioGpu {
    /// Read a virtqueue descriptor from guest memory.
    fn read_descriptor<F>(&self, idx: u16, q: &VirtioQueue, read_word_fn: &mut F) -> VirtDesc
    where
        F: FnMut(u64) -> u32,
    {
        let desc_addr = q.desc_addr + (idx as u64) * 16;

        let w0 = read_word_fn(desc_addr);
        let w1 = read_word_fn(desc_addr + 4);
        let w2 = read_word_fn(desc_addr + 8);
        let w3 = read_word_fn(desc_addr + 12);

        VirtDesc {
            addr: (w1 as u64) << 32 | (w0 as u64),
            len: w2,
            flags: (w3 & 0xFFFF) as u16,
            next: (w3 >> 16) as u16,
        }
    }

    /// Process pending requests on a virtqueue.
    ///
    /// Walks the available ring, reads descriptor chains from guest memory,
    /// processes GPU control commands, and writes responses back.
    ///
    /// Returns the number of requests processed.
    pub fn process_queue<F, G, H, I>(
        &mut self,
        queue_idx: u32,
        read_word_fn: &mut F,
        write_word_fn: &mut G,
        read_bytes_fn: &mut H,
        write_bytes_fn: &mut I,
    ) -> usize
    where
        F: FnMut(u64) -> u32,
        G: FnMut(u64, u32),
        H: FnMut(u64, usize) -> Vec<u8>,
        I: FnMut(u64, &[u8]),
    {
        let q_idx = queue_idx.min(MAX_QUEUES as u32 - 1) as usize;
        let q = self.queues[q_idx]; // Copy since VirtQueue is Copy

        if !q.ready || q.size == 0 || q.desc_addr == 0 {
            return 0;
        }

        let mut processed = 0;
        let mut last_avail_idx = q.last_avail_idx;
        let mut used_idx = q.last_used_idx;

        // Read the available ring index (u16 at avail_addr + 2).
        // The first u32 at avail_addr is flags(u16) | idx(u16).
        // idx is at the upper 16 bits: read_word_fn(avail_addr) >> 16.
        let avail_idx = (read_word_fn(q.avail_addr) >> 16) as u16;

        // Process all new available entries
        while last_avail_idx != avail_idx {
            let desc_idx = (last_avail_idx as u32 % q.size) as u16;

            // Read available ring entry: ring[] at avail_addr + 4 + desc_idx * 2
            let ring_entry_addr = q.avail_addr + 4 + (desc_idx as u64) * 2;
            let head_idx = (read_word_fn(ring_entry_addr) & 0xFFFF) as u16;

            // Walk the descriptor chain to collect readable and writable buffers
            let mut cmd_data: Vec<u8> = Vec::new();
            let mut out_buffers: Vec<(u64, u32)> = Vec::new(); // (addr, len) for writable

            let mut current_idx = head_idx;
            let mut chain_len = 0;
            loop {
                let d = self.read_descriptor(current_idx, &q, read_word_fn);

                if d.flags & VIRTQ_DESC_F_WRITE != 0 {
                    // Device-writable buffer (for response data)
                    out_buffers.push((d.addr, d.len));
                } else {
                    // Device-readable buffer (command data)
                    let bytes = read_bytes_fn(d.addr, d.len as usize);
                    cmd_data.extend_from_slice(&bytes);
                }

                chain_len += 1;
                if chain_len > q.size as usize {
                    break; // Prevent infinite chains
                }
                if d.flags & VIRTQ_DESC_F_NEXT == 0 {
                    break;
                }
                current_idx = d.next;
            }

            // Process the GPU command
            let response = self.process_control(&cmd_data);

            // Write response to the first output buffer
            if !out_buffers.is_empty() && !response.is_empty() {
                let (out_addr, out_len) = out_buffers[0];
                let write_len = (response.len() as u32).min(out_len);
                write_bytes_fn(out_addr, &response[..write_len as usize]);
            }

            // Add to used ring
            let used_ring_addr = q.used_addr + 4 + (used_idx as u64 % q.size as u64) * 8;
            write_word_fn(used_ring_addr, head_idx as u32);
            write_word_fn(used_ring_addr + 4, response.len() as u32);

            used_idx = used_idx.wrapping_add(1);
            processed += 1;
            last_avail_idx = last_avail_idx.wrapping_add(1);
        }

        self.queues[q_idx].last_avail_idx = last_avail_idx;
        self.queues[q_idx].last_used_idx = used_idx;

        if processed > 0 {
            self.int_status |= VIRTIO_INT_USED_RING;
            // Write the updated used index to guest memory
            write_word_fn(q.used_addr + 2, used_idx as u32);
        }

        processed
    }
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn new_virtio_gpu_defaults() {
        let gpu = VirtioGpu::new();
        assert_eq!(gpu.status, 0);
        assert_eq!(gpu.width, DEFAULT_WIDTH);
        assert_eq!(gpu.height, DEFAULT_HEIGHT);
        assert_eq!(
            gpu.framebuffer.len(),
            (DEFAULT_WIDTH * DEFAULT_HEIGHT) as usize
        );
        assert_eq!(gpu.scanouts.len(), 1);
        assert!(!gpu.scanouts[0].enabled);
        assert_eq!(gpu.config.num_scanouts, 1);
        assert_eq!(gpu.commands_processed, 0);
        assert_eq!(gpu.commands_failed, 0);
    }

    #[test]
    fn custom_resolution() {
        let gpu = VirtioGpu::with_resolution(1024, 768);
        assert_eq!(gpu.width, 1024);
        assert_eq!(gpu.height, 768);
        assert_eq!(gpu.framebuffer.len(), 1024 * 768);
    }

    #[test]
    fn read_magic() {
        let gpu = VirtioGpu::new();
        assert_eq!(gpu.read(MAGIC), Some(VIRTIO_MAGIC));
    }

    #[test]
    fn read_version() {
        let gpu = VirtioGpu::new();
        assert_eq!(gpu.read(VERSION), Some(VIRTIO_VERSION));
    }

    #[test]
    fn read_device_id() {
        let gpu = VirtioGpu::new();
        assert_eq!(gpu.read(DEVICE_ID), Some(VIRTIO_GPU_ID));
    }

    #[test]
    fn write_read_status() {
        let mut gpu = VirtioGpu::new();
        gpu.write(STATUS, VIRTIO_STATUS_ACKNOWLEDGE | VIRTIO_STATUS_DRIVER);
        assert_eq!(
            gpu.read(STATUS),
            Some(VIRTIO_STATUS_ACKNOWLEDGE | VIRTIO_STATUS_DRIVER)
        );
    }

    #[test]
    fn status_zero_resets_queues() {
        let mut gpu = VirtioGpu::new();
        gpu.write(QUEUE_SEL, 0);
        gpu.write(QUEUE_NUM, 8);
        gpu.write(QUEUE_READY, 1);
        assert!(gpu.queues[0].ready);

        gpu.write(STATUS, 0);
        assert!(!gpu.queues[0].ready);
        assert_eq!(gpu.queues[0].size, QUEUE_SIZE);
        assert!(gpu.resources.is_empty());
    }

    #[test]
    fn status_zero_clears_resources() {
        let mut gpu = VirtioGpu::new();
        // Create a resource
        let create_cmd = make_resource_create_2d(1, 100, 100);
        let _ = gpu.process_control(&create_cmd);
        assert!(gpu.has_resource(1));

        // Reset
        gpu.write(STATUS, 0);
        assert!(!gpu.has_resource(1));
    }

    #[test]
    fn queue_num_max() {
        let gpu = VirtioGpu::new();
        assert_eq!(gpu.read(QUEUE_NUM_MAX), Some(QUEUE_SIZE));
    }

    #[test]
    fn write_read_queue_ready() {
        let mut gpu = VirtioGpu::new();
        gpu.write(QUEUE_SEL, 0);
        gpu.write(QUEUE_READY, 1);
        assert_eq!(gpu.read(QUEUE_READY), Some(1));

        gpu.write(QUEUE_SEL, 1);
        assert_eq!(gpu.read(QUEUE_READY), Some(0));
    }

    #[test]
    fn queue_descriptor_address() {
        let mut gpu = VirtioGpu::new();
        gpu.write(QUEUE_SEL, 0);
        gpu.write(QUEUE_DESC_LOW, 0x8000);
        gpu.write(QUEUE_DESC_HIGH, 0x0000);
        assert_eq!(gpu.queues[0].desc_addr, 0x8000);

        gpu.write(QUEUE_DESC_LOW, 0x0000);
        gpu.write(QUEUE_DESC_HIGH, 0x0001);
        assert_eq!(gpu.queues[0].desc_addr, 0x0001_0000_0000u64);
    }

    #[test]
    fn queue_avail_used_address() {
        let mut gpu = VirtioGpu::new();
        gpu.write(QUEUE_SEL, 0);
        gpu.write(QUEUE_AVAIL_LOW, 0x9000);
        assert_eq!(gpu.queues[0].avail_addr, 0x9000);

        gpu.write(QUEUE_USED_LOW, 0xA000);
        assert_eq!(gpu.queues[0].used_addr, 0xA000);
    }

    #[test]
    fn queue_notify_returns_queue_idx() {
        let mut gpu = VirtioGpu::new();
        assert_eq!(gpu.write(QUEUE_NOTIFY, 0), Some(0));
        assert_eq!(gpu.write(QUEUE_NOTIFY, 1), Some(1));
        assert_eq!(gpu.write(STATUS, 1), None);
    }

    #[test]
    fn interrupt_ack_clears_bits() {
        let mut gpu = VirtioGpu::new();
        gpu.int_status = VIRTIO_INT_USED_RING;
        gpu.write(INTERRUPT_ACK, VIRTIO_INT_USED_RING);
        assert_eq!(gpu.int_status, 0);
    }

    #[test]
    fn read_config_num_scanouts() {
        let gpu = VirtioGpu::new();
        // Config offset 8 = num_scanouts field
        let val = gpu.read(CONFIG + 8);
        assert_eq!(val, Some(1));
    }

    // -- GPU command tests --

    #[test]
    fn cmd_get_display_info() {
        let mut gpu = VirtioGpu::new();
        let resp = gpu.process_control(&make_display_info_cmd());
        // Response type should be OK_DISPLAY_INFO
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_OK_DISPLAY_INFO);
        assert_eq!(gpu.commands_processed, 1);
    }

    #[test]
    fn cmd_get_display_info_returns_correct_resolution() {
        let mut gpu = VirtioGpu::with_resolution(800, 600);
        let resp = gpu.process_control(&make_display_info_cmd());
        // pmodes[0] starts at offset 24 (after 24-byte header)
        // enabled at +0, rect at +4 (x,y,w,h each u32)
        let enabled = u32::from_le_bytes(resp[24..27 + 1].try_into().unwrap());
        assert_eq!(enabled, 1);
        let r_x = u32::from_le_bytes(resp[28..32].try_into().unwrap());
        let r_y = u32::from_le_bytes(resp[32..36].try_into().unwrap());
        let r_w = u32::from_le_bytes(resp[36..40].try_into().unwrap());
        let r_h = u32::from_le_bytes(resp[40..44].try_into().unwrap());
        assert_eq!(r_x, 0);
        assert_eq!(r_y, 0);
        assert_eq!(r_w, 800);
        assert_eq!(r_h, 600);
    }

    #[test]
    fn cmd_resource_create_2d() {
        let mut gpu = VirtioGpu::new();
        let cmd = make_resource_create_2d(42, 320, 240);
        let resp = gpu.process_control(&cmd);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_OK_NODATA);
        assert!(gpu.has_resource(42));
        assert_eq!(gpu.resource_count(), 1);
        assert_eq!(gpu.commands_processed, 1);
    }

    #[test]
    fn cmd_resource_create_2d_invalid_size() {
        let mut gpu = VirtioGpu::new();
        let cmd = make_resource_create_2d(1, 0, 100); // width=0
        let resp = gpu.process_control(&cmd);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_ERR_UNSPEC);
        assert_eq!(gpu.commands_failed, 1);
    }

    #[test]
    fn cmd_resource_unref() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 100, 100);
        let _ = gpu.process_control(&create);
        assert!(gpu.has_resource(1));

        let unref = make_resource_unref(1);
        let resp = gpu.process_control(&unref);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_OK_NODATA);
        assert!(!gpu.has_resource(1));
    }

    #[test]
    fn cmd_resource_unref_invalid() {
        let mut gpu = VirtioGpu::new();
        let unref = make_resource_unref(999);
        let resp = gpu.process_control(&unref);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID);
    }

    #[test]
    fn cmd_resource_unref_clears_scanout() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 100, 100);
        let _ = gpu.process_control(&create);
        let set_scanout = make_set_scanout(0, 1, 0, 0, 100, 100);
        let _ = gpu.process_control(&set_scanout);
        assert!(gpu.scanouts[0].enabled);

        let unref = make_resource_unref(1);
        let _ = gpu.process_control(&unref);
        assert!(!gpu.scanouts[0].enabled);
    }

    #[test]
    fn cmd_set_scanout() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 640, 480);
        let _ = gpu.process_control(&create);

        let set = make_set_scanout(0, 1, 0, 0, 640, 480);
        let resp = gpu.process_control(&set);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_OK_NODATA);
        assert!(gpu.scanouts[0].enabled);
        assert_eq!(gpu.scanouts[0].resource_id, 1);
    }

    #[test]
    fn cmd_set_scanout_disable() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 100, 100);
        let _ = gpu.process_control(&create);
        let set = make_set_scanout(0, 1, 0, 0, 100, 100);
        let _ = gpu.process_control(&set);
        assert!(gpu.scanouts[0].enabled);

        // Disable by setting resource_id = 0
        let disable = make_set_scanout(0, 0, 0, 0, 0, 0);
        let _ = gpu.process_control(&disable);
        assert!(!gpu.scanouts[0].enabled);
    }

    #[test]
    fn cmd_set_scanout_invalid_scanout_id() {
        let mut gpu = VirtioGpu::new();
        let set = make_set_scanout(1, 1, 0, 0, 100, 100); // scanout 1 doesn't exist
        let resp = gpu.process_control(&set);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID);
    }

    #[test]
    fn cmd_set_scanout_invalid_resource() {
        let mut gpu = VirtioGpu::new();
        let set = make_set_scanout(0, 999, 0, 0, 100, 100);
        let resp = gpu.process_control(&set);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID);
    }

    #[test]
    fn cmd_transfer_to_host_2d() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 100, 100);
        let _ = gpu.process_control(&create);

        let transfer = make_transfer_to_host_2d(1, 0, 0, 100, 100, 0);
        let resp = gpu.process_control(&transfer);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_OK_NODATA);
    }

    #[test]
    fn cmd_transfer_to_host_2d_invalid_resource() {
        let mut gpu = VirtioGpu::new();
        let transfer = make_transfer_to_host_2d(999, 0, 0, 100, 100, 0);
        let resp = gpu.process_control(&transfer);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID);
    }

    #[test]
    fn cmd_resource_attach_backing() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 100, 100);
        let _ = gpu.process_control(&create);

        let attach = make_attach_backing(1, 0x10000, 100 * 100 * 4);
        let resp = gpu.process_control(&attach);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_OK_NODATA);

        let resource = gpu.resources.get(&1).unwrap();
        assert_eq!(resource.backing.len(), 1);
        assert_eq!(resource.backing[0].addr, 0x10000);
        assert_eq!(resource.backing[0].length, 100 * 100 * 4);
    }

    #[test]
    fn cmd_resource_attach_backing_invalid_resource() {
        let mut gpu = VirtioGpu::new();
        let attach = make_attach_backing(999, 0x10000, 1024);
        let resp = gpu.process_control(&attach);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID);
    }

    #[test]
    fn cmd_resource_flush() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 640, 480);
        let _ = gpu.process_control(&create);
        let set_scanout = make_set_scanout(0, 1, 0, 0, 640, 480);
        let _ = gpu.process_control(&set_scanout);

        let flush = make_resource_flush(1, 0, 0, 640, 480);
        let resp = gpu.process_control(&flush);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_OK_NODATA);
    }

    #[test]
    fn cmd_update_cursor() {
        let mut gpu = VirtioGpu::new();
        let cmd = make_update_cursor(0, 100, 200);
        let resp = gpu.process_control(&cmd);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_OK_NODATA);
        assert_eq!(gpu.cursor_pos, (0, 100, 200));
    }

    #[test]
    fn cmd_unknown_returns_error() {
        let mut gpu = VirtioGpu::new();
        let cmd = make_unknown_cmd(0x9999);
        let resp = gpu.process_control(&cmd);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_ERR_UNSPEC);
    }

    #[test]
    fn cmd_too_short_returns_error() {
        let mut gpu = VirtioGpu::new();
        let resp = gpu.process_control(&[0; 10]);
        let resp_type = u32::from_le_bytes(resp[0..3 + 1].try_into().unwrap());
        assert_eq!(resp_type, VIRTIO_GPU_RESP_ERR_UNSPEC);
    }

    // -- Framebuffer tests --

    #[test]
    fn framebuffer_set_get_pixel() {
        let mut gpu = VirtioGpu::new();
        assert_eq!(gpu.get_pixel(0, 0), 0);
        gpu.set_pixel(10, 20, 0xFF0000);
        assert_eq!(gpu.get_pixel(10, 20), 0xFF0000);
    }

    #[test]
    fn framebuffer_out_of_bounds() {
        let mut gpu = VirtioGpu::with_resolution(100, 100);
        assert_eq!(gpu.get_pixel(200, 0), 0);
        gpu.set_pixel(200, 0, 0xFF); // Should not panic
        assert_eq!(gpu.get_pixel(200, 0), 0);
    }

    #[test]
    fn framebuffer_clear() {
        let mut gpu = VirtioGpu::new();
        gpu.set_pixel(0, 0, 0xFF0000);
        gpu.clear_framebuffer(0x00FF00);
        assert_eq!(gpu.get_pixel(0, 0), 0x00FF00);
    }

    #[test]
    fn blit_resource_to_framebuffer() {
        let mut gpu = VirtioGpu::with_resolution(4, 4);

        // Create a 2x2 resource and fill with a pattern
        let create = make_resource_create_2d(1, 2, 2);
        let _ = gpu.process_control(&create);

        // Write pixel data to resource
        let resource = gpu.resources.get_mut(&1).unwrap();
        // 2x2 pixels, each 4 bytes (BGRA)
        resource.data[0..4].copy_from_slice(&[0xFF, 0x00, 0x00, 0xFF]); // red
        resource.data[4..8].copy_from_slice(&[0x00, 0xFF, 0x00, 0xFF]); // green
        resource.data[8..12].copy_from_slice(&[0x00, 0x00, 0xFF, 0xFF]); // blue
        resource.data[12..16].copy_from_slice(&[0xFF, 0xFF, 0x00, 0xFF]); // yellow

        // Set scanout
        let set_scanout = make_set_scanout(0, 1, 0, 0, 2, 2);
        let _ = gpu.process_control(&set_scanout);

        // Flush to framebuffer
        let flush = make_resource_flush(1, 0, 0, 2, 2);
        let _ = gpu.process_control(&flush);

        // Verify framebuffer contents
        // Resource data is BGRA bytes; u32::from_le_bytes gives direct LE conversion
        assert_eq!(gpu.get_pixel(0, 0), 0xFF0000FF); // red:   [0xFF,0x00,0x00,0xFF] -> LE
        assert_eq!(gpu.get_pixel(1, 0), 0xFF00FF00); // green: [0x00,0xFF,0x00,0xFF] -> LE
        assert_eq!(gpu.get_pixel(0, 1), 0xFFFF0000); // blue:  [0x00,0x00,0xFF,0xFF] -> LE
        assert_eq!(gpu.get_pixel(1, 1), 0xFF00FFFF); // yellow:[0xFF,0xFF,0x00,0xFF] -> LE

        // Rest should be zero
        assert_eq!(gpu.get_pixel(2, 0), 0);
        assert_eq!(gpu.get_pixel(0, 2), 0);
    }

    #[test]
    fn write_resource_data() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 4, 4);
        let _ = gpu.process_control(&create);

        let pixel_data = [0xAAu8; 16]; // 4 pixels worth
        assert!(gpu.write_resource_data(1, 0, &pixel_data));
        assert!(gpu.dirty); // Note: write_resource_data doesn't set dirty
                            // Actually it doesn't, but the resource data should be written
        let resource = gpu.resources.get(&1).unwrap();
        assert_eq!(&resource.data[0..16], &pixel_data);
    }

    #[test]
    fn write_resource_data_invalid_id() {
        let mut gpu = VirtioGpu::new();
        assert!(!gpu.write_resource_data(999, 0, &[0; 4]));
    }

    #[test]
    fn write_resource_data_out_of_bounds() {
        let mut gpu = VirtioGpu::new();
        let create = make_resource_create_2d(1, 2, 2);
        let _ = gpu.process_control(&create);

        // Resource is 2*2*4 = 16 bytes, writing at offset 16 is out of bounds
        assert!(!gpu.write_resource_data(1, 16, &[0xAA; 4]));

        // Writing within bounds should succeed
        assert!(gpu.write_resource_data(1, 15, &[0xAA; 4]));
        // Only 1 byte should have been written (offset 15, 1 byte fits in 16-byte buffer)
        let resource = gpu.resources.get(&1).unwrap();
        assert_eq!(resource.data[15], 0xAA);
    }

    // -- Feature bits --

    #[test]
    fn driver_features_write_read() {
        let mut gpu = VirtioGpu::new();
        gpu.write(DRIVER_FEATURES_SEL, 0);
        gpu.write(DRIVER_FEATURES, 0x1234);
        assert_eq!(gpu.driver_features, 0x1234);

        gpu.write(DRIVER_FEATURES_SEL, 1);
        gpu.write(DRIVER_FEATURES, 0xABCD);
        assert_eq!(gpu.driver_features, 0xABCD_0000_1234u64);
    }

    #[test]
    fn no_features_advertised() {
        let gpu = VirtioGpu::new();
        assert_eq!(gpu.read(DEVICE_FEATURES), Some(0));
    }

    // -- Multi-queue --

    #[test]
    fn select_cursor_queue() {
        let mut gpu = VirtioGpu::new();
        gpu.write(QUEUE_SEL, 1);
        gpu.write(QUEUE_READY, 1);
        assert!(gpu.queues[1].ready);
        assert!(!gpu.queues[0].ready);
    }

    #[test]
    fn cursor_queue_notify() {
        let mut gpu = VirtioGpu::new();
        assert_eq!(gpu.write(QUEUE_NOTIFY, 1), Some(1));
    }

    // -- Helper command builders for tests --

    fn make_display_info_cmd() -> Vec<u8> {
        let mut cmd = VirtioGpuCtrlHdr::default();
        cmd.hdr_type = VIRTIO_GPU_CMD_GET_DISPLAY_INFO;
        struct_to_le_bytes(&cmd)
    }

    fn make_resource_create_2d(resource_id: u32, width: u32, height: u32) -> Vec<u8> {
        let mut cmd = VirtioGpuResourceCreate2D::default();
        cmd.hdr.hdr_type = VIRTIO_GPU_CMD_RESOURCE_CREATE_2D;
        cmd.resource_id = resource_id;
        cmd.format = VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM;
        cmd.width = width;
        cmd.height = height;
        struct_to_le_bytes(&cmd)
    }

    fn make_resource_unref(resource_id: u32) -> Vec<u8> {
        let mut cmd = VirtioGpuResourceUnref::default();
        cmd.hdr.hdr_type = VIRTIO_GPU_CMD_RESOURCE_UNREF;
        cmd.resource_id = resource_id;
        struct_to_le_bytes(&cmd)
    }

    fn make_set_scanout(
        scanout_id: u32,
        resource_id: u32,
        x: u32,
        y: u32,
        w: u32,
        h: u32,
    ) -> Vec<u8> {
        let mut cmd = VirtioGpuSetScanout::default();
        cmd.hdr.hdr_type = VIRTIO_GPU_CMD_SET_SCANOUT;
        cmd.r.x = x;
        cmd.r.y = y;
        cmd.r.width = w;
        cmd.r.height = h;
        cmd.scanout_id = scanout_id;
        cmd.resource_id = resource_id;
        struct_to_le_bytes(&cmd)
    }

    fn make_transfer_to_host_2d(
        resource_id: u32,
        x: u32,
        y: u32,
        w: u32,
        h: u32,
        offset: u64,
    ) -> Vec<u8> {
        let mut cmd = VirtioGpuTransferToHost2D::default();
        cmd.hdr.hdr_type = VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D;
        cmd.r.x = x;
        cmd.r.y = y;
        cmd.r.width = w;
        cmd.r.height = h;
        cmd.offset = offset;
        cmd.resource_id = resource_id;
        struct_to_le_bytes(&cmd)
    }

    fn make_attach_backing(resource_id: u32, addr: u64, length: u32) -> Vec<u8> {
        let mut cmd = VirtioGpuResourceAttachBacking::default();
        cmd.hdr.hdr_type = VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING;
        cmd.resource_id = resource_id;
        cmd.nr_entries = 1;

        let mut bytes = struct_to_le_bytes(&cmd);
        let entry = VirtioGpuMemEntry {
            addr,
            length,
            padding: 0,
        };
        bytes.extend(struct_to_le_bytes(&entry));
        bytes
    }

    fn make_resource_flush(resource_id: u32, x: u32, y: u32, w: u32, h: u32) -> Vec<u8> {
        let mut cmd = VirtioGpuResourceFlush::default();
        cmd.hdr.hdr_type = VIRTIO_GPU_CMD_RESOURCE_FLUSH;
        cmd.r.x = x;
        cmd.r.y = y;
        cmd.r.width = w;
        cmd.r.height = h;
        cmd.resource_id = resource_id;
        struct_to_le_bytes(&cmd)
    }

    fn make_update_cursor(scanout_id: u32, x: u32, y: u32) -> Vec<u8> {
        let mut cmd = VirtioGpuUpdateCursor::default();
        cmd.hdr.hdr_type = VIRTIO_GPU_CMD_UPDATE_CURSOR;
        cmd.pos.scanout_id = scanout_id;
        cmd.pos.x = x;
        cmd.pos.y = y;
        struct_to_le_bytes(&cmd)
    }

    fn make_unknown_cmd(cmd_type: u32) -> Vec<u8> {
        let mut hdr = VirtioGpuCtrlHdr::default();
        hdr.hdr_type = cmd_type;
        struct_to_le_bytes(&hdr)
    }
}
