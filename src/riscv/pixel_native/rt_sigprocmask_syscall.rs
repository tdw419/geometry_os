// Pixel-native rt_sigprocmask syscall implementation
// rt_sigprocmask: examine and change blocked signals

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native rt_sigprocmask syscall (Linux syscall 135)
/// int rt_sigprocmask(int how, const sigset_t *set, sigset_t *oldset, size_t sigsetsize)
pub fn syscall_rt_sigprocmask_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
