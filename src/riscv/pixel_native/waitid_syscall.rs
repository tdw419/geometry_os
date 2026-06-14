// Pixel-native waitid syscall implementation
// waitid: wait for process to change state

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native waitid syscall (Linux syscall 95)
pub fn syscall_waitid_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
