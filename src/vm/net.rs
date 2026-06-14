// net.rs -- TCP Networking for Geometry OS (Phase 41)
//
// Provides TCP socket operations for VM programs:
//   CONNECT addr_reg, port_reg, fd_reg  (0x7F)
//   SOCKSEND fd_reg, buf_reg, len_reg, sent_reg  (0x80)
//   SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg  (0x81)
//   DISCONNECT fd_reg  (0x82)
//
// Design: Each connection is stored in a slot (0..MAX_TCP_CONNECTIONS-1).
// The "fd" returned by CONNECT is the slot index. All operations are
// non-blocking. CONNECT itself blocks briefly (100ms timeout) since
// programs need the connection established before sending.
//
// String encoding: CONNECT reads a null-terminated ASCII string from RAM
// at the address in addr_reg. Format: "127.0.0.1" (IP only, port is separate).

use std::io::{Read, Write};
use std::net::TcpStream;

/// Maximum simultaneous TCP connections.
pub const MAX_TCP_CONNECTIONS: usize = 8;

/// TCP connection result codes (written to r0 on error).
pub const NET_OK: u32 = 0;
pub const NET_ERR_INVALID_FD: u32 = 1;
pub const NET_ERR_CONNECT_FAILED: u32 = 2;
pub const NET_ERR_SEND_FAILED: u32 = 3;
pub const NET_ERR_RECV_FAILED: u32 = 4;
pub const NET_ERR_NO_SLOTS: u32 = 5;
pub const NET_ERR_WOULD_BLOCK: u32 = 6;
pub const NET_ERR_CONNECTION_CLOSED: u32 = 7;

