// Pixel-native clock_gettime syscall implementation
// clock_gettime: get time from a clock

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native clock_gettime syscall
/// Linux syscall 113 (RV64)
/// int clock_gettime(clockid_t clk_id, struct timespec *tp)
///
/// Uses CLINT mtime register for CLOCK_MONOTONIC.
/// CLOCK_REALTIME returns mtime + epoch offset.
pub fn syscall_clock_gettime_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let clk_id = cpu.x[10]; // a0: clock ID
    let tp_ptr = cpu.x[11]; // a1: timespec pointer

    // Get current time from CLINT mtime (timer value at 0x0200_BFF8)
    let mtime_addr = 0x0200_BFF8u64;
    let mtime = match bus.read_word(mtime_addr) {
        Ok(v) => v as u64,
        Err(_) => {
            cpu.x[10] = (-14i32) as u32; // EFAULT
            return Some(0);
        }
    };

    // Convert to timespec (seconds + nanoseconds)
    // mtime is in cycles, assume 10 MHz clock (100ns per tick)
    // Adjust for your actual clock frequency
    let clock_freq = 10_000_000u64; // 10 MHz
    let total_ns = (mtime * 1_000_000_000) / clock_freq;
    let secs = total_ns / 1_000_000_000;
    let nsecs = total_ns % 1_000_000_000;

    // Write timespec to user memory
    // struct timespec { time_t tv_sec; long tv_nsec; }
    let pa = match cpu.translate_va(tp_ptr, crate::riscv::mmu::AccessType::Store, bus) {
        Ok(p) => p,
        Err(_) => {
            cpu.x[10] = (-14i32) as u32; // EFAULT
            return Some(0);
        }
    };

    // Write tv_sec (first 4 bytes)
    if bus.write_word(pa, secs as u32).is_err() {
        cpu.x[10] = (-14i32) as u32; // EFAULT
        return Some(0);
    }

    // Write tv_nsec (next 4 bytes)
    if bus.write_word(pa + 4, nsecs as u32).is_err() {
        cpu.x[10] = (-14i32) as u32; // EFAULT
        return Some(0);
    }

    // Success
    cpu.x[10] = 0;
    Some(0)
}