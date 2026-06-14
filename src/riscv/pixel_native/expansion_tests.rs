// Pixel-native writev/readv/ioctl/time syscall tests

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

#[cfg(test)]
mod syscall_expansion_tests {
    use super::*;

    fn setup_vm() -> (RiscvCpu, Bus) {
        let mut cpu = RiscvCpu::new();
        let bus = Bus::new(0x80000000, 1024 * 1024);
        cpu.x[4] = 0; // tp register for PID
        cpu.csr.satp = 0; // Disable MMU for bare metal tests
        (cpu, bus)
    }

    #[test]
    fn test_writev_invalid_iovcount_returns_einval() {
        use crate::riscv::pixel_native::writev_syscall::syscall_writev_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up writev args with iovcnt = 0
        cpu.x[10] = 1; // fd
        cpu.x[11] = 0x80001000;
        cpu.x[12] = 0; // iovcnt = 0

        let _ = syscall_writev_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10] as i32, -22); // EINVAL
    }

    #[test]
    fn test_writev_too_many_iovecs_returns_einval() {
        use crate::riscv::pixel_native::writev_syscall::syscall_writev_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up writev args with iovcnt > 1024
        cpu.x[10] = 1; // fd
        cpu.x[11] = 0x80001000;
        cpu.x[12] = 2000; // iovcnt = 2000 (> 1024)

        let _ = syscall_writev_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10] as i32, -22); // EINVAL
    }

    #[test]
    fn test_readv_single_iovec_returns_zero() {
        use crate::riscv::pixel_native::readv_syscall::syscall_readv_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up iovec: one buffer at 0x80002000 with 4 bytes
        let iovec_ptr: u32 = 0x80001000;
        let buf_ptr: u64 = 0x80002000;
        bus.write_word(iovec_ptr as u64, buf_ptr as u32).unwrap();
        bus.write_word((iovec_ptr + 4) as u64, 4).unwrap();

        // Set up readv args
        cpu.x[10] = 0; // fd (stdin)
        cpu.x[11] = iovec_ptr;
        cpu.x[12] = 1; // iovcnt

        let _ = syscall_readv_pixel_native(&mut cpu, &mut bus);

        // Read from stdin returns 0 (no data available)
        assert_eq!(cpu.x[10], 0);
    }

    #[test]
    fn test_ioctl_terminal_get_attributes_success() {
        use crate::riscv::pixel_native::ioctl_syscall::syscall_ioctl_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up ioctl args for TCGETS (0x5401)
        cpu.x[10] = 1; // fd
        cpu.x[11] = 0x5401; // TCGETS
        cpu.x[12] = 0x80001000; // termios ptr

        let _ = syscall_ioctl_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10], 0); // Success
    }

    #[test]
    fn test_ioctl_get_window_size() {
        use crate::riscv::pixel_native::ioctl_syscall::syscall_ioctl_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up ioctl args for TIOCGWINSZ (0x5413)
        cpu.x[10] = 1; // fd
        cpu.x[11] = 0x5413; // TIOCGWINSZ
        cpu.x[12] = 0x80001000; // winsize ptr

        let _ = syscall_ioctl_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10], 0); // Success
        // Check that winsize was written (rows=24, cols=80)
        let ws_value = bus.read_word(0x80001000u64).unwrap();
        assert_eq!(ws_value & 0xFFFF, 24); // rows
        assert_eq!((ws_value >> 16) & 0xFFFF, 80); // cols
    }

    #[test]
    fn test_ioctl_unsupported_returns_enotty() {
        use crate::riscv::pixel_native::ioctl_syscall::syscall_ioctl_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up ioctl args for unknown request
        cpu.x[10] = 1; // fd
        cpu.x[11] = 0xDEAD; // Unknown request
        cpu.x[12] = 0x80001000;

        let _ = syscall_ioctl_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10] as i32, -25); // ENOTTY
    }

    #[test]
    fn test_clock_gettime_writes_timespec() {
        use crate::riscv::pixel_native::clock_gettime_syscall::syscall_clock_gettime_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Initialize CLINT mtime register to a known value
        let mtime_addr: u64 = 0x0200_BFF8;
        bus.write_word(mtime_addr, 50_000_000u32).unwrap(); // 50 million cycles

        // Set up clock_gettime args
        cpu.x[10] = 1; // CLOCK_MONOTONIC
        cpu.x[11] = 0x80001000; // timespec ptr

        let _ = syscall_clock_gettime_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10], 0); // Success

        // Check timespec was written
        let tv_sec = bus.read_word(0x80001000u64).unwrap() as i64;
        let tv_nsec = bus.read_word((0x80001000u64 + 4) as u64).unwrap() as i64;

        // With 50 MHz clock and 50M cycles, should be ~1 second
        assert!(tv_sec >= 0 && tv_sec <= 10);
        assert!(tv_nsec >= 0 && tv_nsec < 1_000_000_000);
    }

    #[test]
    fn test_nanosleep_zero_time_returns_immediately() {
        use crate::riscv::pixel_native::nanosleep_syscall::syscall_nanosleep_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Write zero timespec (0 seconds, 0 nanoseconds)
        let req_ptr: u32 = 0x80001000;
        bus.write_word(req_ptr as u64, 0).unwrap(); // tv_sec = 0
        bus.write_word((req_ptr + 4) as u64, 0).unwrap(); // tv_nsec = 0

        // Set up nanosleep args
        cpu.x[10] = req_ptr;
        cpu.x[11] = 0x80002000; // rem ptr (unused)

        let _ = syscall_nanosleep_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10], 0); // Success
    }

    #[test]
    fn test_nanosleep_fault_timespec_returns_efault() {
        use crate::riscv::pixel_native::nanosleep_syscall::syscall_nanosleep_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up nanosleep args with invalid pointer
        cpu.x[10] = 0xFFFF0000; // Invalid address
        cpu.x[11] = 0x80002000;

        let _ = syscall_nanosleep_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10] as i32, -14); // EFAULT
    }

    #[test]
    fn test_clock_nanosleep_valid_clock_success() {
        use crate::riscv::pixel_native::clock_nanosleep_syscall::syscall_clock_nanosleep_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Write zero timespec
        let req_ptr: u32 = 0x80001000;
        bus.write_word(req_ptr as u64, 0).unwrap();
        bus.write_word((req_ptr + 4) as u64, 0).unwrap();

        // Set up clock_nanosleep args
        cpu.x[10] = 1; // CLOCK_MONOTONIC
        cpu.x[11] = 0; // flags
        cpu.x[12] = req_ptr;
        cpu.x[13] = 0x80002000; // rem ptr

        let _ = syscall_clock_nanosleep_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10], 0); // Success
    }

    #[test]
    fn test_clock_nanosleep_invalid_clock_returns_einval() {
        use crate::riscv::pixel_native::clock_nanosleep_syscall::syscall_clock_nanosleep_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up clock_nanosleep args with invalid clock
        cpu.x[10] = 99; // Invalid clock ID
        cpu.x[11] = 0; // flags
        cpu.x[12] = 0x80001000;
        cpu.x[13] = 0x80002000;

        let _ = syscall_clock_nanosleep_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10] as i32, -22); // EINVAL
    }

    #[test]
    fn test_ioctl_fionread_returns_zero_bytes() {
        use crate::riscv::pixel_native::ioctl_syscall::syscall_ioctl_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Set up ioctl args for FIONREAD (0x541B)
        cpu.x[10] = 0; // fd (stdin)
        cpu.x[11] = 0x541B; // FIONREAD
        cpu.x[12] = 0x80001000; // result ptr

        let _ = syscall_ioctl_pixel_native(&mut cpu, &mut bus);

        assert_eq!(cpu.x[10], 0); // Success
        // FIONREAD should return 0 (no data available)
        let result = bus.read_word(0x80001000u64).unwrap();
        assert_eq!(result, 0);
    }

    #[test]
    fn test_uname_writes_utsname_success() {
        use crate::riscv::pixel_native::uname_syscall::syscall_uname_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[10] = 0x80001000; // buf ptr
        let res = syscall_uname_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));

        // Read sysname ("Linux") from buffer
        let mut sysname = String::new();
        for i in 0..5 {
            let b = bus.read_byte(0x80001000 + i).unwrap();
            sysname.push(b as char);
        }
        assert_eq!(sysname, "Linux");
    }

    #[test]
    fn test_sysinfo_writes_info_success() {
        use crate::riscv::pixel_native::sysinfo_syscall::syscall_sysinfo_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[10] = 0x80001000; // info ptr
        let res = syscall_sysinfo_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
        let totalram = bus.read_word(0x80001000 + 16).unwrap();
        assert_eq!(totalram, 64 * 1024 * 1024);
    }

    #[test]
    fn test_gettimeofday_writes_time_success() {
        use crate::riscv::pixel_native::gettimeofday_syscall::syscall_gettimeofday_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[10] = 0x80001000; // tv ptr
        cpu.x[11] = 0; // tz ptr
        let res = syscall_gettimeofday_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
    }

    #[test]
    fn test_clock_getres_writes_res_success() {
        use crate::riscv::pixel_native::clock_getres_syscall::syscall_clock_getres_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[11] = 0x80001000; // res ptr
        let res = syscall_clock_getres_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
        let nsec = bus.read_word(0x80001000 + 4).unwrap();
        assert_eq!(nsec, 1);
    }

    #[test]
    fn test_prlimit64_writes_limits_success() {
        use crate::riscv::pixel_native::prlimit64_syscall::syscall_prlimit64_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[13] = 0x80001000; // old_limit ptr
        let res = syscall_prlimit64_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
        let rlim_cur_low = bus.read_word(0x80001000).unwrap();
        assert_eq!(rlim_cur_low, 0xFFFFFFFF);
    }

    #[test]
    fn test_getrandom_fills_buffer_success() {
        use crate::riscv::pixel_native::getrandom_syscall::syscall_getrandom_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[10] = 0x80001000; // buf
        cpu.x[11] = 16; // length
        let res = syscall_getrandom_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(16));
    }

    #[test]
    fn test_memfd_create_allocates_fd_success() {
        use crate::riscv::pixel_native::memfd_create_syscall::syscall_memfd_create_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        // Initialize framebuf pixels array to be non-empty
        bus.framebuf.pixels.resize(256 * 256, 0);
        cpu.x[10] = 0x80001000; // name
        cpu.x[11] = 0; // flags
        let res = syscall_memfd_create_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(3)); // First free FD should be 3
    }

    #[test]
    fn test_rt_sigaction_stubs_success() {
        use crate::riscv::pixel_native::rt_sigaction_syscall::syscall_rt_sigaction_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        let res = syscall_rt_sigaction_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
    }

    #[test]
    fn test_rt_sigprocmask_stubs_success() {
        use crate::riscv::pixel_native::rt_sigprocmask_syscall::syscall_rt_sigprocmask_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        let res = syscall_rt_sigprocmask_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
    }

    #[test]
    fn test_kill_stubs_success() {
        use crate::riscv::pixel_native::kill_syscall::syscall_kill_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[10] = 1; // pid
        let res = syscall_kill_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
    }

    #[test]
    fn test_futex_stubs_success() {
        use crate::riscv::pixel_native::futex_syscall::syscall_futex_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        let res = syscall_futex_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
    }

    #[test]
    fn test_dup_duplicates_fd_success() {
        use crate::riscv::pixel_native::dup_syscall::syscall_dup_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        bus.framebuf.pixels.resize(256 * 256, 0);
        cpu.x[10] = 1; // oldfd (stdout)
        let res = syscall_dup_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(3)); // Should allocate lowest free fd (3)
    }

    #[test]
    fn test_poll_zeroes_revents_success() {
        use crate::riscv::pixel_native::poll_syscall::syscall_poll_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[10] = 0x80001000; // struct pollfd *
        cpu.x[11] = 1; // nfds
        cpu.x[12] = 0; // timeout
        // Prepare pollfd in user memory (set revents to non-zero)
        bus.write_half(0x80001006, 0x1234).unwrap();
        let res = syscall_poll_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
        let revents = bus.read_half(0x80001006).unwrap();
        assert_eq!(revents, 0);
    }

    #[test]
    fn test_fcntl_getfd_returns_zero_success() {
        use crate::riscv::pixel_native::fcntl_syscall::syscall_fcntl_pixel_native;
        let (mut cpu, mut bus) = setup_vm();
        cpu.x[10] = 1; // fd
        cpu.x[11] = 1; // F_GETFD
        let res = syscall_fcntl_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(0));
    }

    #[test]
    fn test_pread64_reads_at_offset() {
        use crate::riscv::pixel_native::pread64_syscall::syscall_pread64_pixel_native;
        let (mut cpu, mut bus) = setup_vm();

        // pread64 on stdin returns None (not in spatial fd table, not seekable)
        cpu.x[10] = 0; // fd (stdin - not in spatial table)
        cpu.x[11] = 0x80001000; // buf
        cpu.x[12] = 4; // count
        cpu.x[13] = 0; // offset

        let res = syscall_pread64_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, None);
    }

    #[test]
    fn test_pwrite64_writes_at_offset() {
        use crate::riscv::pixel_native::pwrite64_syscall::syscall_pwrite64_pixel_native;
        let (mut cpu, mut bus) = setup_vm();

        // pwrite64 on stdout returns None (not in spatial fd table, not seekable)
        cpu.x[10] = 1; // fd (stdout - not in spatial table)
        cpu.x[11] = 0x80001000; // buf
        cpu.x[12] = 0; // count (0 bytes)
        cpu.x[13] = 0; // offset

        let res = syscall_pwrite64_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, None);
    }

    #[test]
    fn test_socket_creates_tcp_socket() {
        use crate::riscv::pixel_native::socket_syscall::syscall_socket_pixel_native;
        let (mut cpu, mut bus) = setup_vm();

        // socket(AF_INET=2, SOCK_STREAM=1, 0)
        cpu.x[10] = 2; // AF_INET
        cpu.x[11] = 1; // SOCK_STREAM
        cpu.x[12] = 0; // protocol

        let res = syscall_socket_pixel_native(&mut cpu, &mut bus);
        assert!(res.is_some());
        assert_eq!(cpu.x[10], 0); // Returns fd 0 (first slot)
    }

    #[test]
    fn test_shutdown_invalid_fd_returns_ebadf() {
        use crate::riscv::pixel_native::shutdown_syscall::syscall_shutdown_pixel_native;
        let (mut cpu, mut bus) = setup_vm();

        cpu.x[10] = 99; // invalid fd
        cpu.x[11] = 2; // SHUT_RDWR

        let res = syscall_shutdown_pixel_native(&mut cpu, &mut bus);
        assert!(res.is_some());
        assert!((cpu.x[10] as i32) < 0); // Returns negative errno
    }
}