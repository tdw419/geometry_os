// Pixel-native sched_yield syscall implementation
// sched_yield: yield the processor

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native sched_yield syscall (Linux syscall 124)
pub fn syscall_sched_yield_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
