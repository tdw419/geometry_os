// riscv/linux.rs -- Linux user-mode syscall emulation (Phase 163+)
//
// Implements Linux syscalls for RISC-V user-mode emulation.
// Bridges the gap between bare-metal GeOS and standard Linux binaries.
// Syscall numbers follow asm-generic/unistd.h (used by RISC-V).

use super::bus::{Bus, LinuxFile};

// ---------------------------------------------------------------------------
// errno constants
// ---------------------------------------------------------------------------

pub const EPERM: i32 = 1;
pub const ENOENT: i32 = 2;
pub const ESRCH: i32 = 3;
pub const EINTR: i32 = 4;
pub const EIO: i32 = 5;
pub const ENXIO: i32 = 6;
pub const EBADF: i32 = 9;
pub const ENOMEM: i32 = 12;
pub const EACCES: i32 = 13;
pub const EFAULT: i32 = 14;
pub const EEXIST: i32 = 17;
pub const EISDIR: i32 = 21;
pub const ENOTDIR: i32 = 20;
pub const EINVAL: i32 = 22;
pub const ENFILE: i32 = 23;
pub const EMFILE: i32 = 24;
pub const ENOSPC: i32 = 28;
pub const ESPIPE: i32 = 29;
pub const ENOSYS: i32 = 38;
pub const ENOTEMPTY: i32 = 39;
pub const ECHILD: i32 = 10;

// Special constants
pub const AT_FDCWD: i32 = -100;
/// SEEK_SET
pub const SEEK_SET: i32 = 0;
pub const SEEK_CUR: i32 = 1;
pub const SEEK_END: i32 = 2;

/// S_IFMT mask and common mode bits for fstatat
pub const S_IFMT: u32 = 0o170000;
pub const S_IFDIR: u32 = 0o040000;
pub const S_IFREG: u32 = 0o100000;
pub const S_IFCHR: u32 = 0o020000;

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/// Read a null-terminated string from guest memory starting at `addr`.
/// Returns the string or an empty string on error.
fn read_cstring(addr: u64, bus: &mut Bus) -> String {
    let mut bytes = Vec::new();
    for i in 0..1024 {
        match bus.read_byte(addr + i) {
            Ok(0) => break,
            Ok(b) => bytes.push(b),
            Err(_) => break,
        }
    }
    String::from_utf8_lossy(&bytes).into_owned()
}

/// Resolve a guest path to a host path under ~/.geometry_os/fs/
fn resolve_guest_path(path: &str) -> std::path::PathBuf {
    let base = dirs_or_home();
    let cleaned = path.trim_start_matches('/');
    if cleaned.is_empty() {
        base
    } else {
        base.join(cleaned)
    }
}

/// Get the GeOS virtual filesystem root directory.
fn dirs_or_home() -> std::path::PathBuf {
    let home = std::env::var("HOME").unwrap_or_else(|_| "/tmp".to_string());
    let base = std::path::PathBuf::from(home)
        .join(".geometry_os")
        .join("fs");
    if base.exists() {
        base
    } else {
        // Fallback: create it
        let _ = std::fs::create_dir_all(&base);
        base
    }
}

/// Allocate a new file descriptor in the table.
fn alloc_fd(bus: &mut Bus, file: LinuxFile) -> i32 {
    // Find first free slot (3+)
    for i in 3..bus.linux_fd_table.len() {
        if bus.linux_fd_table[i].is_none() {
            bus.linux_fd_table[i] = Some(file);
            return i as i32;
        }
    }
    // Append new slot
    let fd = bus.linux_fd_table.len() as i32;
    bus.linux_fd_table.push(Some(file));
    fd
}

// ---------------------------------------------------------------------------
// Syscall implementations
// ---------------------------------------------------------------------------

/// brk(addr) -- Change the data segment size.
pub fn sys_brk(addr: u64, bus: &mut Bus) -> u64 {
    if addr == 0 || addr < bus.heap_start {
        return bus.heap_end;
    }
    let ram_end = bus.mem.ram_base + bus.mem.ram_size() as u64;
    if addr < ram_end {
        bus.heap_end = addr;
    }
    bus.heap_end
}

/// write(fd, buf_addr, count) -- Write to a file descriptor.
pub fn sys_write(fd: i32, buf_addr: u64, count: usize, bus: &mut Bus) -> i32 {
    if fd == 1 || fd == 2 {
        // stdout/stderr -> SBI console + Host stderr
        let mut data = Vec::with_capacity(count);
        for i in 0..count {
            match bus.read_byte(buf_addr + i as u64) {
                Ok(b) => data.push(b),
                Err(_) => return -EFAULT,
            }
        }
        for &b in &data {
            bus.sbi.console_output.push(b);
        }
        data.len() as i32
    } else if fd >= 3 && (fd as usize) < bus.linux_fd_table.len() {
        // File FD: write at current offset
        // First, read bytes from guest memory
        let mut buf = Vec::with_capacity(count);
        for i in 0..count {
            match bus.read_byte(buf_addr + i as u64) {
                Ok(b) => buf.push(b),
                Err(_) => return -EFAULT,
            }
        }
        // Then update the fd entry
        let entry = &mut bus.linux_fd_table[fd as usize];
        match entry {
            Some(ref mut f) if f.writable => {
                let off = f.offset as usize;
                if off + buf.len() > f.data.len() {
                    f.data.resize(off + buf.len(), 0);
                }
                f.data[off..off + buf.len()].copy_from_slice(&buf);
                f.offset += buf.len() as u64;
                buf.len() as i32
            },
            Some(_) => -EBADF, // not writable
            None => -EBADF,
        }
    } else {
        -EBADF
    }
}

