// Pixel-native fstatat() syscall replacement (SYS_fstatat = 79 in RISC-V Linux)
// Direct spatial path for file metadata queries
//
// Design:
// - VFS-based metadata: read from virtual filesystem surface at 0x90000000+
// - Entry format: type(1 byte) | size(3 bytes) | perms(4 bytes) | reserved(8 bytes)
// - Workflow:
//   1. Read pathname from user memory (a1)
//   2. Scan VFS row 0 for file name match
//   3. Read metadata from VFS pixel data
//   4. Write stat structure to user buffer (a2)
//   5. Return 0 on success

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Linux stat64 structure for RISC-V
/// Packed for direct memory write
#[repr(C, packed)]
struct LinuxStat64 {
    st_dev: u64,   // Device ID
    st_ino: u64,   // Inode number
    st_mode: u32,  // File type and mode
    st_nlink: u32, // Number of hard links
    st_uid: u32,   // User ID
    st_gid: u32,   // Group ID
    st_rdev: u64,  // Device ID (if special file)
    __pad1: u64,
    st_size: i64,    // Total size, in bytes
    st_blksize: i32, // Block size for filesystem I/O
    __pad2: i32,
    st_blocks: i64, // Number of 512B blocks allocated
    st_atime: i64,  // Time of last access
    st_atime_nsec: i64,
    st_mtime: i64,  // Time of last modification
    st_mtime_nsec: i64,
    st_ctime: i64,  // Time of last status change
    st_ctime_nsec: i64,
    __unused: [i32; 3],
}

impl Default for LinuxStat64 {
    fn default() -> Self {
        LinuxStat64 {
            st_dev: 0,
            st_ino: 0,
            st_mode: 0,
            st_nlink: 0,
            st_uid: 0,
            st_gid: 0,
            st_rdev: 0,
            __pad1: 0,
            st_size: 0,
            st_blksize: 4096,
            __pad2: 0,
            st_blocks: 0,
            st_atime: 0,
            st_atime_nsec: 0,
            st_mtime: 0,
            st_mtime_nsec: 0,
            st_ctime: 0,
            st_ctime_nsec: 0,
            __unused: [0; 3],
        }
    }
}

/// Pixel-native fstatat() implementation
pub fn syscall_fstatat_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let dirfd = cpu.x[10]; // a0: directory file descriptor (AT_FDCWD = -100 for cwd)
    let pathname_ptr = cpu.x[11]; // a1: pathname pointer in user memory
    let statbuf_ptr = cpu.x[12]; // a2: stat buffer pointer in user memory
    let _flags = cpu.x[13]; // a3: flags (AT_SYMLINK_NOFOLLOW, etc.)

    // Handle AT_FDCWD (use current working directory)
    if dirfd == !0i32 as u32 || dirfd == 0xffffff9c {
        // AT_FDCWD = -100
        // Use current working directory (assumed to be root)
    }

    // Read pathname from user memory
    let pathname = read_string(cpu, bus, pathname_ptr);
    if pathname.is_empty() {
        // Invalid pathname
        cpu.x[10] = !0i32 as u32; // EINVAL
        return Some(!0i32 as u32);
    }

    // Scan VFS for file
    let vfs_result = scan_vfs_for_file(bus, &pathname);
    if vfs_result.is_none() {
        // File not found
        cpu.x[10] = 2; // ENOENT
        return Some(!0i32 as u32);
    }

    let (file_type, file_size) = vfs_result.unwrap();

    // Build stat structure
    let mut stat = LinuxStat64::default();

    // Set mode bits
    match file_type {
        0x04 => {
            // DT_DIR
            stat.st_mode = 0o040755; // S_IFDIR | 0755
        },
        0x08 => {
            // DT_REG
            stat.st_mode = 0o100644; // S_IFREG | 0644
        },
        _ => {
            stat.st_mode = 0o100644; // Default to regular file
        },
    }

    // Set inode and size
    stat.st_ino = (pathname_ptr & 0xFFFF) as u64; // Simple inode from pointer
    stat.st_size = file_size as i64;
    stat.st_nlink = 1;
    stat.st_uid = 0; // root
    stat.st_gid = 0; // root

    // Calculate blocks (rounded up to 512-byte blocks)
    stat.st_blocks = ((file_size + 511) / 512) as i64;

    // Write stat structure to user memory
    write_stat_to_user(cpu, bus, statbuf_ptr, &stat);

    // Return 0 on success
    Some(0)
}

