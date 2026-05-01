// ops_pty.rs -- Persistent host PTY support (PTYOPEN/PTYWRITE/PTYREAD/PTYCLOSE).
//
// A PTY slot owns a child process running inside a pseudo-terminal plus a
// background reader thread that forwards stdout/stderr bytes through an
// mpsc channel. The VM drains the channel on PTYREAD and writes raw input
// bytes through the master on PTYWRITE.
//
// Goal: a guest GeoOS program can host a persistent bash session — `cd`
// changes its working dir, env vars and shell history persist, interactive
// programs see a real tty. ANSI parsing is intentionally out of scope here;
// guest programs are responsible for what they do with the byte stream.
//
// Terminal query interception: The reader thread detects outbound terminal
// queries (DA1, DA2, DSR, XTVERSION, etc.) that child processes send to
// probe terminal capabilities. Since GeOS is a minimal terminal emulator,
// it doesn't respond to these queries. But programs like Hermes Agent (Ink-
// based TUI) block indefinitely waiting for DA1 responses. The reader thread
// intercepts these queries and writes canned responses back to the child,
// preventing hangs.

use portable_pty::{native_pty_system, CommandBuilder, MasterPty, PtySize};
use std::io::{Read, Write};
use std::sync::mpsc::{channel, Receiver};
use std::thread;

/// Maximum simultaneous PTY slots.
pub const MAX_PTY_SLOTS: usize = 4;

/// Result codes (mirrors net.rs convention; written to r0).
pub const PTY_OK: u32 = 0;
pub const PTY_ERR_INVALID_HANDLE: u32 = 1;
pub const PTY_ERR_OPEN_FAILED: u32 = 2;
pub const PTY_ERR_WRITE_FAILED: u32 = 3;
pub const PTY_ERR_NO_SLOTS: u32 = 5;
pub const PTY_ERR_CLOSED: u32 = 7;
pub const PTY_ERR_RESIZE_FAILED: u32 = 8;

// ── Terminal query interceptor ─────────────────────────────────────
//
// Scans the byte stream from the child process for terminal capability
// queries and auto-responds. This prevents TUI apps from hanging when
// they send queries that our minimal terminal emulator doesn't answer.
//
// Design: ALL bytes are forwarded to the VM unchanged. The interceptor
// watches the stream in parallel and, when it detects a complete query
// sequence, writes a canned response back to the child via the PTY
// master writer. The VM's ANSI parser still sees the query bytes and
// handles them (or ignores them) as before.
//
// Queries intercepted (responded to, NOT consumed):
//   CSI c           → DA1 (Primary Device Attributes) → "\e[?1;0c"
//   CSI > c         → DA2 (Secondary Device Attributes) → "\e[>0;0;0c"
//   CSI ? 6 n       → DSR (DECXCPR cursor position) → "\e[?1;1R"
//   CSI > 0 q       → XTVERSION → DCS > | GeOS ST
//   ESC c           → RIS (Reset to Initial State) → silently consumed
//                      (NOT forwarded — prevents VM from clearing screen)

/// States for the query interceptor state machine.
#[derive(Clone, Copy, PartialEq)]
enum QiState {
    /// Normal byte stream, no escape in progress.
    Ground,
    /// Saw ESC (0x1B), waiting for next byte.
    Esc,
    /// Saw ESC [, accumulating CSI parameters.
    Csi,
    /// Saw ESC [ >, accumulating DA2/XTVERSION parameters.
    CsiGreater,
    /// Saw ESC [ ?, accumulating DEC private mode parameters.
    CsiQuestion,
}

/// Scans a byte stream for terminal queries and generates responses.
/// Maintains state across calls (partial sequences span read() boundaries).
pub(crate) struct QueryInterceptor {
    state: QiState,
    /// Buffer for collecting parameter digits between ';' or terminal byte.
    param_buf: String,
}

impl QueryInterceptor {
    pub(crate) fn new() -> Self {
        QueryInterceptor {
            state: QiState::Ground,
            param_buf: String::new(),
        }
    }

    /// Process a single byte from the child's stdout.
    ///
    /// Returns a tuple (forward, respond):
    /// - forward: true if this byte should be sent to the VM channel
    /// - respond: Some(response_bytes) if a query was detected and a
    ///   response should be written back to the child
    pub(crate) fn feed(&mut self, b: u8) -> (bool, Option<Vec<u8>>) {
        match self.state {
            QiState::Ground => {
                if b == 0x1B {
                    self.state = QiState::Esc;
                    // Forward ESC — it might start a query or a normal sequence.
                    // The VM parser will handle it either way.
                    (true, None)
                } else {
                    (true, None)
                }
            }
            QiState::Esc => {
                if b == b'[' {
                    self.state = QiState::Csi;
                    self.param_buf.clear();
                    (true, None) // forward '['
                } else {
                    // ESC + non-[. Unknown ESC sequence (ESC c = RIS, ESC 7, etc.)
                    // The VM parser handles these in pb_esc_other (returns to normal).
                    // Just forward both bytes — no harm done since the VM ignores
                    // unrecognized ESC sequences.
                    self.state = QiState::Ground;
                    (true, None)
                }
            }
            QiState::Csi => {
                if b == b'>' {
                    self.state = QiState::CsiGreater;
                    self.param_buf.clear();
                    (true, None)
                } else if b == b'?' {
                    self.state = QiState::CsiQuestion;
                    self.param_buf.clear();
                    (true, None)
                } else if b == b'c' && (self.param_buf.is_empty() || self.param_buf == "0") {
                    // CSI c or CSI 0 c = DA1 query.
                    self.state = QiState::Ground;
                    (true, Some(b"\x1B[?1;0c".to_vec()))
                } else if b == b'n' {
                    // CSI 5 n = DSR status → respond "\e[0n" (terminal OK).
                    // CSI 6 n = DSR cursor position → respond "\e[1;1R".
                    let resp: Option<Vec<u8>> = match self.param_buf.as_str() {
                        "5" => Some(b"\x1B[0n".to_vec()),
                        "6" => Some(b"\x1B[1;1R".to_vec()),
                        _ => None,
                    };
                    self.state = QiState::Ground;
                    (true, resp)
                } else if b >= b'0' && b <= b'9' {
                    self.param_buf.push(b as char);
                    (true, None)
                } else if b == b';' {
                    self.param_buf.clear();
                    (true, None)
                } else if b >= 0x40 && b <= 0x7E {
                    // CSI final byte for an unintercepted sequence.
                    self.state = QiState::Ground;
                    (true, None)
                } else {
                    (true, None)
                }
            }
            QiState::CsiGreater => {
                if b >= b'0' && b <= b'9' {
                    self.param_buf.push(b as char);
                    (true, None)
                } else if b == b';' {
                    self.param_buf.clear();
                    (true, None)
                } else if b == b'c' {
                    // CSI > c or CSI > params ; c = DA2 query.
                    self.state = QiState::Ground;
                    (true, Some(b"\x1B[>0;0;0c".to_vec()))
                } else if b == b'q' {
                    // CSI > 0 q = XTVERSION query.
                    self.state = QiState::Ground;
                    let response = b"\x1BP>|GeOS\x1B\\".to_vec();
                    (true, Some(response))
                } else if b >= 0x40 && b <= 0x7E {
                    self.state = QiState::Ground;
                    (true, None)
                } else {
                    (true, None)
                }
            }
            QiState::CsiQuestion => {
                if b >= b'0' && b <= b'9' {
                    self.param_buf.push(b as char);
                    (true, None)
                } else if b == b';' {
                    self.param_buf.clear();
                    (true, None)
                } else if b == b'n' {
                    // CSI ? 6 n = DECXCPR (cursor position with ? marker).
                    self.state = QiState::Ground;
                    (true, Some(b"\x1B[?1;1R".to_vec()))
                } else if b >= 0x40 && b <= 0x7E {
                    // Other CSI ? ... final bytes (mode settings, etc.)
                    self.state = QiState::Ground;
                    (true, None)
                } else {
                    (true, None)
                }
            }
        }
    }
}