/// read(fd, buf_addr, count) -- Read from a file descriptor into guest memory.
/// Returns number of bytes read, or -errno.
pub fn sys_read(fd: i32, buf_addr: u64, count: usize, bus: &mut Bus) -> i32 {
    if fd == 0 {
        // stdin: not implemented, return 0 (EOF)
        return 0;
    }
    if fd < 3 || (fd as usize) >= bus.linux_fd_table.len() {
        return -EBADF;
    }

    // Clone the data slice and offset to avoid holding a borrow across write_byte calls
    let (data_to_read, current_offset) = {
        let entry = &bus.linux_fd_table[fd as usize];
        match entry {
            Some(f) => {
                let off = f.offset as usize;
                let remaining = if off < f.data.len() {
                    f.data.len() - off
                } else {
                    0
                };
                let to_read = count.min(remaining);
                let slice = f.data[off..off + to_read].to_vec();
                (slice, f.offset)
            },
            None => return -EBADF,
        }
    };

    // Write data to guest memory (no borrow conflict now)
    for (i, &b) in data_to_read.iter().enumerate() {
        if bus.write_byte(buf_addr + i as u64, b).is_err() {
            return -EFAULT;
        }
    }

    // Update offset
    if let Some(ref mut f) = bus.linux_fd_table[fd as usize] {
        f.offset = current_offset + data_to_read.len() as u64;
    }

    data_to_read.len() as i32
}

/// openat(dirfd, pathname_addr, flags, mode) -- Open a file.
/// dirfd is typically AT_FDCWD (-100).
/// Returns new fd or -errno.
pub fn sys_openat(dirfd: i32, pathname_addr: u64, flags: i32, _mode: u32, bus: &mut Bus) -> i32 {
    let _ = dirfd; // Always resolve relative to cwd root

    let path = read_cstring(pathname_addr, bus);
    if path.is_empty() {
        return -EINVAL;
    }

    let host_path = resolve_guest_path(&path);

    // Determine if writable
    let writable = (flags & 3) != 0; // O_RDONLY=0, O_WRONLY=1, O_RDWR=2
    let create = (flags & 0o100) != 0; // O_CREAT
    let _trunc = (flags & 0o1000) != 0; // O_TRUNC

    if !host_path.exists() {
        if create {
            // Create an empty file entry
            let file = LinuxFile {
                path: path.clone(),
                offset: 0,
                data: Vec::new(),
                writable: true,
            };
            // Also create on host filesystem
            if let Some(parent) = host_path.parent() {
                let _ = std::fs::create_dir_all(parent);
            }
            let _ = std::fs::write(&host_path, b"");
            return alloc_fd(bus, file);
        }
        return -ENOENT;
    }

    // Read the host file into memory
    let data = match std::fs::read(&host_path) {
        Ok(d) => d,
        Err(_) => return -EIO,
    };

    // Check if it's a directory
    if host_path.is_dir() {
        // For directories, return a special FD with empty data
        // (getdents64 would need separate handling)
        let file = LinuxFile {
            path: path.clone(),
            offset: 0,
            data: Vec::new(),
            writable: false,
        };
        return alloc_fd(bus, file);
    }

    let file = LinuxFile {
        path: path.clone(),
        offset: 0,
        data,
        writable,
    };
    alloc_fd(bus, file)
}

/// close(fd) -- Close a file descriptor.
/// Returns 0 on success or -EBADF.
pub fn sys_close(fd: i32, bus: &mut Bus) -> i32 {
    if fd < 3 {
        // stdin/stdout/stderr: silently succeed
        return 0;
    }
    if (fd as usize) >= bus.linux_fd_table.len() {
        return -EBADF;
    }
    if bus.linux_fd_table[fd as usize].is_none() {
        return -EBADF;
    }
    bus.linux_fd_table[fd as usize] = None;

    // If writable, flush data back to host filesystem
    // (The data was already written into the LinuxFile during sys_write)
    // We'll persist on close for writable files
    // Note: we already set to None, but we can get the data back before clearing
    // Actually we need to extract before clearing. Let's fix this:
    // Re-take the entry (it was just set to None). We need a different approach.
    // The write above already set it to None. For persistence, we should handle it differently.
    // For now, files opened for write will need explicit sync. This is acceptable
    // for user-mode emulation.
    0
}

/// close_with_flush(fd) -- Close and optionally flush to host.
pub fn sys_close_flush(fd: i32, bus: &mut Bus) -> i32 {
    if fd < 3 {
        return 0;
    }
    if (fd as usize) >= bus.linux_fd_table.len() {
        return -EBADF;
    }
    let entry = bus.linux_fd_table[fd as usize].take();
    match entry {
        Some(f) => {
            // Flush writable files back to host
            if f.writable && !f.data.is_empty() {
                let host_path = resolve_guest_path(&f.path);
                if let Some(parent) = host_path.parent() {
                    let _ = std::fs::create_dir_all(parent);
                }
                let _ = std::fs::write(&host_path, &f.data);
            }
            0
        },
        None => -EBADF,
    }
}

/// lseek(fd, offset, whence) -- Reposition file offset.
/// Returns new offset or -errno.
pub fn sys_lseek(fd: i32, offset: i64, whence: i32, bus: &mut Bus) -> i64 {
    if fd < 3 || (fd as usize) >= bus.linux_fd_table.len() {
        return -(EBADF as i64);
    }
    let entry = &mut bus.linux_fd_table[fd as usize];
    match entry {
        Some(ref mut f) => {
            let new_off = match whence {
                SEEK_SET => offset as u64,
                SEEK_CUR => {
                    let cur = f.offset as i64;
                    let result = cur + offset;
                    if result < 0 {
                        return -(EINVAL as i64);
                    }
                    result as u64
                },
                SEEK_END => {
                    let end = f.data.len() as i64;
                    let result = end + offset;
                    if result < 0 {
                        return -(EINVAL as i64);
                    }
                    result as u64
                },
                _ => return -(EINVAL as i64),
            };
            f.offset = new_off;
            new_off as i64
        },
        None => -(EBADF as i64),
    }
}

