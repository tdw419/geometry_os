// Pixel-native gettimeofday syscall implementation
// gettimeofday: get time of day

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native gettimeofday syscall (Linux syscall 169)
/// int gettimeofday(struct timeval *tv, struct timezone *tz)
pub fn syscall_gettimeofday_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let tv_ptr = cpu.x[10]; // a0: struct timeval *tv
    let tz_ptr = cpu.x[11]; // a1: struct timezone *tz

    if tv_ptr != 0 {
        let mtime_addr = 0x0200_BFF8u64;
        let mtime = bus.read_word(mtime_addr).unwrap_or(0) as u64;

        // Assume 10 MHz clock
        let clock_freq = 10_000_000u64;
        let total_us = (mtime * 1_000_000) / clock_freq;
        let secs = total_us / 1_000_000;
        let usecs = total_us % 1_000_000;

        let pa = match cpu.translate_va(tv_ptr, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Some(0xFFFFFFF2), // -EFAULT
        };

        if bus.write_word(pa, secs as u32).is_err() {
            return Some(0xFFFFFFF2);
        }
        if bus.write_word(pa + 4, usecs as u32).is_err() {
            return Some(0xFFFFFFF2);
        }
    }

    if tz_ptr != 0 {
        // Zero timezone struct
        let pa = match cpu.translate_va(tz_ptr, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Some(0xFFFFFFF2),
        };
        if bus.write_word(pa, 0).is_err() {
            return Some(0xFFFFFFF2);
        }
        if bus.write_word(pa + 4, 0).is_err() {
            return Some(0xFFFFFFF2);
        }
    }

    Some(0)
}
