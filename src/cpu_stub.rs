// CPU Stub - IPC Command Bridge between GPU VM and Host OS
//
// The CPU stub is Layer 1 of the 3-layer IPC architecture:
//
//   Layer 3 (GPU VM): Runs transpiled .glyph code. Sends IPC requests like
//                      read_block(device, block_num, dest_addr) via SEND opcode.
//   Layer 2 (Device Proxy VM): Thin .glyph shim. Receives IPC, formats a command
//                               struct in a dedicated texture region.
//   Layer 1 (CPU Stub): THIS FILE. Rust code outside the GPU. Polls the command
//                       buffer region in the texture. Executes the actual syscall
//                       (e.g., pread(fd, buf, offset)). Writes response back to a
//                       completion region.
//
// The CPU stub is NOT a VM. It is a regular Rust thread/function that runs
// alongside the GPU compute shader. It reads from the same wgpu texture that
// the shader writes to (via the substrate's shadow RAM).
//
// Command buffer format (8 x u32 = 32 bytes per command slot):
//
//   Offset  Field       Description
//   ------  ----------  ------------------------------------------
//   0       cmd_type    Command type (see CMD_* constants)
//   1       vm_id       Originating VM identifier
//   2       param1      First parameter (meaning depends on cmd_type)
//   3       param2      Second parameter
//   4       param3      Third parameter
//   5       param4      Fourth parameter
//   6       status      0=FREE, 1=PENDING, 2=COMPLETE, 3=ERROR
//   7       result      Result code (bytes read, fd handle, error code)
//
// Command types:
//   READ_BLOCK (1):  param1=device_fd, param2=block_num, param3=dest_addr, param4=block_size
//     -> result = bytes actually read
//   WRITE_BLOCK (2): param1=device_fd, param2=block_num, param3=src_addr, param4=block_size
//     -> result = bytes actually written
//   OPEN (3):        param1=device_id, param2=flags, param3=mode
//     -> result = file descriptor (or error)
//   CLOSE (4):       param1=device_fd
//     -> result = 0 on success
//   IOCTL (5):       param1=device_fd, param2=request_code, param3=arg_addr, param4=arg_len
//     -> result = return value of ioctl
//
// Data transfer: For READ_BLOCK, the stub reads from the file and writes the
// data into the substrate at dest_addr (param3). For WRITE_BLOCK, the stub
// reads data from the substrate at src_addr (param3) and writes to the file.
// Block size is param4 (must be <= MAX_BLOCK_SIZE).

use crate::substrate::Substrate;

// ── Command Types ──

/// Read a block from a device into substrate memory.
pub const CMD_READ_BLOCK: u32 = 1;
/// Write a block from substrate memory to a device.
pub const CMD_WRITE_BLOCK: u32 = 2;
/// Open a device/file.
pub const CMD_OPEN: u32 = 3;
/// Close a device/file.
pub const CMD_CLOSE: u32 = 4;
/// Device control operation.
pub const CMD_IOCTL: u32 = 5;

// ── Status Values ──

/// Command slot is free and available for writing.
pub const STATUS_FREE: u32 = 0;
/// Command has been written by VM and is pending execution.
pub const STATUS_PENDING: u32 = 1;
/// Command has been executed and result is available.
pub const STATUS_COMPLETE: u32 = 2;
/// Command execution failed. Check result field for error code.
pub const STATUS_ERROR: u32 = 3;

// ── Layout Constants ──

/// Number of u32 words per command slot.
pub const CMD_WORDS: usize = 8;
/// Byte size of one command slot (8 x 4 = 32 bytes).
pub const CMD_BYTES: usize = CMD_WORDS * 4;
/// Number of command slots in the command buffer.
pub const CMD_SLOTS: u32 = 16;
/// Total pixels occupied by the command buffer (16 slots x 8 words = 128 pixels).
pub const CMD_BUFFER_PIXELS: u32 = CMD_SLOTS * CMD_WORDS as u32;

/// Maximum block size for READ_BLOCK / WRITE_BLOCK (in bytes).
pub const MAX_BLOCK_SIZE: u32 = 4096;

