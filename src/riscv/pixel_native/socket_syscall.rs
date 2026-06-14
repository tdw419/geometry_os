// Pixel-native socket syscall implementation
// socket: create an endpoint for communication

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native socket syscall (Linux syscall 198)
/// int socket(int domain, int type, int protocol)
pub fn syscall_socket_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let domain = cpu.x[10];     // a0: domain
    let sock_type = cpu.x[11];  // a1: type
    let protocol = cpu.x[12];   // a2: protocol

    let ret = bus.guest_sockets.sys_socket(domain, sock_type, protocol);
    cpu.x[10] = ret as u32;
    Some(ret as u32)
}