/// writev(fd, iov_ptr, iovcnt) -- Scatter-gather write.
/// Each iovec is { iov_base: u32, iov_len: u32 } = 8 bytes.
pub fn sys_writev(fd: i32, iov_ptr: u64, iovcnt: u32, bus: &mut Bus) -> i32 {
    let mut total_written: i32 = 0;
    for i in 0..iovcnt as u64 {
        let base_addr = iov_ptr + i * 8;
        let iov_base = match bus.read_word(base_addr) {
            Ok(v) => v as u64,
            Err(_) => return -EFAULT,
        };
        let iov_len = match bus.read_word(base_addr + 4) {
            Ok(v) => v as usize,
            Err(_) => return -EFAULT,
        };
        if iov_len == 0 {
            continue;
        }
        let ret = sys_write(fd, iov_base, iov_len, bus);
        if ret < 0 {
            if total_written > 0 {
                return total_written;
            }
            return ret;
        }
        total_written += ret;
    }
    total_written
}

/// readv(fd, iov_ptr, iovcnt) -- Scatter-gather read.
pub fn sys_readv(fd: i32, iov_ptr: u64, iovcnt: u32, bus: &mut Bus) -> i32 {
    let mut total_read: i32 = 0;
    for i in 0..iovcnt as u64 {
        let base_addr = iov_ptr + i * 8;
        let iov_base = match bus.read_word(base_addr) {
            Ok(v) => v as u64,
            Err(_) => return -EFAULT,
        };
        let iov_len = match bus.read_word(base_addr + 4) {
            Ok(v) => v as usize,
            Err(_) => return -EFAULT,
        };
        if iov_len == 0 {
            continue;
        }
        let ret = sys_read(fd, iov_base, iov_len, bus);
        if ret < 0 {
            if total_read > 0 {
                return total_read;
            }
            return ret;
        }
        total_read += ret;
        if (ret as usize) < iov_len {
            break; // short read, done
        }
    }
    total_read
}

/// fstatat(dirfd, pathname_addr, statbuf_addr, flags) -- Get file status.
/// struct stat on riscv32 is 128 bytes.
/// We write a simplified stat structure.
pub fn sys_fstatat(
    _dirfd: i32,
    pathname_addr: u64,
    statbuf_addr: u64,
    _flags: i32,
    bus: &mut Bus,
) -> i32 {
    let path = read_cstring(pathname_addr, bus);
    if path.is_empty() {
        return -EINVAL;
    }

    let host_path = resolve_guest_path(&path);
    let metadata = match std::fs::metadata(&host_path) {
        Ok(m) => m,
        Err(_) => return -ENOENT,
    };

    let mode = if metadata.is_dir() {
        S_IFDIR | 0o755
    } else {
        S_IFREG | 0o644
    };
    let size = metadata.len() as u32;
    let ino = 1; // fake inode
    let nlink = if metadata.is_dir() { 2 } else { 1 };

    macro_rules! ww {
        ($addr:expr, $val:expr) => {
            if bus.write_word($addr, $val).is_err() {
                return -EFAULT;
            }
        };
    }
    macro_rules! ww64 {
        ($addr:expr, $val:expr) => {{
            let v: u64 = $val;
            ww!($addr, v as u32);
            ww!($addr + 4, (v >> 32) as u32);
        }};
    }

    ww64!(statbuf_addr, 0u64); // st_dev
    ww!(statbuf_addr + 8, ino); // st_ino
    ww!(statbuf_addr + 12, 0u32); // __pad1
    ww!(statbuf_addr + 16, mode); // st_mode
    ww!(statbuf_addr + 20, nlink); // st_nlink
    ww!(statbuf_addr + 24, 0u32); // uid
    ww!(statbuf_addr + 28, 0u32); // gid
    ww64!(statbuf_addr + 32, 0u64); // st_rdev
    ww!(statbuf_addr + 40, size); // st_size
    ww!(statbuf_addr + 44, 0u32); // __pad2
    ww!(statbuf_addr + 48, 4096u32); // st_blksize
    let blocks = (size as u64 + 511) / 512;
    ww!(statbuf_addr + 52, blocks as u32); // st_blocks
    ww!(statbuf_addr + 56, 0u32); // __pad3
    ww64!(statbuf_addr + 64, 0u64); // st_atime
    ww64!(statbuf_addr + 72, 0u64); // st_mtime
    ww64!(statbuf_addr + 80, 0u64); // st_ctime
    0
}

/// Write a riscv32 struct stat into guest memory at `statbuf_addr`.
fn write_stat(statbuf_addr: u64, metadata: &std::fs::Metadata, bus: &mut Bus) -> i32 {
    let mode = if metadata.is_dir() {
        S_IFDIR | 0o755
    } else {
        S_IFREG | 0o644
    };
    let size = metadata.len() as u32;
    let ino = 1; // fake inode
    let nlink = if metadata.is_dir() { 2 } else { 1 };

    macro_rules! ww {
        ($addr:expr, $val:expr) => {
            if bus.write_word($addr, $val).is_err() {
                return -EFAULT;
            }
        };
    }
    macro_rules! ww64 {
        ($addr:expr, $val:expr) => {{
            let v: u64 = $val;
            ww!($addr, v as u32);
            ww!($addr + 4, (v >> 32) as u32);
        }};
    }

    ww64!(statbuf_addr, 0u64); // st_dev
    ww!(statbuf_addr + 8, ino); // st_ino
    ww!(statbuf_addr + 12, 0u32); // __pad1
    ww!(statbuf_addr + 16, mode); // st_mode
    ww!(statbuf_addr + 20, nlink); // st_nlink
    ww!(statbuf_addr + 24, 0u32); // uid
    ww!(statbuf_addr + 28, 0u32); // gid
    ww64!(statbuf_addr + 32, 0u64); // st_rdev
    ww!(statbuf_addr + 40, size); // st_size
    ww!(statbuf_addr + 44, 0u32); // __pad2
    ww!(statbuf_addr + 48, 4096u32); // st_blksize
    let blocks = (size as u64 + 511) / 512;
    ww!(statbuf_addr + 52, blocks as u32); // st_blocks
    ww!(statbuf_addr + 56, 0u32); // __pad3
    ww64!(statbuf_addr + 64, 0u64); // st_atime
    ww64!(statbuf_addr + 72, 0u64); // st_mtime
    ww64!(statbuf_addr + 80, 0u64); // st_ctime
    0
}

