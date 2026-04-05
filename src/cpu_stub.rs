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
/// Execute a SQL query. param1=addr of SQL string, param2=addr of result buffer, param3=buffer size.
pub const CMD_SQL_QUERY: u32 = 6;
/// Call an LLM model. param1=addr of prompt string, param2=addr of response buffer, param3=buffer size, param4=model flags.
pub const CMD_MODEL_CALL: u32 = 7;
/// Read a status value. param1=addr of key string, param2=addr for value (u32).
pub const CMD_STATUS_READ: u32 = 8;
/// Write a status value. param1=addr of key string, param2=value (u32).
pub const CMD_STATUS_WRITE: u32 = 9;

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

// ── Agent Executor ──

/// Read a null-terminated string from substrate memory starting at byte address `addr`.
/// Reads up to `max_len` bytes. Returns the string without the null terminator.
pub fn read_substrate_string(substrate: &Substrate, addr: u32, max_len: usize) -> String {
    let mut bytes = Vec::with_capacity(max_len);
    for i in 0..max_len {
        let b = substrate.peek_byte(addr + i as u32);
        if b == 0 {
            break;
        }
        bytes.push(b);
    }
    String::from_utf8_lossy(&bytes).into_owned()
}

/// Write a string as null-terminated bytes into substrate memory at byte address `addr`.
/// Returns the number of bytes written (including null terminator).
pub fn write_substrate_string(substrate: &Substrate, addr: u32, s: &str, max_len: usize) -> usize {
    let bytes = s.as_bytes();
    let write_len = bytes.len().min(max_len - 1); // leave room for null
    for (i, &b) in bytes.iter().take(write_len).enumerate() {
        substrate.poke_byte(addr + i as u32, b);
    }
    substrate.poke_byte(addr + write_len as u32, 0); // null terminator
    write_len + 1
}

/// In-memory status store for CMD_STATUS_READ / CMD_STATUS_WRITE.
/// Maps string keys to u32 values. Used by the agent loop to persist state
/// across iterations (mutation count, best fitness, explore/exploit mode).
pub type StatusStore = std::collections::HashMap<String, u32>;

/// Configuration for CMD_MODEL_CALL (LLM inference).
///
/// Supports Ollama (default: http://localhost:11434/api/generate) or any
/// OpenAI-compatible endpoint. Set via env vars or `with_model_config()`.
///
/// Env vars:
///   GEO_MODEL_URL  - full API URL (default: http://localhost:11434/api/generate)
///   GEO_MODEL_NAME - model identifier (default: "llama3")
///   GEO_MODEL_KEY  - API key (default: "", used for OpenAI-compatible endpoints)
#[derive(Clone, Debug)]
pub struct ModelConfig {
    pub endpoint: String,
    pub model: String,
    pub api_key: String,
    pub timeout_secs: u64,
}

impl Default for ModelConfig {
    fn default() -> Self {
        Self {
            endpoint: std::env::var("GEO_MODEL_URL")
                .unwrap_or_else(|_| "http://localhost:11434/api/generate".into()),
            model: std::env::var("GEO_MODEL_NAME")
                .unwrap_or_else(|_| "llama3".into()),
            api_key: std::env::var("GEO_MODEL_KEY").unwrap_or_default(),
            timeout_secs: 30,
        }
    }
}

/// Agent-capable command executor.
///
/// Handles all 9 command types:
/// - Commands 1-5 (READ_BLOCK through IOCTL): delegated to FileExecutor
/// - Command 6 (SQL_QUERY): executes SQL via in-memory SQLite, writes TSV results to substrate
/// - Command 7 (MODEL_CALL): calls an LLM via HTTP, writes response to substrate
/// - Command 8 (STATUS_READ): reads from the in-memory status store
/// - Command 9 (STATUS_WRITE): writes to the in-memory status store
///
/// The status store is shared via `Rc<RefCell<>>` so tests can inspect it.
pub struct AgentExecutor {
    file_executor: FileExecutor,
    status: Rc<RefCell<StatusStore>>,
    db: RefCell<rusqlite::Connection>,
    model_config: ModelConfig,
}

