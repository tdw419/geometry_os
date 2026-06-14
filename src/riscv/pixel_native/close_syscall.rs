// Pixel-native close() syscall replacement (SYS_close = 57 in RISC-V Linux)
// Direct spatial path for file descriptor disposal

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native close() implementation
pub fn syscall_close_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10];  // a0: file descriptor

    // Reserved fds: stdin(0), stdout(1), stderr(2)
    if fd < 3 {
        return Some(0);  // Ignore close on reserved fds
    }

    if fd >= 1024 {
        return Some(0xFFFFFFF7); // -EBADF (-9)
    }

    // Free fd entry in spatial fd table
    let entry_offset = fd * 64;  // 64 bytes per entry
    let table_offset = entry_offset as u64;

    // Check if the fd is actually open first
    let (x0, y0) = crate::pixel::d2xy(8, table_offset as u32 % (256 * 256));
    let pixel_idx0 = (y0 * 256 + x0) as usize;
    if pixel_idx0 < bus.framebuf.pixels.len() {
        let px0 = bus.framebuf.pixels[pixel_idx0];
        let stored_fd = px0 & 0xFF;
        if stored_fd != fd {
            return Some(0xFFFFFFF7); // -EBADF
        }
    } else {
        return Some(0xFFFFFFF7); // -EBADF
    }

    // Clear pixels at fd table entry
    for i in 0..16u64 {
        let pixel_offset = table_offset + i * 4;
        let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
        let pixel_idx = (y * 256 + x) as usize;

        if pixel_idx < bus.framebuf.pixels.len() {
            bus.framebuf.pixels[pixel_idx] = 0;  // Zero out entry
        }
    }

    // Trigger framebuffer update
    bus.framebuf.present_flag = true;

    // Return 0 on success
    Some(0)
}