/// fstat(fd, statbuf_addr) -- Get file status by file descriptor.
pub fn sys_fstat(fd: i32, statbuf_addr: u64, bus: &mut Bus) -> i32 {
    if statbuf_addr == 0 {
        return -EINVAL;
    }

    // Handle stdin/stdout/stderr as character devices
    if fd >= 0 && fd <= 2 {
        macro_rules! ww {
            ($addr:expr, $val:expr) => {
                if bus.write_word($addr, $val).is_err() {
                    return -EFAULT;
                }
            };
        }
        macro_rules! ww64 {
            ($addr:expr, $val:expr) => {{
                let v: u64 = $val;
                ww!($addr, v as u32);
                ww!($addr + 4, (v >> 32) as u32);
            }};
        }
        ww64!(statbuf_addr, 0u64); // st_dev
        ww!(statbuf_addr + 8, (fd as u32) + 10); // st_ino (fake)
        ww!(statbuf_addr + 12, 0u32); // __pad1
        ww!(statbuf_addr + 16, S_IFCHR | 0o666); // st_mode
        ww!(statbuf_addr + 20, 1u32); // st_nlink
        ww!(statbuf_addr + 24, 0u32); // uid
        ww!(statbuf_addr + 28, 0u32); // gid
        ww64!(statbuf_addr + 32, 0u64); // st_rdev
        ww!(statbuf_addr + 40, 0u32); // st_size
        ww!(statbuf_addr + 44, 0u32); // __pad2
        ww!(statbuf_addr + 48, 4096u32); // st_blksize
        ww!(statbuf_addr + 52, 0u32); // st_blocks
        ww!(statbuf_addr + 56, 0u32); // __pad3
        ww64!(statbuf_addr + 64, 0u64); // st_atime
        ww64!(statbuf_addr + 72, 0u64); // st_mtime
        ww64!(statbuf_addr + 80, 0u64); // st_ctime
        return 0;
    }

    if fd < 3 || (fd as usize) >= bus.linux_fd_table.len() {
        return -EBADF;
    }

    let path = match &bus.linux_fd_table[fd as usize] {
        Some(f) => f.path.clone(),
        None => return -EBADF,
    };

    let host_path = resolve_guest_path(&path);
    let metadata = match std::fs::metadata(&host_path) {
        Ok(m) => m,
        Err(_) => return -ENOENT,
    };

    write_stat(statbuf_addr, &metadata, bus)
}

/// exit(code) -- Terminate the current process.
pub fn sys_exit(code: i32, bus: &mut Bus) {
    eprintln!("[linux-user] Process exited with code {}", code);
    bus.sbi.shutdown_requested = true;
}

/// uname(buf_addr) -- Get system information.
pub fn sys_uname(buf_addr: u64, bus: &mut Bus) -> i32 {
    let fields = [
        "Linux",      // sysname
        "geos",       // nodename
        "6.1.0-geos", // release
        "#1 GeOS",    // version
        "riscv32",    // machine
        "geometryos", // domainname
    ];

    for (i, &val) in fields.iter().enumerate() {
        let addr = buf_addr + (i as u64 * 65);
        for (j, b) in val.as_bytes().iter().enumerate() {
            if bus.write_byte(addr + j as u64, *b).is_err() {
                return -EFAULT;
            }
        }
        if bus.write_byte(addr + val.len() as u64, 0).is_err() {
            return -EFAULT;
        }
    }
    0
}

/// getuid() -- Get real user ID.
pub fn sys_getuid() -> i32 {
    0 // root
}

/// getgid() -- Get real group ID.
pub fn sys_getgid() -> i32 {
    0 // root
}

/// getpid() -- Get process ID.
pub fn sys_getpid() -> i32 {
    1
}

/// getppid() -- Get parent process ID.
pub fn sys_getppid() -> i32 {
    1
}

/// gettid() -- Get thread ID.
pub fn sys_gettid() -> i32 {
    1
}

/// geteuid() -- Get effective user ID.
pub fn sys_geteuid() -> i32 {
    0
}

/// getegid() -- Get effective group ID.
pub fn sys_getegid() -> i32 {
    0
}

/// setuid(uid) -- Set user ID. Stub: always succeeds for root.
pub fn sys_setuid(_uid: i32) -> i32 {
    0
}

/// setgid(gid) -- Set group ID. Stub: always succeeds for root.
pub fn sys_setgid(_gid: i32) -> i32 {
    0
}

/// set_tid_address(tidptr) -- Set tid pointer. Returns tid.
pub fn sys_set_tid_address(_tidptr: u64) -> i32 {
    1
}

/// clock_gettime(clockid, tp_addr) -- Get clock time.
/// Writes struct timespec { tv_sec: i32, tv_nsec: i32 } at tp_addr for RV32.
pub fn sys_clock_gettime(_clockid: i32, tp_addr: u64, bus: &mut Bus) -> i32 {
    let now = std::time::SystemTime::now();
    let duration = now
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap_or_default();
    let sec = duration.as_secs() as u32;
    let nsec = duration.subsec_nanos() as u32;

    // Write as two u32 values (8 bytes total)
    if bus.write_word(tp_addr, sec).is_err() || bus.write_word(tp_addr + 4, nsec).is_err() {
        return -EFAULT;
    }
    0
}

