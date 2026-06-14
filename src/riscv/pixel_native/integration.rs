use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use super::write_syscall::syscall_write_pixel_native;
use super::fork_syscall::syscall_fork_pixel_native;
use super::openat_syscall::syscall_openat_pixel_native;
use super::close_syscall::syscall_close_pixel_native;
use super::read_syscall::syscall_read_pixel_native;
use super::exit_syscall::syscall_exit_pixel_native;
use super::execve_syscall::syscall_execve_pixel_native;
use super::getdents_syscall::syscall_getdents_pixel_native;
use super::fstatat_syscall::syscall_fstatat_pixel_native;
use super::unlink_syscall::syscall_unlink_pixel_native;
use super::brk_syscall::syscall_brk_pixel_native;
use super::mmap_syscall::syscall_mmap_pixel_native;
use super::munmap_syscall::syscall_munmap_pixel_native;
use super::pipe2_syscall::syscall_pipe2_pixel_native;
use super::getpid_syscall::syscall_getpid_pixel_native;
use super::rmdir_syscall::syscall_rmdir_pixel_native;
use super::wait_syscall::syscall_wait_pixel_native;
use super::dup2_syscall::syscall_dup2_pixel_native;
use super::chdir_syscall::{syscall_chdir_pixel_native, syscall_getcwd_pixel_native};
use super::mkdir_syscall::syscall_mkdir_pixel_native;
use super::lseek_syscall::syscall_lseek_pixel_native;
use super::faccessat_syscall::syscall_faccessat_pixel_native;
use super::renameat2_syscall::syscall_renameat2_pixel_native;
use super::getppid_syscall::syscall_getppid_pixel_native;
use super::getuid_syscall::syscall_getuid_pixel_native;
use super::geteuid_syscall::syscall_geteuid_pixel_native;
use super::getgid_syscall::syscall_getgid_pixel_native;
use super::getegid_syscall::syscall_getegid_pixel_native;
use super::gettid_syscall::syscall_gettid_pixel_native;
use super::set_tid_address_syscall::syscall_set_tid_address_pixel_native;
use super::mprotect_syscall::syscall_mprotect_pixel_native;
use super::madvise_syscall::syscall_madvise_pixel_native;
use super::umask_syscall::syscall_umask_pixel_native;
use super::exit_group_syscall::syscall_exit_group_pixel_native;
use super::fstat_syscall::syscall_fstat_pixel_native;
use super::writev_syscall::syscall_writev_pixel_native;
use super::readv_syscall::syscall_readv_pixel_native;
use super::pread64_syscall::syscall_pread64_pixel_native;
use super::pwrite64_syscall::syscall_pwrite64_pixel_native;
use super::ioctl_syscall::syscall_ioctl_pixel_native;
use super::clock_gettime_syscall::syscall_clock_gettime_pixel_native;
use super::nanosleep_syscall::syscall_nanosleep_pixel_native;
use super::clock_nanosleep_syscall::syscall_clock_nanosleep_pixel_native;
use super::uname_syscall::syscall_uname_pixel_native;
use super::sysinfo_syscall::syscall_sysinfo_pixel_native;
use super::gettimeofday_syscall::syscall_gettimeofday_pixel_native;
use super::clock_getres_syscall::syscall_clock_getres_pixel_native;
use super::prlimit64_syscall::syscall_prlimit64_pixel_native;
use super::getrandom_syscall::syscall_getrandom_pixel_native;
use super::memfd_create_syscall::syscall_memfd_create_pixel_native;
use super::rt_sigaction_syscall::syscall_rt_sigaction_pixel_native;
use super::rt_sigprocmask_syscall::syscall_rt_sigprocmask_pixel_native;
use super::kill_syscall::syscall_kill_pixel_native;
use super::futex_syscall::syscall_futex_pixel_native;
use super::dup_syscall::syscall_dup_pixel_native;
use super::unlinkat_syscall::syscall_unlinkat_pixel_native;
use super::renameat_syscall::syscall_renameat_pixel_native;
use super::mkdirat_syscall::syscall_mkdirat_pixel_native;
use super::readlinkat_syscall::syscall_readlinkat_pixel_native;
use super::poll_syscall::syscall_poll_pixel_native;
use super::fcntl_syscall::syscall_fcntl_pixel_native;
use super::sched_yield_syscall::syscall_sched_yield_pixel_native;
use super::sigaltstack_syscall::syscall_sigaltstack_pixel_native;
use super::setuid_syscall::syscall_setuid_pixel_native;
use super::setgid_syscall::syscall_setgid_pixel_native;
use super::getrlimit_syscall::syscall_getrlimit_pixel_native;
use super::setrlimit_syscall::syscall_setrlimit_pixel_native;
use super::socketpair_syscall::syscall_socketpair_pixel_native;
use super::waitid_syscall::syscall_waitid_pixel_native;
use super::socket_syscall::syscall_socket_pixel_native;
use super::connect_syscall::syscall_connect_pixel_native;
use super::sendto_syscall::syscall_sendto_pixel_native;
use super::recvfrom_syscall::syscall_recvfrom_pixel_native;
use super::shutdown_syscall::syscall_shutdown_pixel_native;