/// Default command buffer base address in substrate (matches device_proxy.gasm).
pub const CMD_BUF_BASE: u32 = 0x00E20000;

/// Command slot size in pixels (alias for tests).
pub const CMD_SLOT_SIZE: u32 = CMD_WORDS as u32;

/// Public field offsets within a command slot (for tests and proxy integration).
pub mod offsets {
    pub const OFF_CMD_TYPE: u32 = 0;
    pub const OFF_VM_ID: u32 = 1;
    pub const OFF_PARAM1: u32 = 2;
    pub const OFF_PARAM2: u32 = 3;
    pub const OFF_PARAM3: u32 = 4;
    pub const OFF_PARAM4: u32 = 5;
    pub const OFF_STATUS: u32 = 6;
    pub const OFF_RESULT: u32 = 7;
}

/// Field indices within a command slot.
mod field {
    pub const CMD_TYPE: usize = 0;
    pub const VM_ID: usize = 1;
    pub const PARAM1: usize = 2;
    pub const PARAM2: usize = 3;
    pub const PARAM3: usize = 4;
    pub const PARAM4: usize = 5;
    pub const STATUS: usize = 6;
    pub const RESULT: usize = 7;
}

/// A single command parsed from the command buffer.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Command {
    pub cmd_type: u32,
    pub vm_id: u32,
    pub param1: u32,
    pub param2: u32,
    pub param3: u32,
    pub param4: u32,
}

/// Result of executing a command.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CommandResult {
    pub status: u32,
    pub result: u32,
}

/// Trait for executing CPU stub commands. Abstracted for testing.
pub trait CommandExecutor {
    /// Execute a command. Returns the status and result code.
    /// The substrate is provided for reading/writing data blocks.
    fn execute(&self, cmd: &Command, substrate: &Substrate) -> CommandResult;
}

/// File-backed command executor that performs real I/O.
pub struct FileExecutor;

impl CommandExecutor for FileExecutor {
    fn execute(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        match cmd.cmd_type {
            CMD_READ_BLOCK => self.read_block(cmd, substrate),
            CMD_WRITE_BLOCK => self.write_block(cmd, substrate),
            CMD_OPEN => self.open_file(cmd),
            CMD_CLOSE => self.close_file(cmd),
            CMD_IOCTL => CommandResult {
                status: STATUS_ERROR,
                result: 0xFFFF_FFFF, // IOCTL not yet implemented
            },
            _ => CommandResult {
                status: STATUS_ERROR,
                result: 0xFFFF_FFFE, // Unknown command
            },
        }
    }
}

impl FileExecutor {
    fn read_block(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        use std::fs::File;
        use std::io::{Read, Seek, SeekFrom};

        let fd = cmd.param1;
        let block_num = cmd.param2;
        let dest_addr = cmd.param3;
        let block_size = cmd.param4;

        if block_size == 0 || block_size > MAX_BLOCK_SIZE {
            return CommandResult {
                status: STATUS_ERROR,
                result: 0xFFFF_FFFD, // Invalid block size
            };
        }

        // fd is treated as a raw file descriptor (POSIX)
        let file = unsafe { File::from_raw_fd(fd as i32) };
        let mut borrowed = file; // avoid consuming the fd

        let offset = (block_num as u64) * (block_size as u64);
        if let Err(e) = borrowed.seek(SeekFrom::Start(offset)) {
            // Reconstruct the file so it doesn't close the fd on drop
            let _ = borrowed.into_raw_fd();
            return CommandResult {
                status: STATUS_ERROR,
                result: e.raw_os_error().unwrap_or(-1) as u32,
            };
        }

        let mut buf = vec![0u8; block_size as usize];
        match borrowed.read(&mut buf) {
            Ok(bytes_read) => {
                // Write data into substrate at dest_addr, one u32 at a time
                for i in (0..bytes_read).step_by(4) {
                    let mut word_bytes = [0u8; 4];
                    let end = (i + 4).min(bytes_read);
                    word_bytes[..end - i].copy_from_slice(&buf[i..end]);
                    let word = u32::from_le_bytes(word_bytes);
                    substrate.poke(dest_addr + (i / 4) as u32, word);
                }
                // Don't close the fd: reclaim it
                let _ = borrowed.into_raw_fd();
                CommandResult {
                    status: STATUS_COMPLETE,
                    result: bytes_read as u32,
                }
            }
            Err(e) => {
                let _ = borrowed.into_raw_fd();
                CommandResult {
                    status: STATUS_ERROR,
                    result: e.raw_os_error().unwrap_or(-1) as u32,
                }
            }
        }
    }