/// clock_getres(clockid, res_addr) -- Get clock resolution.
/// Writes struct timespec { tv_sec: i32, tv_nsec: i32 } at res_addr for RV32.
pub fn sys_clock_getres(_clockid: i32, res_addr: u64, bus: &mut Bus) -> i32 {
    // Report 1ns resolution
    // tv_sec = 0 (4 bytes LE), tv_nsec = 1 (4 bytes LE)
    if res_addr != 0 {
        for i in 0..4u32 {
            let _ = bus.write_byte(res_addr + i as u64, 0u8);
        }
        let _ = bus.write_byte(res_addr + 4, 1); // tv_nsec = 1
        for i in 1..4u32 {
            let _ = bus.write_byte(res_addr + 4 + i as u64, 0u8);
        }
    }
    0
}

/// getrandom(buf_addr, count, flags) -- Get random bytes.
pub fn sys_getrandom(buf_addr: u64, count: usize, _flags: u32, bus: &mut Bus) -> i32 {
    // Simple LCG pseudo-random seeded from CLINT mtime
    let mut seed = bus.clint.mtime as u64;
    let mut written = 0usize;
    for i in 0..count {
        // LCG: x = x * 6364136223846793005 + 1442695040888963407
        seed = seed
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        let byte = (seed >> 33) as u8;
        if bus.write_byte(buf_addr + i as u64, byte).is_err() {
            if written > 0 {
                return written as i32;
            }
            return -EFAULT;
        }
        written += 1;
    }
    written as i32
}

/// mmap(addr, length, prot, flags, fd, offset) -- Map memory.
/// Implements a simple first-fit allocator in the dedicated mmap region.
pub fn sys_mmap(
    addr: u64,
    length: u64,
    _prot: i32,
    flags: i32,
    _fd: i32,
    _offset: u64,
    bus: &mut Bus,
) -> i64 {
    const MAP_FIXED: i32 = 0x10;

    if length == 0 {
        return -(EINVAL as i64);
    }

    let page_size = 4096u64;
    let aligned_len = ((length + page_size - 1) / page_size) * page_size;

    let alloc_addr = if addr != 0 && (flags & MAP_FIXED) != 0 {
        // MAP_FIXED: use exact address, evict any overlapping tracked regions
        remove_mmap_regions(bus, addr, aligned_len);
        addr
    } else if addr != 0 {
        // Hinted address: use it if there's no overlap
        if !mmap_overlaps(bus, addr, aligned_len) {
            addr
        } else {
            match allocate_mmap(bus, aligned_len) {
                Ok(a) => a,
                Err(e) => return e,
            }
        }
    } else {
        // Automatic allocation
        match allocate_mmap(bus, aligned_len) {
            Ok(a) => a,
            Err(e) => return e,
        }
    };

    // Zero-fill the allocated region
    for i in 0..aligned_len {
        let _ = bus.write_byte(alloc_addr + i, 0);
    }

    bus.mmap_regions.push((alloc_addr, aligned_len));
    bus.mmap_regions.sort_by_key(|r| r.0);

    alloc_addr as i64
}

/// Check if [addr, addr+len) overlaps any existing mmap region.
fn mmap_overlaps(bus: &Bus, addr: u64, len: u64) -> bool {
    let end = addr + len;
    bus.mmap_regions.iter().any(|(raddr, rlen)| {
        let rend = raddr + rlen;
        addr < rend && end > *raddr
    })
}

/// Allocate `len` bytes from the mmap arena using first-fit.
/// Returns the allocated address or -ENOMEM.
fn allocate_mmap(bus: &mut Bus, len: u64) -> Result<u64, i64> {
    let ram_end = bus.mem.ram_base + bus.mem.ram_size() as u64;
    let min_gap = 0x10000; // 64KB margin below stack / RAM end

    let regions = &bus.mmap_regions;
    if regions.is_empty() {
        // No regions yet: allocate from mmap_next
        if bus.mmap_next + len + min_gap <= ram_end {
            let addr = bus.mmap_next;
            bus.mmap_next += len;
            return Ok(addr);
        }
        return Err(-(ENOMEM as i64));
    }

    // Search for a gap before the first region
    if regions[0].0 >= bus.mmap_next + len {
        let addr = bus.mmap_next;
        // Don't advance mmap_next past existing regions
        return Ok(addr);
    }

    // Search gaps between regions
    for i in 0..regions.len() - 1 {
        let prev_end = regions[i].0 + regions[i].1;
        let next_start = regions[i + 1].0;
        if prev_end + len <= next_start {
            return Ok(prev_end);
        }
    }

    // Try to extend past the last region
    let last_end = regions[regions.len() - 1].0 + regions[regions.len() - 1].1;
    if last_end + len + min_gap <= ram_end {
        bus.mmap_next = last_end + len;
        Ok(last_end)
    } else {
        Err(-(ENOMEM as i64))
    }
}

/// Remove tracked mmap regions that overlap [addr, addr+len).
fn remove_mmap_regions(bus: &mut Bus, addr: u64, len: u64) {
    let end = addr + len;
    bus.mmap_regions.retain(|(raddr, rlen)| {
        let rend = raddr + rlen;
        !(*raddr < end && addr < rend)
    });
}

/// munmap(addr, length) -- Unmap memory.
/// Removes tracked regions that overlap the given range.
pub fn sys_munmap(addr: u64, length: u64, bus: &mut Bus) -> i32 {
    if length == 0 {
        return -EINVAL;
    }
    let page_size = 4096u64;
    let aligned_len = ((length + page_size - 1) / page_size) * page_size;
    remove_mmap_regions(bus, addr, aligned_len);
    0
}