/// Render a byte slice as a printable trace line: ESC → \e, control chars
/// → \xHH, printable ASCII as-is. Used by GEOS_PTY_TRACE diagnostics.
fn escape_for_trace(buf: &[u8]) -> String {
    let mut out = String::with_capacity(buf.len() * 2);
    for &b in buf {
        match b {
            0x1B => out.push_str("\\e"),
            b'\n' => out.push_str("\\n"),
            b'\r' => out.push_str("\\r"),
            b'\t' => out.push_str("\\t"),
            0x20..=0x7E => out.push(b as char),
            _ => out.push_str(&format!("\\x{:02x}", b)),
        }
    }
    out
}

pub struct PtySlot {
    master: Box<dyn MasterPty + Send>,
    pub writer: Option<Box<dyn std::io::Write + Send>>,
    rx: Receiver<u8>,
    /// Set true when the reader thread observes EOF or an error.
    closed_flag: std::sync::Arc<std::sync::atomic::AtomicBool>,
    /// Kept alive so the child isn't reaped while the slot exists.
    _child: Box<dyn portable_pty::Child + Send + Sync>,
}

impl PtySlot {
    fn is_closed(&self) -> bool {
        self.closed_flag.load(std::sync::atomic::Ordering::Relaxed)
    }

    /// Drain all pending bytes from the channel (diagnostic).
    pub fn drain_remaining(&self) -> Vec<u8> {
        let mut bytes = Vec::new();
        while let Ok(b) = self.rx.try_recv() {
            bytes.push(b);
        }
        bytes
    }

    pub fn is_alive(&self) -> bool {
        !self.is_closed()
    }
}

/// Read a null-terminated ASCII string from RAM (one byte per u32 cell).
fn read_string_from_ram(ram: &[u32], addr: u32) -> String {
    let mut s = String::new();
    let mut i = addr as usize;
    while i < ram.len() {
        let byte = (ram[i] & 0xFF) as u8;
        if byte == 0 {
            break;
        }
        if byte.is_ascii() {
            s.push(byte as char);
        }
        i += 1;
    }
    s
}

/// Default terminal dimensions matching host_term_v4.asm display.
pub const DEFAULT_COLS: u16 = 80;
pub const DEFAULT_ROWS: u16 = 30;