impl AgentExecutor {
    pub fn new() -> Self {
        let conn = rusqlite::Connection::open_in_memory()
            .expect("failed to open in-memory SQLite database");
        Self {
            file_executor: FileExecutor,
            status: Rc::new(RefCell::new(StatusStore::new())),
            db: RefCell::new(conn),
            model_config: ModelConfig::default(),
        }
    }

    /// Create with a reference to an existing database connection (for sharing).
    pub fn with_db(db: RefCell<rusqlite::Connection>) -> Self {
        Self {
            file_executor: FileExecutor,
            status: Rc::new(RefCell::new(StatusStore::new())),
            db,
            model_config: ModelConfig::default(),
        }
    }

    /// Create with a custom model config for LLM calls.
    pub fn with_model_config(model_config: ModelConfig) -> Self {
        let conn = rusqlite::Connection::open_in_memory()
            .expect("failed to open in-memory SQLite database");
        Self {
            file_executor: FileExecutor,
            status: Rc::new(RefCell::new(StatusStore::new())),
            db: RefCell::new(conn),
            model_config,
        }
    }

    /// Get a clone of the status store handle for inspection in tests.
    pub fn status_handle(&self) -> Rc<RefCell<StatusStore>> {
        Rc::clone(&self.status)
    }

    fn handle_sql_query(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        let sql = read_substrate_string(substrate, cmd.param1, 4096);
        let result_addr = cmd.param2;
        let buf_size = cmd.param3 as usize;

        if buf_size == 0 {
            return CommandResult {
                status: STATUS_ERROR,
                result: 0xFFFF_FFFC, // buffer too small
            };
        }

        let db = self.db.borrow();
        let mut result_text = String::new();

        // Check if it's a SELECT (returns rows) or a mutation (returns affected rows)
        let sql_trimmed = sql.trim().to_uppercase();
        if sql_trimmed.starts_with("SELECT") || sql_trimmed.starts_with("PRAGMA") {
            match db.prepare(&sql) {
                Ok(mut stmt) => {
                    let col_count = stmt.column_count();
                    // Write header
                    for i in 0..col_count {
                        if i > 0 {
                            result_text.push('\t');
                        }
                        let name = stmt.column_name(i).unwrap_or("?");
                        result_text.push_str(name);
                    }
                    result_text.push('\n');

                    // Write rows (limit to prevent overflow)
                    let mut rows = stmt.query([]).unwrap();
                    let mut _row_count = 0u32;
                    while let Ok(Some(row)) = rows.next() {
                        for i in 0..col_count {
                            if i > 0 {
                                result_text.push('\t');
                            }
                            // Try String first, then fall back to i64 -> string
                            let val: String = row
                                .get(i)
                                .unwrap_or_else(|_| {
                                    row.get::<_, i64>(i)
                                        .map(|v| v.to_string())
                                        .unwrap_or_else(|_| "NULL".into())
                                });
                            result_text.push_str(&val);
                        }
                        result_text.push('\n');
                        _row_count += 1;
                        if result_text.len() > buf_size - 1 {
                            break;
                        }
                    }
                }
                Err(e) => {
                    let err = format!("SQL error: {}\n", e);
                    let written = write_substrate_string(substrate, result_addr, &err, buf_size);
                    return CommandResult {
                        status: STATUS_ERROR,
                        result: written as u32,
                    };
                }
            }
        } else {
            // Mutation: INSERT, UPDATE, DELETE, CREATE TABLE, etc.
            match db.execute(&sql, []) {
                Ok(affected) => {
                    result_text = format!("OK\t{}\n", affected);
                }
                Err(e) => {
                    let err = format!("SQL error: {}\n", e);
                    let written = write_substrate_string(substrate, result_addr, &err, buf_size);
                    return CommandResult {
                        status: STATUS_ERROR,
                        result: written as u32,
                    };
                }
            }
        }

        let written = write_substrate_string(substrate, result_addr, &result_text, buf_size);
        CommandResult {
            status: STATUS_COMPLETE,
            result: written as u32,
        }
    }

    fn handle_status_read(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        let key = read_substrate_string(substrate, cmd.param1, 256);
        let store = self.status.borrow();
        match store.get(&key) {
            Some(&value) => {
                substrate.poke(cmd.param2, value);
                CommandResult {
                    status: STATUS_COMPLETE,
                    result: 1, // key found
                }
            }
            None => CommandResult {
                status: STATUS_COMPLETE,
                result: 0, // key not found
            },
        }
    }

