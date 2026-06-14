// Pixel-native faccessat() syscall replacement (SYS_faccessat = 48 in RISC-V Linux)
// Direct spatial path for file accessibility checks

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native faccessat() implementation
pub fn syscall_faccessat_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let dirfd = cpu.x[10];       // a0: directory file descriptor
    let pathname_ptr = cpu.x[11]; // a1: pathname pointer in user memory
    let _mode = cpu.x[12];        // a2: accessibility check mode (F_OK=0, X_OK=1, W_OK=2, R_OK=4)
    let _flags = cpu.x[13];       // a3: flags

    // Handle AT_FDCWD
    if dirfd == !0i32 as u32 || dirfd == 0xffffff9c {
        // AT_FDCWD = -100
    }

    // Read pathname from user memory
    let pathname = read_string(cpu, bus, pathname_ptr);
    if pathname.is_empty() {
        return Some(!22u32 + 1); // -EINVAL
    }

    // Extract filename from path
    let filename = if pathname.starts_with('/') {
        pathname.split('/').last().unwrap_or("")
    } else {
        &pathname
    };

    // Root directory always exists and is accessible
    if filename.is_empty() || pathname == "/" {
        return Some(0);
    }

    // Scan VFS for file
    let vfs_result = scan_vfs_for_file(bus, filename);
    if vfs_result.is_none() {
        return Some(!2u32 + 1); // -ENOENT
    }

    Some(0)
}

/// Scan VFS for a file name
fn scan_vfs_for_file(bus: &Bus, pathname: &str) -> Option<(u8, u32)> {
    let vfs = &bus.vfs_surface;
    let mut filename_chars: Vec<char> = pathname.chars().collect();

    // Remove leading '/' if present
    if filename_chars.first() == Some(&'/') {
        filename_chars.remove(0);
    }

    let filename_str: String = filename_chars.iter().collect();
    if filename_str.is_empty() {
        return None;
    }

    // Search directory index (Row 0, pixels 2-255)
    let file_count = vfs.pixels[1] as usize;
    for i in 0..file_count {
        let idx = vfs.pixels[2 + i];
        let start_row = (idx >> 16) as u16;
        if start_row == 0 {
            continue;
        }

        if let Some(stored_name) = vfs.file_map.get(&start_row) {
            if stored_name == &filename_str {
                let header_val = vfs.pixels[start_row as usize * 256];
                let file_flags = header_val & 0xFF;
                if file_flags & 0x01 == 0 {
                    continue; // Inactive
                }
                let file_type = ((header_val >> 8) & 0xFF) as u8;
                let file_size = (header_val >> 16) as u32;
                return Some((file_type, file_size));
            }
        }
    }

    None
}

/// Read null-terminated string from user memory
fn read_string(cpu: &mut RiscvCpu, bus: &mut Bus, ptr: u32) -> String {
    let mut result = String::new();
    let mut addr = ptr;

    // Read up to 256 bytes
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
