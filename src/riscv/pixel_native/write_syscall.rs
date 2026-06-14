// Auto-generated pixel-native write() syscall replacement
// Original: ECALL_U → kernel → UART transmit
// Pixel-native: Direct Hilbert coordinate write

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;
use std::sync::atomic::{AtomicU32, Ordering};

static CONSOLE_BYTES_WRITTEN: AtomicU32 = AtomicU32::new(0);

/// Pixel-native write() implementation - bypasses kernel, writes directly to pixels or VFS files
pub fn syscall_write_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10];        // a0: file descriptor
    let buffer = cpu.x[11];    // a1: buffer address
    let count = cpu.x[12];     // a2: byte count

    if count == 0 {
        return Some(0);  // Nothing to write
    }

    let mut actual_fd = fd;
    if fd >= 3 && fd < 1024 {
        let entry_offset = fd * 64;
        let table_offset = entry_offset as u64;
        let px0 = get_table_pixel(bus, table_offset, 0);
        let stored_fd = px0 & 0xFF;
        if stored_fd == fd {
            let inode_low = (px0 >> 16) & 0xFF;
            let px1 = get_table_pixel(bus, table_offset, 1);
            let inode_high = px1 & 0xFF;
            let inode = inode_low | (inode_high << 8);

            if inode == 1 || inode == 2 {
                actual_fd = inode;
            } else {
                // Perform file write
                let px2 = get_table_pixel(bus, table_offset, 2);
                let mut offset = px2 & 0x00FFFFFF;

                let sr = inode as usize;
                if sr >= 256 {
                    return None;
                }

                let header_val = bus.vfs_surface.pixels[sr * 256];
                let file_flags = header_val & 0xFF;
                if file_flags & 0x01 == 0 {
                    return None; // Inactive/invalid file header
                }

                let mut file_size = (header_val >> 16) as usize;
                let is_guest_file = (file_flags & 0x02) != 0;
                let data_col_start = if is_guest_file { 64 } else { 1 };

                let mut bytes_written = 0u32;
                for i in 0..count {
                    let file_pos = offset as usize + i as usize;
                    let col = data_col_start + file_pos / 4;
                    let byte_idx = file_pos % 4;

                    let row = sr + col / 256;
                    let cr = col % 256;

                    if row >= 256 {
                        break;
                    }

                    // Read from user space
                    let src_va = buffer + bytes_written;
                    let src_pa = match cpu.translate_va(src_va, AccessType::Load, bus) {
                        Ok(p) => p,
                        Err(_) => return Some(bytes_written),
                    };

                    let byte_val = match bus.read_byte(src_pa) {
                        Ok(v) => v,
                        Err(_) => return Some(bytes_written),
                    };

                    // Modify pixel in VFS
                    let vfs_pixel_idx = row * 256 + cr;
                    let mut px_val = bus.vfs_surface.pixels[vfs_pixel_idx];
                    let mask = !(0xFF << (byte_idx * 8));
                    px_val = (px_val & mask) | ((byte_val as u32) << (byte_idx * 8));

                    bus.vfs_surface.pixels[vfs_pixel_idx] = px_val;
                    bus.vfs_surface.dirty_rows.insert(row as u16);

                    bytes_written += 1;
                }

                if bytes_written > 0 {
                    // Update offset in spatial fd table (pixel i = 2)
                    offset += bytes_written;
                    let new_px2 = (offset & 0x00FFFFFF) | 0xFF000000;
                    set_table_pixel(bus, table_offset, 2, new_px2);

                    // Auto-grow file size
                    if offset as usize > file_size {
                        file_size = offset as usize;
                        bus.vfs_surface.update_file_header(sr as u16, file_size as u32, file_flags);
                    }

                    // Trigger presentation update
                    bus.framebuf.present_flag = true;
                }

                return Some(bytes_written);
            }
        }
    }

    // Console output (stdout=1, stderr=2)
    if actual_fd == 1 || actual_fd == 2 {
        return Some(write_console_pixel_native(cpu, bus, buffer, count));
    }

    // File output (fd >= 3) -> Fall back to traditional
    None
}

/// Write directly to console pixels via Hilbert curve mapping
fn write_console_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus, buffer: u32, count: u32) -> u32 {
    let mut bytes_written = 0u32;

    for i in 0..count {
        // Read byte from user memory (translating VA to PA)
        let byte_addr = buffer + i;
        let pa = match cpu.translate_va(byte_addr, AccessType::Load, bus) {
            Ok(addr) => addr,
            Err(_) => return bytes_written, // Stop if translation faults
        };

        let byte_val = match bus.read_byte(pa) {
            Ok(v) => v,
            Err(_) => return bytes_written,  // Stop on read error
        };

        // Forward to the traditional SBI console buffer so it shows up in stdout
        bus.sbi.console_output.push(byte_val);

        // Console base Hilbert coordinates on 256x256 framebuffer
        let console_offset = CONSOLE_BYTES_WRITTEN.fetch_add(1, Ordering::SeqCst);
        let (x, y) = crate::pixel::d2xy(8, console_offset % (256 * 256));

        // Write pixel directly to the framebuffer (RGBA: R=byte_val, A=255)
        let pixel_value = (byte_val as u32) | 0xFF000000;
        let pixel_idx = (y * 256 + x) as usize;
        if pixel_idx < bus.framebuf.pixels.len() {
            bus.framebuf.pixels[pixel_idx] = pixel_value;
        }

        bytes_written += 1;
    }

    // Trigger framebuffer update to render
    bus.framebuf.present_flag = true;

    bytes_written
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
