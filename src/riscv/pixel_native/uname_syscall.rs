// Pixel-native uname syscall implementation
// uname: get system identification

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native uname syscall (Linux syscall 160)
/// int uname(struct utsname *buf)
pub fn syscall_uname_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let buf_ptr = cpu.x[10]; // a0: struct utsname *buf

    let sysname = "Linux\0";
    let nodename = "geos\0";
    let release = "6.1.0-geos\0";
    let version = "geometry_os\0";
    let machine = "riscv\0";
    let domainname = "localdomain\0";

    let fields = [sysname, nodename, release, version, machine, domainname];

    for (i, field) in fields.iter().enumerate() {
        let field_ptr = buf_ptr + (i as u32 * 65);
        for (j, &byte) in field.as_bytes().iter().enumerate() {
            let pa = match cpu.translate_va(field_ptr + j as u32, AccessType::Store, bus) {
                Ok(p) => p,
                Err(_) => return Some(0xFFFFFFF2), // -EFAULT (-14)
            };
            if bus.write_byte(pa, byte).is_err() {
                return Some(0xFFFFFFF2); // -EFAULT
            }
        }
    }

    Some(0)
}
