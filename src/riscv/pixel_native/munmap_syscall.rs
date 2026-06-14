// Pixel-native munmap() syscall replacement (SYS_munmap = 215 in RISC-V Linux)
// Direct spatial path for memory map disposal
//
// Design:
// - Spatial mmap allocation table: 0x80030000+ (1024 entries × 32 bytes)
// - Workflow:
//   1. Get active pid from tp (x4)
//   2. Decrement mapping count in spatial mmap table
//   3. Return 0 on success

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native munmap() implementation
pub fn syscall_munmap_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let _addr = cpu.x[10];     // a0: mapping start address
    let _length = cpu.x[11];   // a1: mapping length

    let pid = cpu.x[4];        // x4: active process ID (tp)
    let process_idx = pid % 1024;
    let entry_offset = process_idx * 32;
    let table_offset = entry_offset as u64;

    // Decrement active mapping count (pixel i = 1)
    let px1 = get_table_pixel(bus, table_offset, 1);
    let mapping_count = px1 & 0x00FFFFFF;
    if mapping_count > 0 {
        let new_px1 = ((mapping_count - 1) & 0x00FFFFFF) | 0xFF000000;
        set_table_pixel(bus, table_offset, 1, new_px1);
    }

    // Trigger presentation update
    bus.framebuf.present_flag = true;

    // Return 0 on success
    Some(0)
}

/// Read a pixel from the spatial mmap table via Hilbert coordinates
fn get_table_pixel(bus: &Bus, table_offset: u64, pixel_idx: u64) -> u32 {
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx]
    } else {
        0
    }
}

/// Write a pixel to the spatial mmap table via Hilbert coordinates
fn set_table_pixel(bus: &mut Bus, table_offset: u64, pixel_idx: u64, val: u32) {
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx] = val;
    }
}