/// Helper to read table pixel from spatial fd table via Hilbert coordinates
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

/// Read a pixel from VFS surface
fn read_vfs_pixel(bus: &Bus, offset: u64) -> u32 {
    let pixel_idx = offset as usize / 4;
    if pixel_idx < bus.vfs_surface.pixels.len() {
        bus.vfs_surface.pixels[pixel_idx]
    } else {
        0
    }
}

/// Convert file descriptor to pathname by looking up in spatial fd table and VFS
fn fd_to_pathname(cpu: &mut RiscvCpu, bus: &Bus, fd: u32) -> Option<String> {
    // 1. Lookup fd in spatial fd table
    if fd >= 1024 {
        return None;
    }

    let entry_offset = fd * 64;
    let table_offset = entry_offset as u64;

    // Retrieve fd, flags, inode (start row) from pixel i = 0 and i = 1
    let px0 = get_table_pixel(bus, table_offset, 0);
    let px1 = get_table_pixel(bus, table_offset, 1);

    let stored_fd = px0 & 0xFF;
    if stored_fd != fd {
        return None; // File descriptor entry invalid or unused
    }

    let inode_low = (px0 >> 16) & 0xFF;
    let inode_high = px1 & 0xFF;
    let inode = inode_low | (inode_high << 8);

    // 2. Lookup pathname in VFS using inode
    let sr = inode as usize;
    if sr >= 256 {
        return None;
    }

    // VFS row 0 contains directory entries, each filename in 4 pixels (16 chars max)
    // Column is the inode number
    let col = sr as u64;
    let mut pathname = String::new();

    // Scan column for filename
    for pixel_idx in 0..4u64 {
        let pixel_offset = (col * 256 + pixel_idx) * 4;
        let pixel = read_vfs_pixel(bus, pixel_offset);

        // Decode 4 chars from RGBA channels in little-endian order: LSB first
        if pixel != 0 {
            pathname.push((pixel & 0xFF) as u8 as char);
            pathname.push(((pixel >> 8) & 0xFF) as u8 as char);
            pathname.push(((pixel >> 16) & 0xFF) as u8 as char);
            pathname.push(((pixel >> 24) & 0xFF) as u8 as char);
        }
    }

    // Trim nulls
    pathname = pathname.trim_end_matches('\0').to_string();

    if pathname.is_empty() {
        None
    } else {
        Some(pathname)
    }
}

