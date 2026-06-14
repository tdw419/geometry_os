// Pixel-native socketpair syscall implementation
// socketpair: create a pair of connected sockets

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native socketpair syscall (Linux syscall 199)
pub fn syscall_socketpair_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0xFFFFFF9F) // -EAFNOSUPPORT (-97)
}
