// Pixel-native kill syscall implementation
// kill: send signal to a process

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native kill syscall (Linux syscall 129)
/// int kill(pid_t pid, int sig)
pub fn syscall_kill_pixel_native(cpu: &mut RiscvCpu, _bus: &mut Bus) -> Option<u32> {
    let pid = cpu.x[10] as i32;

    if pid == 1 || pid == 0 || pid == -1 {
        Some(0)
    } else {
        Some(0xFFFFFFFD) // -ESRCH (-3)
    }
}
