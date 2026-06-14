use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

pub fn syscall_exit_group_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    super::exit_syscall::syscall_exit_pixel_native(cpu, bus)
}
