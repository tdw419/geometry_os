// Pixel-native unlinkat syscall implementation
// unlinkat: remove a directory entry

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native unlinkat syscall (Linux syscall 35)
/// int unlinkat(int dirfd, const char *pathname, int flags)
pub fn syscall_unlinkat_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let _dirfd = cpu.x[10] as i32;
    let pathname_ptr = cpu.x[11];
    let flags = cpu.x[12] as i32;

    // AT_REMOVEDIR is 0x200. If set, perform rmdir, else perform unlink.
    if (flags & 0x200) != 0 {
        cpu.x[10] = pathname_ptr;
        super::rmdir_syscall::syscall_rmdir_pixel_native(cpu, bus)
    } else {
        cpu.x[10] = pathname_ptr;
        super::unlink_syscall::syscall_unlink_pixel_native(cpu, bus)
    }
}
