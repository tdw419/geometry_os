/// chdir syscall - change current working directory
///
/// xv6/Linux syscall: int chdir(const char *pathname)
/// Updates the cwd_inode field in the process table entry.
/// Pathname is looked up in VFS to get the inode.
///
/// xv6 syscall: 13
/// Linux syscall: 49
pub fn syscall_chdir_pixel_native(
    cpu: &mut crate::riscv::cpu::RiscvCpu,
    bus: &mut crate::riscv::bus::Bus,
) -> Option<u32> {
    let pathname_ptr = cpu.x[10]; // a0: pathname pointer

    // Read pathname from user memory
    let path = match read_user_string(cpu, bus, pathname_ptr) {
        Ok(s) => s,
        Err(_) => return None,
    };

    // Lookup pathname in VFS to get inode
    let file_row = match lookup_file_in_vfs(bus, &path) {
        Some(row) => row,
        None => return None, // Directory not found
    };

    let inode = file_row as u32;

    // Get current process ID from tp register (x4)
    let pid = cpu.x[4];
    let process_idx = pid % 1024;

    // Write cwd_inode to process table entry at pixel 1
    // Pixel 1 format: cwd_inode_low(2B) | cwd_inode_high(2B) | alpha(1B)
    let process_base = 0x80000000 + (process_idx * 256);
    let cwd_pixel_offset = (process_base - 0x80000000 + 4) as u64; // Pixel 1 = offset 4

    let (x, y) = crate::pixel::d2xy(8, cwd_pixel_offset as u32 % (256 * 256));
    let pixel_idx = (y * 256 + x) as usize;

    if pixel_idx < bus.framebuf.pixels.len() {
        let pixel_val = (inode & 0xFFFF) | (((inode >> 16) & 0xFFFF) << 16) | 0xFF000000;
        bus.framebuf.pixels[pixel_idx] = pixel_val;
    }

    // Trigger framebuffer update
    bus.framebuf.present_flag = true;

    // Return 0 on success
    Some(0)
}

/// getcwd syscall - get current working directory
///
/// xv6/Linux syscall: char *getcwd(char *buf, size_t size)
/// Reads cwd_inode from process table, looks up pathname in VFS,
/// and writes to user buffer.
///
/// xv6 syscall: N/A (not in xv6)
/// Linux syscall: 17
pub fn syscall_getcwd_pixel_native(
    cpu: &mut crate::riscv::cpu::RiscvCpu,
    bus: &mut crate::riscv::bus::Bus,
) -> Option<u32> {
    let buf_ptr = cpu.x[10]; // a0: buffer pointer
    let size = cpu.x[11]; // a1: buffer size

    if size == 0 {
        return None;
    }

    // Get current process ID from tp register (x4)
    let pid = cpu.x[4];
    let process_idx = pid % 1024;

    // Read cwd_inode from process table pixel 1
    let process_base = 0x80000000 + (process_idx * 256);
    let cwd_pixel_offset = (process_base - 0x80000000 + 4) as u64; // Pixel 1

    let (x, y) = crate::pixel::d2xy(8, cwd_pixel_offset as u32 % (256 * 256));
    let pixel_idx = (y * 256 + x) as usize;

    let cwd_inode = if pixel_idx < bus.framebuf.pixels.len() {
        let pixel = bus.framebuf.pixels[pixel_idx];
        let inode_low = pixel & 0xFFFF;
        let inode_high = (pixel >> 16) & 0xFFFF;
        (inode_low | (inode_high << 16)) & 0x00FFFFFF // Mask out alpha channel
    } else {
        return None;
    };

    if cwd_inode == 0 {
        // No cwd set, assume root directory (inode 0)
        return None;
    }

    // Lookup pathname in VFS using cwd_inode
    let sr = cwd_inode as usize;
    if sr >= 256 {
        return None;
    }

    let col = sr as u64;
    let mut pathname = String::new();

    // Scan VFS row 0, column sr for filename (4 pixels = 16 chars max)
    for pixel_idx in 0..4u64 {
        let pixel_offset = (col * 256 + pixel_idx) * 4;
        let pixel = read_vfs_pixel(bus, pixel_offset);

        if pixel != 0 {
            // Decode in little-endian order: LSB first (byte 0), then bytes 1, 2, 3
            pathname.push((pixel & 0xFF) as u8 as char);
            pathname.push(((pixel >> 8) & 0xFF) as u8 as char);
            pathname.push(((pixel >> 16) & 0xFF) as u8 as char);
            pathname.push(((pixel >> 24) & 0xFF) as u8 as char);
        }
    }

    pathname = pathname.trim_end_matches('\0').to_string();

    if pathname.is_empty() {
        return None;
    }

    // Write pathname to user buffer
    let pathname_bytes = pathname.as_bytes();
    let bytes_to_write = std::cmp::min(pathname_bytes.len(), size as usize - 1);

    for i in 0..bytes_to_write {
        let pa = match cpu.translate_va(
            buf_ptr + i as u32,
            crate::riscv::mmu::AccessType::Store,
            bus,
        ) {
            Ok(p) => p,
            Err(_) => return None,
        };
        if bus.write_byte(pa, pathname_bytes[i]).is_err() {
            return None;
        }
    }

    // Null terminator
    let null_pa = match cpu.translate_va(
        buf_ptr + bytes_to_write as u32,
        crate::riscv::mmu::AccessType::Store,
        bus,
    ) {
        Ok(p) => p,
        Err(_) => return None,
    };
    if bus.write_byte(null_pa, 0).is_err() {
        return None;
    }

    // Return buffer pointer on success
    Some(buf_ptr)
}

