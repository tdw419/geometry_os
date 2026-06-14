use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use super::read_syscall::syscall_read_pixel_native;
use super::lseek_syscall::syscall_lseek_pixel_native;

/// Pixel-native pread64 syscall (Linux syscall 67)
/// ssize_t pread64(int fd, void *buf, size_t count, loff_t pos)
/// Read from file descriptor at given offset without changing position
pub fn syscall_pread64_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
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

    // Read: read(fd, buf, count)
    cpu.x[10] = fd;
    cpu.x[11] = buf;
    cpu.x[12] = count;
    let read_result = syscall_read_pixel_native(cpu, bus);

    // Restore registers
    cpu.x[10] = save_a0;
    cpu.x[11] = save_a1;
    cpu.x[12] = save_a2;

    read_result
}
