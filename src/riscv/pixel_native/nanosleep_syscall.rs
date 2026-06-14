// Pixel-native nanosleep syscall implementation
// nanosleep: high-resolution sleep

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native nanosleep syscall
/// Linux syscall 101 (common), 35 (RV64)
/// int nanosleep(const struct timespec *req, struct timespec *rem)
///
/// Sleeps for the specified duration using busy-wait loop.
/// For pixel-native: simple busy-wait based on CLINT mtime.
pub fn syscall_nanosleep_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let req_ptr = cpu.x[10]; // a0: requested sleep time
    let rem_ptr = cpu.x[11]; // a1: remaining time (if interrupted)

    // Read requested sleep time from user memory
    let pa = match cpu.translate_va(req_ptr, crate::riscv::mmu::AccessType::Load, bus) {
        Ok(p) => p,
        Err(_) => {
            cpu.x[10] = (-14i32) as u32; // EFAULT
            return Some(0);
        }
    };

    let req_secs = match bus.read_word(pa) {
        Ok(v) => v as u64,
        Err(_) => {
            cpu.x[10] = (-14i32) as u32; // EFAULT
            return Some(0);
        }
    };
    let req_nsecs = match bus.read_word(pa + 4) {
        Ok(v) => v as u64,
        Err(_) => {
            cpu.x[10] = (-14i32) as u32; // EFAULT
            return Some(0);
        }
    };

    // Convert to nanoseconds
    let total_ns = req_secs * 1_000_000_000 + req_nsecs;

    if total_ns == 0 {
        cpu.x[10] = 0; // Success, no sleep needed
        return Some(0);
    }

    // Get start time
    let mtime_addr = 0x0200_BFF8u64;
    let start_time = match bus.read_word(mtime_addr) {
        Ok(v) => v as u64,
        Err(_) => {
            cpu.x[10] = (-14i32) as u32; // EFAULT
            return Some(0);
        }
    };

    // Convert requested sleep to cycles (assuming 10 MHz clock)
    let clock_freq = 10_000_000u64;
    let sleep_cycles = (total_ns * clock_freq) / 1_000_000_000;

    // Busy-wait loop
    // NOTE: In a real implementation, this would use timer interrupts
    // For pixel-native, we do a simple busy-wait
    loop {
        let current = match bus.read_word(mtime_addr) {
            Ok(v) => v as u64,
            Err(_) => {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                return Some(0);
            }
        };
        let elapsed = current.wrapping_sub(start_time);

        if elapsed >= sleep_cycles {
            break;
        }

        // Safety: prevent infinite loop
        if elapsed > 0xFFFFFFFFu64 {
            break; // Timer wrapped, assume done
        }
    }

    // No signal interruption in our implementation, so rem is zero
    cpu.x[10] = 0; // Success
    Some(0)
}