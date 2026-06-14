// Pixel-native setrlimit syscall implementation
// setrlimit: set resource limits

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native setrlimit syscall (Linux syscall 164)
pub fn syscall_setrlimit_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
