// Pixel-native setuid syscall implementation
// setuid: set user identity

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native setuid syscall (Linux syscall 146)
pub fn syscall_setuid_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