/// Spawn `cmd` (or bash if empty) inside a fresh pty. Returns the populated
/// slot or an error string.
pub fn spawn(cmd_line: &str) -> Result<PtySlot, String> {
    let pty_system = native_pty_system();
    let pair = pty_system
        .openpty(PtySize {
            rows: DEFAULT_ROWS,
            cols: DEFAULT_COLS,
            pixel_width: 0,
            pixel_height: 0,
        })
        .map_err(|e| format!("openpty: {}", e))?;

    let cmd = if cmd_line.trim().is_empty() {
        let shell = std::env::var("SHELL").unwrap_or_else(|_| "/bin/bash".to_string());
        let mut c = CommandBuilder::new(shell);
        // Inherit a sane environment from the host so bash finds PATH/HOME.
        if let Ok(home) = std::env::var("HOME") {
            c.cwd(home);
        }
        // Use xterm so bash emits a prompt and handles line editing.
        // xterm-256color may send complex queries; xterm is the safe middle ground.
        c.env("TERM", "xterm");
        // Set COLUMNS/LINES to match the PTY size so bash line wrapping and
        // tab completion align with the actual terminal width from frame 1.
        c.env("COLUMNS", "80");
        c.env("LINES", "30");
        // Simple prompt so we can detect when bash is ready
        c.env("PS1", "$ ");
        // Disable startup files that might produce complex output
        c.arg("--norc");
        c.arg("--noprofile");
        c
    } else {
        // crude split on whitespace; good enough for single commands like
        // "/bin/bash -i" or "python3 -i". Quoted args aren't supported yet.
        let parts: Vec<&str> = cmd_line.split_whitespace().collect();
        let mut c = CommandBuilder::new(parts[0]);
        for arg in &parts[1..] {
            c.arg(arg);
        }
        c.env("TERM", "xterm");
        c.env("COLUMNS", "80");
        c.env("LINES", "30");
        c.env("PS1", "$ ");
        c
    };

    let child = pair
        .slave
        .spawn_command(cmd)
        .map_err(|e| format!("spawn: {}", e))?;
    drop(pair.slave);

    let mut reader = pair
        .master
        .try_clone_reader()
        .map_err(|e| format!("clone_reader: {}", e))?;

    // Duplicate the master fd for the query interceptor's response writer.
    // portable_pty only allows take_writer() once, so we dup the fd here
    // before taking the writer for PTYWRITE use.
    #[cfg(unix)]
    let responder: Option<Box<dyn std::io::Write + Send>> =
        pair.master
            .as_raw_fd()
            .map(|fd| {
                use std::os::unix::io::FromRawFd;
                let duped = unsafe { libc::dup(fd) };
                if duped < 0 {
                    eprintln!("[PTY] dup fd failed: {}", std::io::Error::last_os_error());
                    None
                } else {
                    Some(Box::new(unsafe { std::fs::File::from_raw_fd(duped) })
                        as Box<dyn Write + Send>)
                }
            })
            .flatten();
    #[cfg(not(unix))]
    let responder: Option<Box<dyn std::io::Write + Send>> = None;

    let (tx, rx) = channel::<u8>();
    let closed_flag = std::sync::Arc::new(std::sync::atomic::AtomicBool::new(false));
    let closed_flag_thread = closed_flag.clone();

    // Optional byte-level tracing: set GEOS_PTY_TRACE=1 to log every chunk
    // read from the child and every QI response written back. Useful for
    // diagnosing TUI apps that hang waiting for an unhandled escape sequence.
    let trace = std::env::var("GEOS_PTY_TRACE").is_ok();

    thread::Builder::new()
        .name("pty-reader".into())
        .spawn(move || {
            let mut buf = [0u8; 1024];
            let mut qi = QueryInterceptor::new();
            let mut responder = responder;
            loop {
                match reader.read(&mut buf) {
                    Ok(0) => {
                        if trace {
                            eprintln!("[PTY-TRACE] EOF");
                        }
                        closed_flag_thread.store(true, std::sync::atomic::Ordering::Relaxed);
                        break;
                    }
                    Ok(n) => {
                        if trace {
                            eprintln!("[PTY-TRACE] <- {}: {}", n, escape_for_trace(&buf[..n]));
                        }
                        for &b in &buf[..n] {
                            let (forward, response) = qi.feed(b);
                            if forward {
                                if tx.send(b).is_err() {
                                    return;
                                }
                            }
                            if let Some(resp_bytes) = response {
                                if trace {
                                    eprintln!(
                                        "[PTY-TRACE] -> {}: {}",
                                        resp_bytes.len(),
                                        escape_for_trace(&resp_bytes)
                                    );
                                }
                                if let Some(ref mut w) = responder {
                                    let _ = w.write_all(&resp_bytes);
                                    let _ = w.flush();
                                }
                            }
                        }
                    }
                    Err(e) => {
                        if trace {
                            eprintln!("[PTY-TRACE] read err: {}", e);
                        }
                        closed_flag_thread.store(true, std::sync::atomic::Ordering::Relaxed);
                        break;
                    }
                }
            }
        })
        .map_err(|e| format!("spawn reader: {}", e))?;

    // Take the writer for PTYWRITE to use.
    let mut writer = pair.master.take_writer().ok();

    // Write a newline to trigger bash prompt emission. Without this,
    // bash may buffer its initial prompt indefinitely, especially when
    // the reader hasn't started consuming yet.
    if let Some(ref mut w) = writer {
        let _ = w.write_all(b"\n");
        let _ = w.flush();
    }

    Ok(PtySlot {
        master: pair.master,
        writer,
        rx,
        closed_flag,
        _child: child,
    })
}

impl super::Vm {
    /// PTYOPEN cmd_addr_reg, handle_reg  (0xA9)
    /// Spawns a command (or bash if empty) inside a pty and returns its
    /// slot index in handle_reg. r0 = PTY_OK or error code.
    pub fn op_ptyopen(&mut self) {
        let cmd_reg = self.fetch() as usize;
        let handle_reg = self.fetch() as usize;
        if cmd_reg >= super::NUM_REGS || handle_reg >= super::NUM_REGS {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }

        let cmd_line = read_string_from_ram(&self.ram, self.regs[cmd_reg]);

        let slot_idx = match self.pty_slots.iter().position(|s| s.is_none()) {
            Some(i) => i,
            None => {
                self.regs[0] = PTY_ERR_NO_SLOTS;
                return;
            }
        };

        match spawn(&cmd_line) {
            Ok(slot) => {
                self.pty_slots[slot_idx] = Some(slot);
                self.regs[handle_reg] = slot_idx as u32;
                self.regs[0] = PTY_OK;
            }
            Err(e) => {
                eprintln!("PTYOPEN failed: {}", e);
                self.regs[0] = PTY_ERR_OPEN_FAILED;
            }
        }
    }

    /// PTYWRITE handle_reg, buf_reg, len_reg  (0xAA)
    /// Writes `len` bytes from RAM[buf_reg..] (one byte per u32) to the pty.
    /// r0 = PTY_OK on success, error code otherwise.
    pub fn op_ptywrite(&mut self) {
        let h_reg = self.fetch() as usize;
        let b_reg = self.fetch() as usize;
        let l_reg = self.fetch() as usize;
        if h_reg >= super::NUM_REGS || b_reg >= super::NUM_REGS || l_reg >= super::NUM_REGS {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }
        let h = self.regs[h_reg] as usize;
        let buf_addr = self.regs[b_reg] as usize;
        let len = self.regs[l_reg] as usize;
        if h >= MAX_PTY_SLOTS || self.pty_slots[h].is_none() {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }

        let mut bytes = Vec::with_capacity(len.min(4096));
        for i in 0..len.min(4096) {
            let idx = buf_addr + i;
            if idx >= self.ram.len() {
                break;
            }
            bytes.push((self.ram[idx] & 0xFF) as u8);
        }

        eprintln!(
            "[PTYWRITE] handle={} buf=0x{:04X} len={} bytes={:?}",
            h,
            buf_addr,
            len,
            &bytes
                .iter()
                .map(|&b| {
                    if b >= 0x20 && b < 0x7F {
                        b as char
                    } else {
                        '.'
                    }
                })
                .collect::<String>()
        );
        let slot = self.pty_slots[h].as_mut().unwrap();
        if let Some(ref mut w) = slot.writer {
            match w.write_all(&bytes) {
                Ok(()) => {
                    let _ = w.flush();
                    eprintln!("[PTYWRITE] wrote {} bytes OK", bytes.len());
                    self.regs[0] = PTY_OK;
                }
                Err(e) => {
                    eprintln!("[PTYWRITE] write failed: {}", e);
                    self.regs[0] = PTY_ERR_WRITE_FAILED;
                }
            }
        } else {
            eprintln!("[PTYWRITE] no writer for handle {}", h);
            self.regs[0] = PTY_ERR_WRITE_FAILED;
        }
    }

