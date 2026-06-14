// Pixel-native renameat syscall implementation
// renameat: rename a file relative to directory file descriptors

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native renameat syscall (Linux syscall 38)
/// int renameat(int olddirfd, const char *oldpath, int newdirfd, const char *newpath)
pub fn syscall_renameat_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    // Set flag argument to 0 and call renameat2
    cpu.x[14] = 0; // a4: flags = 0
    super::renameat2_syscall::syscall_renameat2_pixel_native(cpu, bus)
}
