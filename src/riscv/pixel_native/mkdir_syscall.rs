/// mkdir syscall - create a directory
///
/// xv6/Linux syscall: int mkdir(const char *pathname, mode_t mode)
/// Creates a new directory entry in VFS surface.
/// Pathname is stored in row 0, column corresponds to inode number.
///
/// xv6 syscall: 20
/// Linux syscall: 83
pub fn syscall_mkdir_pixel_native(cpu: &mut crate::riscv::cpu::RiscvCpu, bus: &mut crate::riscv::bus::Bus) -> Option<u32> {
    let pathname_ptr = cpu.x[10]; // a0: pathname pointer
    let _mode = cpu.x[11];         // a1: mode (ignored for now)

    // Read pathname from user memory
    let path = match read_user_string(cpu, bus, pathname_ptr) {
        Ok(s) => s,
        Err(_) => return None,
    };

    // Handle absolute paths
    let search_path = if path.starts_with('/') {
        path.trim_start_matches('/')
    } else {
        &path
    };

    if search_path.is_empty() {
        return None; // Can't create root directory
    }

    // Check if directory already exists
    if lookup_file_in_vfs(bus, search_path).is_some() {
        return None; // Already exists
    }

    // Find a free inode number (row in VFS)
    let inode = match find_free_inode(bus) {
        Some(i) => i,
        None => return None, // No free inodes
    };

    eprintln!("[mkdir] found free inode: {}", inode); // Debug

    // Write directory entry to VFS surface
    // Format: 4 pixels = 16 characters max for filename
    // Pixel encoding: RGBA channels store 4 chars each
    let col = inode as u64;

    for (i, chunk) in search_path.as_bytes().chunks(4).enumerate() {
        let pixel_idx = i as u64;

        // Build pixel from 4 bytes (RGBA channels)
        let mut pixel_val = 0u32;
        for (j, &byte) in chunk.iter().enumerate() {
            let shift = j * 8;
            pixel_val |= (byte as u32) << shift;
        }
        eprintln!("[mkdir] chunk {:?}: pixel_val = 0x{:08x}", chunk, pixel_val); // Debug

        // Write to VFS row 0, column = inode, pixel_offset = pixel_idx
        let pixel_offset = (col * 256 + pixel_idx) * 4;
        let vfs_idx = pixel_offset as usize / 4;

        if vfs_idx < bus.vfs_surface.pixels.len() {
            bus.vfs_surface.pixels[vfs_idx] = pixel_val;
            eprintln!("[mkdir] wrote to vfs_idx {}: 0x{:08x}", vfs_idx, pixel_val); // Debug
        }
    }

    // Trigger framebuffer update (VFS changes visible in pixel-native context)
    bus.framebuf.present_flag = true;

    // Return 0 on success
    Some(0)
}

/// Find a free inode number in VFS surface
fn find_free_inode(bus: &crate::riscv::bus::Bus) -> Option<u32> {
    // Scan rows 1-255 for a free slot
    for inode in 1..256u32 {
        let col = inode as u64;

        // Check if this inode is in use by looking at first pixel of the row
        let pixel_offset = (col * 256 + 0) * 4;
        let vfs_idx = pixel_offset as usize / 4;

        if vfs_idx < bus.vfs_surface.pixels.len() {
            let pixel = bus.vfs_surface.pixels[vfs_idx];
            eprintln!("[find_free_inode] inode {}: vfs_idx={}, pixel=0x{:08x}", inode, vfs_idx, pixel); // Debug
            // If first pixel is 0 (or just alpha set), this inode is free
            if pixel == 0 || pixel == 0xFF000000 {
                eprintln!("[find_free_inode] returning inode {}", inode); // Debug
                return Some(inode);
            }
        }
    }

    None
}

/// Read a string from user memory
fn read_user_string(cpu: &mut crate::riscv::cpu::RiscvCpu, bus: &mut crate::riscv::bus::Bus, addr: u32) -> Result<String, ()> {
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

/// Lookup file in VFS surface
pub(crate) fn lookup_file_in_vfs(bus: &crate::riscv::bus::Bus, path: &str) -> Option<usize> {
    if path.is_empty() {
        return None;
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

        if filename == path {
            return Some(row);
        }
    }

    None
}