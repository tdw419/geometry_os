/// Phase 171: Memory Palace Filesystem Bridge
/// FILEOPEN, FILEREAD, FILEWRITE, FILECREATE, FILELIST opcodes
/// Allows Geometry OS programs to read/write the Memory Palace using spatial coordinates (ring, angle).
/// Maps (ring, angle) → ~/.geometry_os/vmfs/<ring_dir>/file_<angle>.dat
/// NOTE: VMFS binary storage is separate from the Palace FUSE fact store
/// at ~/mnt/memory_palace/ to avoid UTF-8/JSON corruption of binary data.
use super::types::*;
use super::Vm;
use std::fs;
use std::io::{Read, Write};
use std::path::PathBuf;

/// Ring directory names in the Memory Palace
const RING_DIRS: [&str; 3] = ["inner_ring", "middle_ring", "outer_ring"];

/// Maximum angle (0-359)
const MAX_ANGLE: u32 = 359;

/// Maximum bytes per FILEREAD/FILEWRITE call
const MAX_IO_CHUNK: usize = 4096;

/// Maximum directory listing size (bytes)
const MAX_DIR_BUF: usize = 4096;

/// Construct the palace path for a given ring and angle.
/// Returns None if ring or angle is invalid.
fn palace_path_for_coords(ring: u32, angle: u32) -> Option<PathBuf> {
    if ring > 2 || angle > MAX_ANGLE {
        return None;
    }
    let ring_dir = RING_DIRS.get(ring as usize)?;
    let home = std::env::var("HOME").unwrap_or_else(|_| "/tmp".to_string());
    let base = PathBuf::from(home).join(".geometry_os/vmfs").join(ring_dir);
    Some(base)
}

/// Find the first matching fact file for a given ring and angle.
/// Pattern: fact_<angle>_* in the ring directory.
/// Returns full path to the file, or None if no match.
fn find_fact_file(ring: u32, angle: u32) -> Option<PathBuf> {
    let base = palace_path_for_coords(ring, angle)?;
    if !base.exists() {
        return None;
    }

    let prefix = format!("fact_{:03}_", angle);
    if let Ok(entries) = fs::read_dir(&base) {
        for entry in entries.flatten() {
            if let Ok(name) = entry.file_name().into_string() {
                if name.starts_with(&prefix) {
                    return Some(entry.path());
                }
            }
        }
    }
    None
}

/// Generate a unique filename for a new fact in the given ring and angle.
/// Pattern: fact_<angle>_<timestamp>_<random>.txt
fn new_fact_filename(angle: u32) -> String {
    use std::time::{SystemTime, UNIX_EPOCH};
    let ts = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_secs();
    let rnd = (ts & 0xFFF) as u32; // simple per-second uniqueness
    format!("fact_{:03}_{:09}_{:03X}.txt", angle, ts, rnd)
}

