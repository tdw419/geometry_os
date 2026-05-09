/// Phase 137: Host Filesystem Bridge
/// FSOPEN, FSCLOSE, FSREAD, FSWRITE, FSLS opcodes
/// Allows Geometry OS programs to read/write files on the host Linux filesystem.
/// Security: restricted to the user's home directory by default.
use super::types::*;
use super::Vm;
use std::io::{Read, Write};

/// Maximum path length for host filesystem operations
const MAX_PATH_LEN: usize = 512;
/// Maximum directory listing size (bytes)
const MAX_DIR_BUF: usize = 4096;
/// Maximum bytes per FSREAD/FSWRITE call
const MAX_IO_CHUNK: usize = 4096;

impl Vm {
    /// Check if a path is within the user's home directory (security sandbox).
    /// Returns the canonicalized path if safe, or None if the path escapes the sandbox.
    fn sandbox_check(path: &str) -> Option<std::path::PathBuf> {
        let home = std::env::var("HOME").unwrap_or_else(|_| "/tmp".to_string());
        let home_dir = std::path::PathBuf::from(&home);

        // Canonicalize the home dir (resolve symlinks)
        let home_canon = match home_dir.canonicalize() {
            Ok(h) => h,
            Err(_) => return None,
        };

        // Handle paths starting with ~
        let expanded = if path.starts_with("~/") {
            format!("{}/{}", home, &path[2..])
        } else if path == "~" {
            home.clone()
        } else if path.starts_with('/') {
            path.to_string()
        } else {
            // Relative paths are relative to home
            format!("{}/{}", home, path)
        };

        let target = std::path::PathBuf::from(&expanded);

        // Canonicalize if it exists, otherwise check the parent + join
        let canon = if target.exists() {
            match target.canonicalize() {
                Ok(c) => c,
                Err(_) => return None,
            }
        } else {
            // For new files, canonicalize parent and join the filename
            let parent = target.parent()?;
            let canon_parent = match parent.canonicalize() {
                Ok(c) => c,
                Err(_) => return None,
            };
            let filename = target.file_name()?;
            canon_parent.join(filename)
        };

        // Check if canonicalized path starts with home directory
        if canon.starts_with(&home_canon) {
            Some(canon)
        } else {
            None
        }
    }