    fn handle_status_write(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        let key = read_substrate_string(substrate, cmd.param1, 256);
        let mut store = self.status.borrow_mut();
        store.insert(key, cmd.param2);
        CommandResult {
            status: STATUS_COMPLETE,
            result: 0,
        }
    }

    /// Handle CMD_MODEL_CALL: send prompt to LLM, write response to substrate.
    ///
    /// Protocol:
    ///   param1 = prompt address (null-terminated string in substrate)
    ///   param2 = response buffer address
    ///   param3 = response buffer size (bytes)
    ///   param4 = max_tokens for generation (0 = use default)
    ///
    /// Supports Ollama (/api/generate) and OpenAI-compatible (/v1/chat/completions).
    /// Auto-detects based on endpoint URL containing "/v1/" or "/chat/".
    fn handle_model_call(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        let prompt = read_substrate_string(substrate, cmd.param1, 8192);
        let response_addr = cmd.param2;
        let buf_size = cmd.param3 as usize;
        let max_tokens = if cmd.param4 > 0 { cmd.param4 } else { 512 };

        let is_ollama = !self.model_config.endpoint.contains("/v1/");
        let response_text = if is_ollama {
            self.call_ollama(&prompt, max_tokens)
        } else {
            self.call_openai_compatible(&prompt, max_tokens)
        };

        match response_text {
            Ok(text) => {
                let written = write_substrate_string(substrate, response_addr, &text, buf_size);
                CommandResult {
                    status: STATUS_COMPLETE,
                    result: written as u32,
                }
            }
            Err(e) => {
                let err = format!("MODEL_ERROR: {}\n", e);
                let written = write_substrate_string(substrate, response_addr, &err, buf_size);
                CommandResult {
                    status: STATUS_ERROR,
                    result: written as u32,
                }
            }
        }
    }

    fn call_ollama(&self, prompt: &str, max_tokens: u32) -> Result<String, String> {
        let body = serde_json::json!({
            "model": self.model_config.model,
            "prompt": prompt,
            "stream": false,
            "options": { "num_predict": max_tokens }
        });

        let agent: ureq::Agent = ureq::Agent::config_builder()
            .timeout_global(Some(std::time::Duration::from_secs(self.model_config.timeout_secs)))
            .build()
            .into();

        let mut response = agent
            .post(&self.model_config.endpoint)
            .send_json(&body)
            .map_err(|e| format!("ollama request failed: {}", e))?;

        let json: serde_json::Value = response
            .body_mut()
            .read_json()
            .map_err(|e| format!("ollama parse failed: {}", e))?;

        json.get("response")
            .and_then(|v| v.as_str())
            .map(|s| s.to_string())
            .ok_or_else(|| "ollama: missing 'response' field".into())
    }

    fn call_openai_compatible(&self, prompt: &str, max_tokens: u32) -> Result<String, String> {
        let body = serde_json::json!({
            "model": self.model_config.model,
            "messages": [{ "role": "user", "content": prompt }],
            "max_tokens": max_tokens
        });

        let agent: ureq::Agent = ureq::Agent::config_builder()
            .timeout_global(Some(std::time::Duration::from_secs(self.model_config.timeout_secs)))
            .build()
            .into();

        let mut req = agent.post(&self.model_config.endpoint);

        if !self.model_config.api_key.is_empty() {
            req = req.header("Authorization", &format!("Bearer {}", self.model_config.api_key));
        }

        let mut response = req
            .send_json(&body)
            .map_err(|e| format!("openai request failed: {}", e))?;

        let json: serde_json::Value = response
            .body_mut()
            .read_json()
            .map_err(|e| format!("openai parse failed: {}", e))?;

        json.pointer("/choices/0/message/content")
            .and_then(|v| v.as_str())
            .map(|s| s.to_string())
            .ok_or_else(|| "openai: missing response content".into())
    }
}

