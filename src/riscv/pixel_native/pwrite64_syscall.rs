use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use super::write_syscall::syscall_write_pixel_native;
use super::lseek_syscall::syscall_lseek_pixel_native;

/// Pixel-native pwrite64 syscall (Linux syscall 68)
/// ssize_t pwrite64(int fd, const void *buf, size_t count, loff_t pos)
/// Write to file descriptor at given offset without changing position
pub fn syscall_pwrite64_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10];        // a0: file descriptor
    let buf = cpu.x[11];       // a1: buffer pointer
    let count = cpu.x[12];     // a2: byte count
    let pos = cpu.x[13];       // a3: offset

    // Save current position
    let save_a0 = cpu.x[10];
    let save_a1 = cpu.x[11];
    let save_a2 = cpu.x[12];

    // Seek to offset: lseek(fd, pos, SEEK_SET=0)
    cpu.x[10] = fd;
    cpu.x[11] = pos;
    cpu.x[12] = 0; // SEEK_SET
    let seek_result = syscall_lseek_pixel_native(cpu, bus);

    if seek_result.is_none() || (cpu.x[10] as i32) < 0 {
        cpu.x[10] = save_a0;
        cpu.x[11] = save_a1;
        cpu.x[12] = save_a2;
        return seek_result;
    }

    // Write: write(fd, buf, count)
    cpu.x[10] = fd;
    cpu.x[11] = buf;
    cpu.x[12] = count;
    let write_result = syscall_write_pixel_native(cpu, bus);

    // Restore registers
    cpu.x[10] = save_a0;
    cpu.x[11] = save_a1;
    cpu.x[12] = save_a2;

    write_result
}
