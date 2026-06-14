/// rmdir syscall - remove a directory
///
/// xv6/Linux syscall: int rmdir(const char *pathname)
/// Removes an empty directory from the VFS surface.
///
/// In pixel-native environment, directories are represented in the VFS surface.
/// This implementation removes a directory entry from row 0 of the VFS.
///
/// xv6 syscall: 30
/// Linux syscall: 84
pub fn syscall_rmdir_pixel_native(cpu: &mut crate::riscv::cpu::RiscvCpu, bus: &mut crate::riscv::bus::Bus) -> Option<u32> {
    // Read pathname from user memory
    let pathname_ptr = cpu.x[10]; // a0: pathname pointer

    // Helper to read user string
    fn read_user_string(
        cpu: &mut crate::riscv::cpu::RiscvCpu,
        bus: &mut crate::riscv::bus::Bus,
        addr: u32,
    ) -> Result<String, ()> {
        let mut bytes = Vec::new();
        let mut current_addr = addr;

        loop {
            let pa = match cpu.translate_va(
                current_addr,
                crate::riscv::mmu::AccessType::Load,
                bus,
            ) {
                Ok(p) => p,
                Err(_) => return Err(()),
            };

            let byte = match bus.read_byte(pa) {
                Ok(b) => b,
                Err(_) => return Err(()),
            };

            if byte == 0 {
                break; // Null terminator
            }

            bytes.push(byte);
            current_addr += 1;

            if bytes.len() > 256 {
                return Err(()); // Path too long
            }
        }

        String::from_utf8(bytes).map_err(|_| ())
    }

    let path = match read_user_string(cpu, bus, pathname_ptr) {
        Ok(s) => s,
        Err(_) => return None, // Invalid pointer
    };

    // Search VFS surface for directory entry (row 0)
    // VFS row 0: column N = directory N, filename in 4 pixels (16 chars max)
    for col in 0..256u64 {
        let mut dirname = String::new();

        // Read filename from 4 pixels
        for pixel_idx in 0..4u64 {
            let pixel_offset = (col * 256 + pixel_idx) * 4;
            let pixel_idx_mem = pixel_offset as usize / 4;
            if pixel_idx_mem < bus.vfs_surface.pixels.len() {
                let pixel = bus.vfs_surface.pixels[pixel_idx_mem];
                if pixel != 0 {
                    // Decode in little-endian order: LSB first (byte 0), then bytes 1, 2, 3
                    dirname.push((pixel & 0xFF) as u8 as char);
                    dirname.push(((pixel >> 8) & 0xFF) as u8 as char);
                    dirname.push(((pixel >> 16) & 0xFF) as u8 as char);
                    dirname.push(((pixel >> 24) & 0xFF) as u8 as char);
                }
            }
        }

        // Trim nulls and check match
        dirname = dirname.trim_end_matches('\0').to_string();

        if dirname == path {
            // Found directory - remove entry by zeroing pixels
            for pixel_idx in 0..4u64 {
                let pixel_offset = (col * 256 + pixel_idx) * 4;
                let pixel_idx_mem = pixel_offset as usize / 4;
                if pixel_idx_mem < bus.vfs_surface.pixels.len() {
                    bus.vfs_surface.pixels[pixel_idx_mem] = 0;
                }
            }

            // Zero out directory content rows (rows 1-255 for this column)
            for row in 1..256u64 {
                let pixel_offset = (row * 256 + col) * 4;
                let pixel_idx_mem = pixel_offset as usize / 4;
                if pixel_idx_mem < bus.vfs_surface.pixels.len() {
                    bus.vfs_surface.pixels[pixel_idx_mem] = 0;
                }
            }



            return Some(0); // Success
        }
    }

    None // Directory not found
}