/// Pixel-native syscall dispatcher
/// Routes syscalls to spatial implementations where available,
/// falls back to traditional kernel otherwise
pub fn dispatch_syscall_pixel_native(
    cpu: &mut RiscvCpu,
    bus: &mut Bus,
    syscall_num: u32,
) -> Option<u32> {
    match syscall_num {
        // xv6 syscall mappings
        16 => syscall_write_pixel_native(cpu, bus),
        2 => syscall_fork_pixel_native(cpu, bus),
        5 => {
            // xv6 fstat: int fstat(int fd, struct stat *st)
            // Convert to fstatat by looking up fd -> pathname in spatial tables
            let fd = cpu.x[10];       // a0: file descriptor
            let statbuf_ptr = cpu.x[11]; // a1: stat buffer pointer

            // Try to convert fd to pathname
            if let Some(pathname) = fd_to_pathname(cpu, bus, fd) {
                // Convert pathname string to user memory for fstatat
                // Allocate a temporary buffer at the end of user memory
                let pathname_ptr = 0x7ffff000u32; // Temporary location

                // Write pathname to user memory
                for (i, byte) in pathname.bytes().enumerate() {
                    let pa = match cpu.translate_va(pathname_ptr + i as u32, crate::riscv::mmu::AccessType::Store, bus) {
                        Ok(p) => p,
                        Err(_) => return None,
                    };
                    if bus.write_byte(pa, byte).is_err() {
                        return None;
                    }
                }
                // Null terminator
                let null_pa = match cpu.translate_va(pathname_ptr + pathname.len() as u32, crate::riscv::mmu::AccessType::Store, bus) {
                    Ok(p) => p,
                    Err(_) => return None,
                };
                if bus.write_byte(null_pa, 0).is_err() {
                    return None;
                }

                // Set up fstatat arguments
                cpu.x[10] = 0xffffff9c; // AT_FDCWD (-100)
                cpu.x[11] = pathname_ptr; // pathname
                cpu.x[12] = statbuf_ptr; // statbuf
                cpu.x[13] = 0; // flags

                // Call fstatat
                syscall_fstatat_pixel_native(cpu, bus)
            } else {
                // Can't resolve fd to pathname, fall back
                None
            }
        },
        11 => syscall_getpid_pixel_native(cpu, bus), // xv6 getpid
        6 => syscall_wait_pixel_native(cpu, bus),    // xv6 wait
        30 => syscall_rmdir_pixel_native(cpu, bus),  // xv6 rmdir
        20 => syscall_mkdir_pixel_native(cpu, bus),  // xv6 mkdir
        13 => syscall_chdir_pixel_native(cpu, bus),  // xv6 chdir
        23 => syscall_dup2_pixel_native(cpu, bus),   // xv6 dup2

        // Linux RV32/RV64 standard syscall mappings
        64 => syscall_write_pixel_native(cpu, bus),
        220 => syscall_fork_pixel_native(cpu, bus),
        56 => syscall_openat_pixel_native(cpu, bus),
        57 => syscall_close_pixel_native(cpu, bus),
        63 => syscall_read_pixel_native(cpu, bus),
        62 => syscall_lseek_pixel_native(cpu, bus),  // lseek - reposition file offset
        93 => syscall_exit_pixel_native(cpu, bus),
        221 => syscall_execve_pixel_native(cpu, bus),
        78 => syscall_getdents_pixel_native(cpu, bus),
        79 => syscall_fstatat_pixel_native(cpu, bus), // fstatat (also covers fstat for fd=AT_FDCWD)
        87 => syscall_unlink_pixel_native(cpu, bus),  // unlink - delete file
        59 => syscall_pipe2_pixel_native(cpu, bus),   // pipe2 - create pipe
        214 => syscall_brk_pixel_native(cpu, bus),
        215 => syscall_munmap_pixel_native(cpu, bus),
        222 => syscall_mmap_pixel_native(cpu, bus),
        84 => syscall_rmdir_pixel_native(cpu, bus), // rmdir
        83 => syscall_mkdir_pixel_native(cpu, bus), // mkdir
        172 => syscall_getpid_pixel_native(cpu, bus), // getpid - get process ID
        260 => syscall_wait_pixel_native(cpu, bus),   // wait4/waitpid
        24 => syscall_dup2_pixel_native(cpu, bus),    // Linux dup2
        49 => syscall_chdir_pixel_native(cpu, bus),   // Linux chdir
        17 => syscall_getcwd_pixel_native(cpu, bus),  // Linux getcwd
        48 => syscall_faccessat_pixel_native(cpu, bus), // Linux faccessat
        276 => syscall_renameat2_pixel_native(cpu, bus), // Linux renameat2

        // Process info
        173 => syscall_getppid_pixel_native(cpu, bus),  // getppid
        174 => syscall_getuid_pixel_native(cpu, bus),   // getuid
        175 => syscall_geteuid_pixel_native(cpu, bus),  // geteuid
        176 => syscall_getgid_pixel_native(cpu, bus),   // getgid
        177 => syscall_getegid_pixel_native(cpu, bus),  // getegid
        178 => syscall_gettid_pixel_native(cpu, bus),   // gettid

        // Passthrough stubs
        44 => syscall_fstat_pixel_native(cpu, bus),     // fstat (old)
        80 => syscall_fstat_pixel_native(cpu, bus),     // fstat (RISC-V)
        94 => syscall_exit_group_pixel_native(cpu, bus), // exit_group
        96 => syscall_set_tid_address_pixel_native(cpu, bus), // set_tid_address
        166 => syscall_umask_pixel_native(cpu, bus),    // umask
        226 => syscall_mprotect_pixel_native(cpu, bus), // mprotect
        233 => syscall_madvise_pixel_native(cpu, bus),  // madvise

        // I/O expansion (batch 3)
        66 => syscall_writev_pixel_native(cpu, bus),  // writev
        65 => syscall_readv_pixel_native(cpu, bus),   // readv
        67 => syscall_pread64_pixel_native(cpu, bus), // pread64
        68 => syscall_pwrite64_pixel_native(cpu, bus), // pwrite64
        29 => syscall_ioctl_pixel_native(cpu, bus),   // ioctl (common)

        // Time syscalls (batch 4)
        113 => syscall_clock_gettime_pixel_native(cpu, bus),     // clock_gettime
        115 => syscall_clock_nanosleep_pixel_native(cpu, bus),   // clock_nanosleep
        101 => syscall_nanosleep_pixel_native(cpu, bus),         // nanosleep
        35 => syscall_nanosleep_pixel_native(cpu, bus),          // nanosleep (RV64)

        // New expansions
        160 => syscall_uname_pixel_native(cpu, bus),            // uname
        179 => syscall_sysinfo_pixel_native(cpu, bus),          // sysinfo
        169 => syscall_gettimeofday_pixel_native(cpu, bus),     // gettimeofday
        114 => syscall_clock_getres_pixel_native(cpu, bus),      // clock_getres
        261 => syscall_prlimit64_pixel_native(cpu, bus),        // prlimit64
        278 => syscall_getrandom_pixel_native(cpu, bus),        // getrandom
        279 => syscall_memfd_create_pixel_native(cpu, bus),      // memfd_create
        134 => syscall_rt_sigaction_pixel_native(cpu, bus),     // rt_sigaction
        135 => syscall_rt_sigprocmask_pixel_native(cpu, bus),   // rt_sigprocmask
        129 => syscall_kill_pixel_native(cpu, bus),             // kill
        98 => syscall_futex_pixel_native(cpu, bus),             // futex
        23 => syscall_dup_pixel_native(cpu, bus),               // dup
        35 => syscall_unlinkat_pixel_native(cpu, bus),          // unlinkat
        38 => syscall_renameat_pixel_native(cpu, bus),          // renameat
        39 => syscall_mkdirat_pixel_native(cpu, bus),           // mkdirat
        78 => syscall_readlinkat_pixel_native(cpu, bus),        // readlinkat
        73 => syscall_poll_pixel_native(cpu, bus),              // poll
        25 => syscall_fcntl_pixel_native(cpu, bus),             // fcntl
        124 => syscall_sched_yield_pixel_native(cpu, bus),      // sched_yield
        132 => syscall_sigaltstack_pixel_native(cpu, bus),      // sigaltstack
        146 => syscall_setuid_pixel_native(cpu, bus),           // setuid
        144 => syscall_setgid_pixel_native(cpu, bus),           // setgid
        163 => syscall_getrlimit_pixel_native(cpu, bus),        // getrlimit
        164 => syscall_setrlimit_pixel_native(cpu, bus),        // setrlimit
        199 => syscall_socketpair_pixel_native(cpu, bus),       // socketpair
        95 => syscall_waitid_pixel_native(cpu, bus),            // waitid

        // Networking (Phase 8)
        198 => syscall_socket_pixel_native(cpu, bus),           // socket
        203 => syscall_connect_pixel_native(cpu, bus),          // connect
        206 => syscall_sendto_pixel_native(cpu, bus),           // sendto
        207 => syscall_recvfrom_pixel_native(cpu, bus),         // recvfrom
        210 => syscall_shutdown_pixel_native(cpu, bus),         // shutdown

        _ => None, // Fall back to traditional implementation
    }
}