#![no_std]
#![no_main]

use core::panic::PanicInfo;
use core::sync::atomic::{AtomicU32, Ordering};

// Linker-provided framebuffer symbols from Umode.ld.
//
// These are absolute linker symbols — their *address* is the value.
// Usage: `&__fb_base as *const u8 as usize` → 0x60000000.
extern "C" {
    static __fb_base: u8;
    static __fb_end: u8;
    static __fb_pixels: u8;
    static __fb_control: u8;
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Command {
    op: u32,
    x: u32,
    y: u32,
    w: u32,
    h: u32,
    color: u32,
}

#[repr(C)]
pub struct CommandQueue {
    head: AtomicU32,
    tail: AtomicU32,
    buf: [Command; 64],
}

const QUEUE_ADDR: usize = 0x6003F000;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

/// Return a raw pointer to the start of the framebuffer pixel buffer.
///
/// # Safety
///
/// The framebuffer is a memory-mapped hardware region. Dereferencing
/// the returned pointer is safe only when:
/// - The MMIO range is mapped in the active page table
/// - The caller has the appropriate privilege level (S-mode or M-mode)
/// - No concurrent access violates hardware constraints
unsafe fn fb_ptr() -> *mut u32 {
    (&__fb_pixels as *const u8) as *mut u32
}

/// Return a raw pointer to the framebuffer control register region.
///
/// # Safety
///
/// Same constraints as `fb_ptr()` — MMIO range must be mapped and
/// accessible at the current privilege level.
unsafe fn fb_ctrl_ptr() -> *mut u32 {
    (&__fb_control as *const u8) as *mut u32
}

/// Write a 32-bit pixel value at (x, y).
///
/// Pixel buffer is 256 KB (0x40000 bytes) → 65536 pixels.
/// At 32 bpp that's a 256×256 frame, or any topology the glyph
/// substrate defines.
///
/// # Safety
///
/// Same MMIO constraints as `fb_ptr()`.
unsafe fn fb_put(x: u32, y: u32, pixel: u32) {
    let stride = 256; // pixels per row
    let offset = (y * stride + x) as usize;
    core::ptr::write_volatile(fb_ptr().add(offset), pixel);
}

/// Signal the display to present the pixel buffer.
///
/// # Safety
///
/// Same MMIO constraints as `fb_ctrl_ptr()`.
unsafe fn fb_present() {
    core::ptr::write_volatile(fb_ctrl_ptr(), 1);
}

fn get_queue() -> &'static CommandQueue {
    unsafe { &*(QUEUE_ADDR as *const CommandQueue) }
}

fn consume(queue: &CommandQueue) -> Option<Command> {
    let h = queue.head.load(Ordering::Relaxed);
    let t = queue.tail.load(Ordering::Acquire); // Ensure we see producer writes
    if h == t {
        return None;
    }
    let cmd = queue.buf[(h % 64) as usize];
    queue.head.store(h.wrapping_add(1), Ordering::Release);
    Some(cmd)
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
    let queue = get_queue();
    
    // Fill full-screen with RED to verify framebuffer access
    unsafe {
        let fb = fb_ptr();
        for i in 0..65536 {
            core::ptr::write_volatile(fb.add(i), 0xFF0000FF);
        }
        fb_present();
    }
    
    loop {
        if let Some(cmd) = consume(queue) {
            unsafe {
                match cmd.op {
                    0 => fb_put(cmd.x, cmd.y, cmd.color), // Pixel
                    1 => { // FillRect
                        for i in 0..cmd.w {
                            for j in 0..cmd.h {
                                fb_put(cmd.x + i, cmd.y + j, cmd.color);
                            }
                        }
                    }
                    2 => fb_present(), // Present
                    3 => { // Clear
                        for i in 0..65536 {
                            core::ptr::write_volatile(fb_ptr().add(i), cmd.color);
                        }
                    }
                    _ => {}
                }
            }
        }
    }
}