impl Vm {
    /// FILEOPEN ring, angle  (0xD0) -- Open a Memory Palace file at spatial coordinates.
    /// Reads ring and angle from immediate operands (not registers).
    /// Returns: handle index in r0 (0..MAX_HOST_FILES-1), or 0xFFFFFFFF on error.
    /// Encoding: 3 words [0xD0, ring, angle]
    pub(crate) fn op_fileopen(&mut self) {
        let ring = self.fetch();
        let angle = self.fetch();

        // Validate ring and angle
        if ring > 2 || angle > MAX_ANGLE {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        // Find the fact file
        let fact_path = match find_fact_file(ring, angle) {
            Some(p) => p,
            None => {
                self.regs[0] = geos_errno(GEOS_ENOENT);
                return;
            },
        };

        // Convert path to string and delegate to FSOPEN logic
        let path_str = match fact_path.to_str() {
            Some(s) => s.to_string(),
            None => {
                self.regs[0] = geos_errno(GEOS_EINVAL);
                return;
            },
        };

        // Follow FSOPEN mode=0 (read-only) for simplicity; can extend with mode operand
        let mode = 0u32;

        // Allocate a handle in host_file_handles table (reusing FS infrastructure)
        // Note: In a clean implementation, we would call self.host_fs_open(&path_str, mode)
        // here to avoid code duplication. For now, inline the minimal logic.
        let handle_idx = self.host_file_handles.iter().position(|h| h.is_none());
        let handle_idx = match handle_idx {
            Some(i) => i,
            None => {
                self.regs[0] = geos_errno(GEOS_ENFILE); // too many open files
                return;
            },
        };

        // Open the file (read-only)
        match std::fs::File::open(&path_str) {
            Ok(file) => {
                self.host_file_handles[handle_idx] = Some((file, 0u8));
                self.regs[0] = handle_idx as u32;
            },
            Err(_) => {
                self.regs[0] = geos_errno(GEOS_EACCES);
            },
        }
    }

    /// FILEREAD handle_reg, buf_reg, len_reg  (0xD1) -- Read from a Memory Palace file.
    /// Uses the same handle pool as FS* opcodes.
    /// Returns: bytes read in r0, or error code.
    /// Encoding: 4 words [0xD1, handle_reg, buf_reg, len_reg]
    pub(crate) fn op_fileread(&mut self) {
        let handle_reg = self.fetch() as usize;
        let buf_reg = self.fetch() as usize;
        let len_reg = self.fetch() as usize;

        if handle_reg >= NUM_REGS || buf_reg >= NUM_REGS || len_reg >= NUM_REGS {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        let handle_idx = self.regs[handle_reg] as usize;
        let buf_addr = self.regs[buf_reg] as usize;
        let mut len = self.regs[len_reg] as usize;

        if len > MAX_IO_CHUNK {
            len = MAX_IO_CHUNK;
        }

        // Validate handle
        if handle_idx >= self.host_file_handles.len() {
            self.regs[0] = geos_errno(GEOS_EBADF);
            return;
        }

        let file = match &mut self.host_file_handles[handle_idx] {
            Some((f, _mode)) => f,
            None => {
                self.regs[0] = geos_errno(GEOS_EBADF);
                return;
            },
        };

        // Read into RAM buffer (treating RAM as u8 bytes)
        let ram_bytes = unsafe {
            std::slice::from_raw_parts_mut(self.ram.as_mut_ptr() as *mut u8, self.ram.len() * 4)
        };

        // Ensure buffer fits in RAM
        if buf_addr + len > ram_bytes.len() {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        match file.read(&mut ram_bytes[buf_addr..buf_addr + len]) {
            Ok(n) => {
                self.regs[0] = n as u32;
            },
            Err(_) => {
                self.regs[0] = geos_errno(GEOS_EIO);
            },
        }
    }

    /// FILEWRITE handle_reg, buf_reg, len_reg  (0xD2) -- Write to a Memory Palace file.
    /// Returns: bytes written in r0, or error code.
    /// Encoding: 4 words [0xD2, handle_reg, buf_reg, len_reg]
    pub(crate) fn op_filewrite(&mut self) {
        let handle_reg = self.fetch() as usize;
        let buf_reg = self.fetch() as usize;
        let len_reg = self.fetch() as usize;

        if handle_reg >= NUM_REGS || buf_reg >= NUM_REGS || len_reg >= NUM_REGS {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        let handle_idx = self.regs[handle_reg] as usize;
        let buf_addr = self.regs[buf_reg] as usize;
        let mut len = self.regs[len_reg] as usize;

        if len > MAX_IO_CHUNK {
            len = MAX_IO_CHUNK;
        }

        // Validate handle
        if handle_idx >= self.host_file_handles.len() {
            self.regs[0] = geos_errno(GEOS_EBADF);
            return;
        }

        let file = match &mut self.host_file_handles[handle_idx] {
            Some((f, _mode)) => f,
            None => {
                self.regs[0] = geos_errno(GEOS_EBADF);
                return;
            },
        };

        // Read from RAM buffer
        let ram_bytes = unsafe {
            std::slice::from_raw_parts(self.ram.as_ptr() as *const u8, self.ram.len() * 4)
        };

        // Ensure buffer fits in RAM
        if buf_addr + len > ram_bytes.len() {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        match file.write(&ram_bytes[buf_addr..buf_addr + len]) {
            Ok(n) => {
                self.regs[0] = n as u32;
                // Auto-flush for immediate visibility
                let _ = file.flush();
            },
            Err(_) => {
                self.regs[0] = geos_errno(GEOS_EIO);
            },
        }
    }

    /// FILECREATE ring, angle, size_hint  (0xD3) -- Create a new Memory Palace file at spatial coordinates.
    /// Reads ring and angle from immediate operands; size_hint from register.
    /// Returns: handle index in r0 (0..MAX_HOST_FILES-1), or 0xFFFFFFFF on error.
    /// Encoding: 4 words [0xD3, ring, angle, size_hint_reg]
    pub(crate) fn op_filecreate(&mut self) {
        let ring = self.fetch();
        let angle = self.fetch();
        let size_hint_reg = self.fetch() as usize;

        if size_hint_reg >= NUM_REGS {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        if ring > 2 || angle > MAX_ANGLE {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        // Get the ring directory path
        let base = match palace_path_for_coords(ring, angle) {
            Some(p) => p,
            None => {
                self.regs[0] = geos_errno(GEOS_EINVAL);
                return;
            },
        };

        // Ensure ring directory exists
        if !base.exists() {
            if fs::create_dir_all(&base).is_err() {
                self.regs[0] = geos_errno(GEOS_EACCES);
                return;
            }
        }

        // Generate a unique filename
        let filename = new_fact_filename(angle);
        let fact_path = base.join(&filename);

        // Allocate a handle
        let handle_idx = self.host_file_handles.iter().position(|h| h.is_none());
        let handle_idx = match handle_idx {
            Some(i) => i,
            None => {
                self.regs[0] = geos_errno(GEOS_ENFILE);
                return;
            },
        };

        // Create the file (write mode)
        match std::fs::File::create(&fact_path) {
            Ok(file) => {
                self.host_file_handles[handle_idx] = Some((file, 2u8));
                self.regs[0] = handle_idx as u32;
            },
            Err(_) => {
                self.regs[0] = geos_errno(GEOS_EACCES);
            },
        }
    }

    /// FILELIST ring, buf_reg, max_len_reg  (0xD4) -- List files in a Memory Palace ring.
    /// Returns: list length in r0, or error code.
    /// Encoding: 4 words [0xD4, ring, buf_reg, max_len_reg]
    pub(crate) fn op_filelist(&mut self) {
        let ring = self.fetch();
        let buf_reg = self.fetch() as usize;
        let max_len_reg = self.fetch() as usize;

        if buf_reg >= NUM_REGS || max_len_reg >= NUM_REGS {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        let buf_addr = self.regs[buf_reg] as usize;
        let max_len = self.regs[max_len_reg] as usize;

        if ring > 2 {
            self.regs[0] = geos_errno(GEOS_EINVAL);
            return;
        }

        // Get the ring directory
        let base = match palace_path_for_coords(ring, 0) {
            Some(p) => p,
            None => {
                self.regs[0] = geos_errno(GEOS_EINVAL);
                return;
            },
        };

        if !base.exists() {
            self.regs[0] = 0; // empty directory
            return;
        }

        // Collect filenames
        let mut entries: Vec<String> = Vec::new();
        if let Ok(dir_iter) = fs::read_dir(&base) {
            for entry in dir_iter.flatten() {
                if let Ok(name) = entry.file_name().into_string() {
                    entries.push(name);
                }
            }
        }

        // Sort entries
        entries.sort();

        // Format listing (newline-separated)
        let listing = entries.join("\n");
        let bytes = listing.as_bytes();
        let copy_len = std::cmp::min(bytes.len(), max_len.min(MAX_DIR_BUF));

        // Write to RAM buffer
        let ram_bytes = unsafe {
            std::slice::from_raw_parts_mut(self.ram.as_mut_ptr() as *mut u8, self.ram.len() * 4)
        };

        if buf_addr + copy_len <= ram_bytes.len() {
            ram_bytes[buf_addr..buf_addr + copy_len].copy_from_slice(&bytes[..copy_len]);
            self.regs[0] = copy_len as u32;
        } else {
            self.regs[0] = geos_errno(GEOS_EINVAL);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::Vm;

    fn geos_errno(code: u32) -> u32 {
        0xFFFFFFFFu32.saturating_sub(code)
    }

    fn is_geos_errno(v: u32) -> bool {
        v & 0xFF000000 != 0
    }

    /// Setup a minimal Memory Palace test structure
    fn setup_test_palace() -> std::io::Result<()> {
        let home = std::env::var("HOME").unwrap_or_else(|_| "/tmp".to_string());
        let base = PathBuf::from(home).join(".geometry_os/vmfs");

        // Create ring directories
        fs::create_dir_all(base.join("inner_ring"))?;
        fs::create_dir_all(base.join("middle_ring"))?;
        fs::create_dir_all(base.join("outer_ring"))?;

        // Create a test fact file
        let fact = base.join("inner_ring/fact_045_000000001234_ABC.txt");
        fs::write(&fact, b"Hello from inner ring angle 045!")?;

        Ok(())
    }

    #[test]
    fn test_palace_path_for_coords() {
        let p0 = palace_path_for_coords(0, 45);
        assert!(p0.is_some());
        assert!(p0.unwrap().ends_with(".geometry_os/vmfs/inner_ring"));

        let p1 = palace_path_for_coords(1, 30);
        assert!(p1.is_some());
        assert!(p1.unwrap().ends_with(".geometry_os/vmfs/middle_ring"));

        let p2 = palace_path_for_coords(2, 60);
        assert!(p2.is_some());
        assert!(p2.unwrap().ends_with(".geometry_os/vmfs/outer_ring"));

        // Invalid ring
        assert!(palace_path_for_coords(3, 0).is_none());
        // Invalid angle
        assert!(palace_path_for_coords(0, 360).is_none());
    }

    #[test]
    fn test_find_fact_file() {
        setup_test_palace().expect("failed to setup test palace");

        let p = find_fact_file(0, 45);
        assert!(p.is_some());
        assert!(p.unwrap().to_str().unwrap().contains("fact_045"));

        // Non-existent angle
        assert!(find_fact_file(0, 999).is_none());
    }

    #[test]
    fn test_new_fact_filename() {
        let f = new_fact_filename(120);
        assert!(f.starts_with("fact_120_"));
        assert!(f.ends_with(".txt"));
    }

    #[test]
    fn test_fileopen_fileread_integration() {
        setup_test_palace().expect("failed to setup test palace");

        let mut vm = Vm::new();
        vm.pc = 0x1000;

        // Set up RAM with minimal program data
        // LDI r0, 0; LDI r1, 0; LDI r2, 45; ... (not needed for this unit test)
        // Directly call the opcode handler
        vm.pc = 0x1000;
        vm.ram[vm.pc as usize] = 0xD0; // FILEOPEN
        vm.ram[(vm.pc + 1) as usize] = 0; // ring
        vm.ram[(vm.pc + 2) as usize] = 45; // angle
        vm.pc = 0x1001; // Skip the opcode so that the operands are fetched correctly

        vm.op_fileopen();

        assert!(
            !is_geos_errno(vm.regs[0]),
            "FILEOPEN should succeed, got 0x{:X}",
            vm.regs[0]
        );

        let handle = vm.regs[0] as usize;
        // Read using FILEREAD
        vm.pc = 0x1010;
        vm.ram[vm.pc as usize] = 0xD1; // FILEREAD
        vm.ram[(vm.pc + 1) as usize] = 1; // handle_reg = r1
        vm.ram[(vm.pc + 2) as usize] = 2; // buf_reg = r2
        vm.ram[(vm.pc + 3) as usize] = 3; // len_reg = r3
        vm.pc = 0x1011; // Skip the opcode so that the operands are fetched correctly
        let buf_addr = 0x2000;
        vm.regs[1] = handle as u32; // handle_reg
        vm.regs[2] = buf_addr as u32; // buf_reg
        vm.regs[3] = 100; // len_reg

        vm.op_fileread();

        assert!(!is_geos_errno(vm.regs[0]), "FILEREAD should succeed");
        let bytes_read = vm.regs[0] as usize;
        assert!(bytes_read > 0);

        // Verify content
        let ram_bytes =
            unsafe { std::slice::from_raw_parts(vm.ram.as_ptr() as *const u8, vm.ram.len() * 4) };
        let content = std::str::from_utf8(&ram_bytes[buf_addr..buf_addr + bytes_read]).unwrap();
        assert!(content.contains("Hello from inner ring angle 045"));
    }

    #[test]
    fn test_fileopen_invalid_ring() {
        let mut vm = Vm::new();
        vm.pc = 0x1000;
        vm.ram[vm.pc as usize] = 0xD0;
        vm.ram[(vm.pc + 1) as usize] = 3; // invalid ring
        vm.ram[(vm.pc + 2) as usize] = 45;

        vm.op_fileopen();

        assert!(
            is_geos_errno(vm.regs[0]),
            "FILEOPEN should fail for invalid ring"
        );
    }

    #[test]
    fn test_fileopen_invalid_angle() {
        let mut vm = Vm::new();
        vm.pc = 0x1000;
        vm.ram[vm.pc as usize] = 0xD0;
        vm.ram[(vm.pc + 1) as usize] = 0;
        vm.ram[(vm.pc + 2) as usize] = 360; // invalid angle

        vm.op_fileopen();

        assert!(
            is_geos_errno(vm.regs[0]),
            "FILEOPEN should fail for invalid angle"
        );
    }

    #[test]
    fn test_filecreate_filewrite_integration() {
        // Clean up any existing fact files for angle 120
        if let Some(dir) = palace_path_for_coords(0, 120) {
            if let Ok(entries) = fs::read_dir(&dir) {
                for entry in entries.flatten() {
                    if let Ok(name) = entry.file_name().into_string() {
                        if name.starts_with("fact_120_") {
                            let _ = fs::remove_file(entry.path());
                        }
                    }
                }
            }
        }

        setup_test_palace().expect("failed to setup test palace");

        let mut vm = Vm::new();

        vm.pc = 0x1000;
        vm.ram[vm.pc as usize] = 0xD3;
        vm.ram[(vm.pc + 1) as usize] = 0; // ring
        vm.ram[(vm.pc + 2) as usize] = 120; // angle
        vm.ram[(vm.pc + 3) as usize] = 3; // size_hint_reg
        vm.pc = 0x1001; // Skip the opcode so that the operands are fetched correctly

        vm.regs[3] = 256;
        vm.op_filecreate();

        assert!(!is_geos_errno(vm.regs[0]), "FILECREATE should succeed");

        let handle = vm.regs[0] as usize;

        // Prepare data in RAM
        let write_buf = 0x2000;
        let data = b"Test fact at angle 120";
        let ram_bytes = unsafe {
            std::slice::from_raw_parts_mut(vm.ram.as_mut_ptr() as *mut u8, vm.ram.len() * 4)
        };
        ram_bytes[write_buf..write_buf + data.len()].copy_from_slice(data);

        // Write using FILEWRITE
        vm.pc = 0x1010;
        vm.ram[vm.pc as usize] = 0xD2; // FILEWRITE
        vm.ram[(vm.pc + 1) as usize] = 1; // handle_reg = r1
        vm.ram[(vm.pc + 2) as usize] = 2; // buf_reg = r2
        vm.ram[(vm.pc + 3) as usize] = 3; // len_reg = r3
        vm.pc = 0x1011; // Skip the opcode so that the operands are fetched correctly
        vm.regs[1] = handle as u32; // handle_reg
        vm.regs[2] = write_buf as u32; // buf_reg
        vm.regs[3] = data.len() as u32; // len_reg

        vm.op_filewrite();

        assert!(!is_geos_errno(vm.regs[0]), "FILEWRITE should succeed");
        assert_eq!(vm.regs[0], data.len() as u32);

        // Verify file was written
        let fact_path = find_fact_file(0, 120).expect("created fact should exist");
        let content = fs::read_to_string(&fact_path).expect("should read file");
        assert_eq!(content, "Test fact at angle 120");
    }

    #[test]
    fn test_filelist() {
        setup_test_palace().expect("failed to setup test palace");

        let mut vm = Vm::new();

        vm.pc = 0x1000;
        vm.ram[vm.pc as usize] = 0xD4;
        vm.ram[(vm.pc + 1) as usize] = 0; // ring
        vm.ram[(vm.pc + 2) as usize] = 2; // buf_reg
        vm.ram[(vm.pc + 3) as usize] = 3; // max_len_reg
        vm.pc = 0x1001; // Skip the opcode so that the operands are fetched correctly

        vm.regs[2] = 0x2000;
        vm.regs[3] = 4096;

        vm.op_filelist();

        assert!(!is_geos_errno(vm.regs[0]), "FILELIST should succeed");
        assert!(vm.regs[0] > 0, "FILELIST should return non-zero length");

        // Verify listing contains the test fact
        let ram_bytes =
            unsafe { std::slice::from_raw_parts(vm.ram.as_ptr() as *const u8, vm.ram.len() * 4) };
        let buf_addr = vm.regs[2] as usize;
        let len = vm.regs[0] as usize;
        let listing = std::str::from_utf8(&ram_bytes[buf_addr..buf_addr + len]).unwrap();
        assert!(listing.contains("fact_045"));
    }

    #[test]
    fn test_filelist_invalid_ring() {
        let mut vm = Vm::new();
        vm.pc = 0x1000;
        vm.ram[vm.pc as usize] = 0xD4;
        vm.ram[(vm.pc + 1) as usize] = 3; // invalid ring
        vm.ram[(vm.pc + 2) as usize] = 2;
        vm.ram[(vm.pc + 3) as usize] = 3;

        vm.op_filelist();

        assert!(
            is_geos_errno(vm.regs[0]),
            "FILELIST should fail for invalid ring"
        );
    }
}
