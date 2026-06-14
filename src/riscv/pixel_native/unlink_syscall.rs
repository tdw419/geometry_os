// Pixel-native unlink() syscall replacement (SYS_unlink = 87 in RISC-V Linux)
// Direct spatial path for file deletion from VFS surface
//
// Design:
// - VFS-based file deletion: mark file pixels as freed in VFS surface at 0x90000000+
// - Entry format: filename(16 chars) | type(1 byte) | size(3 bytes) | perms(4 bytes) | reserved(8 bytes)
// - Workflow:
//   1. Read pathname from user memory (a0)
//   2. Scan VFS row 0 for file name match
//   3. Zero out directory entry pixels (column 0, 4 pixels)
//   4. Zero out file content pixels (rows 1-255)
//   5. Return 0 on success

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native unlink() implementation
pub fn syscall_unlink_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let pathname_ptr = cpu.x[10]; // a0: pathname pointer in user memory

    // Read pathname from user memory
    let pathname = read_string(cpu, bus, pathname_ptr);
    if pathname.is_empty() {
        // Invalid pathname
        cpu.x[10] = !0i32 as u32; // EINVAL
        return Some(!0i32 as u32);
    }

    // Extract filename from path
    let filename = if pathname.starts_with('/') {
        pathname.split('/').last().unwrap_or("")
    } else {
        &pathname
    };

    // Scan VFS for file and delete it using VfsSurface's implementation
    let delete_result = bus.vfs_surface.delete_file_entry(filename);
    if !delete_result {
        // File not found
        cpu.x[10] = 2; // ENOENT
        return Some(!0i32 as u32);
    }

    // Return 0 on success
    Some(0)
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

/// Read a pixel from VFS surface
fn read_vfs_pixel(bus: &Bus, offset: u64) -> u32 {
    let pixel_idx = offset as usize / 4;
    if pixel_idx < bus.vfs_surface.pixels.len() {
        bus.vfs_surface.pixels[pixel_idx]
    } else {
        0
    }
}

/// Write a pixel to VFS surface
fn write_vfs_pixel(bus: &mut Bus, offset: u64, value: u32) {
    let pixel_idx = offset as usize / 4;
    if pixel_idx < bus.vfs_surface.pixels.len() {
        bus.vfs_surface.pixels[pixel_idx] = value;
    }
}