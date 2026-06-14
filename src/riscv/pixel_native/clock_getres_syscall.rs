// Pixel-native clock_getres syscall implementation
// clock_getres: get resolution of a clock

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native clock_getres syscall (Linux syscall 114)
/// int clock_getres(clockid_t clk_id, struct timespec *res)
pub fn syscall_clock_getres_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let res_ptr = cpu.x[11]; // a1: struct timespec *res

    if res_ptr != 0 {
        let pa = match cpu.translate_va(res_ptr, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Some(0xFFFFFFF2), // -EFAULT
        };

        // Write 1ns resolution: tv_sec = 0, tv_nsec = 1
        if bus.write_word(pa, 0).is_err() {
            return Some(0xFFFFFFF2);
        }
        if bus.write_word(pa + 4, 1).is_err() {
            return Some(0xFFFFFFF2);
        }
    }

    Some(0)
}
