// Pixel-native exit() syscall replacement (SYS_exit = 93 in RISC-V Linux)
// Direct spatial process state update
//
// Design:
// - Mark current process as EXITED in spatial process table (0x80000000+)
// - Store exit status code in the process entry
// - Returns None (never returns to caller - process terminates)

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native exit() implementation
pub fn syscall_exit_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let exit_status = cpu.x[10];  // a0: exit status code

    // Get current process ID from tp register (x4)
    let pid = cpu.x[4];

    // 1. Mark process as EXITED in spatial process table
    // Process table at 0x80000000+, 256 bytes per process
    let process_idx = pid % 1024;
    let process_base = 0x80000000 + (process_idx * 256);
    let process_offset = process_base - 0x80000000;

    // Map offset to 256x256 Hilbert coordinates
    let (px, py) = crate::pixel::d2xy(8, process_offset % (256 * 256));
    let pixel_idx = (py * 256 + px) as usize;

    if pixel_idx < bus.framebuf.pixels.len() {
        // State = EXITED (2), Status Code in bits 8-15, Alpha = 255
        let status_code = (exit_status & 0xFF) as u32;
        let pixel_val = 2 | (status_code << 8) | 0xFF000000;
        bus.framebuf.pixels[pixel_idx] = pixel_val;
    }

    // Trigger presentation update
    bus.framebuf.present_flag = true;

    // Return None - the hypervisor will handle process termination
    // The traditional kernel path will clean up the process
    None
}