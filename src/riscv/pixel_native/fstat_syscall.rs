use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

#[repr(C, packed)]
struct LinuxStat64 {
    st_dev: u64,
    st_ino: u64,
    st_mode: u32,
    st_nlink: u32,
    st_uid: u32,
    st_gid: u32,
    st_rdev: u64,
    __pad1: u64,
    st_size: i64,
    st_blksize: i32,
    __pad2: i32,
    st_blocks: i64,
    st_atime: i64,
    st_atime_nsec: i64,
    st_mtime: i64,
    st_mtime_nsec: i64,
    st_ctime: i64,
    st_ctime_nsec: i64,
    __unused: [i32; 3],
}

impl Default for LinuxStat64 {
    fn default() -> Self {
        LinuxStat64 {
            st_dev: 0, st_ino: 0, st_mode: 0, st_nlink: 0,
            st_uid: 0, st_gid: 0, st_rdev: 0, __pad1: 0,
            st_size: 0, st_blksize: 4096, __pad2: 0, st_blocks: 0,
            st_atime: 0, st_atime_nsec: 0,
            st_mtime: 0, st_mtime_nsec: 0,
            st_ctime: 0, st_ctime_nsec: 0,
            __unused: [0; 3],
        }
    }
}

pub fn syscall_fstat_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10];
    let statbuf_ptr = cpu.x[11];

    if statbuf_ptr == 0 {
        return Some((!21u32 + 1)); // -EINVAL
    }

    // Standard FDs (stdin/stdout/stderr) → character device
    if fd < 3 {
        let mut stat = LinuxStat64::default();
        stat.st_mode = 0o020666; // S_IFCHR | 0666
        stat.st_rdev = 0x8800;   // /dev/console major=136
        stat.st_nlink = 1;
        stat.st_blksize = 4096;
        write_stat_to_user(cpu, bus, statbuf_ptr, &stat);
        return Some(0);
    }

    // Resolve fd → pathname via spatial fd table, then delegate to fstatat
    if fd >= 1024 {
        return Some((!8u32 + 1)); // -EBADF
    }

    let entry_offset = fd * 64;
    let table_offset = entry_offset as u64;

    let px0 = get_table_pixel(bus, table_offset, 0);
    let px1 = get_table_pixel(bus, table_offset, 1);

    let stored_fd = px0 & 0xFF;
    if stored_fd != fd {
        return Some((!8u32 + 1)); // -EBADF
    }

    let inode_low = (px0 >> 16) & 0xFF;
    let inode_high = px1 & 0xFF;
    let inode = inode_low | (inode_high << 8);

    let sr = inode as usize;
    if sr >= 256 {
        return Some((!8u32 + 1));
    }

    // Read filename from VFS row 0 at column = inode
    let col = sr as u64;
    let mut pathname = String::new();
    for pixel_idx in 0..4u64 {
        let pixel_offset = (col * 256 + pixel_idx) * 4;
        let pixel = read_vfs_pixel(bus, pixel_offset);
        if pixel != 0 {
            pathname.push((pixel & 0xFF) as u8 as char);
            pathname.push(((pixel >> 8) & 0xFF) as u8 as char);
            pathname.push(((pixel >> 16) & 0xFF) as u8 as char);
            pathname.push(((pixel >> 24) & 0xFF) as u8 as char);
        }
    }
    let pathname = pathname.trim_end_matches('\0').to_string();

    if pathname.is_empty() {
        return Some((!8u32 + 1));
    }

    // Write pathname to temp location and call fstatat
    let pathname_ptr = 0x7ffff000u32;
    for (i, byte) in pathname.bytes().enumerate() {
        let pa = match cpu.translate_va(pathname_ptr + i as u32, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Some((!8u32 + 1)),
        };
        if bus.write_byte(pa, byte).is_err() {
            return Some((!8u32 + 1));
        }
    }
    let null_pa = match cpu.translate_va(pathname_ptr + pathname.len() as u32, AccessType::Store, bus) {
        Ok(p) => p,
        Err(_) => return Some((!8u32 + 1)),
    };
    if bus.write_byte(null_pa, 0).is_err() {
        return Some((!8u32 + 1));
    }

    cpu.x[10] = 0xffffff9c; // AT_FDCWD
    cpu.x[11] = pathname_ptr;
    cpu.x[12] = statbuf_ptr;
    cpu.x[13] = 0;

    super::fstatat_syscall::syscall_fstatat_pixel_native(cpu, bus)
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

fn read_vfs_pixel(bus: &Bus, offset: u64) -> u32 {
    let pixel_idx = offset as usize / 4;
    if pixel_idx < bus.vfs_surface.pixels.len() {
        bus.vfs_surface.pixels[pixel_idx]
    } else {
        0
    }
}

fn write_stat_to_user(cpu: &mut RiscvCpu, bus: &mut Bus, ptr: u32, stat: &LinuxStat64) {
    let stat_bytes: &[u8] = unsafe {
        std::slice::from_raw_parts(
            stat as *const LinuxStat64 as *const u8,
            std::mem::size_of::<LinuxStat64>(),
        )
    };
    for (i, &byte) in stat_bytes.iter().enumerate() {
        let addr = ptr.wrapping_add(i as u32);
        let pa = match cpu.translate_va(addr, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => break,
        };
        let _ = bus.write_byte(pa, byte);
    }
}
