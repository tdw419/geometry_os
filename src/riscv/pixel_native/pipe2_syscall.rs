// Pixel-native pipe2() syscall replacement (SYS_pipe2 = 59 in RISC-V Linux)
// Direct spatial path for pipe creation - enables shell pipelines (cat file | grep pattern)
//
// Design:
// - Spatial fd table: 0x80010000+ (1024 entries × 64 bytes)
// - Pipe buffer region: 0x80020000+ (for pipe data storage)
// - Entry format: fd(1 byte) | flags(1 byte) | pipe_id(4 bytes) | offset(4 bytes) | reserved(54 bytes)
// - Workflow:
//   1. Allocate pipe buffer region (4KB default)
//   2. Allocate two fds (read-end and write-end)
//   3. Write fd entries with pipe_id reference
//   4. Write fd pair to guest memory
//   5. Return 0 on success

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;
use std::sync::atomic::{AtomicU32, Ordering};

static NEXT_PIPE_ID: AtomicU32 = AtomicU32::new(0);
static NEXT_FD: AtomicU32 = AtomicU32::new(3);

/// Pixel-native pipe2() implementation
pub fn syscall_pipe2_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fds_addr = cpu.x[10];  // a0: address to write [read_fd, write_fd] pair
    let _flags = cpu.x[11];    // a1: flags (O_CLOEXEC, O_DIRECT, O_NONBLOCK)

    // 1. Allocate pipe ID
    let pipe_id = NEXT_PIPE_ID.fetch_add(1, Ordering::SeqCst);

    // 2. Allocate pipe buffer region (4KB at 0x80020000 + pipe_id * 4096)
    let pipe_buffer_base = 0x80020000u64 + (pipe_id as u64 * 4096);

    // Initialize pipe buffer (all zeros = empty)
    for i in 0..1024u64 {  // 4KB / 4 bytes = 1024 pixels
        let pixel_offset = i * 4;
        let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
        let pixel_idx = (y * 256 + x) as usize;

        if pixel_idx < bus.framebuf.pixels.len() {
            bus.framebuf.pixels[pixel_idx] = 0;  // Zero-initialized buffer
        }
    }

    // 3. Allocate two fds (read-end and write-end)
    let read_fd = NEXT_FD.fetch_add(1, Ordering::SeqCst);
    let write_fd = NEXT_FD.fetch_add(1, Ordering::SeqCst);

    if read_fd >= 1024 || write_fd >= 1024 {
        return None;  // FD table exhausted
    }

    // 4. Write fd entries to spatial fd table
    // Entry format: fd(1 byte) | flags(1 byte) | pipe_id(4 bytes) | offset(4 bytes) | reserved(54 bytes)
    let fd_table_base = 0x80010000u64;

    // Write read-end fd entry
    write_fd_entry(bus, fd_table_base, read_fd, 0x01, pipe_id, 0);  // flags=0x01 = read-only

    // Write write-end fd entry
    write_fd_entry(bus, fd_table_base, write_fd, 0x02, pipe_id, 0);  // flags=0x02 = write-only

    // 5. Write fd pair to guest memory
    // Format: [read_fd (4 bytes), write_fd (4 bytes)]
    if !write_fd_to_guest(cpu, bus, fds_addr, read_fd, write_fd) {
        return None;  // Invalid guest address
    }

    // Trigger framebuffer update
    bus.framebuf.present_flag = true;

    // Return 0 on success
    Some(0)
}

/// Write fd entry to spatial fd table
fn write_fd_entry(bus: &mut Bus, fd_table_base: u64, fd: u32, flags: u32, pipe_id: u32, offset: u32) {
    let entry_offset = fd * 64;
    let table_offset = entry_offset as u64;

    // Write first pixel: fd(1 byte) | flags(1 byte) | pipe_id(2 bytes high)
    let pixel_offset = table_offset;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let pixel_idx = (y * 256 + x) as usize;

    if pixel_idx < bus.framebuf.pixels.len() {
        let pixel_val = (fd & 0xFF) |
                       ((flags & 0xFF) << 8) |
                       ((pipe_id & 0xFF) << 16) |
                       ((pipe_id >> 8) << 24) |
                       0xFF000000;
        bus.framebuf.pixels[pixel_idx] = pixel_val;
    }

    // Write second pixel: pipe_id(2 bytes low) | offset(2 bytes)
    let pixel_offset = table_offset + 4;
    let (x, y) = crate::pixel::d2xy(8, pixel_offset as u32 % (256 * 256));
    let pixel_idx = (y * 256 + x) as usize;

    if pixel_idx < bus.framebuf.pixels.len() {
        let pixel_val = ((pipe_id >> 16) & 0xFF) |
                       ((pipe_id >> 24) << 8) |
                       (offset & 0xFF) << 16 |
                       ((offset >> 8) & 0xFF) << 24 |
                       0xFF000000;
        bus.framebuf.pixels[pixel_idx] = pixel_val;
    }
}

/// Write fd pair to guest memory
fn write_fd_to_guest(cpu: &mut RiscvCpu, bus: &mut Bus, addr: u32, read_fd: u32, write_fd: u32) -> bool {
    // Write read_fd (4 bytes little-endian)
    for i in 0..4 {
        let pa = match cpu.translate_va(addr + i, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return false,
        };

        let byte = (read_fd >> (i * 8)) as u8;
        if bus.write_byte(pa, byte).is_err() {
            return false;
        }
    }

    // Write write_fd (4 bytes little-endian)
    for i in 0..4 {
        let pa = match cpu.translate_va(addr + 4 + i, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return false,
        };

        let byte = (write_fd >> (i * 8)) as u8;
        if bus.write_byte(pa, byte).is_err() {
            return false;
        }
    }

    true
}