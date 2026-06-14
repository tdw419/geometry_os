// Pixel-native execve() syscall replacement (SYS_execve = 221 in RISC-V Linux)
// Direct spatial program loading and execution
//
// Design:
// - Read ELF file from VFS surface
// - Load program segments into user memory
// - Set new program counter and stack pointer
// - Falls back to traditional kernel for full ELF loading (complex)

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native execve() implementation
///
/// Note: Full ELF loading is complex. This implementation handles
/// simple cases and falls back to traditional kernel for complex ones.
pub fn syscall_execve_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let pathname_ptr = cpu.x[10]; // a0: pathname pointer
    let _argv_ptr = cpu.x[11]; // a1: argv array pointer
    let _envp_ptr = cpu.x[12]; // a2: envp array pointer

    // 1. Read pathname from user memory
    let pathname = match read_user_string(cpu, bus, pathname_ptr) {
        Ok(s) => s,
        Err(_) => return None,
    };

    // 2. Check if file exists in VFS surface
    let _file_row = match find_file_in_vfs(bus, &pathname) {
        Some(row) => row,
        None => return None, // File not found
    };

    // 3. For now, fall back to traditional kernel for full ELF loading
    // ELF parsing, segment loading, and memory management is complex
    // The traditional kernel handles this correctly
    //
    // Future optimization: Pre-load known programs (like /init, /sh)
    // into spatial memory and jump directly to entry point

    None
}

/// Helper: Read null-terminated string from user memory
fn read_user_string(cpu: &mut RiscvCpu, bus: &mut Bus, addr: u32) -> Result<String, ()> {
    let mut bytes = Vec::new();
    let mut current_addr = addr;

    loop {
        let pa = match cpu.translate_va(current_addr, AccessType::Load, bus) {
            Ok(p) => p,
            Err(_) => return Err(()),
        };

        match bus.read_byte(pa) {
            Ok(0) => break, // Null terminator
            Ok(byte) => {
                bytes.push(byte);
                current_addr += 1;
                if bytes.len() > 1024 {
                    return Err(()); // String too long
                }
            }
            Err(_) => return Err(()), // Invalid memory access
        }
    }

    String::from_utf8(bytes).map_err(|_| ())
}

/// Helper: Find file in VFS surface by pathname
fn find_file_in_vfs(bus: &Bus, pathname: &str) -> Option<u32> {
    // Scan VFS surface row 0 for filename matching
    // Row 0 contains directory entries, columns 1-254
    let pathname_bytes = pathname.as_bytes();

    for col in 1..255u32 {
        let mut filename_bytes = Vec::new();
        let base_col = col * 4;

        // Extract up to 16 characters from 4 pixels (RGBA)
        for i in 0..4 {
            let pixel = read_vfs_pixel(bus, 0, base_col + i);
            let r = (pixel & 0xFF) as u8;
            let g = ((pixel >> 8) & 0xFF) as u8;
            let b = ((pixel >> 16) & 0xFF) as u8;
            let a = ((pixel >> 24) & 0xFF) as u8;

            if r != 0 {
                filename_bytes.push(r);
            }
            if g != 0 {
                filename_bytes.push(g);
            }
            if b != 0 {
                filename_bytes.push(b);
            }
            if a != 0 && a != 0xFF {
                filename_bytes.push(a);
            }
        }

        // Compare filename
        if filename_bytes.starts_with(pathname_bytes) {
            // Find the starting row for this file
            for row in 1..256 {
                let pixel = read_vfs_pixel(bus, row, col);
                if pixel != 0 {
                    return Some(row);
                }
            }
        }
    }

    None
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