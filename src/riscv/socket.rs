// riscv/socket.rs -- Guest TCP Socket Proxy (Phase 201)
//
// Provides TCP socket operations for RISC-V guest programs via Linux-style
// syscall interception. When a bare-metal guest executes ECALL with socket
// syscall numbers (196=socket, 201=connect, 204=sendto, 205=recvfrom,
// 208=shutdown, 57=close), the CPU intercepts them and calls these methods.
//
// Design: Each connection gets a guest fd (slot index 0..MAX_GUEST_SOCKETS-1).
// Operations are synchronous — the VM step blocks during connect/send/recv.
// This is acceptable for guest programs that don't need non-blocking I/O.
// String data (addresses) is read from guest RAM via the Bus.

use std::io::{Read, Write};
use std::net::TcpStream;

/// Maximum simultaneous guest TCP connections.
pub const MAX_GUEST_SOCKETS: usize = 8;

/// Linux errno values returned to guest.
pub const EINVAL: u32 = 22;
pub const EBADF: u32 = 9;
pub const ENOMEM: u32 = 12;
pub const EAGAIN: u32 = 11;
pub const ECONNREFUSED: u32 = 111;
pub const ENOTCONN: u32 = 107;
pub const EISCONN: u32 = 106;

/// Linux socket address family.
pub const AF_INET: u32 = 2;
/// TCP socket type.
pub const SOCK_STREAM: u32 = 1;

/// A guest TCP connection.
/// stream is None when allocated via socket() but not yet connected via connect().
/// stream is Some after a successful connect(). sendto/recvfrom require Some.
struct GuestConnection {
    /// Host-side TCP stream. None = allocated but not connected.
    stream: Option<TcpStream>,
}

/// Guest socket manager. Holds up to MAX_GUEST_SOCKETS TCP connections.
pub struct GuestSockets {
    /// Connection slots. None = unused.
    connections: Vec<Option<GuestConnection>>,
}

impl GuestSockets {
    /// Create a new guest socket manager.
    pub fn new() -> Self {
        Self {
            connections: (0..MAX_GUEST_SOCKETS).map(|_| None).collect(),
        }
    }

    /// socket(domain, type, protocol) -> fd or -errno
    ///
    /// Only AF_INET + SOCK_STREAM is supported. Returns the slot index as fd.
    /// The connection is allocated but not yet connected.
    pub fn sys_socket(&mut self, domain: u32, sock_type: u32, _protocol: u32) -> i32 {
        if domain != AF_INET || (sock_type & 0xFF) != SOCK_STREAM {
            return -(EINVAL as i32);
        }
        let slot = self.connections.iter().position(|c| c.is_none());
        match slot {
            Some(idx) => {
                // Mark the slot as allocated (stream=None until connect() succeeds)
                self.connections[idx] = Some(GuestConnection { stream: None });
                idx as i32
            }
            None => -(ENOMEM as i32),
        }
    }

    /// connect(fd, addr_ptr, addr_len) -> 0 or -errno
    ///
    /// Reads a sockaddr_in from guest memory at addr_ptr.
    /// sockaddr_in layout (Linux): family(2) + port(2, network byte order) + addr(4) + padding(8)
    /// For RV32: u16 family, u16 port (big-endian), u32 addr (big-endian), u8[8] zero
    pub fn sys_connect<R: Fn(u64) -> u32>(
        &mut self,
        fd: i32,
        addr_ptr: u32,
        _addr_len: u32,
        read_mem: R,
    ) -> i32 {
        if fd < 0 || (fd as usize) >= MAX_GUEST_SOCKETS {
            return -(EBADF as i32);
        }

        // Read sockaddr_in from guest memory
        // Layout: bytes 0-1 = family, bytes 2-3 = port (network order), bytes 4-7 = addr
        let family = read_mem(addr_ptr as u64) & 0xFFFF;
        let port_net = read_mem((addr_ptr + 1) as u64) & 0xFFFF; // next u32 word
        let addr_net = read_mem((addr_ptr + 2) as u64);

        if family != AF_INET as u32 {
            return -(EINVAL as i32);
        }

        // Port is stored as (high_byte << 8) | low_byte, which is already the
        // correct u16 port value. No from_be() needed — the test encodes it
        // as a pre-assembled integer, not raw network bytes.
        let port = port_net as u16;
        let ip_bytes = addr_net.to_be_bytes();
        let ip = std::net::Ipv4Addr::new(ip_bytes[0], ip_bytes[1], ip_bytes[2], ip_bytes[3]);
        let socket_addr = std::net::SocketAddr::new(ip.into(), port);

        match TcpStream::connect(socket_addr) {
            Ok(stream) => {
                let _ = stream.set_nonblocking(false);
                let _ = stream.set_read_timeout(Some(std::time::Duration::from_secs(5)));
                let _ = stream.set_write_timeout(Some(std::time::Duration::from_secs(5)));
                self.connections[fd as usize] = Some(GuestConnection {
                    stream: Some(stream),
                });
                0
            }
            Err(_) => -(ECONNREFUSED as i32),
        }
    }

