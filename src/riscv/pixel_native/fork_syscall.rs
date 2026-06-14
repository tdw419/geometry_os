use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use std::sync::atomic::{AtomicU32, Ordering};

static NEXT_CHILD_PID: AtomicU32 = AtomicU32::new(100);

/// Pixel-native fork() implementation
/// Performs direct process table spatial updates and allocates child process PID
pub fn syscall_fork_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    // a0 contains the parent process ID or index
    let parent_idx = cpu.x[10];
    let child_pid = NEXT_CHILD_PID.fetch_add(1, Ordering::SeqCst);

    // 1. Parent process registration in spatial process table (0x80000000)
    let parent_base = 0x80000000 + (parent_idx * 256);
    let parent_offset = parent_base - 0x80000000;
    
    // Map offset to 256x256 Hilbert coordinates
    let (px, py) = crate::pixel::d2xy(8, parent_offset % (256 * 256));
    let parent_pixel_idx = (py * 256 + px) as usize;
    if parent_pixel_idx < bus.framebuf.pixels.len() {
        // State = RUNNING (1), Alpha = 255
        bus.framebuf.pixels[parent_pixel_idx] = 1 | 0xFF000000;
    }

    // 2. Child process registration in spatial process table
    let child_idx = child_pid % 1024;
    let child_base = 0x80000000 + (child_idx * 256);
    let child_offset = child_base - 0x80000000;
    
    let (cx, cy) = crate::pixel::d2xy(8, child_offset % (256 * 256));
    let child_pixel_idx = (cy * 256 + cx) as usize;
    if child_pixel_idx < bus.framebuf.pixels.len() {
        // State = RUNNING (1), Parent PID = parent_idx, Alpha = 255
        let pixel_val = 1 | ((parent_idx & 0xFF) << 8) | 0xFF000000;
        bus.framebuf.pixels[child_pixel_idx] = pixel_val;
    }

    // Trigger presentation update
    bus.framebuf.present_flag = true;

    // Return child PID to the parent process
    Some(child_pid)
}

