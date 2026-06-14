// Pixel-native read() syscall replacement (SYS_read = 63 in RISC-V Linux)
// Direct spatial path for file descriptor reading
//
// Design:
// - Check if fd exists in the spatial fd table (0x80010000+)
// - Read the file data from VFS surface at 0x70000000+
// - Copy data to user buffer and update offset in fd table

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native read() implementation
pub fn syscall_read_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10];        // a0: file descriptor
    let buffer = cpu.x[11];    // a1: user buffer address
    let count = cpu.x[12];     // a2: byte count

    // stdin (fd=0) is not handled here (falls back to console or traditional)
    if fd < 3 {
        return None;
    }

    if fd >= 1024 {
        return None;
    }

    // 1. Lookup fd in spatial fd table
    let entry_offset = fd * 64;
    let table_offset = entry_offset as u64;

    // Retrieve fd, flags, inode (start row) from pixel i = 0 and i = 1
    let px0 = get_table_pixel(bus, table_offset, 0);
    let px1 = get_table_pixel(bus, table_offset, 1);

    let stored_fd = px0 & 0xFF;
    let flags = (px0 >> 8) & 0xFF;
    let inode_low = (px0 >> 16) & 0xFF;
    let inode_high = px1 & 0xFF;
    let inode = inode_low | (inode_high << 8);

    if stored_fd != fd {
        return None; // File descriptor entry invalid or unused
    }

    // Retrieve offset from pixel i = 2
    let px2 = get_table_pixel(bus, table_offset, 2);
    let mut offset = px2 & 0x00FFFFFF;

    // 2. Read from VFS file
    let sr = inode as usize;
    if sr >= 256 {
        return None;
    }

    let header_val = bus.vfs_surface.pixels[sr * 256];
    let file_flags = header_val & 0xFF;
    if file_flags & 0x01 == 0 {
        return None; // Invalid/inactive file header
    }

    let file_size = (header_val >> 16) as usize;
    if offset as usize >= file_size {
        return Some(0); // EOF
    }

    let bytes_to_read = std::cmp::min(count as usize, file_size - offset as usize);
    let is_guest_file = (file_flags & 0x02) != 0;
    let data_col_start = if is_guest_file { 64 } else { 1 };

    let mut bytes_read = 0u32;
    for i in 0..bytes_to_read {
        let file_pos = offset as usize + i;
        let col = data_col_start + file_pos / 4;
        let byte_idx = file_pos % 4;

        let row = sr + col / 256;
        let cr = col % 256;

        if row >= 256 {
            break;
        }

        let px_val = bus.vfs_surface.pixels[row * 256 + cr];
        let byte_val = ((px_val >> (byte_idx * 8)) & 0xFF) as u8;

        // Write to user space
        let dest_va = buffer + bytes_read;
        let dest_pa = match cpu.translate_va(dest_va, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Some(bytes_read), // Stop if translation faults
        };

        if bus.write_byte(dest_pa, byte_val).is_err() {
            return Some(bytes_read);
        }

        bytes_read += 1;
    }

    // 3. Update offset in spatial fd table (pixel i = 2)
    offset += bytes_read;
    let new_px2 = (offset & 0x00FFFFFF) | 0xFF000000;
    set_table_pixel(bus, table_offset, 2, new_px2);

    // Trigger presentation update
    bus.framebuf.present_flag = true;

    Some(bytes_read)
}

/// Read a pixel from the spatial table via Hilbert coordinates
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

/// Write a pixel to the spatial table via Hilbert coordinates
fn set_table_pixel(bus: &mut Bus, table_offset: u64, pixel_idx: u64, val: u32) {
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx] = val;
    }
}