    fn write_block(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        use std::fs::File;
        use std::io::{Seek, SeekFrom, Write};

        let fd = cmd.param1;
        let block_num = cmd.param2;
        let src_addr = cmd.param3;
        let block_size = cmd.param4;

        if block_size == 0 || block_size > MAX_BLOCK_SIZE {
            return CommandResult {
                status: STATUS_ERROR,
                result: 0xFFFF_FFFD,
            };
        }

        let file = unsafe { File::from_raw_fd(fd as i32) };
        let mut borrowed = file;

        let offset = (block_num as u64) * (block_size as u64);
        if let Err(e) = borrowed.seek(SeekFrom::Start(offset)) {
            let _ = borrowed.into_raw_fd();
            return CommandResult {
                status: STATUS_ERROR,
                result: e.raw_os_error().unwrap_or(-1) as u32,
            };
        }

        // Read data from substrate at src_addr
        let word_count = (block_size + 3) / 4;
        let mut buf = Vec::with_capacity(block_size as usize);
        for i in 0..word_count {
            let word = substrate.peek(src_addr + i);
            buf.extend_from_slice(&word.to_le_bytes());
        }
        buf.truncate(block_size as usize);

        match borrowed.write_all(&buf) {
            Ok(()) => {
                let _ = borrowed.into_raw_fd();
                CommandResult {
                    status: STATUS_COMPLETE,
                    result: block_size,
                }
            }
            Err(e) => {
                let _ = borrowed.into_raw_fd();
                CommandResult {
                    status: STATUS_ERROR,
                    result: e.raw_os_error().unwrap_or(-1) as u32,
                }
            }
        }
    }

    fn open_file(&self, cmd: &Command) -> CommandResult {

        // For now, device_id maps to a path convention.
        // A real implementation would have a device table.
        // param2 = flags (O_RDONLY=0, O_WRONLY=1, O_RDWR=2)
        // param3 = mode (e.g. 0o644)
        let _device_id = cmd.param1;
        let _flags = cmd.param2;
        let _mode = cmd.param3;

        // Placeholder: actual path resolution needs a device registry
        CommandResult {
            status: STATUS_ERROR,
            result: 0xFFFF_FFFC, // No device registry yet
        }
    }

    fn close_file(&self, cmd: &Command) -> CommandResult {
        use std::fs::File;

        let fd = cmd.param1;
        let file = unsafe { File::from_raw_fd(fd as i32) };
        drop(file); // This closes the fd

        CommandResult {
            status: STATUS_COMPLETE,
            result: 0,
        }
    }
}

// Safety: We use from_raw_fd which is unsafe, and we carefully reclaim the fd
// with into_raw_fd to avoid double-close. This is correct as long as we never
// hand out the same fd to two concurrent operations.
use std::os::unix::io::{FromRawFd, IntoRawFd};

/// The CPU Stub: polls the command buffer in the substrate and executes commands.
pub struct CpuStub<E: CommandExecutor> {
    /// Base Hilbert address of the command buffer in the substrate.
    cmd_buffer_base: u32,
    /// The command executor (real I/O or mock for testing).
    executor: E,
}

impl<E: CommandExecutor> CpuStub<E> {
    /// Create a new CPU stub that operates on the command buffer at the given
    /// substrate address.
    pub fn new(cmd_buffer_base: u32, executor: E) -> Self {
        Self {
            cmd_buffer_base,
            executor,
        }
    }