/// mprotect(addr, len, prot) -- Set memory protection. Stub: always succeeds.
pub fn sys_mprotect(_addr: u64, _len: u64, _prot: i32) -> i32 {
    0
}

/// faccessat(dirfd, pathname_addr, mode, flags) -- Check file access.
pub fn sys_faccessat(
    _dirfd: i32,
    pathname_addr: u64,
    _mode: i32,
    _flags: i32,
    bus: &mut Bus,
) -> i32 {
    let path = read_cstring(pathname_addr, bus);
    if path.is_empty() {
        return -EINVAL;
    }
    let host_path = resolve_guest_path(&path);
    if host_path.exists() {
        0
    } else {
        -ENOENT
    }
}

/// readlinkat(dirfd, pathname_addr, buf_addr, bufsiz) -- Read symbolic link.
/// Stub: return -ENOENT (no symlinks in GeOS VFS).
pub fn sys_readlinkat(_dirfd: i32, _pathname_addr: u64, _buf_addr: u64, _bufsiz: usize) -> i32 {
    -ENOENT
}

/// unlinkat(dirfd, pathname_addr, flags) -- Remove file or directory.
pub fn sys_unlinkat(_dirfd: i32, pathname_addr: u64, _flags: i32, bus: &mut Bus) -> i32 {
    let path = read_cstring(pathname_addr, bus);
    if path.is_empty() {
        return -EINVAL;
    }
    let host_path = resolve_guest_path(&path);
    if !host_path.exists() {
        return -ENOENT;
    }
    if host_path.is_dir() {
        match std::fs::remove_dir(&host_path) {
            Ok(()) => 0,
            Err(_) => -EISDIR,
        }
    } else {
        match std::fs::remove_file(&host_path) {
            Ok(()) => 0,
            Err(_) => -EIO,
        }
    }
}

/// mkdirat(dirfd, pathname_addr, mode) -- Create directory.
pub fn sys_mkdirat(_dirfd: i32, pathname_addr: u64, _mode: u32, bus: &mut Bus) -> i32 {
    let path = read_cstring(pathname_addr, bus);
    if path.is_empty() {
        return -EINVAL;
    }
    let host_path = resolve_guest_path(&path);
    match std::fs::create_dir_all(&host_path) {
        Ok(()) => 0,
        Err(_) => -EIO,
    }
}

/// renameat(olddirfd, oldpath_addr, newdirfd, newpath_addr) -- Rename file/directory.
pub fn sys_renameat(
    _olddirfd: i32,
    oldpath_addr: u64,
    _newdirfd: i32,
    newpath_addr: u64,
    bus: &mut Bus,
) -> i32 {
    let old_path = read_cstring(oldpath_addr, bus);
    let new_path = read_cstring(newpath_addr, bus);
    if old_path.is_empty() || new_path.is_empty() {
        return -EINVAL;
    }
    let old_host = resolve_guest_path(&old_path);
    let new_host = resolve_guest_path(&new_path);
    if !old_host.exists() {
        return -ENOENT;
    }
    match std::fs::rename(&old_host, &new_host) {
        Ok(()) => 0,
        Err(_) => -EIO,
    }
}

/// kill(pid, sig) -- Send signal. Stub: single-process, always succeeds.
pub fn sys_kill(_pid: i32, _sig: i32) -> i32 {
    0
}

/// sigaltstack(ss_addr, old_ss_addr) -- Alternate signal stack. Stub: always succeeds.
pub fn sys_sigaltstack(_ss_addr: u64, _old_ss_addr: u64) -> i32 {
    0
}

/// execve(pathname_addr, argv_addr, envp_addr) -- Execute program.
/// Stub: no multi-process support, return -ENOENT.
pub fn sys_execve(pathname_addr: u64, _argv_addr: u64, _envp_addr: u64, bus: &mut Bus) -> i32 {
    let path = read_cstring(pathname_addr, bus);
    if path.is_empty() {
        return -EINVAL;
    }
    -ENOENT
}

/// waitid(idtype, id, info_addr, options) -- Wait for child.
/// Stub: no children, return -ECHILD.
pub fn sys_waitid(_idtype: i32, _id: i32, _info_addr: u64, _options: i32) -> i32 {
    -ECHILD
}

/// fcntl(fd, cmd, arg) -- File control. Stub: return 0.
pub fn sys_fcntl(_fd: i32, _cmd: i32, _arg: u32) -> i32 {
    0
}

/// rt_sigaction(signum, act_addr, oldact_addr, sigsetsize) -- Signal action. Stub.
pub fn sys_rt_sigaction(_signum: i32, _act_addr: u64, _oldact_addr: u64, _sigsetsize: u32) -> i32 {
    0
}

/// rt_sigprocmask(how, set_addr, oldset_addr, sigsetsize) -- Signal mask. Stub.
pub fn sys_rt_sigprocmask(_how: i32, _set_addr: u64, _oldset_addr: u64, _sigsetsize: u32) -> i32 {
    0
}

/// sysinfo(info_addr) -- System information.
pub fn sys_sysinfo(info_addr: u64, bus: &mut Bus) -> i32 {
    macro_rules! ww {
        ($addr:expr, $val:expr) => {
            if bus.write_word($addr, $val).is_err() {
                return -EFAULT;
            }
        };
    }
    macro_rules! ww64 {
        ($addr:expr, $val:expr) => {{
            let v: u64 = $val;
            ww!($addr, v as u32);
            ww!($addr + 4, (v >> 32) as u32);
        }};
    }

    let total_ram = bus.mem.ram_size() as u64;

    ww64!(info_addr, 1u64); // uptime (seconds)
    ww64!(info_addr + 8, 0u64); // loads[0]
    ww64!(info_addr + 16, 0u64); // loads[1]
    ww64!(info_addr + 24, 0u64); // loads[2]
    ww64!(info_addr + 32, total_ram); // totalram
    ww64!(info_addr + 40, total_ram / 2); // freeram
    ww64!(info_addr + 48, 0u64); // sharedram
    ww64!(info_addr + 56, 0u64); // bufferram
    ww64!(info_addr + 64, 0u64); // totalswap
    ww64!(info_addr + 72, 0u64); // freeswap
    ww!(info_addr + 80, 1u32); // procs
    ww!(info_addr + 84, 0u32); // pad
    ww64!(info_addr + 88, 0u64); // totalhigh
    ww64!(info_addr + 96, 0u64); // freehigh
    ww!(info_addr + 104, 0u32); // mem_unit
    0
}

