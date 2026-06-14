// Pixel-native rt_sigaction syscall implementation
// rt_sigaction: examine and change a signal action

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native rt_sigaction syscall (Linux syscall 134)
/// int rt_sigaction(int signum, const struct sigaction *act, struct sigaction *oldact, size_t sigsetsize)
pub fn syscall_rt_sigaction_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