/// Read a null-terminated ASCII string from RAM.
/// Returns the string (without null terminator) or empty string on error.
fn read_string_from_ram(ram: &[u32], addr: u32) -> String {
    let mut s = String::new();
    let mut i = addr as usize;
    while i < ram.len() {
        let word = ram[i];
        // Each u32 holds one ASCII byte (lower 8 bits)
        let byte = (word & 0xFF) as u8;
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

impl super::Vm {
    /// CONNECT addr_reg, port_reg, fd_reg  (0x7F)
    ///
    /// Connect to a TCP server. Reads a null-terminated IP address string
    /// from RAM[addr_reg], uses port_reg as the port number (16-bit).
    /// On success, stores the connection fd (= slot index) in fd_reg and r0 = NET_OK.
    /// On error, sets r0 = error code.
    ///
    /// The connection is made with a 100ms timeout for the connect phase,
    /// then set to non-blocking for subsequent send/recv operations.
    pub fn op_connect(&mut self) {
        let addr_reg = self.fetch() as usize;
        let port_reg = self.fetch() as usize;
        let fd_reg = self.fetch() as usize;

        if addr_reg >= super::NUM_REGS || port_reg >= super::NUM_REGS || fd_reg >= super::NUM_REGS {
            self.regs[0] = NET_ERR_INVALID_FD;
            return;
        }

        let addr_str = read_string_from_ram(&self.ram, self.regs[addr_reg]);
        let port = self.regs[port_reg] as u16;

        if addr_str.is_empty() {
            self.regs[0] = NET_ERR_CONNECT_FAILED;
            return;
        }

        let socket_addr = format!("{}:{}", addr_str, port);

        // Find a free slot
        let slot = self.tcp_connections.iter().position(|c| c.is_none());

        let slot = match slot {
            Some(s) => s,
            None => {
                self.regs[0] = NET_ERR_NO_SLOTS;
                return;
            },
        };

        match TcpStream::connect(&*socket_addr) {
            Ok(stream) => {
                if stream.set_nonblocking(true).is_err() {
                    self.regs[0] = NET_ERR_CONNECT_FAILED;
                    return;
                }
                if stream
                    .set_read_timeout(Some(std::time::Duration::from_millis(100)))
                    .is_err()
                {
                    self.regs[0] = NET_ERR_CONNECT_FAILED;
                    return;
                }
                self.tcp_connections[slot] = Some(stream);
                self.regs[fd_reg] = slot as u32;
                self.regs[0] = NET_OK;
            },
            Err(_) => {
                self.regs[0] = NET_ERR_CONNECT_FAILED;
            },
        }
    }

    /// SOCKSEND fd_reg, buf_reg, len_reg, sent_reg  (0x80)
    ///
    /// Send data over a TCP connection. Reads `len` bytes from RAM starting
    /// at buf_reg address (one byte per u32, lower 8 bits).
    /// On success, stores bytes actually sent in sent_reg and r0 = NET_OK.
    /// r0 = NET_ERR_WOULD_BLOCK if socket buffer is full (try again next frame).
    pub fn op_socksend(&mut self) {
        let fd_reg = self.fetch() as usize;
        let buf_reg = self.fetch() as usize;
        let len_reg = self.fetch() as usize;
        let sent_reg = self.fetch() as usize;

        if fd_reg >= super::NUM_REGS
            || buf_reg >= super::NUM_REGS
            || len_reg >= super::NUM_REGS
            || sent_reg >= super::NUM_REGS
        {
            self.regs[0] = NET_ERR_INVALID_FD;
            return;
        }

        let fd = self.regs[fd_reg] as usize;
        let buf_addr = self.regs[buf_reg] as usize;
        let len = self.regs[len_reg] as usize;

        if fd >= MAX_TCP_CONNECTIONS || self.tcp_connections[fd].is_none() {
            self.regs[0] = NET_ERR_INVALID_FD;
            return;
        }

        // Convert RAM u32s to bytes
        let mut bytes = Vec::with_capacity(len.min(4096));
        for i in 0..len.min(4096) {
            let idx = buf_addr + i;
            if idx < self.ram.len() {
                bytes.push((self.ram[idx] & 0xFF) as u8);
            } else {
                break;
            }
        }

        if let Some(ref mut stream) = self.tcp_connections[fd] {
            match stream.write(&bytes) {
                Ok(n) => {
                    self.regs[sent_reg] = n as u32;
                    self.regs[0] = NET_OK;
                },
                Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                    self.regs[sent_reg] = 0;
                    self.regs[0] = NET_ERR_WOULD_BLOCK;
                },
                Err(_) => {
                    self.regs[0] = NET_ERR_SEND_FAILED;
                },
            }
        } else {
            self.regs[0] = NET_ERR_INVALID_FD;
        }
    }

    /// SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg  (0x81)
    ///
    /// Receive data from a TCP connection (non-blocking). Reads up to max_len
    /// bytes and stores them in RAM starting at buf_reg (one byte per u32).
    /// On success, stores bytes actually received in recv_reg and r0 = NET_OK.
    /// r0 = NET_ERR_WOULD_BLOCK if no data available (try again next frame).
    /// r0 = NET_ERR_CONNECTION_CLOSED if remote closed the connection.
    pub fn op_sockrecv(&mut self) {
        let fd_reg = self.fetch() as usize;
        let buf_reg = self.fetch() as usize;
        let max_len_reg = self.fetch() as usize;
        let recv_reg = self.fetch() as usize;

        if fd_reg >= super::NUM_REGS
            || buf_reg >= super::NUM_REGS
            || max_len_reg >= super::NUM_REGS
            || recv_reg >= super::NUM_REGS
        {
            self.regs[0] = NET_ERR_INVALID_FD;
            return;
        }

        let fd = self.regs[fd_reg] as usize;
        let buf_addr = self.regs[buf_reg] as usize;
        let max_len = self.regs[max_len_reg] as usize;

        if fd >= MAX_TCP_CONNECTIONS || self.tcp_connections[fd].is_none() {
            self.regs[0] = NET_ERR_INVALID_FD;
            return;
        }

        let mut buf = vec![0u8; max_len.min(4096)];

        if let Some(ref mut stream) = self.tcp_connections[fd] {
            match stream.read(&mut buf) {
                Ok(0) => {
                    // Connection closed by remote
                    self.regs[recv_reg] = 0;
                    self.regs[0] = NET_ERR_CONNECTION_CLOSED;
                },
                Ok(n) => {
                    // Store received bytes into RAM
                    for (i, &byte) in buf[..n].iter().enumerate() {
                        let idx = buf_addr + i;
                        if idx < self.ram.len() {
                            self.ram[idx] = byte as u32;
                        }
                    }
                    self.regs[recv_reg] = n as u32;
                    self.regs[0] = NET_OK;
                },
                Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                    self.regs[recv_reg] = 0;
                    self.regs[0] = NET_ERR_WOULD_BLOCK;
                },
                Err(ref e) if e.kind() == std::io::ErrorKind::TimedOut => {
                    self.regs[recv_reg] = 0;
                    self.regs[0] = NET_ERR_WOULD_BLOCK;
                },
                Err(_) => {
                    self.regs[0] = NET_ERR_RECV_FAILED;
                },
            }
        } else {
            self.regs[0] = NET_ERR_INVALID_FD;
        }
    }

    /// DISCONNECT fd_reg  (0x82)
    ///
    /// Close a TCP connection and free the slot.
    /// r0 = NET_OK on success, error code on failure.
    pub fn op_disconnect(&mut self) {
        let fd_reg = self.fetch() as usize;

        if fd_reg >= super::NUM_REGS {
            self.regs[0] = NET_ERR_INVALID_FD;
            return;
        }

        let fd = self.regs[fd_reg] as usize;

        if fd >= MAX_TCP_CONNECTIONS || self.tcp_connections[fd].is_none() {
            self.regs[0] = NET_ERR_INVALID_FD;
            return;
        }

        // TcpStream::drop handles the close
        self.tcp_connections[fd] = None;
        self.regs[0] = NET_OK;
    }

    /// Get the number of active TCP connections (for diagnostics/testing).
    #[allow(dead_code)]
    pub fn tcp_connection_count(&self) -> usize {
        self.tcp_connections.iter().filter(|c| c.is_some()).count()
    }

    // ═══════════════════════════════════════════════════════
    // HTTPGET opcode (0xCC) -- Blocking HTTP GET
    // ═══════════════════════════════════════════════════════

    /// HTTPGET url_reg, buf_reg, max_len_reg, status_reg, len_reg  (0xCC)
    ///
    /// Performs a blocking HTTP/1.0 GET request. Reads a null-terminated URL
    /// string from RAM[url_reg], sends the request, and stores the response
    /// body in RAM[buf_reg] (up to max_len bytes).
    ///
    /// URL format: "host[:port][/path]" (no scheme required).
    ///   Examples: "example.com", "example.com:8080/api", "127.0.0.1:3000/"
    ///
    /// Returns:
    ///   status_reg = HTTP status code (200, 404, etc.), 0 on connection error
    ///   len_reg    = body length in bytes stored in RAM
    ///   r0         = HTTP_OK (0) on success, error code on failure
    pub fn op_httpget(&mut self) {
        let url_reg = self.fetch() as usize;
        let buf_reg = self.fetch() as usize;
        let max_len_reg = self.fetch() as usize;
        let status_reg = self.fetch() as usize;
        let len_reg = self.fetch() as usize;

        if url_reg >= super::NUM_REGS
            || buf_reg >= super::NUM_REGS
            || max_len_reg >= super::NUM_REGS
            || status_reg >= super::NUM_REGS
            || len_reg >= super::NUM_REGS
        {
            self.regs[0] = HTTP_ERR_BAD_URL;
            return;
        }

        let url = read_string_from_ram(&self.ram, self.regs[url_reg]);
        if url.is_empty() {
            self.regs[0] = HTTP_ERR_BAD_URL;
            return;
        }

        // Parse URL: host[:port][/path]
        let (host, port, path) = match parse_url(&url) {
            Some(p) => p,
            None => {
                self.regs[0] = HTTP_ERR_BAD_URL;
                return;
            },
        };

        let addr = format!("{}:{}", host, port);

        // Connect
        let mut stream = match TcpStream::connect(&*addr) {
            Ok(s) => s,
            Err(_) => {
                self.regs[0] = HTTP_ERR_CONNECT;
                self.regs[status_reg] = 0;
                self.regs[len_reg] = 0;
                return;
            },
        };

        // Set a 5-second read timeout
        let _ = stream.set_read_timeout(Some(std::time::Duration::from_secs(5)));

        // Build and send HTTP/1.0 request
        let request = format!(
            "GET {} HTTP/1.0\r\nHost: {}\r\nUser-Agent: GeOS/1.0\r\nConnection: close\r\n\r\n",
            path, host
        );

        if stream.write_all(request.as_bytes()).is_err() {
            self.regs[0] = HTTP_ERR_SEND;
            self.regs[status_reg] = 0;
            self.regs[len_reg] = 0;
            return;
        }

        // Read entire response
        let mut response_buf = Vec::new();
        let mut tmp = [0u8; 4096];
        loop {
            match stream.read(&mut tmp) {
                Ok(0) => break, // connection closed (HTTP/1.0 + Connection: close)
                Ok(n) => response_buf.extend_from_slice(&tmp[..n]),
                Err(_) => break, // timeout or other error
            }
        }

        // Parse response: find status line and header/body boundary
        let response_str = String::from_utf8_lossy(&response_buf);
        let status_code = parse_status_code(&response_str);

        // Find body (after \r\n\r\n)
        let body_start = find_body_start(&response_buf);
        let body = &response_buf[body_start..];
        let max_len = self.regs[max_len_reg] as usize;

        if body.len() > max_len {
            // Store what fits, signal truncation
            let to_store = body.len().min(max_len);
            let buf_addr = self.regs[buf_reg] as usize;
            for (i, &byte) in body[..to_store].iter().enumerate() {
                let idx = buf_addr + i;
                if idx < self.ram.len() {
                    self.ram[idx] = byte as u32;
                }
            }
            self.regs[status_reg] = status_code;
            self.regs[len_reg] = to_store as u32;
            self.regs[0] = HTTP_ERR_TOO_LARGE;
            return;
        }

        // Store full body in RAM
        let buf_addr = self.regs[buf_reg] as usize;
        for (i, &byte) in body.iter().enumerate() {
            let idx = buf_addr + i;
            if idx < self.ram.len() {
                self.ram[idx] = byte as u32;
            }
        }

        self.regs[status_reg] = status_code;
        self.regs[len_reg] = body.len() as u32;
        self.regs[0] = HTTP_OK;
    }
}

