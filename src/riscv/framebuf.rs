// riscv/framebuf.rs -- MMIO Framebuffer Device
//
// 256x256 RGBA pixel framebuffer mapped at 0x6000_0000.
// Guest reads/writes pixels directly via load/store -- zero ecall overhead.
// This is the "pixel-native" bridge: RISC-V programs draw to the canonical screen.
//
// Memory layout:
//   0x6000_0000 .. 0x603F_FFFF : pixel data (256 * 256 * 4 = 262,144 bytes)
//     Each pixel is 32-bit: bits [31:24]=R, [23:16]=G, [15:8]=B, [7:0]=A
//     Pixel at (x, y) is at offset (y * 256 + x) * 4
//   0x6040_0000 : control register
//     Write 1 to flush/signal present

use std::cell::RefCell;
use std::rc::Rc;

/// MMIO base address for the framebuffer.
pub const FB_BASE: u64 = 0x6000_0000;
/// Size of the pixel buffer in bytes (256 * 256 * 4).
pub const FB_PIXEL_SIZE: usize = 256 * 256 * 4;
/// Control register address (immediately after pixel buffer).
pub const FB_CONTROL_ADDR: u64 = FB_BASE + FB_PIXEL_SIZE as u64;
/// Clip control register address.
/// Write format: (y << 24) | (x << 16) | (h << 8) | w
///   where (x, y, w, h) defines the allowed pixel region.
/// Write 0xFFFFFFFF to disable clipping (full-screen access).
pub const FB_CLIP_ADDR: u64 = FB_CONTROL_ADDR + 4;
/// Total MMIO range size (pixel buffer + control register + clip register).
pub const FB_TOTAL_SIZE: u64 = FB_PIXEL_SIZE as u64 + 8;

/// Convert a framebuffer pixel from SBI format (0xRRGGBBAA) to minifb format (0x00RRGGBB).
///
/// The SBI contract exposes pixels as 0xRRGGBBAA (alpha in low byte).
/// minifb's `update_with_buffer` expects 0x00RRGGBB. Every consumer that
/// blits framebuffer pixels to a minifb buffer should call this instead of
/// shifting manually -- so the next render site doesn't independently forget.
#[inline]
pub fn pixel_to_minifb(rgba: u32) -> u32 {
    rgba >> 8
}

/// Framebuffer width in pixels.
pub const FB_WIDTH: usize = 256;
/// Framebuffer height in pixels.
pub const FB_HEIGHT: usize = 256;

/// Callback type fired when guest writes to the control register (fb_present).
/// Receives a reference to the pixel buffer for display sync.
pub type PresentCallback = Rc<RefCell<dyn FnMut(&[u32])>>;

/// MMIO Framebuffer device.
pub struct Framebuffer {
    /// 256x256 RGBA pixel buffer (256KB).
    pub pixels: Vec<u32>,
    /// Set when guest writes 1 to the control register.
    pub present_flag: bool,
    /// Optional callback fired on fb_present for live display bridge.
    /// When the guest writes 1 to the control register, this callback
    /// is invoked with the current pixel buffer so the host can sync
    /// to its display surface (Geometry OS screen, PNG dump, etc).
    pub on_present: Option<PresentCallback>,
    /// Active clip rectangle: (x, y, w, h). Pixels outside this rect
    /// are silently dropped on write. None means no clipping (full access).
    clip_rect: Option<(u32, u32, u32, u32)>,
}

impl Default for Framebuffer {
    fn default() -> Self {
        Self::new()
    }
}

impl Framebuffer {
    pub fn new() -> Self {
        Self {
            pixels: vec![0u32; FB_WIDTH * FB_HEIGHT],
            present_flag: false,
            on_present: None,
            clip_rect: None,
        }
    }

    /// Create a framebuffer with a live present callback.
    pub fn with_callback(cb: PresentCallback) -> Self {
        Self {
            pixels: vec![0u32; FB_WIDTH * FB_HEIGHT],
            present_flag: false,
            on_present: Some(cb),
            clip_rect: None,
        }
    }

    /// Check if a physical address falls within the framebuffer MMIO range.
    pub fn contains(addr: u64) -> bool {
        addr >= FB_BASE && addr < FB_BASE + FB_TOTAL_SIZE
    }

    /// Read a 32-bit word from the framebuffer.
    pub fn read(&self, addr: u64) -> Option<u32> {
        if addr >= FB_CONTROL_ADDR {
            if addr == FB_CONTROL_ADDR {
                // Control register: return present flag
                return Some(if self.present_flag { 1 } else { 0 });
            }
            if addr == FB_CLIP_ADDR {
                // Clip register: return current clip rect packed
                // Format: (y << 24) | (x << 16) | (h << 8) | w, or 0xFFFFFFFF if none
                return Some(match self.clip_rect {
                    Some((x, y, w, h)) => ((y as u32) << 24) | ((x as u32) << 16) | ((h as u32) << 8) | (w as u32),
                    None => 0xFFFF_FFFF,
                });
            }
            return None;
        }
        let offset = addr.checked_sub(FB_BASE)? as usize;
        if offset >= FB_PIXEL_SIZE {
            return None;
        }
        let pixel_idx = offset / 4;
        if pixel_idx < self.pixels.len() {
            Some(self.pixels[pixel_idx])
        } else {
            None
        }
    }

    /// Set the clip rectangle. Pixels outside (x, y, w, h) will be silently
    /// dropped on write. Pass None to disable clipping.
    pub fn set_clip_rect(&mut self, rect: Option<(u32, u32, u32, u32)>) {
        self.clip_rect = rect;
    }

    /// Check if a pixel index (flat array index) falls within the active clip rect.
    #[inline]
    fn inside_clip(&self, pixel_idx: usize) -> bool {
        match self.clip_rect {
            None => true,
            Some((rx, ry, rw, rh)) => {
                let px = (pixel_idx % FB_WIDTH) as u32;
                let py = (pixel_idx / FB_WIDTH) as u32;
                px >= rx && px < rx + rw && py >= ry && py < ry + rh
            }
        }
    }

    /// Write a 32-bit word to the framebuffer.
    pub fn write(&mut self, addr: u64, val: u32) {
        if addr == FB_CLIP_ADDR {
            // Clip control register
            if val == 0xFFFF_FFFF {
                self.clip_rect = None;
            } else {
                // Packed format: (y << 24) | (x << 16) | (h << 8) | w
                let w = (val & 0xFF) as u32;
                let h = ((val >> 8) & 0xFF) as u32;
                let x = ((val >> 16) & 0xFF) as u32;
                let y = ((val >> 24) & 0xFF) as u32;
                self.clip_rect = Some((x, y, w, h));
            }
            return;
        }
        if addr >= FB_CONTROL_ADDR {
            // Control register: bit 0 = present/flush
            if val & 1 != 0 {
                self.present_flag = true;
                // Fire the live display callback if registered
                if let Some(ref cb) = self.on_present {
                    cb.borrow_mut()(&self.pixels);
                }
            }
            return;
        }
        let offset = match addr.checked_sub(FB_BASE) {
            Some(o) => o as usize,
            None => return,
        };
        if offset >= FB_PIXEL_SIZE {
            return;
        }
        let pixel_idx = offset / 4;
        if pixel_idx < self.pixels.len() && self.inside_clip(pixel_idx) {
            self.pixels[pixel_idx] = val;
        }
    }
}
