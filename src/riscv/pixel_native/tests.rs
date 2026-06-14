// Tests for pixel-native syscall implementations
// Verifies mkdir, rmdir, chdir, getcwd, and other file/directory operations

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

#[cfg(test)]
mod pixel_native_tests {
    use super::*;

    fn setup_vm() -> (RiscvCpu, Bus) {
        let mut cpu = RiscvCpu::new();
        let bus = Bus::new(0x80000000, 1024 * 1024);
        cpu.x[4] = 0; // tp register for PID
        cpu.csr.satp = 0; // Disable MMU for bare metal tests
        (cpu, bus)
    }

    fn write_string_to_user_memory(
        cpu: &mut RiscvCpu,
        bus: &mut Bus,
        addr: u32,
        s: &str,
    ) -> Result<(), ()> {
        for (i, byte) in s.as_bytes().iter().enumerate() {
            let pa =
                cpu.translate_va(addr + i as u32, crate::riscv::mmu::AccessType::Store, bus)
                    .map_err(|_| ())?;
            bus.write_byte(pa, *byte).map_err(|_| ())?;
        }
        let null_pa = cpu
            .translate_va(
                addr + s.len() as u32,
                crate::riscv::mmu::AccessType::Store,
                bus,
            )
            .map_err(|_| ())?;
        bus.write_byte(null_pa, 0).map_err(|_| ())?;
        Ok(())
    }

    #[test]
    fn test_mkdir_syscall_creates_directory() {
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let pathname_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "testdir").unwrap();
        cpu.x[10] = pathname_ptr;
        cpu.x[11] = 0o755;

        let result = syscall_mkdir_pixel_native(&mut cpu, &mut bus);
        assert_eq!(result, Some(0));