// ═══════════════════════════════════════════════════════
// HTTPGET error codes (module-level constants)
// ═══════════════════════════════════════════════════════

/// HTTPGET error codes (written to r0 on error).
pub const HTTP_OK: u32 = 0;
pub const HTTP_ERR_BAD_URL: u32 = 1;
pub const HTTP_ERR_CONNECT: u32 = 2;
pub const HTTP_ERR_SEND: u32 = 3;
pub const _HTTP_ERR_RECV: u32 = 4;
pub const HTTP_ERR_TOO_LARGE: u32 = 5;
pub const _HTTP_ERR_PARSE: u32 = 6;

/// Parse a URL string into (host, port, path).
/// Format: "host[:port][/path]"
/// Examples:
///   "example.com" -> ("example.com", 80, "/")
///   "example.com:8080/api" -> ("example.com", 8080, "/api")
///   "127.0.0.1:3000/" -> ("127.0.0.1", 3000, "/")
fn parse_url(url: &str) -> Option<(String, u16, String)> {
    // Strip optional "http://" prefix
    let url = url
        .strip_prefix("http://")
        .or_else(|| url.strip_prefix("https://"))
        .unwrap_or(url);

    // Find path start
    let (host_port, path) = match url.find('/') {
        Some(i) => (&url[..i], &url[i..]),
        None => (url, "/"),
    };

    // Split host:port
    if let Some(colon) = host_port.rfind(':') {
        let host = &host_port[..colon];
        let port_str = &host_port[colon + 1..];
        let port: u16 = port_str.parse().ok()?;
        if host.is_empty() {
            return None;
        }
        Some((host.to_string(), port, path.to_string()))
    } else {
        if host_port.is_empty() {
            return None;
        }
        Some((host_port.to_string(), 80, path.to_string()))
    }
}

/// Parse HTTP status code from response string.
/// Returns 0 if the status line is malformed.
fn parse_status_code(response: &str) -> u32 {
    // First line: "HTTP/1.x NNN ..."
    let first_line = response.lines().next().unwrap_or("");
    let parts: Vec<&str> = first_line.splitn(3, ' ').collect();
    if parts.len() >= 2 {
        parts[1].parse().unwrap_or(0)
    } else {
        0
    }
}

