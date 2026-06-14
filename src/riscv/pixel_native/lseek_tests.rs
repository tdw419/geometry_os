// Tests for lseek pixel-native syscall
use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

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
        let pa = cpu
            .translate_va(addr + i as u32, crate::riscv::mmu::AccessType::Store, bus)
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

/// Helper function to set file size in VFS surface for testing lseek
/// Bypasses the write syscall limitation
fn set_file_size_for_testing(bus: &mut Bus, fd: u32, size: u32) -> Option<()> {
    if fd < 3 || fd >= 1024 {
        return None;
    }

    // Read inode from fd table (same logic as lseek_syscall)
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

    // Update file size in VFS header pixel
    let sr = inode as usize;
    if sr >= 256 || sr == 0 {
        return None;
    }

    // Update file size in header (upper 16 bits)
    // Preserve existing flags and nh
    let header_idx = sr * 256;
    if header_idx < bus.vfs_surface.pixels.len() {
        let old_header = bus.vfs_surface.pixels[header_idx];
        let nh = (old_header >> 8) & 0xFF;
        let flags = old_header & 0xFF;
        bus.vfs_surface.pixels[header_idx] = ((size & 0xFFFF) << 16) | (nh << 8) | flags;
        Some(())
    } else {
        None
    }
}

/// Read a pixel from the spatial fd table via Hilbert coordinates
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

#[test]
fn test_lseek_seek_set() {
    use crate::riscv::pixel_native::lseek_syscall::syscall_lseek_pixel_native;
    use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;

    let (mut cpu, mut bus) = setup_vm();

    // Create a file
    let pathname_ptr = 0x80001000;
    write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "test_lseek.txt").unwrap();
    cpu.x[10] = -100i32 as u32; // AT_FDCWD
    cpu.x[11] = pathname_ptr;
    cpu.x[12] = 0x40 | 0x2; // O_CREAT | O_WRONLY
    cpu.x[13] = 0o644;

    let fd = syscall_openat_pixel_native(&mut cpu, &mut bus).unwrap();
    assert!(fd >= 3);

    // Set a test file size (simulating that data was written)
    set_file_size_for_testing(&mut bus, fd, 10).unwrap();

    // Test SEEK_SET to offset 5
    cpu.x[10] = fd;
    cpu.x[11] = 5; // Seek to offset 5
    cpu.x[12] = 0; // SEEK_SET
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(result, Some(5), "lseek(SEEK_SET, 5) should return 5");

    // Close the file
    cpu.x[10] = fd;
    use crate::riscv::pixel_native::close_syscall::syscall_close_pixel_native;
    syscall_close_pixel_native(&mut cpu, &mut bus).unwrap();
}

#[test]
fn test_lseek_seek_cur() {
    use crate::riscv::pixel_native::lseek_syscall::syscall_lseek_pixel_native;
    use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;

    let (mut cpu, mut bus) = setup_vm();

    // Create a file
    let pathname_ptr = 0x80001000;
    write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "test_lseek_cur.txt").unwrap();
    cpu.x[10] = -100i32 as u32; // AT_FDCWD
    cpu.x[11] = pathname_ptr;
    cpu.x[12] = 0x40 | 0x2; // O_CREAT | O_WRONLY
    cpu.x[13] = 0o644;

    let fd = syscall_openat_pixel_native(&mut cpu, &mut bus).unwrap();
    assert!(fd >= 3);

    // Set a test file size
    set_file_size_for_testing(&mut bus, fd, 10).unwrap();

    // Seek to beginning with SEEK_SET
    cpu.x[10] = fd;
    cpu.x[11] = 0;
    cpu.x[12] = 0; // SEEK_SET
    syscall_lseek_pixel_native(&mut cpu, &mut bus).unwrap();

    // Test SEEK_CUR + 3 (should move from 0 to 3)
    cpu.x[10] = fd;
    cpu.x[11] = 3; // Move forward 3 bytes
    cpu.x[12] = 1; // SEEK_CUR
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(
        result,
        Some(3),
        "lseek(SEEK_CUR, +3) from 0 should return 3"
    );

    // Test SEEK_CUR + 2 (should move from 3 to 5)
    cpu.x[10] = fd;
    cpu.x[11] = 2; // Move forward 2 bytes
    cpu.x[12] = 1; // SEEK_CUR
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(
        result,
        Some(5),
        "lseek(SEEK_CUR, +2) from 3 should return 5"
    );

    // Close the file
    cpu.x[10] = fd;
    use crate::riscv::pixel_native::close_syscall::syscall_close_pixel_native;
    syscall_close_pixel_native(&mut cpu, &mut bus).unwrap();
}