/// Read a string from user memory
fn read_user_string(
    cpu: &mut crate::riscv::cpu::RiscvCpu,
    bus: &mut crate::riscv::bus::Bus,
    addr: u32,
) -> Result<String, ()> {
    let mut bytes = Vec::new();
    let mut current_addr = addr;

    loop {
        let pa = match cpu.translate_va(current_addr, crate::riscv::mmu::AccessType::Load, bus) {
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
        current_addr += 1;

        if bytes.len() > 256 {
            return Err(()); // Path too long
        }
    }

    String::from_utf8(bytes).map_err(|_| ())
}

/// Read a pixel from VFS surface
fn read_vfs_pixel(bus: &crate::riscv::bus::Bus, offset: u64) -> u32 {
    let pixel_idx = offset as usize / 4;
    if pixel_idx < bus.vfs_surface.pixels.len() {
        bus.vfs_surface.pixels[pixel_idx]
    } else {
        0
    }
}

/// Lookup file in VFS surface (from openat_syscall.rs)
fn lookup_file_in_vfs(bus: &crate::riscv::bus::Bus, path: &str) -> Option<usize> {
    // Handle absolute paths
    let search_path = if path.starts_with('/') {
        path.trim_start_matches('/')
    } else {
        path
    };

    if search_path.is_empty() {
        return None; // Root directory (inode 0, not a file)
    }

    // Scan VFS row 0 for matching filename
    for row in 1..256 {
        let mut filename = String::new();
        let col = row as u64;

        for pixel_idx in 0..4u64 {
            let pixel_offset = (col * 256 + pixel_idx) * 4;
            let pixel = read_vfs_pixel(bus, pixel_offset);

            if pixel != 0 {
                // Decode in little-endian order: LSB first (byte 0), then bytes 1, 2, 3
                filename.push((pixel & 0xFF) as u8 as char);
                filename.push(((pixel >> 8) & 0xFF) as u8 as char);
                filename.push(((pixel >> 16) & 0xFF) as u8 as char);
                filename.push(((pixel >> 24) & 0xFF) as u8 as char);
            }
        }

        filename = filename.trim_end_matches('\0').to_string();

        if filename == search_path {
            return Some(row);
        }
    }

    None
}