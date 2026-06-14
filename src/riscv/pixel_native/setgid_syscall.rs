// Pixel-native setgid syscall implementation
// setgid: set group identity

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native setgid syscall (Linux syscall 144)
pub fn syscall_setgid_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
