// Pixel-native renameat2() syscall replacement (SYS_renameat2 = 276 in RISC-V Linux)
// Direct spatial path for file renaming

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

const RENAME_NOREPLACE: u32 = 1;

/// Pixel-native renameat2() implementation
pub fn syscall_renameat2_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let _olddirfd = cpu.x[10];     // a0: old directory fd
    let oldpath_ptr = cpu.x[11];   // a1: old path pointer
    let _newdirfd = cpu.x[12];     // a2: new directory fd
    let newpath_ptr = cpu.x[13];   // a3: new path pointer
    let flags = cpu.x[14];         // a4: flags

    // Read paths from user memory
    let oldpath = read_string(cpu, bus, oldpath_ptr);
    let newpath = read_string(cpu, bus, newpath_ptr);

    if oldpath.is_empty() || newpath.is_empty() {
        return Some(!22u32 + 1); // -EINVAL
    }

    // Extract filenames from paths
    let old_filename = if oldpath.starts_with('/') {
        oldpath.split('/').last().unwrap_or("")
    } else {
        &oldpath
    };

    let new_filename = if newpath.starts_with('/') {
        newpath.split('/').last().unwrap_or("")
    } else {
        &newpath
    };

    if old_filename.is_empty() || new_filename.is_empty() {
        return Some(!22u32 + 1); // -EINVAL
    }

    // 1. Find the old file's start row
    let old_sr = match find_file_start_row(bus, old_filename) {
        Some(sr) => sr,
        None => return Some(!2u32 + 1), // -ENOENT
    };

    // 2. Check if new file exists
    let dest_exists = find_file_start_row(bus, new_filename).is_some();
    if dest_exists {
        if (flags & RENAME_NOREPLACE) != 0 {
            return Some(!17u32 + 1); // -EEXIST
        } else {
            // Delete existing destination file first
            bus.vfs_surface.delete_file_entry(new_filename);
        }
    }

    // 3. Update file_map name mapping
    bus.vfs_surface.file_map.insert(old_sr, new_filename.to_string());

    // 4. Update the directory index (Row 0) hash for this row
    let file_count = bus.vfs_surface.pixels[1] as usize;
    let new_hash = fnv1a_hash(new_filename);
    for i in 0..file_count {
        let idx = bus.vfs_surface.pixels[2 + i];
        let sr = (idx >> 16) as u16;
        if sr == old_sr {
            bus.vfs_surface.pixels[2 + i] = ((sr as u32) << 16) | (new_hash & 0xFFFF);
            break;
        }
    }

    // 5. Update the hash in the file header pixel
    let header_idx = old_sr as usize * 256;
    let header_val = bus.vfs_surface.pixels[header_idx];
    let new_header_val = (header_val & 0xFFFF00FF) | ((new_hash & 0xFF) << 8);
    bus.vfs_surface.pixels[header_idx] = new_header_val;

    // 6. Sync with host filesystem
    let old_host_path = bus.vfs_surface.base_dir.join(old_filename);
    let new_host_path = bus.vfs_surface.base_dir.join(new_filename);
    let _ = std::fs::rename(old_host_path, new_host_path);

    // 7. Mark directory index and file row dirty
    bus.vfs_surface.dirty_rows.insert(0);
    bus.vfs_surface.dirty_rows.insert(old_sr);

    Some(0)
}

/// Find start row for a filename
fn find_file_start_row(bus: &Bus, filename: &str) -> Option<u16> {
    let vfs = &bus.vfs_surface;
    let file_count = vfs.pixels[1] as usize;
    for i in 0..file_count {
        let idx = vfs.pixels[2 + i];
        let sr = (idx >> 16) as u16;
        if sr == 0 {
            continue;
        }
        if let Some(stored_name) = vfs.file_map.get(&sr) {
            if stored_name == filename {
                // Verify the file header is active
                let header = vfs.pixels[sr as usize * 256];
                if header & 0x01 != 0 {
                    return Some(sr);
                }
            }
        }
    }
    None
}

/// FNV-1a hash function
fn fnv1a_hash(s: &str) -> u32 {
    let mut hash: u32 = 0x811C9DC5;
    for byte in s.bytes() {
        hash ^= byte as u32;
        hash = hash.wrapping_mul(0x01000193);
    }
    hash
}

/// Read null-terminated string from user memory
fn read_string(cpu: &mut RiscvCpu, bus: &mut Bus, ptr: u32) -> String {
    let mut result = String::new();
    let mut addr = ptr;

    for _ in 0..256 {
        let pa = match cpu.translate_va(addr, AccessType::Load, bus) {
            Ok(p) => p,
            Err(_) => break,
        };

        if let Ok(byte) = bus.read_byte(pa) {
            if byte == 0 {
                break;
            }
            result.push(byte as char);
            addr = addr.wrapping_add(1);
        } else {
            break;
        }
    }

    result
}