    /// sendto(fd, buf_ptr, len, flags, addr_ptr, addr_len) -> bytes_sent or -errno
    ///
    /// If addr_ptr is 0, sends on already-connected socket.
    pub fn sys_sendto<R: Fn(u64) -> u32>(
        &mut self,
        fd: i32,
        buf_ptr: u32,
        len: u32,
        _flags: u32,
        _addr_ptr: u32,
        _addr_len: u32,
        read_mem: R,
    ) -> i32 {
        if fd < 0 || (fd as usize) >= MAX_GUEST_SOCKETS {
            return -(EBADF as i32);
        }
        let conn = match &mut self.connections[fd as usize] {
            Some(c) if c.stream.is_some() => c,
            _ => return -(EBADF as i32),
        };

        let len = (len as usize).min(4096);
        let mut bytes = Vec::with_capacity(len);
        for i in 0..len {
            bytes.push((read_mem((buf_ptr + i as u32) as u64) & 0xFF) as u8);
        }

        match conn.stream.as_mut().unwrap().write(&bytes) {
            Ok(n) => n as i32,
            Err(_) => -1,
        }
    }

    /// recvfrom(fd, buf_ptr, len, flags, addr_ptr, addr_len_ptr) -> bytes_recv or -errno
    ///
    /// Writes received bytes into guest memory at buf_ptr.
    pub fn sys_recvfrom<W: FnMut(u64, u32)>(
        &mut self,
        fd: i32,
        buf_ptr: u32,
        max_len: u32,
        _flags: u32,
        mut write_mem: W,
    ) -> i32 {
        if fd < 0 || (fd as usize) >= MAX_GUEST_SOCKETS {
            return -(EBADF as i32);
        }
        let conn = match &mut self.connections[fd as usize] {
            Some(c) if c.stream.is_some() => c,
            _ => return -(EBADF as i32),
        };

        let max_len = (max_len as usize).min(4096);
        let mut buf = vec![0u8; max_len];

        match conn.stream.as_mut().unwrap().read(&mut buf) {
            Ok(0) => 0, // connection closed
            Ok(n) => {
                for (i, &byte) in buf[..n].iter().enumerate() {
                    write_mem((buf_ptr + i as u32) as u64, byte as u32);
                }
                n as i32
            }
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => -(EAGAIN as i32),
            Err(ref e) if e.kind() == std::io::ErrorKind::TimedOut => -(EAGAIN as i32),
            Err(_) => -1,
        }
    }

    /// shutdown(fd, how) -> 0 or -errno
    pub fn sys_shutdown(&mut self, fd: i32, _how: u32) -> i32 {
        if fd < 0 || (fd as usize) >= MAX_GUEST_SOCKETS {
            return -(EBADF as i32);
        }
        match &mut self.connections[fd as usize] {
            Some(conn) => {
                if let Some(s) = conn.stream.as_mut() {
                    let _ = s.shutdown(std::net::Shutdown::Both);
                }
                conn.stream = None;
                0
            }
            None => -(ENOTCONN as i32),
        }
    }

    /// close(fd) -> 0 or -errno
    ///
    /// Also handles socket fds. If fd is a socket slot, close the TCP connection.
    /// Returns 0 if fd was a socket (handled), or 1 if not a socket (let caller handle).
    pub fn sys_close(&mut self, fd: i32) -> i32 {
        if fd < 0 || (fd as usize) >= MAX_GUEST_SOCKETS {
            return 1; // not a socket fd, let caller handle
        }
        if self.connections[fd as usize].is_some() {
            self.connections[fd as usize] = None;
            0
        } else {
            1 // not an active socket
        }
    }

    /// Check if a fd is an active socket connection.
    #[allow(dead_code)]
    pub fn is_socket(&self, fd: i32) -> bool {
        fd >= 0
            && (fd as usize) < MAX_GUEST_SOCKETS
            && self.connections[fd as usize].is_some()
    }

    /// Get the number of active connections (for testing).
    #[allow(dead_code)]
    pub fn connection_count(&self) -> usize {
        self.connections.iter().filter(|c| c.is_some()).count()
    }