    /// FSOPEN path_reg, mode_reg  (0xB9) -- Open a host file.
    /// path_reg: register containing RAM address of null-terminated path string.
    /// mode_reg: 0=read, 1=write(create), 2=append, 3=read+write
    /// Returns: handle index in r0 (0..MAX_HOST_FILES-1), or 0xFFFFFFFF on error.
    /// Encoding: 3 words [0xB9, path_reg, mode_reg]
    pub(crate) fn op_fsopen(&mut self) {
        let path_reg = self.fetch() as usize;
        let mode_reg = self.fetch() as usize;

        if path_reg >= NUM_REGS || mode_reg >= NUM_REGS {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        let path_addr = self.regs[path_reg] as usize;
        let mode = self.regs[mode_reg];

        // Read null-terminated path from RAM
        let path_str = match Self::read_string_static(&self.ram, path_addr) {
            Some(s) => s,
            None => {
                self.regs[0] = 0xFFFFFFFF;
                return;
            }
        };

        if path_str.is_empty() || path_str.len() > MAX_PATH_LEN {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        // Security: sandbox to home directory
        let safe_path = match Self::sandbox_check(&path_str) {
            Some(p) => p,
            None => {
                self.regs[0] = 0xFFFFFFFE; // EACCES
                return;
            }
        };

        // Find a free slot
        let slot = self.host_file_handles.iter().position(|h| h.is_none());
        let slot = match slot {
            Some(s) => s,
            None => {
                self.regs[0] = 0xFFFFFFFD; // EMFILE (too many open files)
                return;
            }
        };

        let file = match mode {
            0 => std::fs::File::open(&safe_path),   // read
            1 => std::fs::File::create(&safe_path), // write (create/truncate)
            2 => std::fs::OpenOptions::new() // append
                .write(true)
                .append(true)
                .open(&safe_path),
            3 => std::fs::OpenOptions::new() // read+write
                .read(true)
                .write(true)
                .create(true)
                .open(&safe_path),
            _ => {
                self.regs[0] = 0xFFFFFFFF; // EINVAL
                return;
            }
        };

        match file {
            Ok(f) => {
                self.host_file_handles[slot] = Some((f, mode as u8));
                self.regs[0] = slot as u32;
            }
            Err(_) => {
                self.regs[0] = 0xFFFFFFFF;
            }
        }
    }

    /// FSCLOSE handle_reg  (0xBA) -- Close a host file handle.
    /// handle_reg: register containing the handle index from FSOPEN.
    /// Returns: 0 in r0 on success, 0xFFFFFFFF on error.
    /// Encoding: 2 words [0xBA, handle_reg]
    pub(crate) fn op_fsclose(&mut self) {
        let handle_reg = self.fetch() as usize;
        if handle_reg >= NUM_REGS {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        let handle = self.regs[handle_reg] as usize;
        if handle >= self.host_file_handles.len() {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        if self.host_file_handles[handle].take().is_some() {
            self.regs[0] = 0; // success
        } else {
            self.regs[0] = 0xFFFFFFFF; // EBADF
        }
    }

    /// FSREAD handle_reg, buf_reg, len_reg  (0xBB) -- Read from host file.
    /// Reads up to len bytes into RAM buffer starting at buf_reg address.
    /// Each byte goes into one u32 RAM cell.
    /// Returns: bytes read in r0, 0xFFFFFFFF on error.
    /// Encoding: 4 words [0xBB, handle_reg, buf_reg, len_reg]
    pub(crate) fn op_fsread(&mut self) {
        let handle_reg = self.fetch() as usize;
        let buf_reg = self.fetch() as usize;
        let len_reg = self.fetch() as usize;

        if handle_reg >= NUM_REGS || buf_reg >= NUM_REGS || len_reg >= NUM_REGS {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        let handle = self.regs[handle_reg] as usize;
        let buf_addr = self.regs[buf_reg] as usize;
        let max_len = self.regs[len_reg] as usize;

        if handle >= self.host_file_handles.len() || max_len > MAX_IO_CHUNK {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        let file_ref = match self.host_file_handles.get_mut(handle) {
            Some(Some((f, _mode))) => f,
            _ => {
                self.regs[0] = 0xFFFFFFFF;
                return;
            }
        };

        let mut tmp_buf = vec![0u8; max_len];
        match file_ref.read(&mut tmp_buf) {
            Ok(n) => {
                for i in 0..n {
                    let addr = buf_addr + i;
                    if addr < self.ram.len() {
                        self.ram[addr] = tmp_buf[i] as u32;
                    }
                }
                self.regs[0] = n as u32;
            }
            Err(_) => {
                self.regs[0] = 0xFFFFFFFF;
            }
        }
    }

    /// FSWRITE handle_reg, buf_reg, len_reg  (0xBC) -- Write to host file.
    /// Writes len bytes from RAM buffer starting at buf_reg address.
    /// Each RAM cell's low byte is written.
    /// Returns: bytes written in r0, 0xFFFFFFFF on error.
    /// Encoding: 4 words [0xBC, handle_reg, buf_reg, len_reg]
    pub(crate) fn op_fswrite(&mut self) {
        let handle_reg = self.fetch() as usize;
        let buf_reg = self.fetch() as usize;
        let len_reg = self.fetch() as usize;

        if handle_reg >= NUM_REGS || buf_reg >= NUM_REGS || len_reg >= NUM_REGS {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        let handle = self.regs[handle_reg] as usize;
        let buf_addr = self.regs[buf_reg] as usize;
        let len = self.regs[len_reg] as usize;

        if handle >= self.host_file_handles.len() || len > MAX_IO_CHUNK {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        let file_ref = match self.host_file_handles.get_mut(handle) {
            Some(Some((f, _mode))) => f,
            _ => {
                self.regs[0] = 0xFFFFFFFF;
                return;
            }
        };

        // Collect bytes from RAM
        let mut tmp_buf = Vec::with_capacity(len);
        for i in 0..len {
            let addr = buf_addr + i;
            if addr < self.ram.len() {
                tmp_buf.push((self.ram[addr] & 0xFF) as u8);
            } else {
                break;
            }
        }

        match file_ref.write_all(&tmp_buf) {
            Ok(()) => {
                if let Err(_) = file_ref.flush() {
                    self.regs[0] = 0xFFFFFFFF;
                    return;
                }
                self.regs[0] = tmp_buf.len() as u32;
            }
            Err(_) => {
                self.regs[0] = 0xFFFFFFFF;
            }
        }
    }

    /// FSLS path_reg, buf_reg, max_len_reg  (0xBD) -- List directory contents.
    /// path_reg: register containing RAM address of null-terminated directory path.
    /// Writes null-separated filenames to RAM buffer at buf_reg.
    /// Returns: total bytes written in r0 (including null separators), 0xFFFFFFFF on error.
    /// Encoding: 4 words [0xBD, path_reg, buf_reg, max_len_reg]
    pub(crate) fn op_fsls(&mut self) {
        let path_reg = self.fetch() as usize;
        let buf_reg = self.fetch() as usize;
        let max_len_reg = self.fetch() as usize;

        if path_reg >= NUM_REGS || buf_reg >= NUM_REGS || max_len_reg >= NUM_REGS {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        let path_addr = self.regs[path_reg] as usize;
        let buf_addr = self.regs[buf_reg] as usize;
        let max_len = self.regs[max_len_reg] as usize;

        if max_len > MAX_DIR_BUF {
            self.regs[0] = 0xFFFFFFFF;
            return;
        }

        // Read path from RAM
        let path_str = match Self::read_string_static(&self.ram, path_addr) {
            Some(s) => s,
            None => {
                self.regs[0] = 0xFFFFFFFF;
                return;
            }
        };

        // Security: sandbox check
        let safe_path = match Self::sandbox_check(&path_str) {
            Some(p) => p,
            None => {
                self.regs[0] = 0xFFFFFFFE; // EACCES
                return;
            }
        };

        // Read directory
        let entries = match std::fs::read_dir(&safe_path) {
            Ok(rd) => rd,
            Err(_) => {
                self.regs[0] = 0xFFFFFFFF;
                return;
            }
        };

        let mut offset = 0;
        for entry in entries {
            if let Ok(e) = entry {
                if let Some(name) = e.file_name().to_str() {
                    for ch in name.chars() {
                        if offset < max_len && buf_addr + offset < self.ram.len() {
                            self.ram[buf_addr + offset] = ch as u32;
                            offset += 1;
                        }
                    }
                    // Null separator between names
                    if offset < max_len && buf_addr + offset < self.ram.len() {
                        self.ram[buf_addr + offset] = 0;
                        offset += 1;
                    }
                }
            }
            if offset >= max_len {
                break;
            }
        }

        self.regs[0] = offset as u32;
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;

    /// Helper: write a null-terminated string into RAM at the given address.
    fn write_string(ram: &mut [u32], addr: usize, s: &str) {
        for (i, ch) in s.chars().enumerate() {
            ram[addr + i] = ch as u32;
        }
        ram[addr + s.len()] = 0; // null terminator
    }

    /// Helper: set up the VM's PC and RAM for an opcode call.
    /// Returns a fresh Vm.
    fn new_vm() -> crate::vm::Vm {
        crate::vm::Vm::new()
    }

    /// Helper: create a test directory under HOME (sandbox-safe).
    fn test_dir(name: &str) -> std::path::PathBuf {
        let home = std::env::var("HOME").unwrap();
        let dir = std::path::PathBuf::from(home).join(".cache").join(name);
        std::fs::create_dir_all(&dir).unwrap();
        dir
    }

    // ── sandbox_check tests ─────────────────────────────────────────

    #[test]
    fn sandbox_check_allows_home_path() {
        let home = std::env::var("HOME").unwrap();
        let path = format!("{}/.bashrc", home);
        let result = crate::vm::Vm::sandbox_check(&path);
        assert!(result.is_some(), "home path should be allowed");
    }

    #[test]
    fn sandbox_check_allows_tilde_expansion() {
        let path = "~/.bashrc";
        let result = crate::vm::Vm::sandbox_check(path);
        assert!(result.is_some(), "tilde path should be allowed");
    }

    #[test]
    fn sandbox_check_rejects_absolute_escape() {
        let result = crate::vm::Vm::sandbox_check("/etc/passwd");
        assert!(result.is_none(), "/etc/passwd should be blocked");
    }

    #[test]
    fn sandbox_check_rejects_symlink_escape() {
        // /tmp is likely outside HOME for most users.
        // If HOME is /home/user, /tmp should be blocked.
        let result = crate::vm::Vm::sandbox_check("/tmp/test");
        // This may be allowed if HOME=/tmp, so we only assert when HOME != /tmp
        let home = std::env::var("HOME").unwrap_or_default();
        if home != "/tmp" && !std::path::PathBuf::from("/tmp").starts_with(&home) {
            assert!(result.is_none(), "/tmp should be blocked");
        }
    }

    // ── FSOPEN tests ───────────────────────────────────────────────

    #[test]
    fn fsopen_create_and_read_file() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsopen");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_create.txt");
        let path_str = path.to_str().unwrap();

        // Write path into RAM
        write_string(&mut vm.ram, 0x5000, path_str);

        // Set up operands: FSOPEN path_reg=5, mode_reg=6
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1; // mode=1 (write/create)
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_ne!(vm.regs[0], 0xFFFFFFFF, "FSOPEN create should succeed");
        let handle = vm.regs[0] as usize;
        assert!(
            handle < crate::vm::types::MAX_HOST_FILES,
            "handle should be valid slot index"
        );
        assert!(
            vm.host_file_handles[handle].is_some(),
            "slot should be occupied"
        );

        // Clean up
        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsopen_read_existing_file() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsopen_read");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_read.txt");
        std::fs::write(&path, "hello").unwrap();
        let path_str = path.to_str().unwrap();

        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0; // mode=0 (read)
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_ne!(vm.regs[0], 0xFFFFFFFF, "FSOPEN read should succeed");
        let handle = vm.regs[0] as usize;

        // Clean up
        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsopen_append_mode() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsopen_append");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_append.txt");
        std::fs::write(&path, "line1\n").unwrap();
        let path_str = path.to_str().unwrap();

        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 2; // mode=2 (append)
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_ne!(vm.regs[0], 0xFFFFFFFF, "FSOPEN append should succeed");

        // Clean up
        let handle = vm.regs[0] as usize;
        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsopen_readwrite_mode() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsopen_rw");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_rw.txt");
        let path_str = path.to_str().unwrap();

        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 3; // mode=3 (read+write)
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_ne!(vm.regs[0], 0xFFFFFFFF, "FSOPEN read+write should succeed");

        // Clean up
        let handle = vm.regs[0] as usize;
        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsopen_invalid_mode_returns_error() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsopen_bad");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_bad.txt");
        let path_str = path.to_str().unwrap();

        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 99; // invalid mode
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_eq!(vm.regs[0], 0xFFFFFFFF, "invalid mode should return error");

        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsopen_sandbox_escape_returns_eacces() {
        let mut vm = new_vm();
        write_string(&mut vm.ram, 0x5000, "/etc/shadow");
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0; // read mode
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFE,
            "sandbox escape should return EACCES"
        );
    }

    #[test]
    fn fsopen_empty_path_returns_error() {
        let mut vm = new_vm();
        // Write a null byte at the path address (empty string)
        vm.ram[0x5000] = 0;
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_eq!(vm.regs[0], 0xFFFFFFFF, "empty path should return error");
    }

    #[test]
    fn fsopen_nonexistent_read_returns_error() {
        let mut vm = new_vm();
        let home = std::env::var("HOME").unwrap();
        let path = format!("{}/geos_test_nonexistent_file_12345.txt", home);
        write_string(&mut vm.ram, 0x5000, &path);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0; // read mode -- file doesn't exist
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFF,
            "reading nonexistent file should fail"
        );
    }

    // ── FSCLOSE tests ──────────────────────────────────────────────

    #[test]
    fn fsclose_valid_handle() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsclose");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_close.txt");
        let path_str = path.to_str().unwrap();

        // Open first
        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0];

        // Close
        vm.regs[7] = handle;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.op_fsclose();

        assert_eq!(vm.regs[0], 0, "FSCLOSE should succeed");
        assert!(
            vm.host_file_handles[handle as usize].is_none(),
            "slot should be freed"
        );

        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsclose_invalid_handle_returns_error() {
        let mut vm = new_vm();
        vm.regs[5] = 99; // out of range
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.op_fsclose();

        assert_eq!(vm.regs[0], 0xFFFFFFFF, "invalid handle should return error");
    }

    #[test]
    fn fsclose_already_closed_returns_error() {
        let mut vm = new_vm();
        // Close handle 0 which was never opened
        vm.regs[5] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.op_fsclose();

        assert_eq!(vm.regs[0], 0xFFFFFFFF, "double-close should return EBADF");
    }

    // ── FSREAD tests ───────────────────────────────────────────────

    #[test]
    fn fsread_reads_file_contents() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsread");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_read_content.txt");
        std::fs::write(&path, "ABCDEF").unwrap();
        let path_str = path.to_str().unwrap();

