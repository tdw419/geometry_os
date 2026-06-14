use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

pub fn syscall_getegid_pixel_native(_cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    Some(0)
}