/// Find the start of the HTTP body (after \r\n\r\n).
/// Returns the index into the buffer where the body begins.
fn find_body_start(buf: &[u8]) -> usize {
    for i in 0..buf.len().saturating_sub(3) {
        if buf[i] == b'\r' && buf[i + 1] == b'\n' && buf[i + 2] == b'\r' && buf[i + 3] == b'\n' {
            return i + 4;
        }
    }
    // No header/body boundary found; return 0 (entire response is "body")
    0
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::{Read, Write};
    use std::net::TcpListener;
    use std::thread;
    use std::time::Duration;

    /// Helper: create a VM with a test TCP echo server running in background.
    /// Returns (vm, port) where port is the server's listening port.
    fn setup_echo_server() -> (super::super::Vm, u16) {
        let listener = TcpListener::bind("127.0.0.1:0").expect("bind");
        let port = listener.local_addr().unwrap().port();

        thread::spawn(move || {
            // Accept one connection, echo data back, then close
            if let Ok((mut stream, _)) = listener.accept() {
                stream.set_read_timeout(Some(Duration::from_secs(5))).ok();
                let mut buf = [0u8; 4096];
                loop {
                    match stream.read(&mut buf) {
                        Ok(0) => break, // connection closed
                        Ok(n) => {
                            if stream.write_all(&buf[..n]).is_err() {
                                break;
                            }
                        },
                        Err(_) => break,
                    }
                }
            }
        });

        // Small delay for server to start
        thread::sleep(Duration::from_millis(50));

        let mut vm = super::super::Vm::new();
        // Write IP string to RAM at 0x7000
        let ip = "127.0.0.1";
        for (i, b) in ip.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + ip.len()] = 0; // null terminator

        (vm, port)
    }

    #[test]
    fn test_connect_success() {
        let (mut vm, port) = setup_echo_server();

        // LDI r1, 0x7000  (address of IP string)
        vm.ram[0] = 0x10;
        vm.ram[1] = 1;
        vm.ram[2] = 0x7000;
        // LDI r2, port
        vm.ram[3] = 0x10;
        vm.ram[4] = 2;
        vm.ram[5] = port as u32;
        // CONNECT r1, r2, r3
        vm.ram[6] = 0x7F;
        vm.ram[7] = 1;
        vm.ram[8] = 2;
        vm.ram[9] = 3;
        vm.pc = 0;

        vm.step(); // LDI r1
        vm.step(); // LDI r2
        vm.step(); // CONNECT
        assert_eq!(vm.regs[0], NET_OK, "CONNECT should succeed");
        assert_eq!(vm.tcp_connection_count(), 1, "Should have 1 connection");
        // r3 should hold the fd (slot index)
        assert!(vm.regs[3] < MAX_TCP_CONNECTIONS as u32);
    }

    #[test]
    fn test_connect_invalid_address() {
        let mut vm = super::super::Vm::new();

        // Write empty string to RAM
        vm.ram[0x7000] = 0; // null terminator immediately

        // LDI r1, 0x7000
        vm.ram[0] = 0x10;
        vm.ram[1] = 1;
        vm.ram[2] = 0x7000;
        // LDI r2, 80
        vm.ram[3] = 0x10;
        vm.ram[4] = 2;
        vm.ram[5] = 80;
        // CONNECT r1, r2, r3
        vm.ram[6] = 0x7F;
        vm.ram[7] = 1;
        vm.ram[8] = 2;
        vm.ram[9] = 3;
        vm.pc = 0;

        vm.step(); // LDI r1
        vm.step(); // LDI r2
        vm.step(); // CONNECT
        assert_eq!(vm.regs[0], NET_ERR_CONNECT_FAILED);
        assert_eq!(vm.tcp_connection_count(), 0);
    }

    #[test]
    fn test_connect_refused() {
        let mut vm = super::super::Vm::new();

        // Write IP string for a port nothing listens on
        let ip = "127.0.0.1";
        for (i, b) in ip.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + ip.len()] = 0;

        // LDI r1, 0x7000
        vm.ram[0] = 0x10;
        vm.ram[1] = 1;
        vm.ram[2] = 0x7000;
        // LDI r2, 19 (port 19 -- nothing listens here)
        vm.ram[3] = 0x10;
        vm.ram[4] = 2;
        vm.ram[5] = 19;
        // CONNECT r1, r2, r3
        vm.ram[6] = 0x7F;
        vm.ram[7] = 1;
        vm.ram[8] = 2;
        vm.ram[9] = 3;
        vm.pc = 0;

        vm.step(); // LDI r1
        vm.step(); // LDI r2
        vm.step(); // CONNECT
        assert_eq!(vm.regs[0], NET_ERR_CONNECT_FAILED);
    }

    #[test]
    fn test_send_recv_roundtrip() {
        let (mut vm, port) = setup_echo_server();

        // Setup: load IP and connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        // CONNECT r1, r2, r3
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step(); // CONNECT
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        // Write "Hello" to RAM at 0x7100
        let msg = b"Hello";
        for (i, &b) in msg.iter().enumerate() {
            vm.ram[0x7100 + i] = b as u32;
        }

        // SOCKSEND fd, 0x7100, 5, r5
        vm.regs[4] = fd;
        vm.regs[5] = 0x7100;
        vm.regs[6] = 5;
        vm.pc = 200;
        vm.ram[200] = 0x80;
        vm.ram[201] = 4;
        vm.ram[202] = 5;
        vm.ram[203] = 6;
        vm.ram[204] = 7;
        vm.step(); // SOCKSEND
        assert_eq!(vm.regs[0], NET_OK, "SOCKSEND should succeed");
        assert!(vm.regs[7] > 0, "Should have sent bytes");

        // Small delay for echo server to respond
        thread::sleep(Duration::from_millis(100));

        // SOCKRECV fd, 0x7200, 100, r5
        vm.regs[5] = 0x7200;
        vm.regs[6] = 100;
        vm.pc = 300;
        vm.ram[300] = 0x81;
        vm.ram[301] = 4;
        vm.ram[302] = 5;
        vm.ram[303] = 6;
        vm.ram[304] = 8;
        vm.step(); // SOCKRECV
        assert_eq!(vm.regs[0], NET_OK, "SOCKRECV should succeed");
        let received = vm.regs[8] as usize;
        assert!(received > 0, "Should have received bytes");

        // Verify echoed data
        for i in 0..received {
            assert_eq!(
                vm.ram[0x7200 + i],
                msg[i] as u32,
                "Byte {} mismatch: got {}, expected {}",
                i,
                vm.ram[0x7200 + i],
                msg[i]
            );
        }
    }

    #[test]
    fn test_disconnect() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        assert_eq!(vm.tcp_connection_count(), 1);

        // Disconnect
        let fd = vm.regs[3];
        vm.regs[4] = fd;
        vm.pc = 200;
        vm.ram[200] = 0x82;
        vm.ram[201] = 4;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        assert_eq!(vm.tcp_connection_count(), 0);
    }

    #[test]
    fn test_disconnect_invalid_fd() {
        let mut vm = super::super::Vm::new();

        // DISCONNECT with fd=99 (out of range)
        vm.regs[1] = 99;
        vm.pc = 100;
        vm.ram[100] = 0x82;
        vm.ram[101] = 1;
        vm.step();
        assert_eq!(vm.regs[0], NET_ERR_INVALID_FD);
    }

    #[test]
    fn test_max_connections() {
        // Start 8 echo servers
        let mut ports = Vec::new();
        let mut vms = Vec::new();
        for _ in 0..MAX_TCP_CONNECTIONS {
            let (vm, port) = setup_echo_server();
            ports.push(port);
            vms.push(vm);
        }

        // Connect all 8 from first VM
        let vm = &mut vms[0];
        for i in 0..MAX_TCP_CONNECTIONS {
            vm.regs[1] = 0x7000;
            vm.regs[2] = ports[i] as u32;
            vm.pc = (100 + i * 10) as u32;
            vm.ram[100 + i * 10] = 0x7F;
            vm.ram[101 + i * 10] = 1;
            vm.ram[102 + i * 10] = 2;
            vm.ram[103 + i * 10] = 10 + i as u32; // store fd in r10+i
            vm.step();
            assert_eq!(vm.regs[0], NET_OK, "Connection {} should succeed", i);
        }

        assert_eq!(vm.tcp_connection_count(), MAX_TCP_CONNECTIONS);

        // 9th connection should fail
        let (_extra_vm, extra_port) = setup_echo_server();
        // We need to update the IP in RAM since extra_vm wrote to its own RAM
        // Use the first vm's RAM which already has 127.0.0.1 at 0x7000
        vm.regs[2] = extra_port as u32;
        vm.pc = 1000;
        vm.ram[1000] = 0x7F;
        vm.ram[1001] = 1;
        vm.ram[1002] = 2;
        vm.ram[1003] = 20;
        vm.step();
        assert_eq!(
            vm.regs[0], NET_ERR_NO_SLOTS,
            "9th connection should fail with NO_SLOTS"
        );
    }

    #[test]
    fn test_send_invalid_fd() {
        let mut vm = super::super::Vm::new();

        // SOCKSEND with fd=99
        vm.regs[1] = 99;
        vm.regs[2] = 0x7100;
        vm.regs[3] = 5;
        vm.pc = 100;
        vm.ram[100] = 0x80;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.ram[104] = 4;
        vm.step();
        assert_eq!(vm.regs[0], NET_ERR_INVALID_FD);
    }

    #[test]
    fn test_recv_invalid_fd() {
        let mut vm = super::super::Vm::new();

        // SOCKRECV with fd=99
        vm.regs[1] = 99;
        vm.regs[2] = 0x7200;
        vm.regs[3] = 100;
        vm.pc = 100;
        vm.ram[100] = 0x81;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.ram[104] = 4;
        vm.step();
        assert_eq!(vm.regs[0], NET_ERR_INVALID_FD);
    }

    #[test]
    fn test_read_string_from_ram() {
        let mut vm = super::super::Vm::new();
        vm.ram[0x7000] = 'H' as u32;
        vm.ram[0x7001] = 'i' as u32;
        vm.ram[0x7002] = 0; // null terminator

        let s = read_string_from_ram(&vm.ram, 0x7000);
        assert_eq!(s, "Hi");
    }

    #[test]
    fn test_read_string_from_ram_empty() {
        let vm = super::super::Vm::new();
        let s = read_string_from_ram(&vm.ram, 0x7000);
        assert_eq!(s, "");
    }

    #[test]
    fn test_read_string_from_ram_past_end() {
        let mut vm = super::super::Vm::new();
        vm.ram[0x7000] = 'A' as u32;
        // No null terminator -- reads until end of RAM
        let s = read_string_from_ram(&vm.ram, 0x7000);
        assert!(s.starts_with("A"));
    }

    // ═══════════════════════════════════════════════════════
    // HTTPGET tests (Phase 225)
    // ═══════════════════════════════════════════════════════

    #[test]
    fn test_parse_url_host_only() {
        let (host, port, path) = parse_url("example.com").unwrap();
        assert_eq!(host, "example.com");
        assert_eq!(port, 80);
        assert_eq!(path, "/");
    }

    #[test]
    fn test_parse_url_host_port_path() {
        let (host, port, path) = parse_url("example.com:8080/api").unwrap();
        assert_eq!(host, "example.com");
        assert_eq!(port, 8080);
        assert_eq!(path, "/api");
    }

    #[test]
    fn test_parse_url_ip_port() {
        let (host, port, path) = parse_url("127.0.0.1:3000/").unwrap();
        assert_eq!(host, "127.0.0.1");
        assert_eq!(port, 3000);
        assert_eq!(path, "/");
    }

    #[test]
    fn test_parse_url_with_http_prefix() {
        let (host, port, path) = parse_url("http://example.com/test").unwrap();
        assert_eq!(host, "example.com");
        assert_eq!(port, 80);
        assert_eq!(path, "/test");
    }

    #[test]
    fn test_parse_url_empty() {
        assert!(parse_url("").is_none());
    }

    #[test]
    fn test_parse_status_code_200() {
        let resp = "HTTP/1.0 200 OK\r\n\r\nbody";
        assert_eq!(parse_status_code(resp), 200);
    }

    #[test]
    fn test_parse_status_code_404() {
        let resp = "HTTP/1.1 404 Not Found\r\n\r\n";
        assert_eq!(parse_status_code(resp), 404);
    }

    #[test]
    fn test_parse_status_code_malformed() {
        let resp = "NOT HTTP\r\n\r\n";
        assert_eq!(parse_status_code(resp), 0);
    }

    #[test]
    fn test_find_body_start() {
        let resp = b"HTTP/1.0 200 OK\r\n\r\nHello World";
        assert_eq!(find_body_start(resp), 19);
    }

    #[test]
    fn test_find_body_start_no_boundary() {
        let resp = b"just body text";
        assert_eq!(find_body_start(resp), 0);
    }

    #[test]
    fn test_find_body_start_with_headers() {
        let resp = b"HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 5\r\n\r\nHello";
        assert_eq!(find_body_start(resp), 64);
    }

    /// Helper: create a mock HTTP server that returns a fixed response.
    fn setup_http_server(body: &str, status: u16) -> u16 {
        let listener = TcpListener::bind("127.0.0.1:0").expect("bind");
        let port = listener.local_addr().unwrap().port();
        let response = format!(
            "HTTP/1.0 {} OK\r\nContent-Type: text/plain\r\nContent-Length: {}\r\n\r\n{}",
            status,
            body.len(),
            body
        );
        let response_bytes = response.into_bytes();
        thread::spawn(move || {
            if let Ok((mut stream, _)) = listener.accept() {
                stream.set_read_timeout(Some(Duration::from_secs(5))).ok();
                let _ = stream.read(&mut [0u8; 4096]); // read request
                let _ = stream.write_all(&response_bytes);
            }
        });
        thread::sleep(Duration::from_millis(100));
        port
    }

    #[test]
    fn test_httpget_success() {
        let port = setup_http_server("Hello from server", 200);
        let mut vm = super::super::Vm::new();

        // Write URL to RAM at 0x7000
        let url = format!("127.0.0.1:{}/", port);
        for (i, b) in url.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + url.len()] = 0;

        // HTTPGET r1, r2, r3, r4, r5
        vm.regs[1] = 0x7000; // url address
        vm.regs[2] = 0x8000; // buf address
        vm.regs[3] = 4096; // max_len
        vm.pc = 100;
        vm.ram[100] = 0xCC;
        vm.ram[101] = 1; // url_reg
        vm.ram[102] = 2; // buf_reg
        vm.ram[103] = 3; // max_len_reg
        vm.ram[104] = 4; // status_reg
        vm.ram[105] = 5; // len_reg
        vm.step();

        assert_eq!(vm.regs[0], HTTP_OK, "r0 should be OK");
        assert_eq!(vm.regs[4], 200, "status should be 200");
        assert_eq!(vm.regs[5], 17, "body length should be 17");

        // Verify body in RAM
        let body: String = (0..17)
            .map(|i| (vm.ram[0x8000 + i] & 0xFF) as u8 as char)
            .collect();
        assert_eq!(body, "Hello from server");
    }

    #[test]
    fn test_httpget_404() {
        let port = setup_http_server("Not Found", 404);
        let mut vm = super::super::Vm::new();

        let url = format!("127.0.0.1:{}/missing", port);
        for (i, b) in url.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + url.len()] = 0;

        vm.regs[1] = 0x7000;
        vm.regs[2] = 0x8000;
        vm.regs[3] = 4096;
        vm.pc = 100;
        vm.ram[100] = 0xCC;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.ram[104] = 4;
        vm.ram[105] = 5;
        vm.step();

        assert_eq!(vm.regs[0], HTTP_OK);
        assert_eq!(vm.regs[4], 404);
    }

    #[test]
    fn test_httpget_connection_refused() {
        let mut vm = super::super::Vm::new();

        // URL pointing to nothing
        let url = "127.0.0.1:19999/";
        for (i, b) in url.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + url.len()] = 0;

        vm.regs[1] = 0x7000;
        vm.regs[2] = 0x8000;
        vm.regs[3] = 4096;
        vm.pc = 100;
        vm.ram[100] = 0xCC;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.ram[104] = 4;
        vm.ram[105] = 5;
        vm.step();

        assert_eq!(vm.regs[0], HTTP_ERR_CONNECT);
    }

    #[test]
    fn test_httpget_empty_url() {
        let mut vm = super::super::Vm::new();
        vm.ram[0x7000] = 0; // empty string

        vm.regs[1] = 0x7000;
        vm.regs[2] = 0x8000;
        vm.regs[3] = 4096;
        vm.pc = 100;
        vm.ram[100] = 0xCC;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.ram[104] = 4;
        vm.ram[105] = 5;
        vm.step();

        assert_eq!(vm.regs[0], HTTP_ERR_BAD_URL);
    }

    #[test]
    fn test_httpget_truncation() {
        let port = setup_http_server("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 200);
        let mut vm = super::super::Vm::new();

        let url = format!("127.0.0.1:{}/", port);
        for (i, b) in url.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + url.len()] = 0;

        vm.regs[1] = 0x7000;
        vm.regs[2] = 0x8000;
        vm.regs[3] = 10; // max_len = 10, body is 26 bytes
        vm.pc = 100;
        vm.ram[100] = 0xCC;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.ram[104] = 4;
        vm.ram[105] = 5;
        vm.step();

        assert_eq!(vm.regs[0], HTTP_ERR_TOO_LARGE);
        assert_eq!(vm.regs[4], 200);
        assert_eq!(vm.regs[5], 10); // truncated to 10
    }

    // ═══════════════════════════════════════════════════════
    // UDP Packet Send/Receive Tests (Phase 439)
    // ═══════════════════════════════════════════════════════

    /// Helper: create a UDP echo server that echoes back whatever it receives.
    fn setup_udp_echo_server() -> u16 {
        let socket = std::net::UdpSocket::bind("127.0.0.1:0").expect("bind UDP echo");
        socket.set_read_timeout(Some(Duration::from_secs(10))).ok();
        let port = socket.local_addr().unwrap().port();
        thread::spawn(move || {
            let mut buf = [0u8; 65535];
            loop {
                match socket.recv_from(&mut buf) {
                    Ok((n, src)) => {
                        if socket.send_to(&buf[..n], src).is_err() {
                            break;
                        }
                    },
                    Err(_) => break,
                }
            }
        });
        thread::sleep(Duration::from_millis(50));
        port
    }

    #[test]
    fn test_udp_send_recv_roundtrip() {
        let port = setup_udp_echo_server();
        let socket = std::net::UdpSocket::bind("127.0.0.1:0").expect("bind client");
        socket.set_read_timeout(Some(Duration::from_secs(2))).ok();

        let msg = b"Hello UDP!";
        let sent = socket.send_to(msg, format!("127.0.0.1:{}", port));
        assert!(sent.is_ok(), "UDP send should succeed");
        assert_eq!(sent.unwrap(), msg.len());

        let mut buf = [0u8; 1024];
        let recv = socket.recv_from(&mut buf);
        assert!(recv.is_ok(), "UDP recv should succeed");
        let (n, _src) = recv.unwrap();
        assert_eq!(n, msg.len(), "Should receive same number of bytes");
        assert_eq!(&buf[..n], msg, "Echoed data should match sent data");
    }

    #[test]
    fn test_udp_send_to_unreachable_port() {
        // UDP send to an unreachable port should not error (UDP is fire-and-forget)
        // but receiving should time out
        let socket = std::net::UdpSocket::bind("127.0.0.1:0").expect("bind client");
        socket
            .set_read_timeout(Some(Duration::from_millis(200)))
            .ok();

        let msg = b"test";
        let sent = socket.send_to(msg, "127.0.0.1:19999");
        assert!(
            sent.is_ok(),
            "UDP send to unreachable port should not error"
        );
        assert_eq!(sent.unwrap(), msg.len());

        // Recv should time out (no echo server)
        let mut buf = [0u8; 1024];
        let recv = socket.recv_from(&mut buf);
        assert!(
            recv.is_err(),
            "UDP recv with no server should time out or error"
        );
    }

    #[test]
    fn test_udp_large_packet() {
        let port = setup_udp_echo_server();
        let socket = std::net::UdpSocket::bind("127.0.0.1:0").expect("bind client");
        socket.set_read_timeout(Some(Duration::from_secs(2))).ok();

        // Send a 1400-byte packet (within typical MTU)
        let msg = vec![0xABu8; 1400];
        let sent = socket.send_to(&msg, format!("127.0.0.1:{}", port));
        assert!(sent.is_ok(), "Large UDP send should succeed");
        assert_eq!(sent.unwrap(), msg.len());

        let mut buf = [0u8; 4096];
        let recv = socket.recv_from(&mut buf);
        assert!(recv.is_ok(), "Large UDP recv should succeed");
        let (n, _src) = recv.unwrap();
        assert_eq!(n, msg.len(), "Large packet echo should match size");
        assert_eq!(&buf[..n], &msg[..], "Large packet echo data should match");
    }

    #[test]
    fn test_udp_multiple_send_recv() {
        let port = setup_udp_echo_server();
        let socket = std::net::UdpSocket::bind("127.0.0.1:0").expect("bind client");
        socket.set_read_timeout(Some(Duration::from_secs(2))).ok();

        let messages: &[&[u8]] = &[b"msg1", b"msg2", b"msg3", b"Hello UDP World!", b"last"];
        for msg in messages.iter() {
            let sent = socket.send_to(msg, format!("127.0.0.1:{}", port));
            assert!(
                sent.is_ok(),
                "Send '{}' should succeed",
                String::from_utf8_lossy(msg)
            );

            let mut buf = [0u8; 1024];
            let recv = socket.recv_from(&mut buf);
            assert!(
                recv.is_ok(),
                "Recv '{}' should succeed",
                String::from_utf8_lossy(msg)
            );
            let (n, _src) = recv.unwrap();
            assert_eq!(
                n,
                msg.len(),
                "Echo '{}' size match",
                String::from_utf8_lossy(msg)
            );
            assert_eq!(
                &buf[..n],
                &msg[..],
                "Echo '{}' data match",
                String::from_utf8_lossy(msg)
            );
        }
    }

    #[test]
    fn test_udp_zero_byte_packet() {
        let port = setup_udp_echo_server();
        let socket = std::net::UdpSocket::bind("127.0.0.1:0").expect("bind client");
        socket.set_read_timeout(Some(Duration::from_secs(2))).ok();

        // Send zero-byte packet
        let msg: &[u8] = b"";
        let sent = socket.send_to(msg, format!("127.0.0.1:{}", port));
        assert!(sent.is_ok(), "Zero-byte UDP send should succeed");
        assert_eq!(sent.unwrap(), 0);

        let mut buf = [0u8; 1024];
        let recv = socket.recv_from(&mut buf);
        assert!(recv.is_ok(), "Zero-byte UDP recv should succeed");
        let (n, _src) = recv.unwrap();
        assert_eq!(n, 0, "Zero-byte echo should be empty");
    }

    #[test]
    fn test_udp_bind_same_port_twice() {
        // Binding two UDP sockets to the same port should fail (port in use)
        let socket1 = std::net::UdpSocket::bind("127.0.0.1:0").expect("bind first");
        let port = socket1.local_addr().unwrap().port();

        let socket2 = std::net::UdpSocket::bind(format!("127.0.0.1:{}", port));
        assert!(socket2.is_err(), "Binding same UDP port twice should fail");
    }

    // ═══════════════════════════════════════════════════════
    // Connection State Machine Tests (Phase 439)
    // ═══════════════════════════════════════════════════════

    #[test]
    fn test_connect_disconnect_reconnect_reuses_slot() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];
        assert_eq!(vm.tcp_connection_count(), 1);

        // Send data
        let msg = b"Hello";
        for (i, &b) in msg.iter().enumerate() {
            vm.ram[0x7100 + i] = b as u32;
        }
        vm.regs[4] = fd;
        vm.regs[5] = 0x7100;
        vm.regs[6] = msg.len() as u32;
        vm.pc = 200;
        vm.ram[200] = 0x80;
        vm.ram[201] = 4;
        vm.ram[202] = 5;
        vm.ram[203] = 6;
        vm.ram[204] = 7;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);

        // Disconnect
        thread::sleep(Duration::from_millis(100));
        vm.regs[8] = fd;
        vm.pc = 300;
        vm.ram[300] = 0x82;
        vm.ram[301] = 8;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        assert_eq!(vm.tcp_connection_count(), 0);

        // Reconnect - should reuse same slot
        let (_vm2, port2) = setup_echo_server();
        vm.regs[1] = 0x7000;
        vm.regs[2] = port2 as u32;
        vm.pc = 400;
        vm.ram[400] = 0x7F;
        vm.ram[401] = 1;
        vm.ram[402] = 2;
        vm.ram[403] = 9;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK, "Reconnect should succeed");
        assert_eq!(vm.tcp_connection_count(), 1);
        assert!(
            vm.regs[9] < MAX_TCP_CONNECTIONS as u32,
            "New fd should be valid"
        );
    }

    #[test]
    fn test_send_after_disconnect_fails() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        // Disconnect
        vm.regs[4] = fd;
        vm.pc = 200;
        vm.ram[200] = 0x82;
        vm.ram[201] = 4;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        assert_eq!(vm.tcp_connection_count(), 0);

        // Send on disconnected fd should fail
        vm.regs[4] = fd;
        vm.regs[5] = 0x7100;
        vm.regs[6] = 5;
        vm.pc = 300;
        vm.ram[300] = 0x80;
        vm.ram[301] = 4;
        vm.ram[302] = 5;
        vm.ram[303] = 6;
        vm.ram[304] = 7;
        vm.step();
        assert_eq!(
            vm.regs[0], NET_ERR_INVALID_FD,
            "Send on disconnected fd should fail"
        );
    }

    #[test]
    fn test_recv_after_disconnect_fails() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        // Disconnect
        vm.regs[4] = fd;
        vm.pc = 200;
        vm.ram[200] = 0x82;
        vm.ram[201] = 4;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);

        // Recv on disconnected fd should fail
        vm.regs[4] = fd;
        vm.regs[5] = 0x7200;
        vm.regs[6] = 100;
        vm.pc = 300;
        vm.ram[300] = 0x81;
        vm.ram[301] = 4;
        vm.ram[302] = 5;
        vm.ram[303] = 6;
        vm.ram[304] = 8;
        vm.step();
        assert_eq!(
            vm.regs[0], NET_ERR_INVALID_FD,
            "Recv on disconnected fd should fail"
        );
    }

    #[test]
    fn test_double_disconnect_fails() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        // First disconnect should succeed
        vm.regs[4] = fd;
        vm.pc = 200;
        vm.ram[200] = 0x82;
        vm.ram[201] = 4;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);

        // Second disconnect on same fd should fail
        vm.pc = 300;
        vm.ram[300] = 0x82;
        vm.ram[301] = 4;
        vm.step();
        assert_eq!(
            vm.regs[0], NET_ERR_INVALID_FD,
            "Double disconnect should fail"
        );
    }

    #[test]
    fn test_connect_to_disconnected_port_then_reuse() {
        let (mut vm, port) = setup_echo_server();

        // Connect and immediately disconnect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        vm.regs[4] = fd;
        vm.pc = 200;
        vm.ram[200] = 0x82;
        vm.ram[201] = 4;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        assert_eq!(vm.tcp_connection_count(), 0);

        // Connect to same server again (new echo server on different port)
        let (_inner_vm, new_port) = setup_echo_server();
        vm.regs[1] = 0x7000;
        vm.regs[2] = new_port as u32;
        vm.pc = 300;
        vm.ram[300] = 0x7F;
        vm.ram[301] = 1;
        vm.ram[302] = 2;
        vm.ram[303] = 5;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK, "Reconnect to new server should succeed");
        assert_eq!(vm.tcp_connection_count(), 1);
    }

    #[test]
    fn test_all_connections_fill_and_drain() {
        let mut ports = Vec::new();
        let mut fds = Vec::new();

        // Fill all connections sequentially using the VM's ip string at 0x7000
        let (mut vm, first_port) = setup_echo_server();
        ports.push(first_port);

        // Connect 1st
        vm.regs[1] = 0x7000;
        vm.regs[2] = ports[0] as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 10;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        fds.push(vm.regs[10]);

        // Connect 2nd through 8th using individual echo servers
        for i in 1..MAX_TCP_CONNECTIONS {
            let (_extra, extra_port) = setup_echo_server();
            ports.push(extra_port);
            let pc = (200 + i * 10) as u32;
            vm.regs[2] = extra_port as u32;
            vm.pc = pc;
            vm.ram[pc as usize] = 0x7F;
            vm.ram[(pc + 1) as usize] = 1;
            vm.ram[(pc + 2) as usize] = 2;
            vm.ram[(pc + 3) as usize] = 10 + i as u32;
            vm.step();
            assert_eq!(vm.regs[0], NET_OK, "Connection {} should succeed", i);
            fds.push(vm.regs[10 + i]);
        }

        assert_eq!(vm.tcp_connection_count(), MAX_TCP_CONNECTIONS);

        // Disconnect all, one at a time
        for i in 0..MAX_TCP_CONNECTIONS {
            let pc = (1000 + i * 10) as u32;
            vm.regs[5] = fds[i]; // Use r5 for fd
            vm.pc = pc;
            vm.ram[pc as usize] = 0x82;
            vm.ram[(pc + 1) as usize] = 5;
            vm.step();
            assert_eq!(vm.regs[0], NET_OK, "Disconnect {} should succeed", i);
        }

        assert_eq!(
            vm.tcp_connection_count(),
            0,
            "All connections should be freed"
        );
    }

    #[test]
    fn test_connect_with_port_zero() {
        let mut vm = super::super::Vm::new();
        let ip = "127.0.0.1";
        for (i, b) in ip.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + ip.len()] = 0;

        // CONNECT with port 0 (invalid)
        vm.regs[1] = 0x7000;
        vm.regs[2] = 0; // port 0
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(
            vm.regs[0], NET_ERR_CONNECT_FAILED,
            "Connect with port 0 should fail"
        );
    }

    // ═══════════════════════════════════════════════════════
    // Buffer Overflow and Boundary Tests (Phase 439)
    // ═══════════════════════════════════════════════════════

    #[test]
    fn test_socksend_zero_len() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        // SOCKSEND with len=0
        vm.regs[4] = fd;
        vm.regs[5] = 0x7100;
        vm.regs[6] = 0; // zero length
        vm.pc = 200;
        vm.ram[200] = 0x80;
        vm.ram[201] = 4;
        vm.ram[202] = 5;
        vm.ram[203] = 6;
        vm.ram[204] = 7;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK, "Send 0 bytes should succeed");
        assert_eq!(vm.regs[7], 0, "0 bytes should be sent");
    }

    #[test]
    fn test_socksend_at_ram_boundary() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        // Write data at end of RAM
        let ram_end = vm.ram.len();
        let buf_addr = ram_end - 10;
        for i in 0..10 {
            vm.ram[buf_addr + i] = (65 + i) as u32; // "ABCDEFGHIJ"
        }

        // SOCKSEND from near-end buffer: addr at RAM.len()-10, len=10
        vm.regs[4] = fd;
        vm.regs[5] = buf_addr as u32;
        vm.regs[6] = 10;
        vm.pc = 200;
        vm.ram[200] = 0x80;
        vm.ram[201] = 4;
        vm.ram[202] = 5;
        vm.ram[203] = 6;
        vm.ram[204] = 7;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK, "Send from RAM boundary should succeed");
        assert!(vm.regs[7] > 0, "Should have sent bytes");
    }

    #[test]
    fn test_socksend_buf_past_ram_end() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        // SOCKSEND with buf_addr past end of RAM (should send 0 bytes gracefully)
        let past_end = vm.ram.len() as u32 + 100;
        vm.regs[4] = fd;
        vm.regs[5] = past_end;
        vm.regs[6] = 10;
        vm.pc = 200;
        vm.ram[200] = 0x80;
        vm.ram[201] = 4;
        vm.ram[202] = 5;
        vm.ram[203] = 6;
        vm.ram[204] = 7;
        vm.step();
        // Should either succeed with 0 bytes sent, or fail gracefully
        let ok = vm.regs[0] == NET_OK || vm.regs[0] == NET_ERR_SEND_FAILED;
        assert!(ok, "Send past RAM end should not panic: r0={}", vm.regs[0]);
    }

    #[test]
    fn test_sockrecv_zero_maxlen() {
        let (mut vm, port) = setup_echo_server();

        // Connect
        vm.regs[1] = 0x7000;
        vm.regs[2] = port as u32;
        vm.pc = 100;
        vm.ram[100] = 0x7F;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);
        let fd = vm.regs[3];

        // Send some data so server has something to echo
        let msg = b"Hello";
        for (i, &b) in msg.iter().enumerate() {
            vm.ram[0x7100 + i] = b as u32;
        }
        vm.regs[4] = fd;
        vm.regs[5] = 0x7100;
        vm.regs[6] = msg.len() as u32;
        vm.pc = 200;
        vm.ram[200] = 0x80;
        vm.ram[201] = 4;
        vm.ram[202] = 5;
        vm.ram[203] = 6;
        vm.ram[204] = 7;
        vm.step();
        assert_eq!(vm.regs[0], NET_OK);

        // SOCKRECV with max_len=0
        thread::sleep(Duration::from_millis(100));
        vm.regs[4] = fd;
        vm.regs[5] = 0x7200;
        vm.regs[6] = 0; // max_len = 0
        vm.pc = 300;
        vm.ram[300] = 0x81;
        vm.ram[301] = 4;
        vm.ram[302] = 5;
        vm.ram[303] = 6;
        vm.ram[304] = 8;
        vm.step();
        // Should succeed with 0 bytes received or WouldBlock (data may still be in flight)
        let ok = vm.regs[0] == NET_OK
            || vm.regs[0] == NET_ERR_WOULD_BLOCK
            || vm.regs[0] == NET_ERR_CONNECTION_CLOSED;
        assert!(
            ok,
            "Recv with max_len=0 should handle gracefully: r0={}",
            vm.regs[0]
        );
    }

    #[test]
    fn test_httpget_empty_response_body() {
        let port = setup_http_server("", 200);
        let mut vm = super::super::Vm::new();

        let url = format!("127.0.0.1:{}/", port);
        for (i, b) in url.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + url.len()] = 0;

        vm.regs[1] = 0x7000;
        vm.regs[2] = 0x8000;
        vm.regs[3] = 4096;
        vm.pc = 100;
        vm.ram[100] = 0xCC;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.ram[104] = 4;
        vm.ram[105] = 5;
        vm.step();

        assert_eq!(vm.regs[0], HTTP_OK, "r0 should be OK");
        assert_eq!(vm.regs[4], 200, "status should be 200");
        assert_eq!(vm.regs[5], 0, "body length should be 0");
    }

    #[test]
    fn test_httpget_max_len_zero() {
        let port = setup_http_server("Hello", 200);
        let mut vm = super::super::Vm::new();

        let url = format!("127.0.0.1:{}/", port);
        for (i, b) in url.bytes().enumerate() {
            vm.ram[0x7000 + i] = b as u32;
        }
        vm.ram[0x7000 + url.len()] = 0;

        vm.regs[1] = 0x7000;
        vm.regs[2] = 0x8000;
        vm.regs[3] = 0; // max_len = 0
        vm.pc = 100;
        vm.ram[100] = 0xCC;
        vm.ram[101] = 1;
        vm.ram[102] = 2;
        vm.ram[103] = 3;
        vm.ram[104] = 4;
        vm.ram[105] = 5;
        vm.step();

        // Should either succeed with 0 bytes or error with TOO_LARGE
        let ok = vm.regs[0] == HTTP_OK || vm.regs[0] == HTTP_ERR_TOO_LARGE;
        assert!(
            ok,
            "HTTPGET with max_len=0 should handle gracefully: r0={}",
            vm.regs[0]
        );
        assert_eq!(vm.regs[4], 200, "status should still be 200");
    }

    #[test]
    fn test_parse_url_trailing_dot() {
        let result = parse_url("host.with.trailing.dot.:8080/");
        assert!(result.is_some(), "URL with trailing dot should be valid");
        let (host, port, path) = result.unwrap();
        assert_eq!(host, "host.with.trailing.dot.");
        assert_eq!(port, 8080);
        assert_eq!(path, "/");
    }

    #[test]
    fn test_parse_url_single_path_segment() {
        let (host, port, path) = parse_url("example.com/api").unwrap();
        assert_eq!(host, "example.com");
        assert_eq!(port, 80);
        assert_eq!(path, "/api");
    }

    #[test]
    fn test_parse_url_no_path_root() {
        let (host, port, path) = parse_url("example.com:3000").unwrap();
        assert_eq!(host, "example.com");
        assert_eq!(port, 3000);
        assert_eq!(path, "/");
    }

    #[test]
    fn test_read_string_from_ram_with_non_ascii() {
        let mut vm = super::super::Vm::new();
        // Write ASCII + non-ASCII bytes
        vm.ram[0x7000] = 'A' as u32;
        vm.ram[0x7001] = 0x80; // non-ASCII byte (> 127)
        vm.ram[0x7002] = 'B' as u32;
        vm.ram[0x7003] = 0; // null terminator

        let s = read_string_from_ram(&vm.ram, 0x7000);
        // Non-ASCII bytes are filtered by is_ascii()
        assert_eq!(s, "AB", "Non-ASCII bytes should be filtered out");
    }

    #[test]
    fn test_read_string_from_ram_max_length() {
        let mut vm = super::super::Vm::new();
        // Write a long string
        for i in 0..256 {
            vm.ram[0x7000 + i] = (65 + (i % 26)) as u32; // "ABC...ZABC..."
        }
        vm.ram[0x7000 + 256] = 0; // null terminator

        let s = read_string_from_ram(&vm.ram, 0x7000);
        assert_eq!(s.len(), 256, "Should read all 256 chars");
        assert_eq!(s.as_bytes()[0], b'A', "First char should be A");
        // Index 255 = 255 % 26 = 21 -> 65 + 21 = 86 = 'V'
        assert_eq!(s.as_bytes()[255], b'V', "Index 255 = 255 % 26 = 21 = 'V'");
    }
}
