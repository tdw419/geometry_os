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

/// Clip rectangle: (x, y, width, height). None means no clipping.
pub type ClipRect = Option<(u32, u32, u32, u32)>;

/// Callback type fired when guest writes to the control register (fb_present).
/// Receives a reference to the pixel buffer and the active clip rect.
/// The clip rect lets the GUI composite only the program's region.
pub type PresentCallback = Rc<RefCell<dyn FnMut(&[u32], ClipRect)>>;

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
                    Some((x, y, w, h)) => {
                        ((y as u32) << 24) | ((x as u32) << 16) | ((h as u32) << 8) | (w as u32)
                    }
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
                // A value of 0 for w or h means 256 (full extent) since
                // the 8-bit field can't encode 256 directly.
                let w = (val & 0xFF) as u32;
                let h = ((val >> 8) & 0xFF) as u32;
                let x = ((val >> 16) & 0xFF) as u32;
                let y = ((val >> 24) & 0xFF) as u32;
                let w = if w == 0 { 256 } else { w };
                let h = if h == 0 { 256 } else { h };
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
                    cb.borrow_mut()(&self.pixels, self.clip_rect);
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

#[cfg(test)]
mod tests {
    use super::*;
    use std::cell::RefCell;
    use std::rc::Rc;

    /// Test that the present callback receives the current clip rect.
    #[test]
    fn test_present_callback_receives_clip_rect() {
        let captured: Rc<RefCell<Option<ClipRect>>> = Rc::new(RefCell::new(None));
        let cap_clone = captured.clone();

        let cb: PresentCallback = Rc::new(RefCell::new(move |_pixels: &[u32], clip| {
            *cap_clone.borrow_mut() = Some(clip);
        }));

        let mut fb = Framebuffer::with_callback(cb);

        // No clip set — present should fire with None
        fb.write(FB_CONTROL_ADDR, 1); // control = 1 (present)
        assert_eq!(*captured.borrow(), Some(None));

        // Set clip rect: x=10, y=20, w=30, h=40
        let packed: u32 = (20u32 << 24) | (10u32 << 16) | (40u32 << 8) | 30u32;
        fb.write(FB_CLIP_ADDR, packed);

        // Present again — should fire with Some((10, 20, 30, 40))
        fb.write(FB_CONTROL_ADDR, 1);
        assert_eq!(*captured.borrow(), Some(Some((10, 20, 30, 40))));

        // Release clip (0xFFFFFFFF) — present should fire with None
        fb.write(FB_CLIP_ADDR, 0xFFFFFFFF);
        fb.write(FB_CONTROL_ADDR, 1);
        assert_eq!(*captured.borrow(), Some(None));
    }

    /// Test that two programs with different clip rects present independently.
    /// Simulates the multi-program scenario: Program A paints left half,
    /// Program B paints right half, each presents with their own clip rect.
    #[test]
    fn test_two_programs_present_with_clip_rects() {
        // Track all presents: (clip_rect, pixel_at_0_0, pixel_at_128_0)
        let presents: Rc<RefCell<Vec<(ClipRect, u32, u32)>>> = Rc::new(RefCell::new(Vec::new()));
        let pres_clone = presents.clone();

        let cb: PresentCallback = Rc::new(RefCell::new(move |pixels: &[u32], clip| {
            let p00 = pixels[0];       // top-left corner
            let p128 = pixels[128];    // x=128, y=0 (right half)
            pres_clone.borrow_mut().push((clip, p00, p128));
        }));

        let mut fb = Framebuffer::with_callback(cb);

        // --- Program A: left half (x=0, y=0, w=128, h=256) ---
        // h=0 encodes as 256 (0 means full extent in 8-bit packed format)
        let clip_a: u32 = (0u32 << 24) | (0u32 << 16) | (0u32 << 8) | 128u32;
        fb.write(FB_CLIP_ADDR, clip_a);

        // Paint red pixel at (0, 0) — inside A's clip
        let red = 0xFF0000FFu32; // RGBA
        fb.write(FB_BASE, red); // pixel at (0,0) = FB_BASE + 0*4

        // Try to paint at (128, 0) — outside A's clip, should be dropped
        let blue = 0x00FF00FFu32;
        fb.write(FB_BASE + 128 * 4, blue);

        // Program A presents
        fb.write(FB_CONTROL_ADDR, 1);

        // --- Program B: right half (x=128, y=0, w=128, h=256) ---
        let clip_b: u32 = (0u32 << 24) | (128u32 << 16) | (0u32 << 8) | 128u32;
        fb.write(FB_CLIP_ADDR, clip_b);

        // Paint blue pixel at (128, 0) — inside B's clip
        fb.write(FB_BASE + 128 * 4, blue);

        // Try to paint at (0, 0) — outside B's clip, should be dropped
        fb.write(FB_BASE, 0x00FF0000u32); // green — should NOT overwrite A's red

        // Program B presents
        fb.write(FB_CONTROL_ADDR, 1);

        // Verify: 2 presents recorded
        let pres = presents.borrow();
        assert_eq!(pres.len(), 2);

        // Program A's present: clip=(0,0,128,256), pixel at (0,0)=red, pixel at (128,0)=0
        assert_eq!(pres[0].0, Some((0, 0, 128, 256)));
        assert_eq!(pres[0].1, red);       // A's pixel at (0,0) is red
        assert_eq!(pres[0].2, 0);        // A couldn't write to (128,0)

        // Program B's present: clip=(128,0,128,256), pixel at (128,0)=blue
        assert_eq!(pres[1].0, Some((128, 0, 128, 256)));
        assert_eq!(pres[1].1, red);       // (0,0) still has A's red (B couldn't overwrite)
        assert_eq!(pres[1].2, blue);      // B's pixel at (128,0) is blue
    }

    /// Test that clip rect changes between presents are correctly tracked.
    #[test]
    fn test_clip_rect_changes_between_presents() {
        let rects: Rc<RefCell<Vec<ClipRect>>> = Rc::new(RefCell::new(Vec::new()));
        let rects_clone = rects.clone();

        let cb: PresentCallback = Rc::new(RefCell::new(move |_pixels: &[u32], clip| {
            rects_clone.borrow_mut().push(clip);
        }));

        let mut fb = Framebuffer::with_callback(cb);

        // Present with no clip
        fb.write(FB_CONTROL_ADDR, 1);

        // Set clip and present
        fb.write(FB_CLIP_ADDR, (5 << 24) | (10 << 16) | (20 << 8) | 30);
        fb.write(FB_CONTROL_ADDR, 1);

        // Change clip and present
        fb.write(FB_CLIP_ADDR, (50 << 24) | (60 << 16) | (40 << 8) | 40);
        fb.write(FB_CONTROL_ADDR, 1);

        // Disable clip and present
        fb.write(FB_CLIP_ADDR, 0xFFFFFFFF);
        fb.write(FB_CONTROL_ADDR, 1);

        let r = rects.borrow();
        assert_eq!(r.len(), 4);
        assert_eq!(r[0], None);
        assert_eq!(r[1], Some((10, 5, 30, 20))); // x=10, y=5, w=30, h=20
        assert_eq!(r[2], Some((60, 50, 40, 40))); // x=60, y=50, w=40, h=40
        assert_eq!(r[3], None);
    }
}
