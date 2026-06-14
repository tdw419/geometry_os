// Pixel-native mkdirat syscall implementation
// mkdirat: create a directory relative to a directory file descriptor

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native mkdirat syscall (Linux syscall 39)
/// int mkdirat(int dirfd, const char *pathname, mode_t mode)
pub fn syscall_mkdirat_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let dirfd = cpu.x[10] as i32;
    let pathname_ptr = cpu.x[11];
    let mode = cpu.x[12];

    if dirfd != -100 {
        // Only support AT_FDCWD (-100) for now
        return None;
    }

    cpu.x[10] = pathname_ptr;
    cpu.x[11] = mode;
    super::mkdir_syscall::syscall_mkdir_pixel_native(cpu, bus)
}