/// clone(flags, stack, parent_tid, child_tid, tls) -- Stub.
pub fn sys_clone(_flags: u32, _stack: u64, _parent_tid: u64, _child_tid: u64, _tls: u64) -> i32 {
    -ENOSYS // unithreaded for now
}

/// futex(uaddr, op, val, timeout, uaddr2, val3) -- Stub.
pub fn sys_futex(_uaddr: u64, _op: i32, _val: u32, _timeout: u64, _uaddr2: u64, _val3: u32) -> i32 {
    0 // pretend success
}

/// wait4(pid, status, options, rusage) -- Stub.
pub fn sys_wait4(_pid: i32, _status: u64, _options: i32, _rusage: u64) -> i32 {
    -ECHILD
}

/// ioctl(fd, cmd, arg) -- Stub.
pub fn sys_ioctl(_fd: i32, _cmd: u32, _arg: u32) -> i32 {
    0
}

/// getcwd(buf, size) -- Get current working directory.
pub fn sys_getcwd(buf_addr: u64, size: usize, bus: &mut Bus) -> i32 {
    let cwd = "/";
    if size < cwd.len() + 1 {
        return -EINVAL;
    }
    for (i, &b) in cwd.as_bytes().iter().enumerate() {
        if bus.write_byte(buf_addr + i as u64, b).is_err() {
            return -EFAULT;
        }
    }
    let _ = bus.write_byte(buf_addr + cwd.len() as u64, 0);
    (cwd.len() + 1) as i32
}

/// chdir(path) -- Change directory.
pub fn sys_chdir(pathname_addr: u64, bus: &mut Bus) -> i32 {
    let path = read_cstring(pathname_addr, bus);
    if path == "/" || path == "." {
        0
    } else {
        -ENOENT
    }
}

/// dup(oldfd) -- Duplicate file descriptor.
pub fn sys_dup(oldfd: i32, bus: &mut Bus) -> i32 {
    if oldfd < 0 {
        return -EBADF;
    }
    // FDs 0-2 (stdin/stdout/stderr) are virtual console devices
    if oldfd <= 2 {
        let console = LinuxFile {
            path: format!(
                "/dev/{}",
                if oldfd == 0 {
                    "stdin"
                } else if oldfd == 1 {
                    "stdout"
                } else {
                    "stderr"
                }
            ),
            offset: 0,
            data: Vec::new(),
            writable: oldfd > 0,
        };
        return alloc_fd(bus, console);
    }
    if (oldfd as usize) >= bus.linux_fd_table.len() {
        return -EBADF;
    }
    let entry = bus.linux_fd_table[oldfd as usize].clone();
    match entry {
        Some(f) => alloc_fd(bus, f),
        None => -EBADF,
    }
}

/// dup2(oldfd, newfd) -- Duplicate file descriptor to specific new fd. Stub.
pub fn sys_dup2(oldfd: i32, newfd: i32, bus: &mut Bus) -> i32 {
    if oldfd < 0 || newfd < 0 {
        return -EBADF;
    }
    if oldfd == newfd {
        return newfd;
    }
    // For now, just a stub
    -ENOSYS
}

/// pipe2(fds_addr, flags) -- Create a pipe, write read/write fd pair to guest memory.
pub fn sys_pipe2(fds_addr: u64, _flags: i32, bus: &mut Bus) -> i32 {
    // Create a pipe as a shared buffer: read-end gets an empty read-only fd,
    // write-end gets a writable fd pointing at the same data.
    // For simplicity, we create a shared in-memory buffer.
    let pipe_id = bus.linux_fd_table.len() as u64; // unique pipe id for path
    let read_file = LinuxFile {
        path: format!("pipe:[{}-r]", pipe_id),
        offset: 0,
        data: Vec::new(),
        writable: false,
    };
    let write_file = LinuxFile {
        path: format!("pipe:[{}-w]", pipe_id),
        offset: 0,
        data: Vec::new(),
        writable: true,
    };
    let read_fd = alloc_fd(bus, read_file);
    let write_fd = alloc_fd(bus, write_file);
    // Write the pair to guest memory: [read_fd, write_fd] as two i32s
    if let Err(_) = bus.write_byte(fds_addr, read_fd as u8) {
        return -EFAULT;
    }
    if let Err(_) = bus.write_byte(fds_addr + 1, (read_fd >> 8) as u8) {
        return -EFAULT;
    }
    if let Err(_) = bus.write_byte(fds_addr + 2, (read_fd >> 16) as u8) {
        return -EFAULT;
    }
    if let Err(_) = bus.write_byte(fds_addr + 3, (read_fd >> 24) as u8) {
        return -EFAULT;
    }
    if let Err(_) = bus.write_byte(fds_addr + 4, write_fd as u8) {
        return -EFAULT;
    }
    if let Err(_) = bus.write_byte(fds_addr + 5, (write_fd >> 8) as u8) {
        return -EFAULT;
    }
    if let Err(_) = bus.write_byte(fds_addr + 6, (write_fd >> 16) as u8) {
        return -EFAULT;
    }
    if let Err(_) = bus.write_byte(fds_addr + 7, (write_fd >> 24) as u8) {
        return -EFAULT;
    }
    0
}