    /// connect_guest(fd, addr_str, port) -> 0 or -errno
    ///
    /// Direct connect using parsed address string and port (no guest RAM access).
    pub fn connect_guest(&mut self, fd: i32, addr_str: &str, port: u16) -> i32 {
        if fd < 0 || (fd as usize) >= MAX_GUEST_SOCKETS {
            return -(EBADF as i32);
        }
        let ip: std::net::Ipv4Addr = match addr_str.parse() {
            Ok(ip) => ip,
            Err(_) => return -(EINVAL as i32),
        };
        let socket_addr = std::net::SocketAddr::new(ip.into(), port);
        match TcpStream::connect(socket_addr) {
            Ok(stream) => {
                let _ = stream.set_nonblocking(false);
                let _ = stream.set_read_timeout(Some(std::time::Duration::from_secs(5)));
                let _ = stream.set_write_timeout(Some(std::time::Duration::from_secs(5)));
                self.connections[fd as usize] = Some(GuestConnection {
                    stream: Some(stream),
                });
                0
            }
            Err(_) => -(ECONNREFUSED as i32),
        }
    }

    /// sendto_guest(fd, data, addr_str, port) -> bytes_sent or -errno
    ///
    /// Send data directly. If not connected, auto-connects to addr_str:port first.
    pub fn sendto_guest(&mut self, fd: i32, data: &[u8], addr_str: &str, port: u16) -> i32 {
        if fd < 0 || (fd as usize) >= MAX_GUEST_SOCKETS {
            return -(EBADF as i32);
        }
        // Auto-connect if not yet connected
        if self.connections[fd as usize].is_none() {
            let ret = self.connect_guest(fd, addr_str, port);
            if ret != 0 {
                return ret;
            }
        }
        let conn = match &mut self.connections[fd as usize] {
            Some(c) if c.stream.is_some() => c,
            _ => return -(EBADF as i32),
        };
        match conn.stream.as_mut().unwrap().write(data) {
            Ok(n) => n as i32,
            Err(_) => -1,
        }
    }