    /// Read a single command slot from the substrate.
    /// Returns None if the slot is not in PENDING state.
    fn read_slot(&self, substrate: &Substrate, slot: u32) -> Option<Command> {
        let base = self.cmd_buffer_base + slot * CMD_WORDS as u32;
        let status = substrate.peek(base + field::STATUS as u32);
        if status != STATUS_PENDING {
            return None;
        }
        Some(Command {
            cmd_type: substrate.peek(base + field::CMD_TYPE as u32),
            vm_id: substrate.peek(base + field::VM_ID as u32),
            param1: substrate.peek(base + field::PARAM1 as u32),
            param2: substrate.peek(base + field::PARAM2 as u32),
            param3: substrate.peek(base + field::PARAM3 as u32),
            param4: substrate.peek(base + field::PARAM4 as u32),
        })
    }

    /// Write a result back to a command slot in the substrate.
    fn write_result(&self, substrate: &Substrate, slot: u32, result: &CommandResult) {
        let base = self.cmd_buffer_base + slot * CMD_WORDS as u32;
        substrate.poke(base + field::RESULT as u32, result.result);
        // Write status LAST so the VM sees COMPLETE/ERROR only after result is set.
        substrate.poke(base + field::STATUS as u32, result.status);
    }

    /// Poll all command slots once and execute any pending commands.
    /// Returns the number of commands executed.
    pub fn poll_once(&self, substrate: &Substrate) -> u32 {
        let mut executed = 0u32;
        for slot in 0..CMD_SLOTS {
            if let Some(cmd) = self.read_slot(substrate, slot) {
                let result = self.executor.execute(&cmd, substrate);
                self.write_result(substrate, slot, &result);
                executed += 1;
            }
        }
        executed
    }

    /// Run a continuous poll loop until `should_stop` returns true.
    /// Checks all slots each iteration, sleeps briefly between polls.
    #[allow(dead_code)]
    pub fn run_loop<F>(&self, substrate: &Substrate, mut should_stop: F)
    where
        F: FnMut() -> bool,
    {
        while !should_stop() {
            self.poll_once(substrate);
            std::thread::sleep(std::time::Duration::from_micros(100));
        }
    }

    /// Get the base address of the command buffer.
    #[allow(dead_code)]
    pub fn base_addr(&self) -> u32 {
        self.cmd_buffer_base
    }
}

/// Write a pending command into a substrate slot (for testing: simulates the VM side).
pub fn write_command(
    substrate: &Substrate,
    cmd_buffer_base: u32,
    slot: u32,
    cmd: &Command,
) {
    let base = cmd_buffer_base + slot * CMD_WORDS as u32;
    substrate.poke(base + field::CMD_TYPE as u32, cmd.cmd_type);
    substrate.poke(base + field::VM_ID as u32, cmd.vm_id);
    substrate.poke(base + field::PARAM1 as u32, cmd.param1);
    substrate.poke(base + field::PARAM2 as u32, cmd.param2);
    substrate.poke(base + field::PARAM3 as u32, cmd.param3);
    substrate.poke(base + field::PARAM4 as u32, cmd.param4);
    substrate.poke(base + field::RESULT as u32, 0);
    // Write status LAST to signal the stub.
    substrate.poke(base + field::STATUS as u32, STATUS_PENDING);
}

/// Read the status of a command slot.
pub fn read_slot_status(substrate: &Substrate, cmd_buffer_base: u32, slot: u32) -> u32 {
    let base = cmd_buffer_base + slot * CMD_WORDS as u32;
    substrate.peek(base + field::STATUS as u32)
}

