// Pixel-native sigaltstack syscall implementation
// sigaltstack: set and/or get signal stack context

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native sigaltstack syscall (Linux syscall 132)
pub fn syscall_sigaltstack_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