    /// recvfrom_guest(fd, buf) -> bytes_read or -errno
    ///
    /// Receive data into provided buffer. Returns number of bytes read.
    pub fn recvfrom_guest(&mut self, fd: i32, buf: &mut [u8]) -> i32 {
        if fd < 0 || (fd as usize) >= MAX_GUEST_SOCKETS {
            return -(EBADF as i32);
        }
        let conn = match &mut self.connections[fd as usize] {
            Some(c) if c.stream.is_some() => c,
            _ => return -(EBADF as i32),
        };
        match conn.stream.as_mut().unwrap().read(buf) {
            Ok(0) => 0,
            Ok(n) => n as i32,
            Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => -(EAGAIN as i32),
            Err(ref e) if e.kind() == std::io::ErrorKind::TimedOut => -(EAGAIN as i32),
            Err(_) => -1,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::{Read, Write};
    use std::net::TcpListener;
    use std::thread;
    use std::time::Duration;

    /// Helper: read a u32 from a byte slice at byte offset.
    fn read_u32_at(data: &[u8], offset: usize) -> u32 {
        u32::from_le_bytes([data[offset], data[offset + 1], data[offset + 2], data[offset + 3]])
    }

    /// Helper: create an echo server and return its port.
    fn setup_echo_server() -> u16 {
        let listener = TcpListener::bind("127.0.0.1:0").expect("bind");
        let port = listener.local_addr().unwrap().port();
        thread::spawn(move || {
            if let Ok((mut stream, _)) = listener.accept() {
                stream.set_read_timeout(Some(Duration::from_secs(5))).ok();
                let mut buf = [0u8; 4096];
                loop {
                    match stream.read(&mut buf) {
                        Ok(0) => break,
                        Ok(n) => {
                            if stream.write_all(&buf[..n]).is_err() {
                                break;
                            }
                        }
                        Err(_) => break,
                    }
                }
            }
        });
        thread::sleep(Duration::from_millis(50));
        port
    }

    #[test]
    fn test_sys_socket_allocates_fd() {
        let mut sockets = GuestSockets::new();
        let fd = sockets.sys_socket(AF_INET, SOCK_STREAM, 0);
        assert!(fd >= 0, "socket() should return valid fd, got {}", fd);
    }

    #[test]
    fn test_sys_socket_invalid_domain() {
        let mut sockets = GuestSockets::new();
        let fd = sockets.sys_socket(99, SOCK_STREAM, 0);
        assert_eq!(fd, -(EINVAL as i32));
    }

    #[test]
    fn test_sys_socket_invalid_type() {
        let mut sockets = GuestSockets::new();
        let fd = sockets.sys_socket(AF_INET, 99, 0);
        assert_eq!(fd, -(EINVAL as i32));
    }

    #[test]
    fn test_sys_socket_exhausted() {
        let mut sockets = GuestSockets::new();
        for _ in 0..MAX_GUEST_SOCKETS {
            let fd = sockets.sys_socket(AF_INET, SOCK_STREAM, 0);
            assert!(fd >= 0);
        }
        let fd = sockets.sys_socket(AF_INET, SOCK_STREAM, 0);
        assert_eq!(fd, -(ENOMEM as i32));
    }

    #[test]
    fn test_connect_send_recv_roundtrip() {
        let port = setup_echo_server();
        let mut sockets = GuestSockets::new();

        // Mock guest RAM
        let ram: std::cell::RefCell<Vec<u32>> = std::cell::RefCell::new(vec![0u32; 0x10000]);

        // socket()
        let fd = sockets.sys_socket(AF_INET, SOCK_STREAM, 0);
        assert!(fd >= 0);

        // Build sockaddr_in in guest RAM at 0x100
        // word 0: family (u16) + padding
        ram.borrow_mut()[0x100] = AF_INET;
        // word 1: port in network byte order (big-endian u16)
        let port_bytes = port.to_be_bytes();
        ram.borrow_mut()[0x101] = ((port_bytes[0] as u32) << 8) | (port_bytes[1] as u32);
        // word 2: IP addr in network byte order (127.0.0.1 = 0x7F000001 big-endian)
        ram.borrow_mut()[0x102] = 0x7F000001; // 127.0.0.1 in big-endian = already correct for u32 BE

        let read_mem = |addr: u64| -> u32 { ram.borrow()[addr as usize] };
        let write_mem = |addr: u64, val: u32| { ram.borrow_mut()[addr as usize] = val; };

        // connect()
        let ret = sockets.sys_connect(fd, 0x100, 16, &read_mem);
        assert_eq!(ret, 0, "connect() should succeed");

        // Write "Hello" to guest RAM at 0x200
        let msg = b"Hello";
        for (i, &b) in msg.iter().enumerate() {
            ram.borrow_mut()[0x200 + i] = b as u32;
        }

        // sendto()
        let sent = sockets.sys_sendto(fd, 0x200, msg.len() as u32, 0, 0, 0, &read_mem);
        assert!(sent > 0, "sendto() should send bytes, got {}", sent);

        // recvfrom()
        let received = sockets.sys_recvfrom(fd, 0x300, 100, 0, &write_mem);
        assert!(received > 0, "recvfrom() should receive bytes, got {}", received);

        // Verify echoed data
        for i in 0..received as usize {
            assert_eq!(
                ram.borrow()[0x300 + i],
                msg[i] as u32,
                "Byte {} mismatch: got {}, expected {}",
                i,
                ram.borrow()[0x300 + i],
                msg[i]
            );
        }

        // close()
        let ret = sockets.sys_close(fd);
        assert_eq!(ret, 0);
        assert_eq!(sockets.connection_count(), 0);
    }

    #[test]
    fn test_connect_refused() {
        let mut sockets = GuestSockets::new();
        let ram: std::cell::RefCell<Vec<u32>> = std::cell::RefCell::new(vec![0u32; 0x10000]);

        let fd = sockets.sys_socket(AF_INET, SOCK_STREAM, 0);
        assert!(fd >= 0);

        // Try connecting to a port nothing listens on
        ram.borrow_mut()[0x100] = AF_INET;
        ram.borrow_mut()[0x101] = 19; // port 19
        ram.borrow_mut()[0x102] = 0x7F000001; // 127.0.0.1

        let read_mem = |addr: u64| -> u32 { ram.borrow()[addr as usize] };
        let ret = sockets.sys_connect(fd, 0x100, 16, &read_mem);
        assert_eq!(ret, -(ECONNREFUSED as i32));
    }

    #[test]
    fn test_close_nonexistent_fd() {
        let mut sockets = GuestSockets::new();
        let ret = sockets.sys_close(0);
        assert_eq!(ret, 1); // not a socket
    }

    #[test]
    fn test_send_on_disconnected() {
        let mut sockets = GuestSockets::new();
        let fd = sockets.sys_socket(AF_INET, SOCK_STREAM, 0);
        // Don't connect, just try to send
        let ram: std::cell::RefCell<Vec<u32>> = std::cell::RefCell::new(vec![0u32; 0x100]);
        let read_mem = |addr: u64| -> u32 { ram.borrow()[addr as usize] };
        let ret = sockets.sys_sendto(fd, 0, 5, 0, 0, 0, &read_mem);
        assert_eq!(ret, -(EBADF as i32));
    }
}
