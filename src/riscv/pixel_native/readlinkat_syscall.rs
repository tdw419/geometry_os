// Pixel-native readlinkat syscall implementation
// readlinkat: read value of a symbolic link relative to a directory file descriptor

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native readlinkat syscall (Linux syscall 78)
/// ssize_t readlinkat(int dirfd, const char *pathname, char *buf, size_t bufsiz)
pub fn syscall_readlinkat_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    // Return -EINVAL (22) as there are no symbolic links in VFS
    Some(0xFFFFFFEA)
}