        // Open
        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0; // read
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;
        assert_ne!(handle as u32, 0xFFFFFFFF);

        // Read 6 bytes into buf at 0x6000
        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000; // buf addr
        vm.regs[9] = 6; // max len
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fsread();

        assert_eq!(vm.regs[0], 6, "should read 6 bytes");
        // Check RAM contents: each byte in its own u32 cell
        assert_eq!(vm.ram[0x6000], b'A' as u32);
        assert_eq!(vm.ram[0x6001], b'B' as u32);
        assert_eq!(vm.ram[0x6002], b'C' as u32);
        assert_eq!(vm.ram[0x6003], b'D' as u32);
        assert_eq!(vm.ram[0x6004], b'E' as u32);
        assert_eq!(vm.ram[0x6005], b'F' as u32);

        // Clean up
        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsread_partial_read() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsread_partial");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_partial.txt");
        std::fs::write(&path, "Hi").unwrap();
        let path_str = path.to_str().unwrap();

        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;

        // Request 10 bytes but file only has 2
        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 10;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fsread();

        assert_eq!(vm.regs[0], 2, "should read only 2 bytes available");
        assert_eq!(vm.ram[0x6000], b'H' as u32);
        assert_eq!(vm.ram[0x6001], b'i' as u32);

        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsread_invalid_handle_returns_error() {
        let mut vm = new_vm();
        vm.regs[7] = 99; // out of range
        vm.regs[8] = 0x6000;
        vm.regs[9] = 10;
        let pc = vm.pc as usize;
        vm.ram[pc] = 7;
        vm.ram[pc + 1] = 8;
        vm.ram[pc + 2] = 9;
        vm.op_fsread();

        assert_eq!(vm.regs[0], 0xFFFFFFFF);
    }

    #[test]
    fn fsread_exceeds_max_chunk_returns_error() {
        let mut vm = new_vm();
        // Try to read more than MAX_IO_CHUNK (4096)
        vm.regs[7] = 0; // valid handle but empty
        vm.regs[8] = 0x6000;
        vm.regs[9] = 5000; // > 4096
        let pc = vm.pc as usize;
        vm.ram[pc] = 7;
        vm.ram[pc + 1] = 8;
        vm.ram[pc + 2] = 9;
        vm.op_fsread();

        assert_eq!(vm.regs[0], 0xFFFFFFFF, "should reject len > MAX_IO_CHUNK");
    }

    // ── FSWRITE tests ──────────────────────────────────────────────

    #[test]
    fn fswrite_writes_data_to_file() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fswrite");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_write.txt");
        let path_str = path.to_str().unwrap();

        // Open for write
        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1; // write mode
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;
        assert_ne!(handle as u32, 0xFFFFFFFF);

        // Write "hello" into RAM at 0x6000
        let msg = b"hello";
        for (i, &b) in msg.iter().enumerate() {
            vm.ram[0x6000 + i] = b as u32;
        }

        // FSWRITE handle, buf, len
        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 5;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();

        assert_eq!(vm.regs[0], 5, "should write 5 bytes");

        // Close and verify on disk
        vm.host_file_handles[handle] = None;
        let contents = std::fs::read_to_string(&path).unwrap();
        assert_eq!(contents, "hello", "file should contain 'hello'");

        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fswrite_append_mode_appends() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fswrite_append");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_append.txt");
        std::fs::write(&path, "line1\n").unwrap();
        let path_str = path.to_str().unwrap();

        // Open for append
        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 2; // append mode
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;

        // Write "line2"
        let msg = b"line2";
        for (i, &b) in msg.iter().enumerate() {
            vm.ram[0x6000 + i] = b as u32;
        }
        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 5;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();

        assert_eq!(vm.regs[0], 5);

        vm.host_file_handles[handle] = None;
        let contents = std::fs::read_to_string(&path).unwrap();
        assert_eq!(
            contents, "line1\nline2",
            "append should preserve existing content"
        );

        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fswrite_invalid_handle_returns_error() {
        let mut vm = new_vm();
        vm.regs[7] = 99;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 5;
        let pc = vm.pc as usize;
        vm.ram[pc] = 7;
        vm.ram[pc + 1] = 8;
        vm.ram[pc + 2] = 9;
        vm.op_fswrite();

        assert_eq!(vm.regs[0], 0xFFFFFFFF);
    }

    #[test]
    fn fswrite_exceeds_max_chunk_returns_error() {
        let mut vm = new_vm();
        vm.regs[7] = 0;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 5000; // > 4096
        let pc = vm.pc as usize;
        vm.ram[pc] = 7;
        vm.ram[pc + 1] = 8;
        vm.ram[pc + 2] = 9;
        vm.op_fswrite();

        assert_eq!(vm.regs[0], 0xFFFFFFFF);
    }

    // ── FSLS tests ─────────────────────────────────────────────────

    #[test]
    fn fsls_lists_directory_contents() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsls");
        std::fs::create_dir_all(&dir).unwrap();
        // Create known files
        std::fs::write(dir.join("alpha.txt"), "").unwrap();
        std::fs::write(dir.join("beta.txt"), "").unwrap();
        let path_str = dir.to_str().unwrap();

        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000; // path
        vm.regs[6] = 0x6000; // buf
        vm.regs[7] = 1024; // max_len
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.ram[pc + 2] = 7;
        vm.op_fsls();

        assert_ne!(vm.regs[0], 0xFFFFFFFF, "FSLS should succeed");
        let bytes_written = vm.regs[0] as usize;
        assert!(bytes_written > 0, "should write some bytes");

        // Read back the buffer and check for known filenames
        let mut buf = Vec::new();
        for i in 0..bytes_written {
            buf.push((vm.ram[0x6000 + i] & 0xFF) as u8);
        }
        let listing = String::from_utf8_lossy(&buf);
        // Filenames are null-separated; check both exist
        assert!(
            listing.contains("alpha.txt"),
            "listing should contain 'alpha.txt', got: {:?}",
            listing
        );
        assert!(
            listing.contains("beta.txt"),
            "listing should contain 'beta.txt', got: {:?}",
            listing
        );

        // Clean up
        let _ = std::fs::remove_file(dir.join("alpha.txt"));
        let _ = std::fs::remove_file(dir.join("beta.txt"));
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsls_nonexistent_dir_returns_error() {
        let mut vm = new_vm();
        let home = std::env::var("HOME").unwrap();
        let path = format!("{}/geos_test_nonexistent_dir_12345", home);
        write_string(&mut vm.ram, 0x5000, &path);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0x6000;
        vm.regs[7] = 1024;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.ram[pc + 2] = 7;
        vm.op_fsls();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFF,
            "nonexistent dir should return error"
        );
    }

    #[test]
    fn fsls_sandbox_escape_returns_eacces() {
        let mut vm = new_vm();
        write_string(&mut vm.ram, 0x5000, "/etc");
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0x6000;
        vm.regs[7] = 1024;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.ram[pc + 2] = 7;
        vm.op_fsls();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFE,
            "sandbox escape should return EACCES"
        );
    }

    #[test]
    fn fsls_exceeds_max_dir_buf_returns_error() {
        let mut vm = new_vm();
        let home = std::env::var("HOME").unwrap();
        write_string(&mut vm.ram, 0x5000, &home);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0x6000;
        vm.regs[7] = 5000; // > MAX_DIR_BUF (4096)
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.ram[pc + 2] = 7;
        vm.op_fsls();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFF,
            "max_len > MAX_DIR_BUF should return error"
        );
    }

    // ── Roundtrip: write then read ─────────────────────────────────

    #[test]
    fn fs_roundtrip_write_read() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_roundtrip");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("roundtrip.bin");
        let path_str = path.to_str().unwrap();

        // Write data
        write_string(&mut vm.ram, 0x5000, path_str);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1; // write
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let write_handle = vm.regs[0] as usize;

        let original = b"Hello, Geometry OS!";
        for (i, &b) in original.iter().enumerate() {
            vm.ram[0x6000 + i] = b as u32;
        }
        vm.regs[7] = write_handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = original.len() as u32;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();
        assert_eq!(vm.regs[0], original.len() as u32);

        // Close write handle
        vm.regs[10] = write_handle as u32;
        let pc3 = vm.pc as usize;
        vm.ram[pc3] = 10;
        vm.op_fsclose();
        assert_eq!(vm.regs[0], 0);

        // Reopen for reading
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc4 = vm.pc as usize;
        vm.ram[pc4] = 5;
        vm.ram[pc4 + 1] = 6;
        vm.op_fsopen();
        let read_handle = vm.regs[0] as usize;
        assert_ne!(read_handle as u32, 0xFFFFFFFF);

        // Read back
        vm.regs[7] = read_handle as u32;
        vm.regs[8] = 0x7000; // different buffer
        vm.regs[9] = original.len() as u32;
        let pc5 = vm.pc as usize;
        vm.ram[pc5] = 7;
        vm.ram[pc5 + 1] = 8;
        vm.ram[pc5 + 2] = 9;
        vm.op_fsread();
        assert_eq!(vm.regs[0], original.len() as u32);

        // Verify contents match
        for (i, &b) in original.iter().enumerate() {
            assert_eq!(vm.ram[0x7000 + i], b as u32, "byte {} mismatch", i);
        }

        // Clean up
        vm.host_file_handles[read_handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── Multiple file slots ────────────────────────────────────────

    #[test]
    fn fs_multiple_handles_simultaneous() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_multi");
        std::fs::create_dir_all(&dir).unwrap();

        // Open 3 files simultaneously
        let mut handles = Vec::new();
        for i in 0..3 {
            let path = dir.join(format!("file{}.txt", i));
            std::fs::write(&path, format!("content{}", i)).unwrap();
            let path_str = path.to_str().unwrap();

            write_string(&mut vm.ram, 0x5000 + i * 100, path_str);
            vm.regs[5] = (0x5000 + i * 100) as u32;
            vm.regs[6] = 0; // read
            let pc = vm.pc as usize;
            vm.ram[pc] = 5;
            vm.ram[pc + 1] = 6;
            vm.op_fsopen();
            assert_ne!(vm.regs[0], 0xFFFFFFFF, "file {} should open", i);
            handles.push(vm.regs[0] as usize);
        }

        // All handles should be distinct
        let unique: std::collections::HashSet<_> = handles.iter().collect();
        assert_eq!(unique.len(), 3, "should have 3 distinct handles");

        // Clean up
        for (i, &h) in handles.iter().enumerate() {
            vm.host_file_handles[h] = None;
            let path = dir.join(format!("file{}.txt", i));
            let _ = std::fs::remove_file(&path);
        }
        let _ = std::fs::remove_dir(&dir);
    }

    // ── Register boundary tests ────────────────────────────────────

    #[test]
    fn fsopen_out_of_range_registers_returns_error() {
        let mut vm = new_vm();
        // path_reg = 32 (out of range) -- the check should catch it before indexing
        let pc = vm.pc as usize;
        vm.ram[pc] = 32; // invalid reg
        vm.ram[pc + 1] = 0;
        vm.op_fsopen();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFF,
            "out-of-range register should return error"
        );
    }

    #[test]
    fn fsclose_out_of_range_register_returns_error() {
        let mut vm = new_vm();
        let pc = vm.pc as usize;
        vm.ram[pc] = 32; // invalid reg
        vm.op_fsclose();

        assert_eq!(vm.regs[0], 0xFFFFFFFF);
    }

    #[test]
    fn fsread_out_of_range_registers_returns_error() {
        let mut vm = new_vm();
        let pc = vm.pc as usize;
        vm.ram[pc] = 32;
        vm.ram[pc + 1] = 0;
        vm.ram[pc + 2] = 0;
        vm.op_fsread();

        assert_eq!(vm.regs[0], 0xFFFFFFFF);
    }

    #[test]
    fn fswrite_out_of_range_registers_returns_error() {
        let mut vm = new_vm();
        let pc = vm.pc as usize;
        vm.ram[pc] = 32;
        vm.ram[pc + 1] = 0;
        vm.ram[pc + 2] = 0;
        vm.op_fswrite();

        assert_eq!(vm.regs[0], 0xFFFFFFFF);
    }

    #[test]
    fn fsls_out_of_range_registers_returns_error() {
        let mut vm = new_vm();
        let pc = vm.pc as usize;
        vm.ram[pc] = 32;
        vm.ram[pc + 1] = 0;
        vm.ram[pc + 2] = 0;
        vm.op_fsls();

        assert_eq!(vm.regs[0], 0xFFFFFFFF);
    }

    // ── EMFILE: all slots occupied ──────────────────────────────────

    #[test]
    fn fsopen_emfile_when_all_slots_full() {
        use crate::vm::types::MAX_HOST_FILES;
        let mut vm = new_vm();
        let dir = test_dir("geos_test_emfile");
        std::fs::create_dir_all(&dir).unwrap();

        // Open MAX_HOST_FILES files to fill all slots
        for i in 0..MAX_HOST_FILES {
            let path = dir.join(format!("slot_{}.txt", i));
            std::fs::write(&path, format!("data{}", i)).unwrap();
            write_string(&mut vm.ram, 0x3000 + i * 100, path.to_str().unwrap());
            vm.regs[5] = (0x3000 + i * 100) as u32;
            vm.regs[6] = 0; // read
            let pc = vm.pc as usize;
            vm.ram[pc] = 5;
            vm.ram[pc + 1] = 6;
            vm.op_fsopen();
            assert_ne!(
                vm.regs[0], 0xFFFFFFFF,
                "slot {} should open successfully",
                i
            );
        }

        // Now try to open one more — should fail with 0xFFFFFFFF
        let extra = dir.join("extra.txt");
        std::fs::write(&extra, "nope").unwrap();
        write_string(&mut vm.ram, 0x5000, extra.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_eq!(
            vm.regs[0],
            0xFFFFFFFD, // EMFILE
            "opening file when all {} slots are full should return EMFILE",
            MAX_HOST_FILES
        );

        // Cleanup
        for i in 0..MAX_HOST_FILES {
            vm.host_file_handles[i] = None;
            let path = dir.join(format!("slot_{}.txt", i));
            let _ = std::fs::remove_file(&path);
        }
        let _ = std::fs::remove_file(&extra);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── Empty directory listing ─────────────────────────────────────

    #[test]
    fn fsls_empty_directory_returns_zero_bytes() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_empty_dir");
        std::fs::create_dir_all(&dir).unwrap();

        write_string(&mut vm.ram, 0x5000, dir.to_str().unwrap());
        vm.regs[5] = 0x5000; // path
        vm.regs[6] = 0x6000; // buf
        vm.regs[7] = 1024; // max_len
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.ram[pc + 2] = 7;
        vm.op_fsls();

        assert_eq!(vm.regs[0], 0, "empty directory should return 0 bytes");

        let _ = std::fs::remove_dir(&dir);
    }

    // ── File truncation on write-mode open ──────────────────────────

    #[test]
    fn fsopen_write_mode_truncates_existing_file() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_truncate");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("truncate.txt");
        std::fs::write(&path, "AAAAAAAAAA").unwrap(); // 10 bytes

        // Open in write mode (mode=1) — should truncate
        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1; // write mode
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;
        assert_ne!(handle as u32, 0xFFFFFFFF, "write open should succeed");

        // Close without writing anything
        vm.host_file_handles[handle] = None;

        // Reopen in read mode and verify file is empty
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0; // read mode
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 5;
        vm.ram[pc2 + 1] = 6;
        vm.op_fsopen();
        let read_handle = vm.regs[0] as usize;
        assert_ne!(read_handle as u32, 0xFFFFFFFF);

        // Read up to 100 bytes — should get 0
        vm.regs[7] = read_handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 100;
        let pc3 = vm.pc as usize;
        vm.ram[pc3] = 7;
        vm.ram[pc3 + 1] = 8;
        vm.ram[pc3 + 2] = 9;
        vm.op_fsread();

        assert_eq!(vm.regs[0], 0, "truncated file should read 0 bytes");

        // Cleanup
        vm.host_file_handles[read_handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── FSWRITE with high bytes in RAM cells ────────────────────────

    #[test]
    fn fswrite_strips_high_bytes_from_ram() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_highbyte");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("highbyte.bin");

        // Open for write
        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1; // write
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;
        assert!(handle < MAX_HOST_FILES as usize);

        // Write data with high bytes set: each RAM cell has value 0xFF000041 etc.
        // Only low byte (& 0xFF) should be written to the file
        vm.ram[0x6000] = 0xFF000041; // 'A' with high bits
        vm.ram[0x6001] = 0xDEADBEEF; // low byte = 0xEF
        vm.ram[0x6002] = 0x12345642; // low byte = 0x42 = 'B'

        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 3;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();

        assert_eq!(vm.regs[0], 3, "should write 3 bytes");

        // Close and verify file contents
        vm.host_file_handles[handle] = None;
        let on_disk = std::fs::read(&path).unwrap();
        assert_eq!(on_disk.len(), 3);
        assert_eq!(on_disk[0], 0x41, "high byte should be stripped");
        assert_eq!(on_disk[1], 0xEF, "high byte should be stripped");
        assert_eq!(on_disk[2], 0x42, "high byte should be stripped");

        // Cleanup
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── FSREAD from closed handle returns error ─────────────────────

    #[test]
    fn fsread_closed_handle_returns_error() {
        let mut vm = new_vm();

        // Try to read from handle 0 which was never opened (None)
        vm.regs[7] = 0; // handle 0 — never opened
        vm.regs[8] = 0x6000;
        vm.regs[9] = 100;
        let pc = vm.pc as usize;
        vm.ram[pc] = 7;
        vm.ram[pc + 1] = 8;
        vm.ram[pc + 2] = 9;
        vm.op_fsread();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFF,
            "reading from never-opened handle should return error"
        );
    }

    // ── FSWRITE to closed handle returns error ──────────────────────

    #[test]
    fn fswrite_closed_handle_returns_error() {
        let mut vm = new_vm();

        // Try to write to handle 0 which was never opened
        vm.ram[0x6000] = 0x41; // 'A'
        vm.regs[7] = 0; // handle 0 — never opened
        vm.regs[8] = 0x6000;
        vm.regs[9] = 1;
        let pc = vm.pc as usize;
        vm.ram[pc] = 7;
        vm.ram[pc + 1] = 8;
        vm.ram[pc + 2] = 9;
        vm.op_fswrite();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFF,
            "writing to never-opened handle should return error"
        );
    }

    // ── FSWRITE/FSREAD with RAM boundary (near end of RAM) ─────────

    #[test]
    fn fswrite_clamps_at_ram_boundary() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_ramboundary");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("ramboundary.bin");

        // Open for write
        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;
        assert!(handle < MAX_HOST_FILES as usize);

        // Set buf_addr near end of RAM, len that exceeds it
        let ram_len = vm.ram.len();
        let buf_addr = ram_len - 2; // only 2 cells before end
        vm.ram[buf_addr] = 0x58; // 'X'
        vm.ram[buf_addr + 1] = 0x59; // 'Y'

        vm.regs[7] = handle as u32;
        vm.regs[8] = buf_addr as u32;
        vm.regs[9] = 100; // request 100 bytes, but only 2 fit in RAM
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();

        // Should write only 2 bytes (clamped by RAM boundary)
        assert_eq!(
            vm.regs[0], 2,
            "should write only 2 bytes when buf near end of RAM"
        );

        // Verify on disk
        vm.host_file_handles[handle] = None;
        let on_disk = std::fs::read(&path).unwrap();
        assert_eq!(on_disk.len(), 2);
        assert_eq!(on_disk[0], 0x58);
        assert_eq!(on_disk[1], 0x59);

        // Cleanup
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fsread_clamps_at_ram_boundary() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_readram");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("readram.bin");
        std::fs::write(&path, b"ABCDE").unwrap();

        // Open for read
        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;
        assert!(handle < MAX_HOST_FILES as usize);

        // Read into buffer near end of RAM
        let ram_len = vm.ram.len();
        let buf_addr = ram_len - 2; // only 2 cells before end

        vm.regs[7] = handle as u32;
        vm.regs[8] = buf_addr as u32;
        vm.regs[9] = 100; // request 100, file has 5, but only 2 fit in RAM
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fsread();

        // r0 should be 5 (bytes read from file), not 2
        // The read reports all bytes consumed from the file,
        // but only writes what fits in RAM
        assert_eq!(vm.regs[0], 5, "should report 5 bytes read from file");

        // But only 2 bytes actually landed in RAM
        assert_eq!(vm.ram[buf_addr], 0x41, "first byte 'A'");
        assert_eq!(vm.ram[buf_addr + 1], 0x42, "second byte 'B'");

        // Cleanup
        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── FSCLOSE on never-opened handle ──────────────────────────────

    #[test]
    fn fsclose_never_opened_handle_returns_error() {
        let mut vm = new_vm();

        vm.regs[5] = 5; // handle 5 was never opened
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.op_fsclose();

        assert_eq!(
            vm.regs[0], 0xFFFFFFFF,
            "closing never-opened handle should return error"
        );
    }

    // ── Sequential reads (file cursor advances) ─────────────────────

    #[test]
    fn fsread_sequential_reads_advance_cursor() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_sequential");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("sequential.txt");
        std::fs::write(&path, "ABCDEFGHIJ").unwrap();

        // Open for read
        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;

        // First read: 3 bytes -> "ABC"
        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 3;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fsread();
        assert_eq!(vm.regs[0], 3);
        assert_eq!(vm.ram[0x6000], b'A' as u32);
        assert_eq!(vm.ram[0x6001], b'B' as u32);
        assert_eq!(vm.ram[0x6002], b'C' as u32);

        // Second read: 3 bytes -> "DEF" (cursor advanced past ABC)
        vm.regs[9] = 3;
        let pc3 = vm.pc as usize;
        vm.ram[pc3] = 7;
        vm.ram[pc3 + 1] = 8;
        vm.ram[pc3 + 2] = 9;
        vm.op_fsread();
        assert_eq!(vm.regs[0], 3);
        assert_eq!(vm.ram[0x6000], b'D' as u32);
        assert_eq!(vm.ram[0x6001], b'E' as u32);
        assert_eq!(vm.ram[0x6002], b'F' as u32);

        // Third read: 10 bytes but only 4 remain -> "GHIJ"
        vm.regs[9] = 10;
        let pc4 = vm.pc as usize;
        vm.ram[pc4] = 7;
        vm.ram[pc4 + 1] = 8;
        vm.ram[pc4 + 2] = 9;
        vm.op_fsread();
        assert_eq!(vm.regs[0], 4);
        assert_eq!(vm.ram[0x6000], b'G' as u32);

        // Fourth read: nothing left -> 0 bytes
        vm.regs[9] = 10;
        let pc5 = vm.pc as usize;
        vm.ram[pc5] = 7;
        vm.ram[pc5 + 1] = 8;
        vm.ram[pc5 + 2] = 9;
        vm.op_fsread();
        assert_eq!(vm.regs[0], 0, "should read 0 bytes at EOF");

        // Cleanup
        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── Binary data roundtrip (all byte values 0x00-0xFF) ───────────

    #[test]
    fn fs_roundtrip_binary_data_all_byte_values() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_binary");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("binary.bin");

        // Write all 256 byte values
        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1; // write
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let write_handle = vm.regs[0] as usize;

        for i in 0u32..256 {
            vm.ram[0x6000 + i as usize] = i;
        }
        vm.regs[7] = write_handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 256;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();
        assert_eq!(vm.regs[0], 256);

        // Close
        vm.regs[10] = write_handle as u32;
        let pc3 = vm.pc as usize;
        vm.ram[pc3] = 10;
        vm.op_fsclose();

        // Reopen and read back
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0; // read
        let pc4 = vm.pc as usize;
        vm.ram[pc4] = 5;
        vm.ram[pc4 + 1] = 6;
        vm.op_fsopen();
        let read_handle = vm.regs[0] as usize;

        vm.regs[7] = read_handle as u32;
        vm.regs[8] = 0x7000;
        vm.regs[9] = 256;
        let pc5 = vm.pc as usize;
        vm.ram[pc5] = 7;
        vm.ram[pc5 + 1] = 8;
        vm.ram[pc5 + 2] = 9;
        vm.op_fsread();
        assert_eq!(vm.regs[0], 256);

        // Verify all 256 bytes match
        for i in 0u32..256 {
            assert_eq!(vm.ram[0x7000 + i as usize], i, "byte {} mismatch", i);
        }

        // Cleanup
        vm.host_file_handles[read_handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── Read+Write mode (mode=3) roundtrip ─────────────────────────

    #[test]
    fn fsopen_readwrite_mode_roundtrip() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_rw_roundtrip");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("rw.txt");

        // Open in read+write mode (creates file)
        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 3; // read+write
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;
        assert_ne!(handle as u32, 0xFFFFFFFF, "RW open should succeed");

        // Write "HELLO"
        for (i, &b) in b"HELLO".iter().enumerate() {
            vm.ram[0x6000 + i] = b as u32;
        }
        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 5;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();
        assert_eq!(vm.regs[0], 5);

        // Seek back to start by closing and reopening
        vm.regs[10] = handle as u32;
        let pc3 = vm.pc as usize;
        vm.ram[pc3] = 10;
        vm.op_fsclose();

        // Reopen in read mode
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc4 = vm.pc as usize;
        vm.ram[pc4] = 5;
        vm.ram[pc4 + 1] = 6;
        vm.op_fsopen();
        let read_handle = vm.regs[0] as usize;

        vm.regs[7] = read_handle as u32;
        vm.regs[8] = 0x7000;
        vm.regs[9] = 5;
        let pc5 = vm.pc as usize;
        vm.ram[pc5] = 7;
        vm.ram[pc5 + 1] = 8;
        vm.ram[pc5 + 2] = 9;
        vm.op_fsread();
        assert_eq!(vm.regs[0], 5);
        assert_eq!(vm.ram[0x7000], b'H' as u32);
        assert_eq!(vm.ram[0x7004], b'O' as u32);

        // Cleanup
        vm.host_file_handles[read_handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── Relative path resolution (relative to HOME) ────────────────

    #[test]
    fn fsopen_relative_path_resolves_from_home() {
        let mut vm = new_vm();
        let home = std::env::var("HOME").unwrap();
        let dir = std::path::PathBuf::from(&home)
            .join(".cache")
            .join("geos_test_relative");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("rel.txt");
        std::fs::write(&path, "relative").unwrap();

        // Use a relative path from HOME: .cache/geos_test_relative/rel.txt
        let rel_path = ".cache/geos_test_relative/rel.txt";
        write_string(&mut vm.ram, 0x5000, rel_path);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0; // read
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_ne!(vm.regs[0], 0xFFFFFFFF, "relative path should resolve");
        let handle = vm.regs[0] as usize;

        // Read to verify
        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 8;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fsread();
        assert_eq!(vm.regs[0], 8, "should read 8 bytes");

        // Verify content
        let mut buf = Vec::new();
        for i in 0..8 {
            buf.push((vm.ram[0x6000 + i] & 0xFF) as u8);
        }
        assert_eq!(String::from_utf8_lossy(&buf), "relative");

        // Cleanup
        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── Tilde expansion in FSOPEN ──────────────────────────────────

    #[test]
    fn fsopen_tilde_path_works() {
        let mut vm = new_vm();
        let home = std::env::var("HOME").unwrap();
        let dir = std::path::PathBuf::from(&home)
            .join(".cache")
            .join("geos_test_tilde");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("tilde.txt");
        std::fs::write(&path, "tilde").unwrap();

        // Use ~/ path
        let tilde_path = format!("~/.cache/geos_test_tilde/tilde.txt");
        write_string(&mut vm.ram, 0x5000, &tilde_path);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_ne!(vm.regs[0], 0xFFFFFFFF, "tilde path should work");
        let handle = vm.regs[0] as usize;
        vm.host_file_handles[handle] = None;

        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── FSOPEN with path exceeding MAX_PATH_LEN ────────────────────

    #[test]
    fn fsopen_path_too_long_returns_error() {
        let mut vm = new_vm();
        // Create a path longer than 512 chars
        let long_path = "a".repeat(600);
        write_string(&mut vm.ram, 0x5000, &long_path);
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();

        assert_eq!(vm.regs[0], 0xFFFFFFFF, "path > 512 chars should fail");
    }

    // ── Multiple sequential writes to same file ────────────────────

    #[test]
    fn fswrite_multiple_sequential_writes() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_multiwrite");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("multi.txt");

        // Open for write
        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;

        // First write: "AB"
        vm.ram[0x6000] = b'A' as u32;
        vm.ram[0x6001] = b'B' as u32;
        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 2;
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();
        assert_eq!(vm.regs[0], 2);

        // Second write: "CD"
        vm.ram[0x6000] = b'C' as u32;
        vm.ram[0x6001] = b'D' as u32;
        vm.regs[9] = 2;
        let pc3 = vm.pc as usize;
        vm.ram[pc3] = 7;
        vm.ram[pc3 + 1] = 8;
        vm.ram[pc3 + 2] = 9;
        vm.op_fswrite();
        assert_eq!(vm.regs[0], 2);

        // Close and verify
        vm.host_file_handles[handle] = None;
        let contents = std::fs::read_to_string(&path).unwrap();
        assert_eq!(contents, "ABCD", "sequential writes should concatenate");

        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── FSLS with subdirectories ───────────────────────────────────

    #[test]
    fn fsls_lists_subdirectories() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_fsls_subdir");
        let subdir = dir.join("subdir");
        std::fs::create_dir_all(&subdir).unwrap();
        std::fs::write(dir.join("file.txt"), "").unwrap();

        write_string(&mut vm.ram, 0x5000, dir.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0x6000;
        vm.regs[7] = 1024;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.ram[pc + 2] = 7;
        vm.op_fsls();

        assert_ne!(vm.regs[0], 0xFFFFFFFF);
        let bytes_written = vm.regs[0] as usize;
        let mut buf = Vec::new();
        for i in 0..bytes_written {
            buf.push((vm.ram[0x6000 + i] & 0xFF) as u8);
        }
        let listing = String::from_utf8_lossy(&buf);
        assert!(
            listing.contains("file.txt"),
            "listing should contain 'file.txt', got: {:?}",
            listing
        );
        assert!(
            listing.contains("subdir"),
            "listing should contain 'subdir', got: {:?}",
            listing
        );

        let _ = std::fs::remove_file(dir.join("file.txt"));
        let _ = std::fs::remove_dir(&subdir);
        let _ = std::fs::remove_dir(&dir);
    }

    // ── Zero-length read/write ─────────────────────────────────────

    #[test]
    fn fsread_zero_length_returns_zero() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_zeroread");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("zero.txt");
        std::fs::write(&path, "data").unwrap();

        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 0;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;

        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 0; // zero-length read
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fsread();

        assert_eq!(vm.regs[0], 0, "zero-length read should return 0");

        vm.host_file_handles[handle] = None;
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }

    #[test]
    fn fswrite_zero_length_succeeds() {
        let mut vm = new_vm();
        let dir = test_dir("geos_test_zerowrite");
        std::fs::create_dir_all(&dir).unwrap();
        let path = dir.join("zero.txt");

        write_string(&mut vm.ram, 0x5000, path.to_str().unwrap());
        vm.regs[5] = 0x5000;
        vm.regs[6] = 1;
        let pc = vm.pc as usize;
        vm.ram[pc] = 5;
        vm.ram[pc + 1] = 6;
        vm.op_fsopen();
        let handle = vm.regs[0] as usize;

        vm.regs[7] = handle as u32;
        vm.regs[8] = 0x6000;
        vm.regs[9] = 0; // zero-length write
        let pc2 = vm.pc as usize;
        vm.ram[pc2] = 7;
        vm.ram[pc2 + 1] = 8;
        vm.ram[pc2 + 2] = 9;
        vm.op_fswrite();

        assert_eq!(vm.regs[0], 0, "zero-length write should return 0");

        // File should exist but be empty
        vm.host_file_handles[handle] = None;
        let contents = std::fs::read_to_string(&path).unwrap();
        assert!(
            contents.is_empty(),
            "file should be empty after zero-length write"
        );

        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_dir(&dir);
    }
}
