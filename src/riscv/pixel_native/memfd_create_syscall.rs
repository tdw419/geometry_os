// Pixel-native memfd_create syscall implementation
// memfd_create: create an anonymous file

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native memfd_create syscall (Linux syscall 279)
/// int memfd_create(const char *name, unsigned int flags)
pub fn syscall_memfd_create_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let _name_ptr = cpu.x[10]; // a0: name
    let flags = cpu.x[11];     // a1: flags

    // Find first free FD slot in the spatial FD table (scanning 3..1024)
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

    let fd = match allocated_fd {
        Some(f) => f,
        None => return Some(0xFFFFFFFF), // -1
    };

    // Use a special anonymous inode number (e.g., 500)
    let inode = 500u32;
    let entry_offset = fd * 64;
    let table_offset = entry_offset as u64;

    for i in 0..16u64 {
        let pixel_offset = table_offset + i * 4;
        let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
        let pixel_idx = (y * 256 + x) as usize;

        if pixel_idx < bus.framebuf.pixels.len() {
            let pixel_value = match i {
                0 => (fd & 0xFF) | ((flags & 0xFF) << 8) | ((inode & 0xFF) << 16) | 0xFF000000,
                1 => ((inode >> 8) & 0xFF) | 0xFF000000,
                _ => 0xFF000000,
            };
            bus.framebuf.pixels[pixel_idx] = pixel_value;
        }
    }

    bus.framebuf.present_flag = true;
    Some(fd)
}