impl CommandExecutor for AgentExecutor {
    fn execute(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        match cmd.cmd_type {
            1..=5 => self.file_executor.execute(cmd, substrate),
            CMD_SQL_QUERY => self.handle_sql_query(cmd, substrate),
            CMD_MODEL_CALL => self.handle_model_call(cmd, substrate),
            CMD_STATUS_READ => self.handle_status_read(cmd, substrate),
            CMD_STATUS_WRITE => self.handle_status_write(cmd, substrate),
            _ => CommandResult {
                status: STATUS_ERROR,
                result: 0xFFFF_FFFE, // Unknown command
            },
        }
    }
}

use std::cell::RefCell;
use std::rc::Rc;

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

        // Verify new command type constants are distinct from existing
        assert_ne!(CMD_SQL_QUERY, CMD_MODEL_CALL);
        assert_ne!(CMD_STATUS_READ, CMD_STATUS_WRITE);
        assert_ne!(CMD_SQL_QUERY, CMD_READ_BLOCK);
        assert_eq!(CMD_SQL_QUERY, 6);
        assert_eq!(CMD_MODEL_CALL, 7);
        assert_eq!(CMD_STATUS_READ, 8);
        assert_eq!(CMD_STATUS_WRITE, 9);
    }

    // ── GEO-60: AgentExecutor Tests ──

    #[test]
    fn test_agent_executor_status_write_and_read() {
        let substrate = Substrate::new();
        let executor = AgentExecutor::new();
        let status = executor.status_handle();
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        // Write a key "iteration" with value 42 into substrate at a known address
        let key_addr: u32 = 0x0004_0000;
        write_substrate_string(&substrate, key_addr, "iteration", 256);

        // Issue CMD_STATUS_WRITE
        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_STATUS_WRITE,
                vm_id: 0,
                param1: key_addr,
                param2: 42,
                param3: 0,
                param4: 0,
            },
        );

        let count = stub.poll_once(&substrate);
        assert_eq!(count, 1);
        assert_eq!(
            read_slot_status(&substrate, TEST_CMD_BASE, 0),
            STATUS_COMPLETE
        );
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 0), 0);

        // Verify the status store has the value
        assert_eq!(*status.borrow().get("iteration").unwrap(), 42);

        // Now read it back via CMD_STATUS_READ
        let val_addr: u32 = 0x0004_0100;
        write_command(
            &substrate,
            TEST_CMD_BASE,
            1,
            &Command {
                cmd_type: CMD_STATUS_READ,
                vm_id: 0,
                param1: key_addr,
                param2: val_addr,
                param3: 0,
                param4: 0,
            },
        );

        let count2 = stub.poll_once(&substrate);
        assert_eq!(count2, 1);
        assert_eq!(
            read_slot_status(&substrate, TEST_CMD_BASE, 1),
            STATUS_COMPLETE
        );
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 1), 1); // key found

        // Verify the value was written to substrate
        assert_eq!(substrate.peek(val_addr), 42);
    }

    #[test]
    fn test_agent_executor_status_read_missing_key() {
        let substrate = Substrate::new();
        let executor = AgentExecutor::new();
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        let key_addr: u32 = 0x0004_0000;
        write_substrate_string(&substrate, key_addr, "nonexistent", 256);

        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_STATUS_READ,
                vm_id: 0,
                param1: key_addr,
                param2: 0x0004_0100,
                param3: 0,
                param4: 0,
            },
        );

        stub.poll_once(&substrate);
        assert_eq!(
            read_slot_status(&substrate, TEST_CMD_BASE, 0),
            STATUS_COMPLETE
        );
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 0), 0); // key not found
    }

    #[test]
    fn test_agent_executor_status_overwrite() {
        let substrate = Substrate::new();
        let executor = AgentExecutor::new();
        let status = executor.status_handle();
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        let key_addr: u32 = 0x0004_0000;
        write_substrate_string(&substrate, key_addr, "counter", 256);

        // Write counter = 10
        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_STATUS_WRITE,
                vm_id: 0,
                param1: key_addr,
                param2: 10,
                param3: 0,
                param4: 0,
            },
        );
        stub.poll_once(&substrate);
        assert_eq!(*status.borrow().get("counter").unwrap(), 10);

        // Overwrite counter = 99
        write_command(
            &substrate,
            TEST_CMD_BASE,
            1,
            &Command {
                cmd_type: CMD_STATUS_WRITE,
                vm_id: 0,
                param1: key_addr,
                param2: 99,
                param3: 0,
                param4: 0,
            },
        );
        stub.poll_once(&substrate);
        assert_eq!(*status.borrow().get("counter").unwrap(), 99);
    }

    #[test]
    fn test_agent_executor_sql_create_and_select() {
        let substrate = Substrate::new();
        let executor = AgentExecutor::new();
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        let sql_addr: u32 = 0x0004_0000;
        let result_addr: u32 = 0x0004_1000;
        let buf_size: u32 = 4096;

        // CREATE TABLE
        write_substrate_string(&substrate, sql_addr, "CREATE TABLE mutations (id INTEGER PRIMARY KEY, fitness INTEGER)", 256);
        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_SQL_QUERY,
                vm_id: 0,
                param1: sql_addr,
                param2: result_addr,
                param3: buf_size,
                param4: 0,
            },
        );
        assert_eq!(stub.poll_once(&substrate), 1);
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 0), STATUS_COMPLETE);

        // INSERT
        write_substrate_string(&substrate, sql_addr, "INSERT INTO mutations (fitness) VALUES (85)", 256);
        write_command(
            &substrate,
            TEST_CMD_BASE,
            1,
            &Command {
                cmd_type: CMD_SQL_QUERY,
                vm_id: 0,
                param1: sql_addr,
                param2: result_addr,
                param3: buf_size,
                param4: 0,
            },
        );
        assert_eq!(stub.poll_once(&substrate), 1);
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 1), STATUS_COMPLETE);
        let insert_result = read_substrate_string(&substrate, result_addr, 256);
        assert!(insert_result.starts_with("OK\t"));

        // SELECT
        write_substrate_string(&substrate, sql_addr, "SELECT fitness FROM mutations", 256);
        write_command(
            &substrate,
            TEST_CMD_BASE,
            2,
            &Command {
                cmd_type: CMD_SQL_QUERY,
                vm_id: 0,
                param1: sql_addr,
                param2: result_addr,
                param3: buf_size,
                param4: 0,
            },
        );
        assert_eq!(stub.poll_once(&substrate), 1);
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 2), STATUS_COMPLETE);

        let select_result = read_substrate_string(&substrate, result_addr, 256);
        assert!(select_result.contains("fitness"));
        assert!(select_result.contains("85"));
    }

    #[test]
    fn test_agent_executor_sql_error() {
        let substrate = Substrate::new();
        let executor = AgentExecutor::new();
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        let sql_addr: u32 = 0x0004_0000;
        let result_addr: u32 = 0x0004_1000;

        // Invalid SQL should return error
        write_substrate_string(&substrate, sql_addr, "SELECTT broken", 256);
        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_SQL_QUERY,
                vm_id: 0,
                param1: sql_addr,
                param2: result_addr,
                param3: 4096,
                param4: 0,
            },
        );
        stub.poll_once(&substrate);
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 0), STATUS_ERROR);
        let err_msg = read_substrate_string(&substrate, result_addr, 256);
        assert!(err_msg.contains("SQL error"));
    }

    #[test]
    fn test_agent_executor_model_call_connection_refused() {
        // With a non-existent endpoint, MODEL_CALL should return error with message.
        let substrate = Substrate::new();
        let config = ModelConfig {
            endpoint: "http://127.0.0.1:1/api/generate".into(), // port 1 = guaranteed refused
            model: "test".into(),
            api_key: String::new(),
            timeout_secs: 1,
        };
        let executor = AgentExecutor::with_model_config(config);
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        let prompt_addr: u32 = 0x0004_0000;
        let response_addr: u32 = 0x0004_1000;
        write_substrate_string(&substrate, prompt_addr, "What is 2+2?", 256);

        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_MODEL_CALL,
                vm_id: 0,
                param1: prompt_addr,
                param2: response_addr,
                param3: 4096,
                param4: 64,
            },
        );
        stub.poll_once(&substrate);
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 0), STATUS_ERROR);
        let err = read_substrate_string(&substrate, response_addr, 256);
        assert!(
            err.contains("MODEL_ERROR"),
            "expected MODEL_ERROR, got: {:?}",
            err
        );
    }

    #[test]
    fn test_agent_executor_model_config_custom() {
        let substrate = Substrate::new();
        let config = ModelConfig {
            endpoint: "http://example.com/v1/chat/completions".into(),
            model: "gpt-4".into(),
            api_key: "sk-test".into(),
            timeout_secs: 10,
        };
        let executor = AgentExecutor::with_model_config(config);
        let stub = CpuStub::new(TEST_CMD_BASE, executor);
        let substrate = Substrate::new();

        let prompt_addr: u32 = 0x0004_0000;
        let response_addr: u32 = 0x0004_1000;
        write_substrate_string(&substrate, prompt_addr, "hello", 256);

        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_MODEL_CALL,
                vm_id: 0,
                param1: prompt_addr,
                param2: response_addr,
                param3: 4096,
                param4: 0, // use default max_tokens
            },
        );
        stub.poll_once(&substrate);
        // Will fail (no server) but should use OpenAI-compatible path
        assert_eq!(read_slot_status(&substrate, TEST_CMD_BASE, 0), STATUS_ERROR);
        let err = read_substrate_string(&substrate, response_addr, 256);
        assert!(
            err.contains("openai"),
            "expected openai error path, got: {:?}",
            err
        );
    }

    #[test]
    fn test_agent_executor_delegates_file_commands() {
        // AgentExecutor should delegate commands 1-5 to FileExecutor.
        // We test by sending an unknown file command (CMD_IOCTL returns error from FileExecutor)
        // and verifying we get the IOCTL-not-implemented error, not the unknown-command error.
        let substrate = Substrate::new();
        let executor = AgentExecutor::new();
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        write_command(
            &substrate,
            TEST_CMD_BASE,
            0,
            &Command {
                cmd_type: CMD_IOCTL,
                vm_id: 0,
                param1: 0,
                param2: 0,
                param3: 0,
                param4: 0,
            },
        );
        stub.poll_once(&substrate);
        assert_eq!(
            read_slot_status(&substrate, TEST_CMD_BASE, 0),
            STATUS_ERROR
        );
        assert_eq!(read_slot_result(&substrate, TEST_CMD_BASE, 0), 0xFFFF_FFFF);
        // FileExecutor returns 0xFFFFFFFF for IOCTL, AgentExecutor returns 0xFFFFFFFE for unknown.
        // Getting 0xFFFFFFFF proves delegation happened.
    }

    #[test]
    fn test_substrate_string_roundtrip() {
        let substrate = Substrate::new();
        let addr: u32 = 0x0005_0000;

        // Write and read back
        let written = write_substrate_string(&substrate, addr, "hello world", 256);
        assert_eq!(written, 12); // 11 chars + null

        let read = read_substrate_string(&substrate, addr, 256);
        assert_eq!(read, "hello world");
    }

    #[test]
    fn test_substrate_string_truncation() {
        let substrate = Substrate::new();
        let addr: u32 = 0x0005_0000;

        // Write a string into a buffer too small for it
        let written = write_substrate_string(&substrate, addr, "abcdefghij", 5);
        assert_eq!(written, 5); // 4 chars + null

        let read = read_substrate_string(&substrate, addr, 5);
        assert_eq!(read, "abcd");
    }

    #[test]
    fn test_agent_executor_multiple_status_keys() {
        let substrate = Substrate::new();
        let executor = AgentExecutor::new();
        let status = executor.status_handle();
        let stub = CpuStub::new(TEST_CMD_BASE, executor);

        // Write three different keys
        let keys = [("iteration", 7u32, 0x0004_0000u32), ("best_fitness", 85, 0x0004_0100), ("mode", 1, 0x0004_0200)];
        for (i, (key, value, addr)) in keys.iter().enumerate() {
            write_substrate_string(&substrate, *addr, key, 256);
            write_command(
                &substrate,
                TEST_CMD_BASE,
                i as u32,
                &Command {
                    cmd_type: CMD_STATUS_WRITE,
                    vm_id: 0,
                    param1: *addr,
                    param2: *value,
                    param3: 0,
                    param4: 0,
                },
            );
        }

        assert_eq!(stub.poll_once(&substrate), 3);

        // Verify all three in the store
        let store = status.borrow();
        assert_eq!(*store.get("iteration").unwrap(), 7);
        assert_eq!(*store.get("best_fitness").unwrap(), 85);
        assert_eq!(*store.get("mode").unwrap(), 1);
    }
}
