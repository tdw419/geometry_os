/// wait syscall - wait for child process to change state
///
/// xv6/Linux syscall: pid_t wait(int *wstatus)
/// In our single-process model, there are no children to wait for.
/// Returns -1 (ECHILD) since no child processes exist.
///
/// xv6 syscall: 6
/// Linux syscall: 260
pub fn syscall_wait_pixel_native(cpu: &mut crate::riscv::cpu::RiscvCpu, bus: &mut crate::riscv::bus::Bus) -> Option<u32> {
    // wstatus_ptr is in a0 (cpu.x[10])
    // In single-process model (PID=1), there are no children
    // Return ECHILD (-10 in errno.h, but we return -1 as error)

    // Optionally write to wstatus pointer if provided
    let wstatus_ptr = cpu.x[10];
    if wstatus_ptr != 0 {
        // Write 0 to status (no child state change)
        let pa = match cpu.translate_va(
            wstatus_ptr,
            crate::riscv::mmu::AccessType::Store,
            bus,
        ) {
            Ok(p) => p,
            Err(_) => return Some(0xFFFFFFFFu32), // Invalid pointer -> error
        };

        // Write exit status 0 as little-endian 32-bit
        for i in 0..4 {
            let byte_pa = pa + i as u64;
            let _ = bus.write_byte(byte_pa, 0);
        }
    }

    // Return -1 to indicate no child processes (ECHILD error)
    // In 32-bit signed, -1 is 0xFFFFFFFF
    Some(0xFFFFFFFFu32)
}