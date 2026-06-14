// Pixel-native clock_nanosleep syscall implementation
// clock_nanosleep: high-resolution sleep with clock selection

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native clock_nanosleep syscall
/// Linux syscall 115 (RV64)
/// int clock_nanosleep(clockid_t clk_id, int flags,
///                     const struct timespec *req, struct timespec *rem)
/// 
/// Sleeps for the specified duration using the specified clock.
/// For pixel-native: delegates to nanosleep for CLOCK_MONOTONIC/CLOCK_REALTIME.
pub fn syscall_clock_nanosleep_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let clk_id = cpu.x[10];       // a0: clock ID
    let flags = cpu.x[11] as i32; // a1: flags (TIMER_ABSTIME, etc.)
    let req_ptr = cpu.x[12];      // a2: requested sleep time
    let rem_ptr = cpu.x[13];      // a3: remaining time (if interrupted)
    
    // For simplicity, only support CLOCK_MONOTONIC (1) and CLOCK_REALTIME (0)
    // For other clocks, return EINVAL
    if clk_id != 0 && clk_id != 1 {
        cpu.x[10] = (-22i32) as u32; // EINVAL
        return Some(0);
    }
    
    // Delegation to nanosleep
    // Set up nanosleep arguments
    cpu.x[10] = req_ptr;
    cpu.x[11] = rem_ptr;
    
    // Call nanosleep syscall
    crate::riscv::pixel_native::nanosleep_syscall::syscall_nanosleep_pixel_native(cpu, bus)
}