/// Read null-terminated string from user memory
fn read_string(cpu: &mut RiscvCpu, bus: &mut Bus, ptr: u32) -> String {
    let mut result = String::new();
    let mut addr = ptr;

    // Read up to 256 bytes
    for _ in 0..256 {
        let pa = match cpu.translate_va(addr, AccessType::Load, bus) {
            Ok(p) => p,
            Err(_) => break,
        };

        if let Ok(byte) = bus.read_byte(pa) {
            if byte == 0 {
                break;
            }
            result.push(byte as char);
            addr = addr.wrapping_add(1);
        } else {
            break;
        }
    }

    result
}

/// Scan VFS surface for file and extract metadata
fn scan_vfs_for_file(bus: &Bus, pathname: &str) -> Option<(u8, u32)> {
    // VFS starts at 0x90000000, row 0 contains directory entries
    // Each filename encoded in 4 pixels (16 chars max)
    // Format: char0 | char1 | char2 | char3 (each pixel RGBA = 4 chars)

    let vfs_base = 0x90000000u64;
    let mut filename_chars: Vec<char> = pathname.chars().collect();

    // Remove leading '/' if present
    if filename_chars.first() == Some(&'/') {
        filename_chars.remove(0);
    }

    let filename_str: String = filename_chars.iter().collect();

    if filename_str.is_empty() {
        return Some((0x04, 0)); // Root directory is DT_DIR
    }

    // Scan columns 1-254 (column 0 reserved)
    for col in 1..254u64 {
        // Read 4 pixels for filename (16 chars)
        let mut vfs_filename = String::new();
        let mut valid_entry = false;

        for pixel_idx in 0..4 {
            let pixel_offset = (col * 256 + pixel_idx) * 4;
            let addr = vfs_base + pixel_offset;

            if addr + 4 <= vfs_base + 256 * 256 * 4 {
                // Read pixel from VFS via vfs_surface pixels array
                let pixel = read_vfs_pixel(bus, pixel_offset);

                // Decode 4 chars from RGBA channels
                if pixel != 0 {
                    vfs_filename.push(((pixel >> 24) & 0xFF) as u8 as char);
                    vfs_filename.push(((pixel >> 16) & 0xFF) as u8 as char);
                    vfs_filename.push(((pixel >> 8) & 0xFF) as u8 as char);
                    vfs_filename.push((pixel & 0xFF) as u8 as char);
                    valid_entry = true;
                }
            }
        }

        if valid_entry && vfs_filename == filename_str {
            // Found file! Read metadata from first pixel (bits 0-7 = file type)
            let first_pixel_offset = col * 256 * 4;
            let pixel = read_vfs_pixel(bus, first_pixel_offset);
            let file_type = ((pixel >> 8) & 0xFF) as u8; // File type in bits 8-15
            let file_size = (pixel & 0xFF) as u32; // Simple size encoding

            // Estimate size from file rows (rows 1-255)
            let estimated_size = estimate_file_size(bus, vfs_base, col);

            return Some((file_type, estimated_size));
        }
    }

    None
}

/// Read a pixel from VFS surface
fn read_vfs_pixel(bus: &Bus, offset: u64) -> u32 {
    let pixel_idx = offset as usize / 4;
    if pixel_idx < bus.vfs_surface.pixels.len() {
        bus.vfs_surface.pixels[pixel_idx]
    } else {
        0
    }
}

/// Estimate file size from VFS rows
fn estimate_file_size(bus: &Bus, vfs_base: u64, col: u64) -> u32 {
    // Count non-empty rows 1-255 for this column
    let mut size = 0u32;

    for row in 1..256u64 {
        let pixel_offset = (col + row * 256) * 4;
        let pixel = read_vfs_pixel(bus, pixel_offset);
        if pixel != 0 {
            size += 4; // Each non-empty pixel = 4 bytes
        }
    }

    size
}

/// Write stat structure to user memory byte-by-byte
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