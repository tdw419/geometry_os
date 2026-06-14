// Pixel-native dup syscall implementation
// dup: duplicate a file descriptor

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native dup syscall (Linux syscall 23)
/// int dup(int oldfd)
pub fn syscall_dup_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let oldfd = cpu.x[10]; // a0: oldfd

    if oldfd >= 1024 {
        return Some(0xFFFFFFF7); // -EBADF
    }

    // Read or synthesize oldfd entry
    let px_old_list: Vec<u32> = if oldfd < 3 {
        // oldfd is a reserved fd (0, 1, 2)
        let mut list = vec![0xFF000000; 16];
        list[0] = (oldfd & 0xFF) | ((oldfd & 0xFF) << 16) | 0xFF000000;
        list
    } else {
        // Read oldfd entry from spatial FD table
        let old_entry_offset = oldfd * 64;
        let old_table_offset = old_entry_offset as u64;

        // Get pixel 0 to validate entry
        let (x, y) = crate::pixel::d2xy(8, old_table_offset as u32 % (256 * 256));
        let pixel_idx = (y * 256 + x) as usize;
        let px0_old = if pixel_idx < bus.framebuf.pixels.len() {
            bus.framebuf.pixels[pixel_idx]
        } else {
            0
        };
        let stored_fd = px0_old & 0xFF;

        if stored_fd != oldfd {
            return Some(0xFFFFFFF7); // -EBADF
        }

        let mut list = Vec::with_capacity(16);
        for i in 0..16u64 {
            let pixel_offset = old_table_offset + i * 4;
            let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
            let idx = (y * 256 + x) as usize;
            let val = if idx < bus.framebuf.pixels.len() {
                bus.framebuf.pixels[idx]
            } else {
                0
            };
            list.push(val);
        }
        list
    };

    // Find the lowest free FD slot in the spatial table
    let mut allocated_fd = None;
    for fd in 3..1024u32 {
        let entry_offset = fd * 64;
        let table_offset = entry_offset as u64;
        
        let (x, y) = crate::pixel::d2xy(8, table_offset as u32 % (256 * 256));
        let pixel_idx = (y * 256 + x) as usize;
        let px0 = if pixel_idx < bus.framebuf.pixels.len() {
            bus.framebuf.pixels[pixel_idx]
        } else {
            0
        };
        
        let stored_fd = px0 & 0xFF;
        if stored_fd != fd {
            allocated_fd = Some(fd);
            break;
        }
    }

    let newfd = match allocated_fd {
        Some(f) => f,
        None => return Some(0xFFFFFFFF), // -EMFILE / -ENFILE
    };

    // Write to newfd slot
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

    bus.framebuf.present_flag = true;
    Some(newfd)
}
