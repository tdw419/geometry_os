// Pixel-native getrlimit syscall implementation
// getrlimit: get resource limits

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native getrlimit syscall (Linux syscall 163)
/// int getrlimit(int resource, struct rlimit *rlim)
pub fn syscall_getrlimit_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let rlim_ptr = cpu.x[11]; // a1: struct rlimit *rlim

    if rlim_ptr != 0 {
        let pa = match cpu.translate_va(rlim_ptr, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Some(0xFFFFFFF2), // -EFAULT
        };

        // Write infinite limits (RLIM_INFINITY = -1u32)
        if bus.write_word(pa, 0xFFFFFFFF).is_err() { return Some(0xFFFFFFF2); }
        if bus.write_word(pa + 4, 0xFFFFFFFF).is_err() { return Some(0xFFFFFFF2); }
    }

    Some(0)
}
