// Pixel-native openat() syscall replacement (SYS_openat = 56 in RISC-V Linux)
// Direct spatial path for file descriptor creation
//
// Design:
// - Spatial fd table: 0x80010000+ (1024 entries × 64 bytes)
// - Entry format: fd(1 byte) | flags(1 byte) | inode(4 bytes) | offset(4 bytes) | reserved(54 bytes)
// - Workflow:
//   1. Check path in VFS surface at 0x70000000+
//   2. Allocate fd from spatial table
//   3. Return fd to user space

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::cpu::StepResult;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;
use std::sync::atomic::{AtomicU32, Ordering};

static NEXT_FD: AtomicU32 = AtomicU32::new(3);

/// Pixel-native openat() implementation
pub fn syscall_openat_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let dirfd = cpu.x[10] as i32;      // a0: directory file descriptor (usually AT_FDCWD = -100)
    let pathname_ptr = cpu.x[11];      // a1: pathname pointer
    let flags = cpu.x[12];             // a2: flags (O_RDONLY, O_WRONLY, O_RDWR, etc.)
    let _mode = cpu.x[13];             // a3: mode (for O_CREAT)

    // Read pathname from user memory
    let path = match read_user_string(cpu, bus, pathname_ptr) {
        Ok(s) => s,
        Err(_) => return None,  // Invalid pointer
    };

    // AT_FDCWD (-100) means use current working directory
    if dirfd != -100i32 {
        // For now, only support AT_FDCWD (absolute paths or relative to cwd)
        return None;
    }

    // Check if file exists in VFS surface
    let mut file_row = match lookup_file_in_vfs(bus, &path) {
        Some(row) => Some(row),
        None => {
            let o_creat = 0x40;
            if (flags & o_creat) != 0 {
                bus.vfs_surface.create_file_entry(&path)
            } else {
                None
            }
        }
    };

    let file_row = match file_row {
        Some(row) => {
            let o_trunc = 0x200;
            if (flags & o_trunc) != 0 {
                bus.vfs_surface.update_file_header(row, 0, 0x01);
            }
            row
        },
        None => return None,
    };

    // Allocate fd from spatial fd table at 0x80010000+
    let fd = NEXT_FD.fetch_add(1, Ordering::SeqCst);
    if fd >= 1024 {
        return None;  // FD table exhausted
    }

    // Write fd entry to spatial fd table
    // Entry format: fd(1 byte) | flags(1 byte) | inode(4 bytes) | offset(4 bytes) | reserved(54 bytes)
    // For simplicity, encode as pixels in framebuffer at 0x80010000+
    let fd_table_base = 0x80010000u64;
    let entry_offset = fd * 64;  // 64 bytes per entry

    // Use file row as inode identifier
    let inode = file_row as u32;

    // Map offset to Hilbert coordinates on 256x256 framebuffer
    let table_offset = entry_offset as u64;
    for i in 0..16u64 {  // First 16 pixels contain fd, flags, inode, offset
        let pixel_offset = table_offset + i * 4;
        let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
        let pixel_idx = (y * 256 + x) as usize;

        if pixel_idx < bus.framebuf.pixels.len() {
            let pixel_value = match i {
                0 => (fd & 0xFF) | ((flags & 0xFF) << 8) | ((inode & 0xFF) << 16) | 0xFF000000,
                1 => ((inode >> 8) & 0xFF) | 0xFF000000,  // inode continuation
                _ => 0xFF000000,  // Reserved
            };
            bus.framebuf.pixels[pixel_idx] = pixel_value;
        }
    }

    // Trigger framebuffer update
    bus.framebuf.present_flag = true;

    // Return fd to user space
    Some(fd)
}

/// Lookup file in VFS surface by pathname
fn lookup_file_in_vfs(bus: &Bus, path: &str) -> Option<u16> {
    let vfs = &bus.vfs_surface;

    // Check if path is absolute or relative
    let filename = if path.starts_with('/') {
        // Extract filename from absolute path
        path.split('/').last().unwrap_or("")
    } else {
        // Use relative path as-is (should match files in VFS)
        path
    };

    if filename.is_empty() {
        return None;
    }

    // Compute name hash (same FNV-1a as VFS)
    let name_hash = fnv1a_hash(filename);

    // Search directory index (Row 0, pixels 2-255)
    let file_count = vfs.pixels[1] as usize;
    for i in 0..file_count {
        let idx = vfs.pixels[2 + i];
        let stored_hash = (idx & 0xFFFF) as u32;
        let start_row = (idx >> 16) as u16;

        if stored_hash == (name_hash & 0xFFFF) && start_row > 0 {
            // Verify filename by checking actual path if file_map exists
            if let Some(stored_name) = vfs.file_map.get(&start_row) {
                if stored_name == filename {
                    return Some(start_row);
                }
            }
        }
    }

    None
}

/// FNV-1a hash (same as VfsSurface implementation)
fn fnv1a_hash(s: &str) -> u32 {
    let mut hash: u32 = 0x811C9DC5;
    for byte in s.bytes() {
        hash ^= byte as u32;
        hash = hash.wrapping_mul(0x01000193);
    }
    hash
}

/// Read null-terminated string from user memory
fn read_user_string(cpu: &mut RiscvCpu, bus: &mut Bus, ptr: u32) -> Result<String, ()> {
    let mut bytes = Vec::new();
    let mut addr = ptr;

    loop {
        let pa = match cpu.translate_va(addr, AccessType::Load, bus) {
            Ok(p) => p,
            Err(_) => return Err(()),
        };
        let byte = match bus.read_byte(pa) {
            Ok(b) => b,
            Err(_) => return Err(()),
        };

        if byte == 0 {
            break;
        }

        bytes.push(byte);
        addr += 1;

        if bytes.len() > 256 {
            return Err(());  // Path too long
        }
    }

    String::from_utf8(bytes).map_err(|_| ())
}