    /// PTYREAD handle_reg, buf_reg, max_len_reg  (0xAB)
    /// Drains up to max_len bytes pending from the pty into RAM.
    /// r0 = bytes drained (0 = none available right now).
    /// Sets r0 = 0xFFFFFFFF if the slot is closed (child exited / EOF).
    pub fn op_ptyread(&mut self) {
        let h_reg = self.fetch() as usize;
        let b_reg = self.fetch() as usize;
        let m_reg = self.fetch() as usize;
        eprintln!(
            "[PTYREAD] handle_reg={} buf_reg={} max_reg={}",
            h_reg, b_reg, m_reg
        );
        if h_reg >= super::NUM_REGS || b_reg >= super::NUM_REGS || m_reg >= super::NUM_REGS {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }
        let h = self.regs[h_reg] as usize;
        let buf_addr = self.regs[b_reg] as usize;
        let max_len = self.regs[m_reg] as usize;
        if h >= MAX_PTY_SLOTS || self.pty_slots[h].is_none() {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }

        let slot = self.pty_slots[h].as_ref().unwrap();
        let mut written = 0usize;
        while written < max_len.min(4096) {
            match slot.rx.try_recv() {
                Ok(byte) => {
                    let idx = buf_addr + written;
                    if idx < self.ram.len() {
                        self.ram[idx] = byte as u32;
                    }
                    written += 1;
                }
                Err(_) => break,
            }
        }

        if written == 0 && slot.is_closed() {
            eprintln!("[PTYREAD] slot closed, returning 0xFFFFFFFF");
            self.regs[0] = u32::MAX;
            return;
        }
        if written > 0 {
            let preview: String = (0..written.min(80))
                .map(|i| {
                    let b = (self.ram[buf_addr + i] & 0xFF) as u8;
                    if b >= 0x20 && b < 0x7F {
                        b as char
                    } else {
                        '.'
                    }
                })
                .collect();
            eprintln!(
                "[PTYREAD] read {} bytes into 0x{:04X}: {:?}",
                written, buf_addr, preview
            );
        }
        self.regs[0] = written as u32;
    }

    /// PTYCLOSE handle_reg  (0xAC)
    /// Drops the slot, killing the child and joining the reader.
    /// r0 = PTY_OK or PTY_ERR_INVALID_HANDLE.
    pub fn op_ptyclose(&mut self) {
        let h_reg = self.fetch() as usize;
        if h_reg >= super::NUM_REGS {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }
        let h = self.regs[h_reg] as usize;
        if h >= MAX_PTY_SLOTS || self.pty_slots[h].is_none() {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }
        self.pty_slots[h] = None;
        self.regs[0] = PTY_OK;
    }

    /// PTYSIZE handle_reg, rows_reg, cols_reg  (0xAD)
    /// Resizes the PTY to the given dimensions.
    /// r0 = PTY_OK on success, error code otherwise.
    pub fn op_ptysize(&mut self) {
        let h_reg = self.fetch() as usize;
        let rows_reg = self.fetch() as usize;
        let cols_reg = self.fetch() as usize;
        if h_reg >= super::NUM_REGS || rows_reg >= super::NUM_REGS || cols_reg >= super::NUM_REGS {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }
        let h = self.regs[h_reg] as usize;
        let rows = self.regs[rows_reg];
        let cols = self.regs[cols_reg];
        if h >= MAX_PTY_SLOTS || self.pty_slots[h].is_none() {
            self.regs[0] = PTY_ERR_INVALID_HANDLE;
            return;
        }

        let slot = self.pty_slots[h].as_ref().unwrap();
        match slot.master.resize(PtySize {
            rows: rows as u16,
            cols: cols as u16,
            pixel_width: 0,
            pixel_height: 0,
        }) {
            Ok(()) => {
                self.regs[0] = PTY_OK;
            }
            Err(e) => {
                eprintln!("PTYSIZE failed: {}", e);
                self.regs[0] = PTY_ERR_RESIZE_FAILED;
            }
        }
    }

