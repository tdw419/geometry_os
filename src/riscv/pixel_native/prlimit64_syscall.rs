// Pixel-native prlimit64 syscall implementation
// prlimit64: get/set resource limits

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native prlimit64 syscall (Linux syscall 261)
/// int prlimit64(pid_t pid, int resource, const struct rlimit64 *new_limit, struct rlimit64 *old_limit)
pub fn syscall_prlimit64_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let old_limit_ptr = cpu.x[13]; // a3: struct rlimit64 *old_limit

    if old_limit_ptr != 0 {
        let pa = match cpu.translate_va(old_limit_ptr, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Some(0xFFFFFFF2), // -EFAULT
        };

        // Write infinite limits: rlim_cur = RLIM64_INFINITY (u64::MAX), rlim_max = RLIM64_INFINITY
        // RLIM64_INFINITY is 0xFFFFFFFFFFFFFFFFu64 (two 32-bit words of 0xFFFFFFFF)
        if bus.write_word(pa, 0xFFFFFFFF).is_err() { return Some(0xFFFFFFF2); }
        if bus.write_word(pa + 4, 0xFFFFFFFF).is_err() { return Some(0xFFFFFFF2); }
        if bus.write_word(pa + 8, 0xFFFFFFFF).is_err() { return Some(0xFFFFFFF2); }
        if bus.write_word(pa + 12, 0xFFFFFFFF).is_err() { return Some(0xFFFFFFF2); }
    }

    Some(0)
}
