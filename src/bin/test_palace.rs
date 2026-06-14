// test_palace.rs — Verify /dev/palace kernel device
//
// Tests:
//   1. Open /dev/palace and mmap
//   2. Write checkerboard pattern
//   3. Read back and verify pixels
//   4. Test bulk write_buffer / read_buffer
//
// Usage:
//   sudo insmod kernel/geometry_os/palace.ko
//   sudo chmod 666 /dev/palace
//   cargo run --bin test_palace

use std::fs::OpenOptions;
use std::io;
use std::os::unix::io::AsRawFd;
use std::ptr;

const PALACE_PATH: &str = "/dev/palace";
const PALACE_SIZE: usize = 256 * 1024; // 256 KB
const WIDTH: usize = 256;
const HEIGHT: usize = 256;

fn main() {
    println!("[test_palace] Opening {}...", PALACE_PATH);

    // ── Step 1: Open and mmap ────────────────────────────────────────
    let file = match OpenOptions::new().read(true).write(true).open(PALACE_PATH) {
        Ok(f) => f,
        Err(e) => {
            eprintln!("[test_palace] FAIL: Could not open {}: {}", PALACE_PATH, e);
            eprintln!("[test_palace] Is palace.ko loaded? Try:");
            eprintln!("  sudo insmod kernel/geometry_os/palace.ko");
            eprintln!("  sudo chmod 666 /dev/palace");
            std::process::exit(1);
        },
    };

    let fd = file.as_raw_fd();
    let ptr = unsafe {
        libc::mmap(
            ptr::null_mut(),
            PALACE_SIZE,
            libc::PROT_READ | libc::PROT_WRITE,
            libc::MAP_SHARED,
            fd,
            0,
        )
    };

    if ptr == libc::MAP_FAILED {
        let err = io::Error::last_os_error();
        eprintln!("[test_palace] FAIL: mmap failed: {}", err);
        std::process::exit(1);
    }
    println!("[test_palace] mmap'd at {:p}", ptr);

    // ── Step 2: Write checkerboard pattern ───────────────────────────
    println!("[test_palace] Writing checkerboard pattern...");
    let buf = unsafe { std::slice::from_raw_parts_mut(ptr as *mut u8, PALACE_SIZE) };

    for y in 0..HEIGHT {
        for x in 0..WIDTH {
            let offset = (y * WIDTH + x) * 4;
            let is_white = (x / 16 + y / 16) % 2 == 0;
            if is_white {
                buf[offset] = 0xFF; // R
                buf[offset + 1] = 0xFF; // G
                buf[offset + 2] = 0xFF; // B
                buf[offset + 3] = 0xFF; // A
            } else {
                buf[offset] = 0x00; // R
                buf[offset + 1] = 0x00; // G
                buf[offset + 2] = 0x00; // B
                buf[offset + 3] = 0xFF; // A
            }
        }
    }
    println!("[test_palace] Checkerboard written (16x16 pixel squares)");

    // ── Step 3: Read back and verify ─────────────────────────────────
    println!("[test_palace] Verifying pixel reads...");
    let mut errors = 0;

    // Check a few known positions
    // (0, 0) should be white (even / even = white)
    {
        let offset = (0 * WIDTH + 0) * 4;
        let r = buf[offset];
        let g = buf[offset + 1];
        let b = buf[offset + 2];
        let a = buf[offset + 3];
        if r != 0xFF || g != 0xFF || b != 0xFF || a != 0xFF {
            eprintln!(
                "[test_palace] FAIL: pixel (0,0) expected white, got ({:02X},{:02X},{:02X},{:02X})",
                r, g, b, a
            );
            errors += 1;
        }
    }

    // (16, 0) should be black (16/16=1, 0/16=0, 1+0=1 odd = black)
    {
        let offset = (0 * WIDTH + 16) * 4;
        let r = buf[offset];
        let g = buf[offset + 1];
        let b = buf[offset + 2];
        let a = buf[offset + 3];
        if r != 0x00 || g != 0x00 || b != 0x00 || a != 0xFF {
            eprintln!(
                "[test_palace] FAIL: pixel (16,0) expected black, got ({:02X},{:02X},{:02X},{:02X})",
                r, g, b, a
            );
            errors += 1;
        }
    }

    // (16, 16) should be white (16/16=1, 16/16=1, 1+1=2 even = white)
    {
        let offset = (16 * WIDTH + 16) * 4;
        let r = buf[offset];
        let g = buf[offset + 1];
        let b = buf[offset + 2];
        let a = buf[offset + 3];
        if r != 0xFF || g != 0xFF || b != 0xFF || a != 0xFF {
            eprintln!(
                "[test_palace] FAIL: pixel (16,16) expected white, got ({:02X},{:02X},{:02X},{:02X})",
                r, g, b, a
            );
            errors += 1;
        }
    }

    // ── Step 4: Test write_buffer / read_buffer API ─────────────────
    println!("[test_palace] Testing bulk read/write...");

    // Write a red horizontal line at row 128 via raw file write
    let mut line_data = vec![0u8; WIDTH * 4];
    for i in 0..WIDTH {
        line_data[i * 4] = 0xFF; // R
        line_data[i * 4 + 1] = 0x00; // G
        line_data[i * 4 + 2] = 0x00; // B
        line_data[i * 4 + 3] = 0xFF; // A
    }
    // Use lseek + write to test the char device's write path
    use libc::{lseek, write, SEEK_SET};
    unsafe {
        lseek(fd, (128 * WIDTH * 4) as i64, SEEK_SET);
        let written = write(
            fd,
            line_data.as_ptr() as *const libc::c_void,
            line_data.len(),
        );
        if written < 0 {
            eprintln!("[test_palace] FAIL: write() failed");
            errors += 1;
        } else {
            println!("[test_palace] write({} bytes via file write) OK", written);
        }
    }

    // Read back via mmap to verify
    let px_offset = (128 * WIDTH + 0) * 4;
    if buf[px_offset] == 0xFF && buf[px_offset + 1] == 0x00 && buf[px_offset + 2] == 0x00 {
        println!("[test_palace] Readback via mmap: RED line at row 128 confirmed");
    } else {
        eprintln!(
            "[test_palace] FAIL: Readback mismatch at (0, 128): got ({:02X},{:02X},{:02X})",
            buf[px_offset],
            buf[px_offset + 1],
            buf[px_offset + 2]
        );
        errors += 1;
    }

    // ── Step 5: test read() path ─────────────────────────────────────
    println!("[test_palace] Testing read() path...");
    let mut read_back = vec![0u8; 16];
    unsafe {
        lseek(fd, 0, SEEK_SET);
        let n = libc::read(fd, read_back.as_mut_ptr() as *mut libc::c_void, 16);
        if n != 16 {
            eprintln!("[test_palace] FAIL: read() returned {} (expected 16)", n);
            errors += 1;
        } else if read_back[0] == 0xFF && read_back[4] == 0xFF && read_back[3] == 0xFF {
            // (0,0) should be white (0xFF,0xFF,0xFF,0xFF)
            println!("[test_palace] read() path OK — first pixel matches");
        } else {
            eprintln!(
                "[test_palace] FAIL: read() returned unexpected data: {:02X?}",
                &read_back[..8]
            );
            errors += 1;
        }
    }

    // ── Results ──────────────────────────────────────────────────────
    unsafe {
        libc::munmap(ptr, PALACE_SIZE);
    }

    if errors == 0 {
        println!("[test_palace] ✓ All tests PASSED!");
    } else {
        eprintln!("[test_palace] ✗ {} test(s) FAILED!", errors);
        std::process::exit(1);
    }
}