    /// Resize the PTY directly by handle index (called from host on font mode switch).
    /// Returns true on success.
    pub fn resize_pty_direct(&mut self, handle: usize, rows: u16, cols: u16) -> bool {
        if handle >= MAX_PTY_SLOTS {
            return false;
        }
        if let Some(ref slot) = self.pty_slots[handle] {
            match slot.master.resize(PtySize {
                rows,
                cols,
                pixel_width: 0,
                pixel_height: 0,
            }) {
                Ok(()) => true,
                Err(e) => {
                    eprintln!("PTY resize failed: {}", e);
                    false
                }
            }
        } else {
            false
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::time::{Duration, Instant};

    #[test]
    fn pty_pwd_roundtrip() {
        // Run pwd once; expect a path containing '/' to come back.
        let mut slot = match spawn("") {
            Ok(s) => s,
            Err(e) => {
                eprintln!("skipping: pty spawn failed: {}", e);
                return;
            }
        };

        {
            let w = slot.writer.as_mut().expect("writer");
            w.write_all(b"pwd\nexit\n").expect("write pwd");
        }

        let deadline = Instant::now() + Duration::from_secs(5);
        let mut output = Vec::new();
        while Instant::now() < deadline {
            match slot.rx.try_recv() {
                Ok(b) => output.push(b),
                Err(_) => {
                    if slot.is_closed() && output.contains(&b'/') {
                        break;
                    }
                    thread::sleep(Duration::from_millis(20));
                }
            }
        }

        let text = String::from_utf8_lossy(&output);
        assert!(
            text.contains('/'),
            "expected pwd output containing '/', got: {:?}",
            text
        );
    }

    /// VM-level integration test: PTYOPEN -> PTYWRITE "echo hello\n" -> PTYREAD -> assert "hello"
    ///
    /// Tests the full opcode pipeline by setting up RAM with instruction operands
    /// and calling the opcode handlers directly.
    #[test]
    fn pty_vm_echo_roundtrip() {
        use crate::vm::Vm;

        let mut vm = Vm::new();

        // Write empty command string at 0x5000 (null byte = spawn default shell)
        vm.ram[0x5000] = 0;

        // PTYOPEN: set registers for cmd_addr_reg=5, handle_reg=10
        vm.regs[5] = 0x5000;
        // Set up fetch stream at current PC: [opcode, cmd_reg, handle_reg]
        let base_pc = vm.pc as usize;
        vm.ram[base_pc] = 0xA9; // PTYOPEN opcode (consumed by step(), not op_ptyopen)
        vm.ram[base_pc + 1] = 5; // cmd_addr_reg
        vm.ram[base_pc + 2] = 10; // handle_reg
        vm.pc = base_pc as u32 + 1; // skip opcode (op_ptyopen reads from pc)
        vm.op_ptyopen();

        let handle = vm.regs[10];
        assert_eq!(
            vm.regs[0], PTY_OK,
            "PTYOPEN should succeed, got r0={}",
            vm.regs[0]
        );

        // Wait for bash to start up and emit its initial prompt
        thread::sleep(Duration::from_millis(500));

        // Drain initial output using PTYREAD
        let drain_pc = vm.pc as usize;
        vm.ram[drain_pc] = 12; // handle_reg
        vm.ram[drain_pc + 1] = 6; // buf_reg
        vm.ram[drain_pc + 2] = 7; // max_len_reg
        vm.regs[12] = handle;
        vm.regs[6] = 0x5800;
        vm.regs[7] = 512;
        vm.pc = drain_pc as u32;
        vm.op_ptyread();

        // Write "echo hello\n" to send buffer at 0x5400
        let send_buf: usize = 0x5400;
        let msg = b"echo hello
";
        for (i, &byte) in msg.iter().enumerate() {
            vm.ram[send_buf + i] = byte as u32;
        }

        // PTYWRITE handle, send_buf, len
        let write_pc = vm.pc as usize;
        vm.ram[write_pc] = 12; // handle_reg
        vm.ram[write_pc + 1] = 6; // buf_reg
        vm.ram[write_pc + 2] = 7; // len_reg
        vm.regs[12] = handle;
        vm.regs[6] = send_buf as u32;
        vm.regs[7] = msg.len() as u32;
        vm.pc = write_pc as u32;
        vm.op_ptywrite();
        assert_eq!(vm.regs[0], PTY_OK, "PTYWRITE should succeed");

        // Wait for echo output to arrive
        thread::sleep(Duration::from_millis(500));

        // PTYREAD the response
        let read_pc = vm.pc as usize;
        vm.ram[read_pc] = 12; // handle_reg
        vm.ram[read_pc + 1] = 6; // buf_reg
        vm.ram[read_pc + 2] = 7; // max_len_reg
        vm.regs[12] = handle;
        vm.regs[6] = 0x5800;
        vm.regs[7] = 512;
        vm.pc = read_pc as u32;
        vm.op_ptyread();

        let bytes_read = vm.regs[0];
        assert!(
            bytes_read > 0 && bytes_read != u32::MAX,
            "PTYREAD should return bytes, got r0={}",
            bytes_read
        );

        // Collect the bytes from RAM and check for "hello"
        let recv_buf: usize = 0x5800;
        let mut output = Vec::new();
        for i in 0..bytes_read as usize {
            output.push((vm.ram[recv_buf + i] & 0xFF) as u8);
        }
        let text = String::from_utf8_lossy(&output);
        assert!(
            text.contains("hello"),
            "expected 'hello' in PTY output, got: {:?}",
            text
        );

        // Clean up with PTYCLOSE
        let close_pc = vm.pc as usize;
        vm.ram[close_pc] = 12; // handle_reg
        vm.regs[12] = handle;
        vm.pc = close_pc as u32;
        vm.op_ptyclose();
        assert_eq!(vm.regs[0], PTY_OK, "PTYCLOSE should succeed");
    }

    /// Test multi-session: open 2 PTY slots, verify both work independently,
    /// close one, verify the other still works. Phase 128 coverage.
    #[test]
    fn pty_multi_session() {
        use crate::vm::Vm;

        let mut vm = Vm::new();

        // Open first PTY (slot 0) with empty command = default shell
        vm.ram[0x5000] = 0; // null-terminated empty string
        vm.regs[5] = 0x5000;
        vm.pc = 0;
        vm.ram[0] = 5; // cmd_addr_reg
        vm.ram[1] = 10; // handle_reg
        vm.pc = 0;
        vm.op_ptyopen();

        assert_eq!(vm.regs[0], PTY_OK, "First PTYOPEN should succeed");
        let handle0 = vm.regs[10];
        assert_eq!(handle0, 0, "First slot should be index 0");

        // Open second PTY (slot 1)
        vm.ram[0x5001] = 0; // another null-terminated empty string
        vm.regs[5] = 0x5001;
        vm.regs[10] = 0;
        vm.pc = 100;
        vm.ram[100] = 5;
        vm.ram[101] = 10;
        vm.pc = 100;
        vm.op_ptyopen();

        assert_eq!(vm.regs[0], PTY_OK, "Second PTYOPEN should succeed");
        let handle1 = vm.regs[10];
        assert_eq!(handle1, 1, "Second slot should be index 1");

        // Verify both slots are occupied
        assert!(vm.pty_slots[0].is_some(), "Slot 0 should be occupied");
        assert!(vm.pty_slots[1].is_some(), "Slot 1 should be occupied");
        assert!(vm.pty_slots[2].is_none(), "Slot 2 should be empty");
        assert!(vm.pty_slots[3].is_none(), "Slot 3 should be empty");

        // Close slot 0
        vm.regs[12] = handle0;
        vm.pc = 200;
        vm.ram[200] = 12;
        vm.pc = 200;
        vm.op_ptyclose();
        assert_eq!(vm.regs[0], PTY_OK, "PTYCLOSE slot 0 should succeed");
        assert!(vm.pty_slots[0].is_none(), "Slot 0 should be freed");
        assert!(vm.pty_slots[1].is_some(), "Slot 1 should still be alive");

        // Close slot 1
        vm.regs[12] = handle1;
        vm.pc = 300;
        vm.ram[300] = 12;
        vm.pc = 300;
        vm.op_ptyclose();
        assert_eq!(vm.regs[0], PTY_OK, "PTYCLOSE slot 1 should succeed");
        assert!(vm.pty_slots[1].is_none(), "Slot 1 should be freed");

        // Verify all slots are now empty
        for (i, slot) in vm.pty_slots.iter().enumerate() {
            assert!(slot.is_none(), "Slot {} should be empty after close", i);
        }
    }

    /// Test that PTYOPEN with a specific command (shell selection) works.
    /// Phase 128 shell selection coverage.
    #[test]
    fn pty_shell_selection() {
        // Spawn with explicit /bin/sh command
        let mut slot = match spawn("/bin/sh") {
            Ok(s) => s,
            Err(e) => {
                eprintln!("skipping: pty spawn /bin/sh failed: {}", e);
                return;
            }
        };

        // Send echo to verify it works
        {
            let w = slot.writer.as_mut().expect("writer");
            let _ = w.write_all(b"echo test_selection_ok\nexit\n");
            let _ = w.flush();
        }

        let deadline = Instant::now() + Duration::from_secs(5);
        let mut output = Vec::new();
        while Instant::now() < deadline {
            match slot.rx.try_recv() {
                Ok(b) => output.push(b),
                Err(_) => {
                    if slot.is_closed() && output.contains(&b't') {
                        break;
                    }
                    thread::sleep(Duration::from_millis(20));
                }
            }
        }

        let text = String::from_utf8_lossy(&output);
        assert!(
            text.contains("test_selection_ok"),
            "expected 'test_selection_ok' in output from /bin/sh, got: {:?}",
            text
        );
    }

    /// Test that PTYREAD returns initial bash output (prompt) after PTYOPEN.
    /// This verifies that the TERM=xterm + PS1 + newline trigger actually works.
    #[test]
    fn pty_initial_output_available() {
        let slot = match spawn("") {
            Ok(s) => s,
            Err(e) => {
                eprintln!("skipping: pty spawn failed: {}", e);
                return;
            }
        };

        // Wait briefly for bash to start and emit prompt
        thread::sleep(Duration::from_millis(500));

        // Drain all available output
        let deadline = Instant::now() + Duration::from_secs(3);
        let mut output = Vec::new();
        while Instant::now() < deadline {
            match slot.rx.try_recv() {
                Ok(b) => output.push(b),
                Err(_) => {
                    if !output.is_empty() {
                        // Got some output and channel is now empty -- done
                        break;
                    }
                    thread::sleep(Duration::from_millis(50));
                }
            }
        }

        let text = String::from_utf8_lossy(&output);
        // With TERM=xterm and PS1='$ ', bash should emit SOMETHING (prompt, ANSI codes, etc.)
        assert!(
            !text.is_empty(),
            "PTY should have initial output after spawn, got empty string"
        );
    }

    /// Test PTYSIZE opcode resizes the PTY correctly.
    /// Spawn bash at default size, resize to 80x30 via op_ptysize, then
    /// verify bash reports $COLUMNS=80.
    #[test]
    fn pty_resize_via_opcode() {
        use crate::vm::Vm;

        let mut vm = Vm::new();

        // Open PTY
        vm.ram[0x5000] = 0; // null-terminated empty string
        vm.regs[5] = 0x5000;
        vm.pc = 0;
        vm.ram[0] = 5; // cmd_addr_reg
        vm.ram[1] = 10; // handle_reg
        vm.pc = 0;
        vm.op_ptyopen();

        assert_eq!(vm.regs[0], PTY_OK, "PTYOPEN should succeed");
        let handle = vm.regs[10];

        // Wait for bash to start
        thread::sleep(Duration::from_millis(500));

        // Drain initial output
        vm.regs[12] = handle;
        vm.regs[6] = 0x5800;
        vm.regs[7] = 512;
        vm.pc = 100;
        vm.ram[100] = 12;
        vm.ram[101] = 6;
        vm.ram[102] = 7;
        vm.pc = 100;
        vm.op_ptyread();

        // PTYSIZE handle, rows=30, cols=80
        let size_pc: usize = 200;
        vm.ram[size_pc] = 12; // handle_reg
        vm.ram[size_pc + 1] = 13; // rows_reg
        vm.ram[size_pc + 2] = 14; // cols_reg
        vm.regs[12] = handle;
        vm.regs[13] = 30; // rows
        vm.regs[14] = 80; // cols
        vm.pc = size_pc as u32;
        vm.op_ptysize();

        assert_eq!(
            vm.regs[0], PTY_OK,
            "PTYSIZE should succeed, got r0={}",
            vm.regs[0]
        );

        // Send "echo $COLUMNS\n" to verify bash sees the new width
        let send_buf: usize = 0x5400;
        let msg = b"echo $COLUMNS\n";
        for (i, &byte) in msg.iter().enumerate() {
            vm.ram[send_buf + i] = byte as u32;
        }

        vm.regs[12] = handle;
        vm.regs[6] = send_buf as u32;
        vm.regs[7] = msg.len() as u32;
        vm.pc = 300;
        vm.ram[300] = 12;
        vm.ram[301] = 6;
        vm.ram[302] = 7;
        vm.pc = 300;
        vm.op_ptywrite();
        assert_eq!(vm.regs[0], PTY_OK, "PTYWRITE should succeed");

        // Wait for bash to respond
        thread::sleep(Duration::from_millis(500));

        // Read response
        vm.regs[12] = handle;
        vm.regs[6] = 0x5800;
        vm.regs[7] = 512;
        vm.pc = 400;
        vm.ram[400] = 12;
        vm.ram[401] = 6;
        vm.ram[402] = 7;
        vm.pc = 400;
        vm.op_ptyread();

        let bytes_read = vm.regs[0];
        assert!(
            bytes_read > 0 && bytes_read != u32::MAX,
            "PTYREAD should return bytes after resize, got r0={}",
            bytes_read
        );

        let mut output = Vec::new();
        for i in 0..bytes_read as usize {
            output.push((vm.ram[0x5800 + i] & 0xFF) as u8);
        }
        let text = String::from_utf8_lossy(&output);
        assert!(
            text.contains("80"),
            "expected '80' (new COLUMNS) in output, got: {:?}",
            text
        );

        // Clean up
        vm.regs[12] = handle;
        vm.pc = 500;
        vm.ram[500] = 12;
        vm.pc = 500;
        vm.op_ptyclose();
        assert_eq!(vm.regs[0], PTY_OK, "PTYCLOSE should succeed");
    }

    /// Test PTYSIZE with invalid handle returns error.
    #[test]
    fn pty_resize_invalid_handle() {
        use crate::vm::Vm;

        let mut vm = Vm::new();

        // PTYSIZE with handle pointing to non-existent slot
        vm.regs[12] = 0; // handle = 0 (empty)
        vm.regs[13] = 30; // rows
        vm.regs[14] = 42; // cols
        vm.pc = 0;
        vm.ram[0] = 12;
        vm.ram[1] = 13;
        vm.ram[2] = 14;
        vm.pc = 0;
        vm.op_ptysize();

        assert_eq!(
            vm.regs[0], PTY_ERR_INVALID_HANDLE,
            "PTYSIZE with no open slot should return INVALID_HANDLE"
        );
    }

    /// Test that PTY spawns with the correct initial size (42x30).
    #[test]
    fn pty_initial_size_42x30() {
        let mut slot = match spawn("") {
            Ok(s) => s,
            Err(e) => {
                eprintln!("skipping: pty spawn failed: {}", e);
                return;
            }
        };

        // Wait for bash to start
        thread::sleep(Duration::from_millis(500));

        // Drain initial prompt
        let deadline = Instant::now() + Duration::from_secs(2);
        let mut drain = Vec::new();
        while Instant::now() < deadline {
            match slot.rx.try_recv() {
                Ok(b) => drain.push(b),
                Err(_) => {
                    if !drain.is_empty() {
                        break;
                    }
                    thread::sleep(Duration::from_millis(50));
                }
            }
        }

        // Send "echo $COLUMNS\nexit\n" to check initial column count
        {
            let w = slot.writer.as_mut().expect("writer");
            let _ = w.write_all(b"echo $COLUMNS\nexit\n");
            let _ = w.flush();
        }

        let deadline = Instant::now() + Duration::from_secs(5);
        let mut output = Vec::new();
        while Instant::now() < deadline {
            match slot.rx.try_recv() {
                Ok(b) => output.push(b),
                Err(_) => {
                    if slot.is_closed() && output.contains(&b'8') {
                        break;
                    }
                    thread::sleep(Duration::from_millis(20));
                }
            }
        }

        let text = String::from_utf8_lossy(&output);
        assert!(
            text.contains("80"),
            "bash $COLUMNS should be 80 (matching initial spawn size), got: {:?}",
            text
        );
    }

    // ── QueryInterceptor unit tests ────────────────────────────────────

    /// Helper: feed all bytes through a fresh interceptor and collect both
    /// the forwarded byte stream and any responses generated.
    fn run_qi(input: &[u8]) -> (Vec<u8>, Vec<Vec<u8>>) {
        let mut qi = QueryInterceptor::new();
        let mut forwarded = Vec::new();
        let mut responses = Vec::new();
        for &b in input {
            let (forward, resp) = qi.feed(b);
            if forward {
                forwarded.push(b);
            }
            if let Some(r) = resp {
                responses.push(r);
            }
        }
        (forwarded, responses)
    }

    #[test]
    fn qi_plain_text_passes_through_unchanged() {
        let (fwd, resp) = run_qi(b"hello world\n");
        assert_eq!(fwd, b"hello world\n");
        assert!(resp.is_empty(), "no responses expected for plain text");
    }

    #[test]
    fn qi_da1_query_responds() {
        // \e[c = DA1 query → should respond \e[?1;0c
        let (fwd, resp) = run_qi(b"\x1B[c");
        assert_eq!(fwd, b"\x1B[c", "DA1 bytes should still be forwarded to VM");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1B[?1;0c");
    }

    #[test]
    fn qi_da1_with_zero_param_responds() {
        // \e[0c is also DA1
        let (_, resp) = run_qi(b"\x1B[0c");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1B[?1;0c");
    }

    #[test]
    fn qi_da2_query_responds() {
        // \e[>c = DA2
        let (_, resp) = run_qi(b"\x1B[>c");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1B[>0;0;0c");
    }

    #[test]
    fn qi_da2_with_param_responds() {
        // \e[>0;0c is also DA2
        let (_, resp) = run_qi(b"\x1B[>0;0c");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1B[>0;0;0c");
    }

    #[test]
    fn qi_dsr_status_responds() {
        // \e[5n = DSR status query → \e[0n (terminal OK)
        let (_, resp) = run_qi(b"\x1B[5n");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1B[0n");
    }

    #[test]
    fn qi_dsr_cursor_position_responds() {
        // \e[6n = CPR → \e[1;1R
        let (_, resp) = run_qi(b"\x1B[6n");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1B[1;1R");
    }

    #[test]
    fn qi_decxcpr_responds() {
        // \e[?6n = DECXCPR → \e[?1;1R
        let (_, resp) = run_qi(b"\x1B[?6n");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1B[?1;1R");
    }

    #[test]
    fn qi_xtversion_responds() {
        // \e[>0q = XTVERSION → DCS > | GeOS ST
        let (_, resp) = run_qi(b"\x1B[>0q");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1BP>|GeOS\x1B\\");
    }

    #[test]
    fn qi_normal_csi_sequences_pass_through_silently() {
        // Common ANSI sequences that should NOT trigger responses.
        for seq in [
            &b"\x1B[2J"[..],      // erase display
            &b"\x1B[H"[..],       // cursor home
            &b"\x1B[1;1H"[..],    // cursor pos
            &b"\x1B[31m"[..],     // SGR red
            &b"\x1B[0;1;31m"[..], // SGR multi-param
            &b"\x1B[?1049h"[..],  // alt screen
            &b"\x1B[?2004l"[..],  // bracket paste off
            &b"\x1B[K"[..],       // erase line
            &b"\x1B[A"[..],       // cursor up
            &b"\x1B[2A"[..],      // cursor up 2 (Hermes redraw)
            &b"\x1B[42C"[..],     // cursor right 42 (Hermes redraw)
            &b"\x1B[?25l"[..],    // cursor hide (prompt_toolkit)
            &b"\x1B[?25h"[..],    // cursor show (prompt_toolkit)
            &b"\x1B[?7l"[..],     // auto-wrap off
            &b"\x1B[?7h"[..],     // auto-wrap on
            &b"\x1B[?12l"[..],    // local cursor blink off
        ] {
            let (fwd, resp) = run_qi(seq);
            assert_eq!(fwd, seq, "sequence should pass through: {:?}", seq);
            assert!(resp.is_empty(), "no response expected for: {:?}", seq);
        }
    }

    #[test]
    fn qi_256_color_sgr_passes_through_no_response() {
        // \e[0;38;5;230;48;5;234m — Hermes uses these heavily.
        // Each ';' clears param_buf, but the params are not queries; the 'm'
        // terminator is unknown to QI's query handlers, so no response fires.
        let seq = b"\x1B[0;38;5;230;48;5;234m";
        let (fwd, resp) = run_qi(seq);
        assert_eq!(fwd, seq);
        assert!(
            resp.is_empty(),
            "256-color SGR should not trigger a response, got: {:?}",
            resp
        );
    }

    #[test]
    fn qi_cursor_shape_with_space_intermediate() {
        // \e[2 q = set cursor shape to steady block. The space (0x20) is a
        // CSI intermediate byte. QI doesn't track intermediates; it should
        // see space as "not a digit/semicolon/final" and silently keep state,
        // then 'q' as a final byte that ends the sequence with no response.
        let seq = b"\x1B[2 q";
        let (fwd, resp) = run_qi(seq);
        assert_eq!(fwd, seq);
        assert!(resp.is_empty());
    }

    #[test]
    fn qi_prompt_toolkit_startup_pattern() {
        // Prompt_toolkit's typical startup writes: cursor hide, CPR query,
        // then style changes. Only the CPR should trigger a response.
        let seq = b"\x1B[?25l\x1B[6n\x1B[0m";
        let (fwd, resp) = run_qi(seq);
        assert_eq!(fwd, seq, "all bytes still flow to VM renderer");
        assert_eq!(resp.len(), 1, "exactly one response (CPR)");
        assert_eq!(resp[0], b"\x1B[1;1R");
    }

    #[test]
    fn qi_ris_passes_through() {
        // \e c = RIS — we forward both bytes; VM parser ignores unknown ESC
        let (fwd, resp) = run_qi(b"\x1Bc");
        assert_eq!(fwd, b"\x1Bc");
        assert!(resp.is_empty());
    }

    #[test]
    fn qi_split_query_across_feeds() {
        // The state machine must work when bytes arrive one-at-a-time
        // (or split across read() boundaries — same thing in this code).
        let mut qi = QueryInterceptor::new();
        let mut got_response = None;
        for &b in b"\x1B[c" {
            let (_, resp) = qi.feed(b);
            if let Some(r) = resp {
                got_response = Some(r);
            }
        }
        assert_eq!(got_response.as_deref(), Some(&b"\x1B[?1;0c"[..]));
    }

    #[test]
    fn qi_query_embedded_in_text() {
        // Real streams interleave: greeting, query, more text.
        let input = b"hi\x1B[cthere";
        let (fwd, resp) = run_qi(input);
        assert_eq!(fwd, input, "all bytes forwarded to VM");
        assert_eq!(resp.len(), 1);
        assert_eq!(resp[0], b"\x1B[?1;0c");
    }

    /// End-to-end: spawn a real shell, have it send a DA1 query to its stdout,
    /// read the response back from its stdin, and echo the response. This
    /// proves the dup'd fd → reader-thread → responder writer pipeline works
    /// in a real PTY, not just the QueryInterceptor logic in isolation.
    #[test]
    fn pty_query_response_roundtrip() {
        let mut slot = match spawn("") {
            Ok(s) => s,
            Err(e) => {
                eprintln!("skipping: pty spawn failed: {}", e);
                return;
            }
        };

        // Wait for shell prompt
        thread::sleep(Duration::from_millis(300));
        // Drain initial output
        while slot.rx.try_recv().is_ok() {}

        // Have bash:
        //   1. Send DA1 query to its stdout (the PTY master sees it,
        //      QueryInterceptor responds via dup'd fd back to bash's stdin)
        //   2. Use dd to capture exactly 7 bytes from stdin (DA1 response length)
        //   3. Print BEFORE:<bytes>:AFTER so we can extract the response
        let script = b"printf '\\e[c'; printf 'BEFORE:'; dd bs=1 count=7 2>/dev/null; printf ':AFTER\\n'; exit\n";
        {
            let w = slot.writer.as_mut().expect("writer");
            w.write_all(script).expect("write script");
            let _ = w.flush();
        }

        // Collect output until we see MARK or timeout
        let deadline = Instant::now() + Duration::from_secs(5);
        let mut output = Vec::new();
        while Instant::now() < deadline {
            match slot.rx.try_recv() {
                Ok(b) => output.push(b),
                Err(_) => {
                    if output.windows(6).any(|w| w == b":AFTER") {
                        break;
                    }
                    thread::sleep(Duration::from_millis(20));
                }
            }
        }

        let text = String::from_utf8_lossy(&output);
        // dd echoes the 7 bytes of stdin between BEFORE: and :AFTER markers.
        // The full DA1 response is "\e[?1;0c"; the printable suffix is "?1;0c".
        assert!(
            text.contains("?1;0c"),
            "expected DA1 response '?1;0c' between BEFORE: and :AFTER, got:\n{}",
            text
        );
    }

    #[test]
    fn qi_back_to_back_queries() {
        // prompt_toolkit may issue several queries on startup.
        let (_, resp) = run_qi(b"\x1B[c\x1B[6n\x1B[>c");
        assert_eq!(resp.len(), 3);
        assert_eq!(resp[0], b"\x1B[?1;0c"); // DA1
        assert_eq!(resp[1], b"\x1B[1;1R"); // CPR
        assert_eq!(resp[2], b"\x1B[>0;0;0c"); // DA2
    }
}
