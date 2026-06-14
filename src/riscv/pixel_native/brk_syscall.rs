// Pixel-native brk() syscall replacement (SYS_brk = 214 in RISC-V Linux)
// Direct spatial path for program break modification
//
// Design:
// - Spatial program break table: 0x80020000+ (1024 entries × 16 bytes)
// - Entry format: base_break (4 bytes) | current_break (4 bytes) | max_break (4 bytes) | reserved (4 bytes)
// - Workflow:
//   1. Get active pid from tp (x4)
//   2. Read base_break and current_break from spatial break table
//   3. If new_break is 0, return current_break (or fall back to traditional if unitialized)
//   4. If new_break is valid, update current_break and return it

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native brk() implementation
pub fn syscall_brk_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let new_break = cpu.x[10]; // a0: new program break (0 to query)
    let pid = cpu.x[4];        // x4: active process ID (tp)

    let process_idx = pid % 1024;
    let entry_offset = process_idx * 16;
    let table_offset = entry_offset as u64;

    // Retrieve base_break and current_break from pixels i = 0 and i = 1
    let px0 = get_table_pixel(bus, table_offset, 0);
    let px1 = get_table_pixel(bus, table_offset, 1);

    // Filter out alpha channel or default marker (0xFF000000)
    let base_break = px0 & 0x00FFFFFF;
    let current_break = px1 & 0x00FFFFFF;

    if new_break == 0 {
        if base_break != 0 {
            // Return current break from spatial table
            Some(current_break)
        } else {
            // Uninitialized in spatial table, let traditional kernel handle query and establish base break
            None
        }
    } else {
        // Handle break modification
        if base_break != 0 {
            if new_break >= base_break {
                // Update current break in spatial table (pixel i = 1)
                let new_px1 = (new_break & 0x00FFFFFF) | 0xFF000000;
                set_table_pixel(bus, table_offset, 1, new_px1);
                bus.framebuf.present_flag = true;
                Some(new_break)
            } else {
                // Invalid break address (less than base)
                Some(current_break)
            }
        } else {
            // First time modification: initialize base and current break
            let new_px0 = (new_break & 0x00FFFFFF) | 0xFF000000;
            let new_px1 = (new_break & 0x00FFFFFF) | 0xFF000000;
            set_table_pixel(bus, table_offset, 0, new_px0);
            set_table_pixel(bus, table_offset, 1, new_px1);
            bus.framebuf.present_flag = true;
            Some(new_break)
        }
    }
}

/// Read a pixel from the spatial break table via Hilbert coordinates
fn get_table_pixel(bus: &Bus, table_offset: u64, pixel_idx: u64) -> u32 {
    let base_addr = 0x80020000u64;
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx]
    } else {
        0
    }
}

/// Write a pixel to the spatial break table via Hilbert coordinates
fn set_table_pixel(bus: &mut Bus, table_offset: u64, pixel_idx: u64, val: u32) {
    let base_addr = 0x80020000u64;
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx] = val;
    }
}