/// Read the result field of a command slot.
pub fn read_slot_result(substrate: &Substrate, cmd_buffer_base: u32, slot: u32) -> u32 {
    let base = cmd_buffer_base + slot * CMD_WORDS as u32;
    substrate.peek(base + field::RESULT as u32)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::cell::RefCell;
    use std::rc::Rc;

    /// Mock executor that records commands and returns canned results.
    struct MockExecutor {
        calls: Rc<RefCell<Vec<Command>>>,
        results: Vec<CommandResult>,
    }

    impl MockExecutor {
        fn new(results: Vec<CommandResult>) -> (Self, Rc<RefCell<Vec<Command>>>) {
            let calls = Rc::new(RefCell::new(Vec::new()));
            let calls_clone = Rc::clone(&calls);
            (
                Self { calls, results },
                calls_clone,
            )
        }
    }

    impl CommandExecutor for MockExecutor {
        fn execute(&self, cmd: &Command, _substrate: &Substrate) -> CommandResult {
            self.calls.borrow_mut().push(cmd.clone());
            self.results.get(self.calls.borrow().len() - 1)
                .cloned()
                .unwrap_or(CommandResult {
                    status: STATUS_COMPLETE,
                    result: 42,
                })
        }
    }

    const TEST_CMD_BASE: u32 = 0x0002_0000; // Arbitrary address in allocatable range

    #[test]
    fn test_poll_empty_buffer() {
        let substrate = Substrate::new();
        let (executor, _calls) = MockExecutor::new(vec![]);
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        let count = stub.poll_once(&substrate);
        assert_eq!(count, 0);
    }

    #[test]
    fn test_single_command_read_block() {
        let substrate = Substrate::new();
        let expected_result = CommandResult {
            status: STATUS_COMPLETE,
            result: 512,
        };
        let (executor, calls) = MockExecutor::new(vec![expected_result.clone()]);
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        // Write a pending READ_BLOCK command into slot 0
        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_READ_BLOCK,
                vm_id: 3,
                param1: 10, // fd
                param2: 0,  // block_num
                param3: 0x0010_0000, // dest_addr
                param4: 512, // block_size
            },
        );

        // Poll once
        let count = stub.poll_once(&substrate);
        assert_eq!(count, 1);

        // Verify the executor received the command
        let recorded = calls.borrow();
        assert_eq!(recorded.len(), 1);
        assert_eq!(recorded[0].cmd_type, CMD_READ_BLOCK);
        assert_eq!(recorded[0].vm_id, 3);
        assert_eq!(recorded[0].param1, 10);

        // Verify the result was written back
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 0), STATUS_COMPLETE);
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 0), 512);
    }

    #[test]
    fn test_multiple_commands_in_sequence() {
        let substrate = Substrate::new();
        let results = vec![
            CommandResult { status: STATUS_COMPLETE, result: 512 },
            CommandResult { status: STATUS_COMPLETE, result: 0 },
            CommandResult { status: STATUS_COMPLETE, result: 256 },
        ];
        let (executor, calls) = MockExecutor::new(results);
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        // Write three commands into slots 0, 2, and 5
        write_command(&substrate, TEST_CMD_BASE, 0, &Command {
            cmd_type: CMD_READ_BLOCK, vm_id: 0,
            param1: 5, param2: 0, param3: 0x1000, param4: 512,
        });
        write_command(&substrate, TEST_CMD_BASE, 2, &Command {
            cmd_type: CMD_CLOSE, vm_id: 1,
            param1: 5, param2: 0, param3: 0, param4: 0,
        });
        write_command(&substrate, TEST_CMD_BASE, 5, &Command {
            cmd_type: CMD_WRITE_BLOCK, vm_id: 2,
            param1: 3, param2: 1, param3: 0x2000, param4: 256,
        });

        let count = stub.poll_once(&substrate);
        assert_eq!(count, 3);

        // All three slots should have results
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 0), STATUS_COMPLETE);
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 0), 512);

        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 2), STATUS_COMPLETE);
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 2), 0);

        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 5), STATUS_COMPLETE);
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 5), 256);

        // Verify order: slots are processed 0, 2, 5
        let recorded = calls.borrow();
        assert_eq!(recorded.len(), 3);
        assert_eq!(recorded[0].cmd_type, CMD_READ_BLOCK);
        assert_eq!(recorded[1].cmd_type, CMD_CLOSE);
        assert_eq!(recorded[2].cmd_type, CMD_WRITE_BLOCK);
    }

    #[test]
    fn test_completed_slot_not_repolled() {
        let substrate = Substrate::new();
        let (executor, calls) = MockExecutor::new(vec![
            CommandResult { status: STATUS_COMPLETE, result: 100 },
        ]);
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        write_command(&substrate, TEST_CMD_BASE, 0, &Command {
            cmd_type: CMD_READ_BLOCK, vm_id: 0,
            param1: 1, param2: 0, param3: 0, param4: 100,
        });

        // First poll executes it
        assert_eq!(stub.poll_once(&substrate), 1);

        // Second poll should NOT re-execute the completed slot
        assert_eq!(stub.poll_once(&substrate), 0);

        assert_eq!(calls.borrow().len(), 1);
    }

    #[test]
    fn test_error_result() {
        let substrate = Substrate::new();
        let (executor, _) = MockExecutor::new(vec![
            CommandResult { status: STATUS_ERROR, result: 0xFFFF_FFFD },
        ]);
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        write_command(&substrate, TEST_CMD_BASE, 0, &Command {
            cmd_type: 99, // Unknown command type
            vm_id: 0,
            param1: 0, param2: 0, param3: 0, param4: 0,
        });

        assert_eq!(stub.poll_once(&substrate), 1);
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 0), STATUS_ERROR);
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 0), 0xFFFF_FFFD);
    }

    /// Real integration test: uses FileExecutor with a temp file.
    /// Verifies that READ_BLOCK reads from an actual file into the substrate.
    #[test]
    fn test_read_block_from_file() {
        use std::fs;
        use std::io::Write;

        // Create a temp file with known content
        let dir = std::env::temp_dir().join("geo_cpu_stub_test");
        fs::create_dir_all(&dir).unwrap();
        let path = dir.join("test_block.bin");
        let mut file = fs::File::create(&path).unwrap();
        // Write 512 bytes: bytes 0-255 = 0xAA, bytes 256-511 = 0x55
        let mut data = vec![0xAAu8; 256];
        data.extend_from_slice(&[0x55u8; 256]);
        file.write_all(&data).unwrap();

        // Reopen to get a raw fd
        let file = fs::File::open(&path).unwrap();
        let fd = file.into_raw_fd();

        let substrate = Substrate::new();
        let executor = FileExecutor;
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        let dest_addr = 0x0003_0000u32; // Where to read data into

        // Write READ_BLOCK command: read block 0 (offset 0), 512 bytes, into dest_addr
        write_command(&substrate, TEST_CMD_BASE, 0, &Command {
            cmd_type: CMD_READ_BLOCK,
            vm_id: 0,
            param1: fd as u32,
            param2: 0, // block_num
            param3: dest_addr,
            param4: 512,
        });

        let count = stub.poll_once(&substrate);
        assert_eq!(count, 1);
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 0), STATUS_COMPLETE);
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 0), 512);

        // Verify data was written into substrate
        // First u32 at dest_addr should be 0xAAAAAAAA (four 0xAA bytes)
        let word0 = substrate.peek(dest_addr);
        assert_eq!(word0, 0xAAAA_AAAA);

        // Check a word in the second half (0x55 region)
        let word64 = substrate.peek(dest_addr + 64);
        assert_eq!(word64, 0x5555_5555);

        // Clean up fd
        unsafe { std::fs::File::from_raw_fd(fd) }; // close it
        let _ = fs::remove_file(&path);
    }

    #[test]
    fn test_command_format_documented() {
        // Verify all constants are distinct and sensible
        assert_ne!(CMD_READ_BLOCK, CMD_WRITE_BLOCK);
        assert_ne!(CMD_OPEN, CMD_CLOSE);
        assert_ne!(STATUS_FREE, STATUS_PENDING);
        assert_ne!(STATUS_COMPLETE, STATUS_ERROR);

        // Verify command slot size
        assert_eq!(CMD_WORDS, 8);
        assert_eq!(CMD_BYTES, 32);
        assert_eq!(CMD_BUFFER_PIXELS, CMD_SLOTS * CMD_WORDS as u32);
    }
}
