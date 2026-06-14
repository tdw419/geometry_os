// Pixel-native getdents() syscall replacement (SYS_getdents64 = 61 in RISC-V Linux)
// Note: SYS_getdents = 78 is deprecated, getdents64 = 61 is the modern version
// Direct spatial directory reading from VFS surface
//
// Design:
// - Read directory entries from VFS surface row 0 (directory index)
// - Format entries as linux_dirent64 structure in user buffer
// - Update file position for subsequent reads

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// linux_dirent64 structure (as defined in Linux kernel)
struct LinuxDirent64 {
    d_ino: u64,     // 64-bit inode number
    d_off: i64,     // 64-bit offset to next entry
    d_reclen: u16,  // Size of this record
    d_type: u8,     // File type
    d_name: Vec<u8>, // Null-terminated filename
}

/// Helper: Read a pixel from VFS surface
fn read_vfs_pixel(bus: &Bus, row: u32, col: u32) -> u32 {
    if row < 256 && col < 256 {
        let offset = (row * 256 + col) as usize;
        bus.vfs_surface.pixels[offset]
    } else {
        0
    }
}

/// Helper: Get filename from VFS directory entry (row 0)
fn get_filename_from_dir_entry(bus: &Bus, dir_idx: u32) -> Option<String> {
    // Directory entries stored in row 0, 4 pixels per filename
    // Each filename uses 1 column: pixels at (0, col*4), (0, col*4+1), (0, col*4+2), (0, col*4+3)
    // Encoded as RGBA characters

    let base_col = dir_idx * 4;
    let mut chars = Vec::new();

    for i in 0..4 {
        let pixel = read_vfs_pixel(bus, 0, base_col + i);
        // Extract up to 4 characters from this pixel (RGBA channels)
        let r = (pixel & 0xFF) as u8;
        let g = ((pixel >> 8) & 0xFF) as u8;
        let b = ((pixel >> 16) & 0xFF) as u8;
        let a = ((pixel >> 24) & 0xFF) as u8;

        if r != 0 {
            chars.push(r);
        }
        if g != 0 {
            chars.push(g);
        }
        if b != 0 {
            chars.push(b);
        }
        if a != 0 && a != 0xFF {
            chars.push(a);
        }
    }

    if chars.is_empty() {
        None
    } else {
        String::from_utf8(chars).ok()
    }
}

/// Helper: Get file type from VFS
fn get_file_type_from_vfs(bus: &Bus, row: u32) -> u8 {
    // Check if row looks like a directory (starts with DIR marker)
    // For simplicity: row > 0 is a file, row 0 is directory metadata
    if row == 0 {
        0x04 // DT_DIR
    } else {
        0x08 // DT_REG (regular file)
    }
}

/// Helper: Write data to user memory
fn write_user_memory(cpu: &mut RiscvCpu, bus: &mut Bus, addr: u32, data: &[u8]) -> Result<(), ()> {
    let mut current_addr = addr;
    for &byte in data {
        let pa = match cpu.translate_va(current_addr, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Err(()),
        };

        if bus.write_byte(pa, byte).is_err() {
            return Err(());
        }

        current_addr += 1;
    }
    Ok(())
}

/// Pixel-native getdents() implementation
pub fn syscall_getdents_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10]; // a0: file descriptor
    let buffer = cpu.x[11]; // a1: user buffer
    let count = cpu.x[12]; // a2: buffer size

    // Only handle directory file descriptors
    // For now, we'll assume fd pointing to root directory (.)
    // In a real implementation, we'd check if fd is a directory in the fd table

    // 1. Scan VFS surface row 0 for directory entries
    // Row 0 contains directory metadata in columns 1-254 (column 0 is reserved)
    let mut entries = Vec::new();
    let mut d_off = 0i64;

    // Always include "." and ".." entries
    entries.push(LinuxDirent64 {
        d_ino: 0,
        d_off: d_off + 24, // Offset to next entry (24 = size of dirent64 for ".")
        d_reclen: 24,
        d_type: 0x04, // DT_DIR
        d_name: b".".to_vec(),
    });
    d_off += 24;

    entries.push(LinuxDirent64 {
        d_ino: 0,
        d_off: d_off + 24,
        d_reclen: 24,
        d_type: 0x04, // DT_DIR
        d_name: b"..".to_vec(),
    });
    d_off += 24;

    // Scan VFS surface for actual files
    for col in 1..255u32 {
        if let Some(filename) = get_filename_from_dir_entry(bus, col) {
            // Find the file's starting row (scan down the column)
            let mut file_row = 0u32;
            for row in 1..256 {
                let pixel = read_vfs_pixel(bus, row, col);
                if pixel != 0 {
                    file_row = row;
                    break;
                }
            }

            if file_row > 0 {
                let file_type = get_file_type_from_vfs(bus, file_row);
                let name_bytes = filename.as_bytes().to_vec();
                let name_len = name_bytes.len() as u16;
                let reclen = 19 + name_len + 1; // 19 + name + null terminator

                entries.push(LinuxDirent64 {
                    d_ino: file_row as u64,
                    d_off: d_off + reclen as i64,
                    d_reclen: reclen,
                    d_type: file_type,
                    d_name: name_bytes,
                });
                d_off += reclen as i64;
            }
        }
    }

    // 2. Write entries to user buffer
    let mut bytes_written = 0u32;
    for entry in &entries {
        let entry_size = entry.d_reclen as u32;
        if bytes_written + entry_size > count {
            break; // Buffer full
        }

        // Write linux_dirent64 structure
        let mut entry_data = Vec::new();

        // d_ino (8 bytes, little-endian)
        entry_data.extend_from_slice(&entry.d_ino.to_le_bytes());

        // d_off (8 bytes, little-endian)
        entry_data.extend_from_slice(&entry.d_off.to_le_bytes());

        // d_reclen (2 bytes, little-endian)
        entry_data.extend_from_slice(&entry.d_reclen.to_le_bytes());

        // d_type (1 byte)
        entry_data.push(entry.d_type);

        // Padding (1 byte)
        entry_data.push(0);

        // d_name (null-terminated)
        entry_data.extend_from_slice(&entry.d_name);
        entry_data.push(0); // Null terminator

        // Align to 8-byte boundary
        while entry_data.len() % 8 != 0 {
            entry_data.push(0);
        }

        if write_user_memory(cpu, bus, buffer + bytes_written, &entry_data).is_err() {
            return None;
        }

        bytes_written += entry_size;
    }

    Some(bytes_written)
}