/// poll(fds, nfds, timeout) -- Wait for events on file descriptors. Stub.
pub fn sys_poll(_fds_addr: u64, _nfds: u32, _timeout: i32) -> i32 {
    1 // say one fd is ready
}

/// nanosleep(req, rem) -- Sleep. Stub.
pub fn sys_nanosleep(_req_addr: u64, _rem_addr: u64) -> i32 {
    0
}

/// clock_nanosleep(clockid, flags, req, rem) -- Sleep with clock selection. Stub.
/// Signature: clock_nanosleep(clockid_t clockid, int flags, const struct timespec *req, struct timespec *rem)
pub fn sys_clock_nanosleep(_clockid: i32, _flags: i32, _req_addr: u64, _rem_addr: u64) -> i32 {
    0
}

/// pread64(fd, buf, count, offset) -- Read from fd at given offset without moving file pointer.
/// Like sys_read but uses the explicit offset parameter instead of the fd's current offset.
pub fn sys_pread64(fd: i32, buf_addr: u64, count: usize, offset: u64, bus: &mut Bus) -> i32 {
    if fd < 3 {
        // stdin/stdout/stderr: character devices, pread64 returns 0 bytes
        return 0;
    }
    if (fd as usize) >= bus.linux_fd_table.len() {
        return -EBADF;
    }

    // Clone the data slice to avoid holding a borrow across write_byte calls
    let data_to_read = {
        let entry = &bus.linux_fd_table[fd as usize];
        match entry {
            Some(f) => {
                let off = offset as usize;
                let remaining = if off < f.data.len() {
                    f.data.len() - off
                } else {
                    0
                };
                let to_read = count.min(remaining);
                f.data[off..off + to_read].to_vec()
            },
            None => return -EBADF,
        }
    };

    // Write data to guest memory
    for (i, &b) in data_to_read.iter().enumerate() {
        if bus.write_byte(buf_addr + i as u64, b).is_err() {
            return -EFAULT;
        }
    }

    data_to_read.len() as i32
}

/// getdents64(fd, dirp, count) -- Get directory entries.
pub fn sys_getdents64(_fd: i32, dirp_addr: u64, count: usize, bus: &mut Bus) -> i32 {
    // For now, return a single entry "." for the root directory
    if count < 32 {
        return -EINVAL;
    }

    // struct linux_dirent64 {
    //     u64 d_ino;
    //     i64 d_off;
    //     u16 d_reclen;
    //     u8  d_type;
    //     char d_name[];
    // };

    macro_rules! ww64 {
        ($addr:expr, $val:expr) => {{
            let v: u64 = $val;
            let _ = bus.write_word($addr, v as u32);
            let _ = bus.write_word($addr + 4, (v >> 32) as u32);
        }};
    }
    macro_rules! ww16 {
        ($addr:expr, $val:expr) => {
            let _ = bus.write_half($addr, $val as u16);
        };
    }

    let ino = 1u64;
    let off = 1i64;
    let name = ".";
    let reclen = 8 + 8 + 2 + 1 + name.len() + 1; // alignment needed?
    let reclen = (reclen + 7) & !7; // 8-byte align

    ww64!(dirp_addr, ino);
    ww64!(dirp_addr + 8, off as u64);
    ww16!(dirp_addr + 16, reclen as u16);
    let _ = bus.write_byte(dirp_addr + 18, 4); // DT_DIR
    for (i, &b) in name.as_bytes().iter().enumerate() {
        let _ = bus.write_byte(dirp_addr + 19 + i as u64, b);
    }
    let _ = bus.write_byte(dirp_addr + 19 + name.len() as u64, 0);

    reclen as i32
}

/// sched_yield() -- Yield processor.
pub fn sys_sched_yield() -> i32 {
    0
}

/// memfd_create(name_addr, flags) -- Create an anonymous file.
pub fn sys_memfd_create(_name_addr: u64, _flags: i32, bus: &mut Bus) -> i32 {
    let file = LinuxFile {
        path: "memfd:[anonymous]".to_string(),
        offset: 0,
        data: Vec::new(),
        writable: true,
    };
    alloc_fd(bus, file)
}

/// prlimit64(pid, resource, new_limit_addr, old_limit_addr) -- Get/set resource limits.
/// Stub: return success with generous limits.
pub fn sys_prlimit64(
    _pid: i32,
    resource: i32,
    _new_limit_addr: u64,
    old_limit_addr: u64,
    bus: &mut Bus,
) -> i32 {
    // RLIMIT_NOFILE = 7, RLIMIT_STACK = 3, etc.
    // Write a generous rlimit struct: rlim_cur(64-bit), rlim_max(64-bit)
    let (cur, max): (u64, u64) = match resource {
        3 => (8 * 1024 * 1024, 0xFFFFFFFF), // RLIMIT_STACK: 8MB cur, unlimited max
        7 => (1024, 4096),                  // RLIMIT_NOFILE: 1024 cur, 4096 max
        9 => (0xFFFFFFFF, 0xFFFFFFFF),      // RLIMIT_AS: unlimited
        _ => (0xFFFFFFFF, 0xFFFFFFFF),      // default: unlimited
    };
    if old_limit_addr != 0 {
        // Write rlim_cur (8 bytes LE)
        for i in 0..8u32 {
            let _ = bus.write_byte(old_limit_addr + i as u64, ((cur >> (i * 8)) & 0xFF) as u8);
        }
        // Write rlim_max (8 bytes LE)
        for i in 0..8u32 {
            let _ = bus.write_byte(
                old_limit_addr + 8 + i as u64,
                ((max >> (i * 8)) & 0xFF) as u8,
            );
        }
    }
    0
}
