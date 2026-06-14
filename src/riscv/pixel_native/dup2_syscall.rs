/// dup2 syscall - duplicate file descriptor to a specific fd
///
/// xv6/Linux syscall: int dup2(int oldfd, int newfd)
/// Copies fd entry from oldfd to newfd in the spatial FD table.
/// If newfd is already open, it's closed first.
///
/// xv6 syscall: 23
/// Linux syscall: 24
pub fn syscall_dup2_pixel_native(cpu: &mut crate::riscv::cpu::RiscvCpu, bus: &mut crate::riscv::bus::Bus) -> Option<u32> {
    let oldfd = cpu.x[10]; // a0: old file descriptor
    let newfd = cpu.x[11]; // a1: new file descriptor

    // Validate ranges
    if oldfd >= 1024 || newfd >= 1024 {
        return Some(0xFFFFFFF7); // -EBADF
    }

    // Special case: dup2(oldfd, oldfd) returns oldfd unchanged
    if oldfd == newfd {
        return Some(oldfd);
    }

    // Read or synthesize oldfd entry
    let px_old_list: Vec<u32> = if oldfd < 3 {
        // oldfd is a reserved fd (0, 1, 2). It's always open.
        // Synthesize its px0 value: fd=oldfd, flags=0, inode=oldfd
        let mut list = vec![0xFF000000; 16];
        list[0] = (oldfd & 0xFF) | ((oldfd & 0xFF) << 16) | 0xFF000000;
        list
    } else {
        // Read oldfd entry from spatial FD table
        let old_entry_offset = oldfd * 64;
        let old_table_offset = old_entry_offset as u64;

        // Get pixel 0 to validate entry
        let px0_old = read_fd_pixel(bus, old_table_offset, 0);
        let stored_fd = px0_old & 0xFF;

        if stored_fd != oldfd {
            return Some(0xFFFFFFF7); // -EBADF
        }

        let mut list = Vec::with_capacity(16);
        for i in 0..16u64 {
            list.push(read_fd_pixel(bus, old_table_offset, i));
        }
        list
    };

    // If newfd is in spatial range, clear/overwrite it
    if newfd >= 3 {
        close_fd_entry(bus, newfd);

        let new_entry_offset = newfd * 64;
        let new_table_offset = new_entry_offset as u64;

        for i in 0..16u64 {
            let pixel_offset_new = new_table_offset + i * 4;
            let (x_new, y_new) = crate::pixel::d2xy(8, pixel_offset_new as u32 % (256 * 256));
            let pixel_idx_new = (y_new * 256 + x_new) as usize;

            if pixel_idx_new < bus.framebuf.pixels.len() {
                let mut pixel_val = px_old_list[i as usize];

                // Update fd number in pixel 0 to match newfd
                if i == 0 {
                    let flags = (pixel_val >> 8) & 0xFF;
                    let inode_low = (pixel_val >> 16) & 0xFFFF;
                    let alpha = pixel_val & 0xFF000000;
                    pixel_val = (newfd & 0xFF) | ((flags & 0xFF) << 8) | ((inode_low & 0xFFFF) << 16) | alpha;
                }

                bus.framebuf.pixels[pixel_idx_new] = pixel_val;
            }
        }
    }

    // Trigger framebuffer update
    bus.framebuf.present_flag = true;

    // Return newfd on success
    Some(newfd)
}

/// Read a pixel from FD table via Hilbert coordinates
fn read_fd_pixel(bus: &crate::riscv::bus::Bus, table_offset: u64, pixel_idx: u64) -> u32 {
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx]
    } else {
        0
    }
}

/// Close FD entry by clearing pixels
fn close_fd_entry(bus: &mut crate::riscv::bus::Bus, fd: u32) {
    let entry_offset = fd * 64;
    let table_offset = entry_offset as u64;

    for i in 0..16u64 {
        let pixel_offset = table_offset + i * 4;
        let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
        let pixel_idx = (y * 256 + x) as usize;

        if pixel_idx < bus.framebuf.pixels.len() {
            bus.framebuf.pixels[pixel_idx] = 0;
        }
    }
}