#[test]
fn test_lseek_seek_end() {
    use crate::riscv::pixel_native::lseek_syscall::syscall_lseek_pixel_native;
    use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;

    let (mut cpu, mut bus) = setup_vm();

    // Create a file
    let pathname_ptr = 0x80001000;
    write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "test_lseek_end.txt").unwrap();
    cpu.x[10] = -100i32 as u32; // AT_FDCWD
    cpu.x[11] = pathname_ptr;
    cpu.x[12] = 0x40 | 0x2; // O_CREAT | O_WRONLY
    cpu.x[13] = 0o644;

    let fd = syscall_openat_pixel_native(&mut cpu, &mut bus).unwrap();
    assert!(fd >= 3);

    // Set file size to 20 bytes
    set_file_size_for_testing(&mut bus, fd, 20).unwrap();

    // Test SEEK_END - 5 (should move to offset 15)
    cpu.x[10] = fd;
    cpu.x[11] = (-5i32) as u32; // Seek back 5 bytes from EOF
    cpu.x[12] = 2; // SEEK_END
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(result, Some(15), "lseek(SEEK_END, -5) should return 15");

    // Test SEEK_END - 20 (should move to offset 0)
    cpu.x[10] = fd;
    cpu.x[11] = (-20i32) as u32; // Seek back to beginning
    cpu.x[12] = 2; // SEEK_END
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(result, Some(0), "lseek(SEEK_END, -20) should return 0");

    // Test SEEK_END + 0 (should move to offset 20)
    cpu.x[10] = fd;
    cpu.x[11] = 0; // Seek to EOF
    cpu.x[12] = 2; // SEEK_END
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(result, Some(20), "lseek(SEEK_END, 0) should return 20");

    // Close the file
    cpu.x[10] = fd;
    use crate::riscv::pixel_native::close_syscall::syscall_close_pixel_native;
    syscall_close_pixel_native(&mut cpu, &mut bus).unwrap();
}

#[test]
fn test_lseek_invalid_fd() {
    use crate::riscv::pixel_native::lseek_syscall::syscall_lseek_pixel_native;

    let (mut cpu, mut bus) = setup_vm();

    // Try to seek on an invalid fd
    cpu.x[10] = 999; // Invalid fd
    cpu.x[11] = 0;
    cpu.x[12] = 0; // SEEK_SET
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(result, None, "lseek on invalid fd should return None");
}

#[test]
fn test_lseek_negative_offset_rejected() {
    use crate::riscv::pixel_native::lseek_syscall::syscall_lseek_pixel_native;
    use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;

    let (mut cpu, mut bus) = setup_vm();

    // Create a file
    let pathname_ptr = 0x80001000;
    write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "test_lseek_neg.txt").unwrap();
    cpu.x[10] = -100i32 as u32; // AT_FDCWD
    cpu.x[11] = pathname_ptr;
    cpu.x[12] = 0x40 | 0x2; // O_CREAT | O_WRONLY
    cpu.x[13] = 0o644;

    let fd = syscall_openat_pixel_native(&mut cpu, &mut bus).unwrap();

    // Try SEEK_SET with negative offset
    cpu.x[10] = fd;
    cpu.x[11] = (-1i32) as u32; // Invalid: negative
    cpu.x[12] = 0; // SEEK_SET
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(result, None, "lseek(SEEK_SET, -1) should return None");

    // Close the file
    cpu.x[10] = fd;
    use crate::riscv::pixel_native::close_syscall::syscall_close_pixel_native;
    syscall_close_pixel_native(&mut cpu, &mut bus).unwrap();
}

#[test]
fn test_lseek_invalid_whence() {
    use crate::riscv::pixel_native::lseek_syscall::syscall_lseek_pixel_native;
    use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;

    let (mut cpu, mut bus) = setup_vm();

    // Create a file
    let pathname_ptr = 0x80001000;
    write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "test_lseek_whence.txt").unwrap();
    cpu.x[10] = -100i32 as u32; // AT_FDCWD
    cpu.x[11] = pathname_ptr;
    cpu.x[12] = 0x40 | 0x2; // O_CREAT | O_WRONLY
    cpu.x[13] = 0o644;

    let fd = syscall_openat_pixel_native(&mut cpu, &mut bus).unwrap();

    // Try invalid whence value
    cpu.x[10] = fd;
    cpu.x[11] = 0;
    cpu.x[12] = 99; // Invalid whence
    let result = syscall_lseek_pixel_native(&mut cpu, &mut bus);
    assert_eq!(
        result,
        None,
        "lseek with invalid whence should return None"
    );

    // Close the file
    cpu.x[10] = fd;
    use crate::riscv::pixel_native::close_syscall::syscall_close_pixel_native;
    syscall_close_pixel_native(&mut cpu, &mut bus).unwrap();
}

#[test]
fn test_lseek_dispatch_integration() {
    use crate::riscv::pixel_native::integration::dispatch_syscall_pixel_native;
    use crate::riscv::pixel_native::openat_syscall::syscall_openat_pixel_native;

    let (mut cpu, mut bus) = setup_vm();

    // Create a file via dispatch (openat = 56)
    let pathname_ptr = 0x80001000;
    write_string_to_user_memory(&mut cpu, &mut bus, pathname_ptr, "test_dispatch_lseek.txt")
        .unwrap();
    cpu.x[10] = -100i32 as u32;
    cpu.x[11] = pathname_ptr;
    cpu.x[12] = 0x40 | 0x2;
    cpu.x[13] = 0o644;

    let fd = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 56).unwrap();
    assert!(fd >= 3);

    // Set a test file size
    set_file_size_for_testing(&mut bus, fd, 5).unwrap();

    // Test lseek via dispatch (lseek = 62)
    cpu.x[10] = fd;
    cpu.x[11] = 2;
    cpu.x[12] = 0; // SEEK_SET
    let result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 62);
    assert_eq!(result, Some(2), "Dispatched lseek should return 2");

    // Close via dispatch (close = 57)
    cpu.x[10] = fd;
    let close_result = dispatch_syscall_pixel_native(&mut cpu, &mut bus, 57);
    assert_eq!(close_result, Some(0));
}