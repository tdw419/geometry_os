// Pixel-native lseek() syscall replacement (SYS_lseek = 62 in RISC-V Linux)
// Direct spatial path for file descriptor seeking
//
// Design:
// - Check if fd exists in the spatial fd table (0x80010000+)
// - Update file offset in fd table entry (pixel 2)
// - Return new offset to user space
//
// Whence values:
// - SEEK_SET (0): Set offset to specified value
// - SEEK_CUR (1): Set offset to current + specified value
// - SEEK_END (2): Set offset to EOF + specified value

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native lseek() implementation
pub fn syscall_lseek_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10];           // a0: file descriptor
    let offset_arg = cpu.x[11];   // a1: offset (signed 32-bit)
    let whence = cpu.x[12];       // a2: whence (SEEK_SET=0, SEEK_CUR=1, SEEK_END=2)

    // Validate fd range
    if fd < 3 || fd >= 1024 {
        return None; // Invalid fd
    }

    // 1. Lookup fd in spatial fd table
    let entry_offset = fd * 64;
    let table_offset = entry_offset as u64;

    // Retrieve fd, flags, inode from pixel 0 and 1
    let px0 = get_table_pixel(bus, table_offset, 0);
    let px1 = get_table_pixel(bus, table_offset, 1);

    let stored_fd = px0 & 0xFF;
    if stored_fd != fd {
        return None; // File descriptor entry invalid or unused
    }

    let inode_low = (px0 >> 16) & 0xFF;
    let inode_high = px1 & 0xFF;
    let inode = inode_low | (inode_high << 8);

    // 2. Get current offset from pixel 2
    let px2 = get_table_pixel(bus, table_offset, 2);
    let current_offset = px2 & 0x00FFFFFF;

    // 3. Get file size from VFS header
    let sr = inode as usize;
    if sr >= 256 {
        return None;
    }

    let header_val = bus.vfs_surface.pixels[sr * 256];
    let file_flags = header_val & 0xFF;
    if file_flags & 0x01 == 0 {
        return None; // Invalid/inactive file header
    }

    let file_size = (header_val >> 16) as u32;

    // 4. Calculate new offset based on whence
    let offset_arg_signed = offset_arg as i32;
    let new_offset = match whence {
        0 => { // SEEK_SET
            if offset_arg_signed < 0 {
                return None; // Cannot seek before start
            }
            offset_arg
        },
        1 => { // SEEK_CUR
            let current = current_offset as i32;
            let result = current.saturating_add(offset_arg_signed);
            if result < 0 {
                return None; // Cannot seek before start
            }
            result as u32
        },
        2 => { // SEEK_END
            let size = file_size as i32;
            let result = size.saturating_add(offset_arg_signed);
            if result < 0 {
                return None; // Cannot seek before start
            }
            result as u32
        },
        _ => return None, // Invalid whence value
    };

    // 5. Update offset in spatial fd table (pixel 2)
    let new_px2 = (new_offset & 0x00FFFFFF) | 0xFF000000;
    set_table_pixel(bus, table_offset, 2, new_px2);

    // Trigger presentation update
    bus.framebuf.present_flag = true;

    // 6. Return new offset to user space
    Some(new_offset)
}

/// Read a pixel from the spatial table via Hilbert coordinates
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

/// Write a pixel to the spatial table via Hilbert coordinates
fn set_table_pixel(bus: &mut Bus, table_offset: u64, pixel_idx: u64, val: u32) {
    let pixel_offset = table_offset + pixel_idx * 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let idx = (y * 256 + x) as usize;
    if idx < bus.framebuf.pixels.len() {
        bus.framebuf.pixels[idx] = val;
    }
}