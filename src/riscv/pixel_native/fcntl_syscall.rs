// Pixel-native fcntl syscall implementation
// fcntl: manipulate file descriptor

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

const F_DUPFD: u32 = 0;
const F_GETFD: u32 = 1;
const F_SETFD: u32 = 2;
const F_GETFL: u32 = 3;
const F_SETFL: u32 = 4;

/// Pixel-native fcntl syscall (Linux syscall 25)
/// int fcntl(int fd, int cmd, ...)
pub fn syscall_fcntl_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10];  // a0: fd
    let cmd = cpu.x[11]; // a1: cmd
    let arg = cpu.x[12]; // a2: arg

    if fd >= 1024 {
        return Some(0xFFFFFFF7); // -EBADF
    }

    match cmd {
        F_GETFD => {
            Some(0) // Return 0 (no FD_CLOEXEC for simplicity)
        }
        F_SETFD => {
            Some(0) // Success
        }
        F_GETFL => {
            if fd < 3 {
                return Some(0); // stdin, stdout, stderr flags
            }
            let entry_offset = fd * 64;
            let table_offset = entry_offset as u64;
            let px0 = get_table_pixel(bus, table_offset, 0);
            let stored_fd = px0 & 0xFF;
            if stored_fd != fd {
                return Some(0xFFFFFFF7); // -EBADF
            }
            let flags = (px0 >> 8) & 0xFF;
            Some(flags)
        }
        F_SETFL => {
            if fd < 3 {
                return Some(0);
            }
            let entry_offset = fd * 64;
            let table_offset = entry_offset as u64;
            let px0 = get_table_pixel(bus, table_offset, 0);
            let stored_fd = px0 & 0xFF;
            if stored_fd != fd {
                return Some(0xFFFFFFF7); // -EBADF
            }
            let inode_low = (px0 >> 16) & 0xFFFF;
            let new_px0 = (fd & 0xFF) | ((arg & 0xFF) << 8) | ((inode_low & 0xFFFF) << 16) | 0xFF000000;
            set_table_pixel(bus, table_offset, 0, new_px0);
            bus.framebuf.present_flag = true;
            Some(0)
        }
        F_DUPFD => {
            // Duplicate fd to lowest unused fd >= arg
            let start_fd = if arg < 3 { 3 } else { arg };
            if start_fd >= 1024 {
                return Some(0xFFFFFFF6); // -EINVAL
            }

            // Read oldfd entry
            let px_old_list: Vec<u32> = if fd < 3 {
                let mut list = vec![0xFF000000; 16];
                list[0] = (fd & 0xFF) | ((fd & 0xFF) << 16) | 0xFF000000;
                list
            } else {
                let old_entry_offset = fd * 64;
                let old_table_offset = old_entry_offset as u64;
                let px0_old = get_table_pixel(bus, old_table_offset, 0);
                let stored_fd = px0_old & 0xFF;
                if stored_fd != fd {
                    return Some(0xFFFFFFF7); // -EBADF
                }
                let mut list = Vec::with_capacity(16);
                for i in 0..16u64 {
                    list.push(get_table_pixel(bus, old_table_offset, i));
                }
                list
            };

            let mut allocated_fd = None;
            for candidate in start_fd..1024 {
                let entry_offset = candidate * 64;
                let table_offset = entry_offset as u64;
                let px0 = get_table_pixel(bus, table_offset, 0);
                let stored_fd = px0 & 0xFF;
                if stored_fd != candidate {
                    allocated_fd = Some(candidate);
                    break;
                }
            }

            let newfd = match allocated_fd {
                Some(f) => f,
                None => return Some(0xFFFFFFFF), // -EMFILE
            };

            // Write to newfd
            let new_entry_offset = newfd * 64;
            let new_table_offset = new_entry_offset as u64;
            for i in 0..16u64 {
                let mut pixel_val = px_old_list[i as usize];
                if i == 0 {
                    let flags = (pixel_val >> 8) & 0xFF;
                    let inode_low = (pixel_val >> 16) & 0xFFFF;
                    pixel_val = (newfd & 0xFF) | ((flags & 0xFF) << 8) | ((inode_low & 0xFFFF) << 16) | 0xFF000000;
                }
                set_table_pixel(bus, new_table_offset, i, pixel_val);
            }

            bus.framebuf.present_flag = true;
            Some(newfd)
        }
        _ => None, // Fall back to traditional kernel
    }
}

fn get_table_pixel(bus: &Bus, table_offset: u64, pixel_idx: u64) -> u32 {
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx]
    } else {
        0
    }
}

fn set_table_pixel(bus: &mut Bus, table_offset: u64, pixel_idx: u64, val: u32) {
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx] = val;
    }
}