        // Verify directory was created by looking it up
        let inode = crate::riscv::pixel_native::mkdir_syscall::lookup_file_in_vfs(&bus, "testdir");
        assert!(inode.is_some(), "testdir should be found in VFS");
    }

    #[test]
    fn test_mkdir_syscall_fails_on_existing_directory() {
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let pathname_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "testdir").unwrap();
        cpu.x[10] = pathname_ptr;
        cpu.x[11] = 0o755;

        // First mkdir should succeed
        let result1 = syscall_mkdir_pixel_native(&mut cpu, &mut bus);
        assert_eq!(result1, Some(0));

        // Second mkdir should fail
        let result2 = syscall_mkdir_pixel_native(&mut cpu, &mut bus);
        assert_eq!(
            result2,
            None,
            "mkdir should fail if directory already exists"
        );
    }

    #[test]
    fn test_rmdir_syscall_removes_directory() {
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;
        use crate::riscv::pixel_native::rmdir_syscall::syscall_rmdir_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let pathname_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "testdir").unwrap();
        cpu.x[10] = pathname_ptr;
        cpu.x[11] = 0o755;

        // Create directory
        let create_result = syscall_mkdir_pixel_native(&mut cpu, &mut bus);
        assert_eq!(create_result, Some(0));

        // Remove directory
        let remove_result = syscall_rmdir_pixel_native(&mut cpu, &mut bus);
        assert_eq!(
            remove_result,
            Some(0),
            "rmdir should return 0 on success"
        );

        // Verify directory was removed (lookup should fail after rmdir)
        let inode = crate::riscv::pixel_native::mkdir_syscall::lookup_file_in_vfs(&bus, "testdir");
        assert!(inode.is_none(), "testdir should not be found after rmdir");
    }

    #[test]
    fn test_chdir_syscall_updates_cwd() {
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;
        use crate::riscv::pixel_native::chdir_syscall::syscall_chdir_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let pathname_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "testdir").unwrap();
        cpu.x[10] = pathname_ptr;
        cpu.x[11] = 0o755;

        // Create directory first
        let create_result = syscall_mkdir_pixel_native(&mut cpu, &mut bus);
        assert_eq!(create_result, Some(0));

        // Get the inode that was allocated
        let inode = crate::riscv::pixel_native::mkdir_syscall::lookup_file_in_vfs(&bus, "testdir")
            .expect("testdir should exist");

        // Change to directory
        let chdir_result = syscall_chdir_pixel_native(&mut cpu, &mut bus);
        assert_eq!(chdir_result, Some(0), "chdir should return 0 on success");

        // Verify cwd_inode was set in process table
        let process_base = 0x80000000u64; // Process 0
        let cwd_pixel_offset = (process_base - 0x80000000 + 4) as u64; // Pixel 1
        let (x, y) = crate::pixel::d2xy(8, cwd_pixel_offset as u32 % (256 * 256));
        let pixel_idx = (y * 256 + x) as usize;
        assert!(pixel_idx < bus.framebuf.pixels.len());
        let pixel = bus.framebuf.pixels[pixel_idx];
        let inode_low = pixel & 0xFFFF;
        let inode_high = (pixel >> 16) & 0xFFFF;
        let cwd_inode = (inode_low | (inode_high << 16)) & 0x00FFFFFF; // Mask out alpha channel
        assert_eq!(cwd_inode, inode as u32, "cwd_inode should match allocated inode");
    }

    #[test]
    fn test_getcwd_syscall_returns_current_directory() {
        use crate::riscv::pixel_native::chdir_syscall::{
            syscall_chdir_pixel_native, syscall_getcwd_pixel_native,
        };
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let pathname_ptr = 0x80001000;
        let buf_ptr = 0x80002000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "testdir").unwrap();
        cpu.x[10] = pathname_ptr;
        cpu.x[11] = 0o755;

        // Create and change to directory
        assert_eq!(syscall_mkdir_pixel_native(&mut cpu, &mut bus), Some(0));
        assert_eq!(syscall_chdir_pixel_native(&mut cpu, &mut bus), Some(0));

        // Get current directory
        cpu.x[10] = buf_ptr;
        cpu.x[11] = 256; // buffer size
        let getcwd_result = syscall_getcwd_pixel_native(&mut cpu, &mut bus);
        assert_eq!(
            getcwd_result,
            Some(buf_ptr),
            "getcwd should return buffer pointer"
        );

        // Read back the directory name from user memory
        let mut read_buf = Vec::new();
        let mut current_addr = buf_ptr;
        loop {
            let pa = cpu
                .translate_va(current_addr, crate::riscv::mmu::AccessType::Load, &mut bus)
                .unwrap();
            let byte = bus.read_byte(pa).unwrap();
            if byte == 0 {
                break;
            }
            read_buf.push(byte);
            current_addr += 1;
        }
        let cwd = String::from_utf8(read_buf).unwrap();
        assert_eq!(cwd, "testdir", "getcwd should return 'testdir'");
    }

    #[test]
    fn test_dispatch_syscall_mkdir() {
        use crate::riscv::pixel_native::integration::dispatch_syscall_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Test Linux syscall 83 (mkdir)
        let pathname_ptr1 = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr1, "newdir_linux").unwrap();
        cpu.x[10] = pathname_ptr1;
        cpu.x[11] = 0o755;
        let result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 83);
        assert_eq!(
            result,
            Some(0),
            "Linux syscall 83 (mkdir) should dispatch correctly"
        );

        // Test xv6 syscall 20 (mkdir)
        let pathname_ptr2 = 0x80002000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr2, "newdir_xv6").unwrap();
        cpu.x[10] = pathname_ptr2;
        cpu.x[11] = 0o755;
        let result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 20);
        assert_eq!(
            result,
            Some(0),
            "xv6 syscall 20 (mkdir) should dispatch correctly"
        );
    }

    #[test]
    fn test_dispatch_syscall_rmdir() {
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;
        use crate::riscv::pixel_native::integration::dispatch_syscall_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let pathname_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "tmpdir").unwrap();
        cpu.x[10] = pathname_ptr;
        cpu.x[11] = 0o755;

        // Create directory first
        assert_eq!(syscall_mkdir_pixel_native(&mut cpu, &mut bus), Some(0));

        // Test Linux syscall 84 (rmdir)
        let result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 84);
        assert_eq!(
            result,
            Some(0),
            "Linux syscall 84 (rmdir) should dispatch correctly"
        );

        // Test xv6 syscall 30 (rmdir)
        cpu.x[10] = pathname_ptr;
        assert_eq!(syscall_mkdir_pixel_native(&mut cpu, &mut bus), Some(0));
        let result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 30);
        assert_eq!(
            result,
            Some(0),
            "xv6 syscall 30 (rmdir) should dispatch correctly"
        );
    }

    #[test]
    fn test_dispatch_syscall_chdir() {
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;
        use crate::riscv::pixel_native::integration::dispatch_syscall_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let pathname_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "workdir").unwrap();
        cpu.x[10] = pathname_ptr;
        cpu.x[11] = 0o755;

        // Create directory first
        assert_eq!(syscall_mkdir_pixel_native(&mut cpu, &mut bus), Some(0));

        // Test Linux syscall 49 (chdir)
        let result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 49);
        assert_eq!(
            result,
            Some(0),
            "Linux syscall 49 (chdir) should dispatch correctly"
        );

        // Test xv6 syscall 13 (chdir)
        let pathname_ptr_2 = 0x80001800;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr_2, "workdir_xv6").unwrap();
        cpu.x[10] = pathname_ptr_2;
        cpu.x[11] = 0o755;
        assert_eq!(syscall_mkdir_pixel_native(&mut cpu, &mut bus), Some(0));
        let result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 13);
        assert_eq!(
            result,
            Some(0),
            "xv6 syscall 13 (chdir) should dispatch correctly"
        );
    }

    #[test]
    fn test_dispatch_syscall_getcwd() {
        use crate::riscv::pixel_native::chdir_syscall::{
            syscall_chdir_pixel_native, syscall_getcwd_pixel_native,
        };
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;
        use crate::riscv::pixel_native::integration::dispatch_syscall_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let pathname_ptr = 0x80001000;
        let buf_ptr = 0x80002000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "homedir").unwrap();
        cpu.x[10] = pathname_ptr;
        cpu.x[11] = 0o755;

        // Create and change to directory
        assert_eq!(syscall_mkdir_pixel_native(&mut cpu, &mut bus), Some(0));
        assert_eq!(syscall_chdir_pixel_native(&mut cpu, &mut bus), Some(0));

        // Test Linux syscall 17 (getcwd)
        cpu.x[10] = buf_ptr;
        cpu.x[11] = 256;
        let result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 17);
        assert_eq!(
            result,
            Some(buf_ptr),
            "Linux syscall 17 (getcwd) should dispatch correctly"
        );
    }

    #[test]
    fn test_multiple_directories() {
        use crate::riscv::pixel_native::mkdir_syscall::syscall_mkdir_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Create multiple directories
        for i in 1..=5 {
            let pathname_ptr = 0x80001000 + i * 100;
            let dir_name = format!("dir{}", i);
            write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, &dir_name).unwrap();
            cpu.x[10] = pathname_ptr;
            cpu.x[11] = 0o755;
            let result = syscall_mkdir_pixel_native(&mut cpu, &mut bus);
            assert_eq!(
                result,
                Some(0),
                "mkdir for {} should succeed",
                dir_name
            );
        }

        // Verify at least 5 directories were created
        let mut created_count = 0;
        for col in 1..=5u64 {
            let pixel_offset = (col * 256 + 0) * 4;
            let vfs_idx = pixel_offset as usize / 4;
            if vfs_idx < bus.vfs_surface.pixels.len() {
                let pixel = bus.vfs_surface.pixels[vfs_idx];
                if pixel != 0 && pixel != 0xFF000000 {
                    created_count += 1;
                }
            }
        }
        assert!(
            created_count >= 5,
            "Should have created at least 5 directories, got {}",
            created_count
        );
    }

    #[test]
    fn test_file_write_and_read_pixel_native() {
        use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;
        use crate::riscv::pixel_native::write_syscall::syscall_write_pixel_native;
        use crate::riscv::pixel_native::read_syscall::syscall_read_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        bus.pixel_native_enabled = true;

        // 1. Create and open a file "testwrite.txt"
        let pathname_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "testwrite.txt").unwrap();
        cpu.x[10] = 0xffffff9c; // AT_FDCWD
        cpu.x[11] = pathname_ptr;
        cpu.x[12] = 0x40 | 0x02; // O_CREAT | O_RDWR
        cpu.x[13] = 0o644;

        let fd_res = syscall_openat_pixel_native(&mut cpu, &mut bus);
        assert!(fd_res.is_some());
        let fd = fd_res.unwrap();

        // 2. Write data to the file
        let write_buf_ptr = 0x80002000;
        let test_data = "Hello, Geometry OS!";
        write_string_to_user_memory(&mut cpu, &mut bus, write_buf_ptr, test_data).unwrap();

        cpu.x[10] = fd as u32;
        cpu.x[11] = write_buf_ptr;
        cpu.x[12] = test_data.len() as u32;
        let write_res = syscall_write_pixel_native(&mut cpu, &mut bus);
        assert_eq!(write_res, Some(test_data.len() as u32));

        // 3. Reset fd offset to 0 manually for reading, or open it again
        let entry_offset = fd * 64;
        let table_offset = entry_offset as u64;
        let new_px2 = 0xFF000000; // Offset = 0
        let pixel_offset = table_offset + 2 * 4;
        let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
        let idx = (y * 256 + x) as usize;
        bus.framebuf.pixels[idx] = new_px2;

        // 4. Read data back
        let read_buf_ptr = 0x80003000;
        cpu.x[10] = fd as u32;
        cpu.x[11] = read_buf_ptr;
        cpu.x[12] = test_data.len() as u32;
        let read_res = syscall_read_pixel_native(&mut cpu, &mut bus);
        assert_eq!(read_res, Some(test_data.len() as u32));

        // Read back the string from user memory and verify
        let mut read_buf = Vec::new();
        for i in 0..test_data.len() {
            let pa = cpu.translate_va(read_buf_ptr + i as u32, crate::riscv::mmu::AccessType::Load, &mut bus).unwrap();
            read_buf.push(bus.read_byte(pa).unwrap());
        }
        let read_str = String::from_utf8(read_buf).unwrap();
        assert_eq!(read_str, test_data);
    }

    #[test]
    fn test_faccessat_pixel_native() {
        use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;
        use crate::riscv::pixel_native::faccessat_syscall::syscall_faccessat_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        bus.pixel_native_enabled = true;

        // 1. Check access on non-existent file -> should return -ENOENT
        let pathname_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "nonexistent_access.txt").unwrap();
        cpu.x[10] = 0xffffff9c; // AT_FDCWD
        cpu.x[11] = pathname_ptr;
        cpu.x[12] = 0; // F_OK
        cpu.x[13] = 0;
        let res = syscall_faccessat_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res, Some(!2u32 + 1));

        // 2. Create the file
        cpu.x[12] = 0x40 | 0x02; // O_CREAT | O_RDWR
        cpu.x[13] = 0o644;
        let fd_res = syscall_openat_pixel_native(&mut cpu, &mut bus);
        assert!(fd_res.is_some());

        // 3. Check access again -> should return 0 (success)
        cpu.x[10] = 0xffffff9c; // AT_FDCWD
        cpu.x[11] = pathname_ptr;
        cpu.x[12] = 0; // F_OK
        cpu.x[13] = 0;
        let res2 = syscall_faccessat_pixel_native(&mut cpu, &mut bus);
        assert_eq!(res2, Some(0));
    }

    #[test]
    fn test_renameat2_pixel_native() {
        use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;
        use crate::riscv::pixel_native::renameat2_syscall::syscall_renameat2_pixel_native;
        use crate::riscv::pixel_native::faccessat_syscall::syscall_faccessat_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        bus.pixel_native_enabled = true;

        // 1. Create file "source.txt"
        let oldpath_ptr = 0x80001000;
        write_string_to_user_memory(&mut cpu, &mut bus, oldpath_ptr, "source.txt").unwrap();
        cpu.x[10] = 0xffffff9c; // AT_FDCWD
        cpu.x[11] = oldpath_ptr;
        cpu.x[12] = 0x40 | 0x02; // O_CREAT | O_RDWR
        cpu.x[13] = 0o644;
        let fd_res = syscall_openat_pixel_native(&mut cpu, &mut bus);
        assert!(fd_res.is_some());

        // 2. Rename "source.txt" to "dest.txt"
        let newpath_ptr = 0x80002000;
        write_string_to_user_memory(&mut cpu, &mut bus, newpath_ptr, "dest.txt").unwrap();
        cpu.x[10] = 0xffffff9c; // olddirfd
        cpu.x[11] = oldpath_ptr;
        cpu.x[12] = 0xffffff9c; // newdirfd
        cpu.x[13] = newpath_ptr;
        cpu.x[14] = 0; // flags
        let rename_res = syscall_renameat2_pixel_native(&mut cpu, &mut bus);
        assert_eq!(rename_res, Some(0));

        // 3. Verify old file is not accessible, and new file is accessible
        cpu.x[10] = 0xffffff9c;
        cpu.x[11] = oldpath_ptr;
        cpu.x[12] = 0;
        cpu.x[13] = 0;
        let access_old = syscall_faccessat_pixel_native(&mut cpu, &mut bus);
        assert_eq!(access_old, Some(!2u32 + 1));

        cpu.x[11] = newpath_ptr;
        let access_new = syscall_faccessat_pixel_native(&mut cpu, &mut bus);
        assert_eq!(access_new, Some(0));
    }

    #[test]
    fn test_process_info_syscalls() {
        use crate::riscv::pixel_native::getppid_syscall::syscall_getppid_pixel_native;
        use crate::riscv::pixel_native::getuid_syscall::syscall_getuid_pixel_native;
        use crate::riscv::pixel_native::geteuid_syscall::syscall_geteuid_pixel_native;
        use crate::riscv::pixel_native::getgid_syscall::syscall_getgid_pixel_native;
        use crate::riscv::pixel_native::getegid_syscall::syscall_getegid_pixel_native;
        use crate::riscv::pixel_native::gettid_syscall::syscall_gettid_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        assert_eq!(syscall_getppid_pixel_native(&mut cpu, &mut bus), Some(1));
        assert_eq!(syscall_getuid_pixel_native(&mut cpu, &mut bus), Some(0));
        assert_eq!(syscall_geteuid_pixel_native(&mut cpu, &mut bus), Some(0));
        assert_eq!(syscall_getgid_pixel_native(&mut cpu, &mut bus), Some(0));
        assert_eq!(syscall_getegid_pixel_native(&mut cpu, &mut bus), Some(0));
        assert_eq!(syscall_gettid_pixel_native(&mut cpu, &mut bus), Some(1));
    }

    #[test]
    fn test_passthrough_stub_syscalls() {
        use crate::riscv::pixel_native::set_tid_address_syscall::syscall_set_tid_address_pixel_native;
        use crate::riscv::pixel_native::mprotect_syscall::syscall_mprotect_pixel_native;
        use crate::riscv::pixel_native::madvise_syscall::syscall_madvise_pixel_native;
        use crate::riscv::pixel_native::umask_syscall::syscall_umask_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        assert_eq!(syscall_set_tid_address_pixel_native(&mut cpu, &mut bus), Some(1));
        assert_eq!(syscall_mprotect_pixel_native(&mut cpu, &mut bus), Some(0));
        assert_eq!(syscall_madvise_pixel_native(&mut cpu, &mut bus), Some(0));
        assert_eq!(syscall_umask_pixel_native(&mut cpu, &mut bus), Some(0o022));
    }

    #[test]
    fn test_fstat_standard_fds() {
        use crate::riscv::pixel_native::fstat_syscall::syscall_fstat_pixel_native;

        let (mut cpu, mut bus) = setup_vm();
        let statbuf_ptr = 0x80002000;

        // fstat on stdin (fd=0) should succeed as character device
        cpu.x[10] = 0; // fd = stdin
        cpu.x[11] = statbuf_ptr;
        let result = syscall_fstat_pixel_native(&mut cpu, &mut bus);
        assert_eq!(result, Some(0), "fstat on stdin should succeed");

        // fstat on stdout (fd=1) should succeed
        cpu.x[10] = 1;
        cpu.x[11] = statbuf_ptr;
        let result = syscall_fstat_pixel_native(&mut cpu, &mut bus);
        assert_eq!(result, Some(0), "fstat on stdout should succeed");

        // fstat on stderr (fd=2) should succeed
        cpu.x[10] = 2;
        cpu.x[11] = statbuf_ptr;
        let result = syscall_fstat_pixel_native(&mut cpu, &mut bus);
        assert_eq!(result, Some(0), "fstat on stderr should succeed");
    }

    #[test]
    fn test_dispatch_new_syscalls() {
        use crate::riscv::pixel_native::integration::dispatch_syscall_pixel_native;

        let (mut cpu, mut bus) = setup_vm();

        // Process info via dispatcher
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 173), Some(1),  "getppid");
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 174), Some(0),  "getuid");
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 175), Some(0),  "geteuid");
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 176), Some(0),  "getgid");
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 177), Some(0),  "getegid");
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 178), Some(1),  "gettid");

        // Passthrough stubs via dispatcher
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 96),  Some(1),    "set_tid_address");
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 166), Some(0o022), "umask");
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 226), Some(0),    "mprotect");
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 233), Some(0),    "madvise");

        // fstat on stdin via dispatcher (syscall 80)
        cpu.x[10] = 0; // stdin
        cpu.x[11] = 0x80002000;
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 80), Some(0), "fstat(80)");

        // fstat on stdin via dispatcher (syscall 44)
        cpu.x[10] = 0;
        cpu.x[11] = 0x80002000;
        assert_eq!(dispatch_syscall_pixel_native(&mut cpu, &mut bus, 44), Some(0), "fstat(44)");
    }
}