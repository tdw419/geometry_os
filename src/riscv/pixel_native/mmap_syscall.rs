// Pixel-native mmap() syscall replacement (SYS_mmap = 222 in RISC-V Linux)
// Direct spatial path for memory map allocation
//
// Design:
// - Spatial mmap allocation table: 0x80030000+ (1024 entries × 32 bytes)
// - Entry format: next_mmap_addr (4 bytes) | mapping_count (4 bytes) | mappings (24 bytes)
// - Workflow:
//   1. Get active pid from tp (x4)
//   2. Read next_mmap_addr from spatial mmap table
//   3. Allocate start address at next_mmap_addr if addr parameter is 0
//   4. Increment next_mmap_addr by length (aligned to page boundary, 4096 bytes)
//   5. Write new mapping address to user register a0
//   6. Return allocated address

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native mmap() implementation
pub fn syscall_mmap_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let addr = cpu.x[10];      // a0: requested address (usually 0)
    let length = cpu.x[11];    // a1: mapping length
    let _prot = cpu.x[12];     // a2: protection flags
    let _flags = cpu.x[13];    // a3: mapping flags
    let _fd = cpu.x[14];       // a4: file descriptor
    let _offset = cpu.x[15];   // a5: offset

    if length == 0 {
        return None; // Invalid allocation length
    }

    let pid = cpu.x[4];        // x4: active process ID (tp)
    let process_idx = pid % 1024;
    let entry_offset = process_idx * 32;
    let table_offset = entry_offset as u64;

    // Retrieve next_mmap_addr from pixel i = 0
    let px0 = get_table_pixel(bus, table_offset, 0);
    let mut next_mmap_addr = px0 & 0x00FFFFFF;

    // Default mmap base address (e.g. 0x40000000) if uninitialized
    if next_mmap_addr == 0 {
        next_mmap_addr = 0x40000000;
    }

    // Determine allocate start address
    let start_addr = if addr != 0 {
        addr
    } else {
        next_mmap_addr
    };

    // Page-align length (4096 bytes)
    let aligned_length = (length + 4095) & !4095;

    // Update next_mmap_addr pointer in spatial table (pixel i = 0)
    let new_next_addr = start_addr + aligned_length;
    let new_px0 = (new_next_addr & 0x00FFFFFF) | 0xFF000000;
    set_table_pixel(bus, table_offset, 0, new_px0);

    // Track active mapping count (pixel i = 1)
    let px1 = get_table_pixel(bus, table_offset, 1);
    let mapping_count = (px1 & 0x00FFFFFF) + 1;
    let new_px1 = (mapping_count & 0x00FFFFFF) | 0xFF000000;
    set_table_pixel(bus, table_offset, 1, new_px1);

    // Trigger presentation update
    bus.framebuf.present_flag = true;

    // Return allocated address to user space
    Some(start_addr)
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
