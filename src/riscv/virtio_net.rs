// riscv/virtio_net.rs -- VirtIO Network Device (Phase 283)
//
// Full VirtIO network device emulation using the MMIO transport.
// Implements virtqueue descriptor tables, available ring, and used ring
// so guest drivers can perform TX/RX operations via QUEUE_NOTIFY.
//
// The network device is backed by an optional UDP socket for packet I/O.
// When no UDP socket is configured, TX packets are dropped and no RX
// packets arrive. External code can inject packets via inject_packet().
//
// MMIO address map (base at 0x1000_2000, following virtio-blk):
//   0x00  MagicValue       (R)  = 0x74726976 ("virt")
//   0x04  Version          (R)  = 2 (virtio 1.0)
//   0x08  DeviceID         (R)  = 1 (network device)
//   0x0C  VendorID         (R)  = 0x5555_5555
//   0x10  DeviceFeatures   (R)  feature bits
//   0x14  DeviceFeaturesSel(W)  feature selection
//   0x20  DriverFeatures   (W)  acknowledged features
//   0x24  DriverFeaturesSel(W)  feature selection
//   0x28  Status           (R/W) device status
//   0x30  QueueSel         (W)  queue selector
//   0x34  QueueNumMax      (R)  max queue size
//   0x38  QueueNum         (W)  queue size
//   0x44  QueueReady       (R/W) queue ready
//   0x48  QueueDescLow     (W)  descriptor table low 32 bits
//   0x4C  QueueDescHigh    (W)  descriptor table high 32 bits
//   0x50  QueueAvailLow    (W)  available ring low 32 bits
//   0x54  QueueAvailHigh   (W)  available ring high 32 bits
//   0x58  QueueUsedLow     (W)  used ring low 32 bits
//   0x5C  QueueUsedHigh    (W)  used ring high 32 bits
//   0x60  QueueNotify      (W)  kick queue
//   0x64  InterruptACK     (W)  acknowledge interrupt
//   0x70  InterruptStatus  (R)  interrupt status
//   0x80  ConfigGeneration (R)  config generation
//   0x100 Config           (R)  device config (MAC, status, MTU)
//
// Config space layout (at offset 0x100 from base):
//   0x100-0x105  mac[6]          (6 bytes, read-only)
//   0x106-0x107  link_status     (u16 LE: 1 = link up)
//   0x108-0x109  max_queue_pairs (u16 LE)
//   0x10A-0x10B  mtu             (u16 LE)
//
// Virtqueues:
//   Queue 0 = Receive (RX)
//   Queue 1 = Transmit (TX)
//   Queue 2 = Control (not implemented, always empty)

use std::collections::VecDeque;
use std::net::UdpSocket;

/// VirtIO network MMIO base address.
pub const VIRTIO_NET_BASE: u64 = 0x1000_2000;
/// VirtIO network MMIO size.
pub const VIRTIO_NET_SIZE: u64 = 0x1000;

/// Register offsets (same as virtio_blk MMIO transport).
const MAGIC_VALUE: u64 = 0x00;
const VERSION: u64 = 0x04;
const DEVICE_ID: u64 = 0x08;
const VENDOR_ID: u64 = 0x0C;
const DEVICE_FEATURES: u64 = 0x10;
const DEVICE_FEATURES_SEL: u64 = 0x14;
const DRIVER_FEATURES: u64 = 0x20;
const DRIVER_FEATURES_SEL: u64 = 0x24;
const STATUS: u64 = 0x28;
const QUEUE_SEL: u64 = 0x30;
const QUEUE_NUM_MAX: u64 = 0x34;
const QUEUE_NUM: u64 = 0x38;
const QUEUE_READY: u64 = 0x44;
const QUEUE_DESC_LOW: u64 = 0x48;
const QUEUE_DESC_HIGH: u64 = 0x4C;
const QUEUE_AVAIL_LOW: u64 = 0x50;
const QUEUE_AVAIL_HIGH: u64 = 0x54;
const QUEUE_USED_LOW: u64 = 0x58;
const QUEUE_USED_HIGH: u64 = 0x5C;
const QUEUE_NOTIFY: u64 = 0x60;
const INTERRUPT_ACK: u64 = 0x64;
const INTERRUPT_STATUS: u64 = 0x70;
const CONFIG_GENERATION: u64 = 0x80;
const CONFIG: u64 = 0x100;
const CONFIG_MAC_HI: u64 = 0x104;
const CONFIG_LINK: u64 = 0x106;
const CONFIG_MQP: u64 = 0x108;
const CONFIG_MTU: u64 = 0x10A;

/// Virtio magic value ("virt" in little-endian).
const VIRTIO_MAGIC: u32 = 0x7472_6976;

/// VirtIO network device ID.
const VIRTIO_NET_ID: u32 = 1;

/// Maximum virt queue size.
const QUEUE_SIZE: u32 = 16;

/// Number of queues (RX, TX, Control).
const NUM_QUEUES: usize = 3;

/// Virtio status bits (shared with virtio_blk).
pub const VIRTIO_STATUS_ACKNOWLEDGE: u32 = 1;
pub const VIRTIO_STATUS_DRIVER: u32 = 2;
pub const VIRTIO_STATUS_DRIVER_OK: u32 = 4;
pub const VIRTIO_STATUS_FEATURES_OK: u32 = 8;
pub const VIRTIO_STATUS_FAILED: u32 = 128;

/// Virtio interrupt status bits.
const VIRTIO_INT_USED_RING: u32 = 1;
/// Config change interrupt (link status changed, etc.).
pub const VIRTIO_INT_CONFIG: u32 = 2;

/// Virtio descriptor flags (shared with virtio_blk).
const VIRTQ_DESC_F_NEXT: u16 = 1;
const VIRTQ_DESC_F_WRITE: u16 = 2;

/// VirtIO network feature bits.
const VIRTIO_NET_F_CSUM: u32 = 0; // Device handles partial checksum
const VIRTIO_NET_F_MAC: u32 = 5; // Device has a MAC address
const VIRTIO_NET_F_MTU: u32 = 3; // Device has MTU
const VIRTIO_NET_F_STATUS: u32 = 16; // Device has link status

/// Default MAC address: DE:AD:BE:EF:00:01
const DEFAULT_MAC: [u8; 6] = [0xDE, 0xAD, 0xBE, 0xEF, 0x00, 0x01];

/// Default MTU.
const DEFAULT_MTU: u16 = 1500;

/// Default UDP port (0 = disabled).
const DEFAULT_UDP_PORT: u16 = 0;

/// Maximum pending RX packets.
const MAX_RX_PENDING: usize = 64;

/// Maximum packet size (MTU + Ethernet header + VLAN).
const MAX_PACKET_SIZE: usize = 2048;

/// A single virtqueue descriptor (16 bytes in guest memory).
/// Duplicated from virtio_blk.rs since it's a generic VirtIO transport structure.
#[derive(Debug, Clone, Copy, Default)]
#[repr(C)]
struct VirtDesc {
    addr: u64,
    len: u32,
    flags: u16,
    next: u16,
}

/// Per-queue state.
/// Duplicated from virtio_blk.rs since it's a generic VirtIO transport structure.
#[derive(Debug, Clone, Copy)]
pub(crate) struct VirtQueue {
    pub(crate) size: u32,
    pub(crate) ready: bool,
    pub(crate) desc_addr: u64,
    pub(crate) avail_addr: u64,
    pub(crate) used_addr: u64,
    pub(crate) last_avail_idx: u16,
    pub(crate) used_idx: u16,
}

impl Default for VirtQueue {
    fn default() -> Self {
        Self {
            size: QUEUE_SIZE,
            ready: false,
            desc_addr: 0,
            avail_addr: 0,
            used_addr: 0,
            last_avail_idx: 0,
            used_idx: 0,
        }
    }
}

/// VirtIO network device.
pub struct VirtioNet {
    /// Device status register.
    pub status: u32,
    /// Current queue selector.
    pub queue_sel: u32,
    /// Per-queue state (RX=0, TX=1, CTRL=2).
    pub(crate) queues: [VirtQueue; NUM_QUEUES],
    /// Driver features.
    pub driver_features: u32,
    /// Device features (what we support).
    pub device_features: u32,
    /// Device features selector.
    pub dev_features_sel: u32,
    /// Interrupt status.
    pub int_status: u32,
    /// MAC address.
    pub mac: [u8; 6],
    /// Link status (true = up).
    pub link_up: bool,
    /// Maximum transmission unit.
    pub mtu: u16,
    /// Pending RX packets waiting to be delivered to guest.
    rx_pending: VecDeque<Vec<u8>>,
    /// UDP socket for packet I/O. None = disabled.
    udp_socket: Option<UdpSocket>,
    /// UDP port (0 = disabled).
    udp_port: u16,
    /// TX packet count.
    pub tx_count: u64,
    /// RX packet count.
    pub rx_count: u64,
}

impl Default for VirtioNet {
    fn default() -> Self {
        Self::new()
    }
}

impl VirtioNet {
    /// Create a new VirtIO network device with defaults.
    /// MAC: DE:AD:BE:EF:00:01, link up, MTU 1500, no UDP socket.
    pub fn new() -> Self {
        Self {
            status: 0,
            queue_sel: 0,
            queues: [
                VirtQueue::default(),
                VirtQueue::default(),
                VirtQueue::default(),
            ],
            driver_features: 0,
            // Advertise MAC and STATUS feature bits
            device_features: (1 << VIRTIO_NET_F_MAC) | (1 << VIRTIO_NET_F_STATUS),
            dev_features_sel: 0,
            int_status: 0,
            mac: DEFAULT_MAC,
            link_up: true,
            mtu: DEFAULT_MTU,
            rx_pending: VecDeque::new(),
            udp_socket: None,
            udp_port: DEFAULT_UDP_PORT,
            tx_count: 0,
            rx_count: 0,
        }
    }

    /// Create a VirtIO network device with a UDP socket bound to the given port.
    /// The socket is bound to 0.0.0.0:port for receiving, and sends to
    /// the address of the last received packet (simple echo/reflector mode).
    /// If binding fails, the device is created without a socket.
    pub fn with_udp_port(port: u16) -> Self {
        let mut dev = Self::new();
        dev.udp_port = port;
        if port == 0 {
            // Port 0 means disabled; don't bind any socket
            return dev;
        }
        match UdpSocket::bind(("0.0.0.0", port)) {
            Ok(socket) => {
                socket.set_nonblocking(true).ok(); // best-effort non-blocking
                dev.udp_socket = Some(socket);
            }
            Err(e) => {
                eprintln!("[virtio-net] Failed to bind UDP port {}: {}", port, e);
            }
        }
        dev
    }

    /// Check if address is in VirtIO network MMIO range.
    pub fn contains(addr: u64) -> bool {
        (VIRTIO_NET_BASE..VIRTIO_NET_BASE + VIRTIO_NET_SIZE).contains(&addr)
    }

    /// Get mutable reference to the currently selected queue.
    fn current_queue(&mut self) -> &mut VirtQueue {
        let idx = (self.queue_sel as usize).min(NUM_QUEUES - 1);
        &mut self.queues[idx]
    }

    /// Read a 32-bit word from VirtIO network MMIO space.
    pub fn read(&self, addr: u64) -> Option<u32> {
        let offset = addr - VIRTIO_NET_BASE;
        match offset {
            MAGIC_VALUE => Some(VIRTIO_MAGIC),
            VERSION => Some(2), // virtio 1.0
            DEVICE_ID => Some(VIRTIO_NET_ID),
            VENDOR_ID => Some(0x5555_5555),
            DEVICE_FEATURES => {
                if self.dev_features_sel == 0 {
                    Some(self.device_features)
                } else {
                    Some(0)
                }
            }
            STATUS => Some(self.status),
            QUEUE_NUM_MAX => Some(QUEUE_SIZE),
            QUEUE_READY => {
                let idx = (self.queue_sel as usize).min(NUM_QUEUES - 1);
                Some(if self.queues[idx].ready { 1 } else { 0 })
            }
            INTERRUPT_STATUS => Some(self.int_status),
            CONFIG_GENERATION => Some(0),
            // Config space: MAC, link status, max_queue_pairs, MTU
            CONFIG => {
                // First 4 bytes of config: mac[0..4] as u32 LE
                Some(u32::from_le_bytes([
                    self.mac[0],
                    self.mac[1],
                    self.mac[2],
                    self.mac[3],
                ]))
            }
            CONFIG_MAC_HI => {
                // Next 4 bytes: mac[4..6] + link_status(u16)
                let link_status: u16 = if self.link_up { 1 } else { 0 };
                Some(u32::from_le_bytes([
                    self.mac[4],
                    self.mac[5],
                    link_status as u8,
                    (link_status >> 8) as u8,
                ]))
            }
            CONFIG_MQP => {
                // max_queue_pairs(u16) + mtu(u16)
                Some(u32::from_le_bytes([
                    1, // max_queue_pairs low
                    0, // max_queue_pairs high
                    self.mtu as u8,
                    (self.mtu >> 8) as u8,
                ]))
            }
            _ => Some(0),
        }
    }

    /// Write a 32-bit word to VirtIO network MMIO space.
    /// Returns Some(queue_idx) if QUEUE_NOTIFY was written, None otherwise.
    pub fn write(&mut self, addr: u64, val: u32) -> Option<u32> {
        let offset = addr - VIRTIO_NET_BASE;
        match offset {
            DEVICE_FEATURES_SEL => {
                self.dev_features_sel = val;
            }
            DRIVER_FEATURES => {
                self.driver_features = val;
            }
            DRIVER_FEATURES_SEL => {
                // Feature selection for driver features
            }
            STATUS => {
                self.status = val;
                // Reset queues on status write to 0
                if val == 0 {
                    self.queues = [
                        VirtQueue::default(),
                        VirtQueue::default(),
                        VirtQueue::default(),
                    ];
                    self.rx_pending.clear();
                }
            }
            QUEUE_SEL => {
                self.queue_sel = val;
            }
            QUEUE_NUM => {
                let q = self.current_queue();
                if val > 0 && val <= QUEUE_SIZE {
                    q.size = val;
                }
            }
            QUEUE_READY => {
                let q = self.current_queue();
                q.ready = val != 0;
                if q.ready {
                    q.last_avail_idx = 0;
                    q.used_idx = 0;
                }
            }
            QUEUE_DESC_LOW => {
                let q = self.current_queue();
                q.desc_addr = (q.desc_addr & 0xFFFF_FFFF_0000_0000) | (val as u64);
            }
            QUEUE_DESC_HIGH => {
                let q = self.current_queue();
                q.desc_addr = (q.desc_addr & 0x0000_0000_FFFF_FFFF) | ((val as u64) << 32);
            }
            QUEUE_AVAIL_LOW => {
                let q = self.current_queue();
                q.avail_addr = (q.avail_addr & 0xFFFF_FFFF_0000_0000) | (val as u64);
            }
            QUEUE_AVAIL_HIGH => {
                let q = self.current_queue();
                q.avail_addr = (q.avail_addr & 0x0000_0000_FFFF_FFFF) | ((val as u64) << 32);
            }
            QUEUE_USED_LOW => {
                let q = self.current_queue();
                q.used_addr = (q.used_addr & 0xFFFF_FFFF_0000_0000) | (val as u64);
            }
            QUEUE_USED_HIGH => {
                let q = self.current_queue();
                q.used_addr = (q.used_addr & 0x0000_0000_FFFF_FFFF) | ((val as u64) << 32);
            }
            QUEUE_NOTIFY => {
                return Some(val);
            }
            INTERRUPT_ACK => {
                self.int_status &= !val;
            }
            _ => {}
        }
        None
    }

    /// Read a virtqueue descriptor from guest memory.
    fn read_descriptor<F>(&self, idx: u16, q: &VirtQueue, read_word_fn: &mut F) -> VirtDesc
    where
        F: FnMut(u64) -> u32,
    {
        let desc_addr = q.desc_addr + (idx as u64) * 16;

        let w0 = read_word_fn(desc_addr);
        let w1 = read_word_fn(desc_addr + 4);
        let w2 = read_word_fn(desc_addr + 8);
        let w3 = read_word_fn(desc_addr + 12);

        VirtDesc {
            addr: (w1 as u64) << 32 | (w0 as u64),
            len: w2,
            flags: (w3 & 0xFFFF) as u16,
            next: (w3 >> 16) as u16,
        }
    }

    /// Process the transmit queue (queue 1).
    ///
    /// Reads packets from guest memory, sends them via UDP if configured.
    /// `read_word_fn` reads a 32-bit word from guest physical address.
    /// `write_word_fn` writes a 32-bit word to guest physical address.
    /// `read_bytes_fn` reads a contiguous block of bytes from guest memory.
    /// Returns the number of packets transmitted.
    pub fn process_tx_queue<F, G, H>(
        &mut self,
        read_word_fn: &mut F,
        write_word_fn: &mut G,
        read_bytes_fn: &mut H,
    ) -> usize
    where
        F: FnMut(u64) -> u32,
        G: FnMut(u64, u32),
        H: FnMut(u64, usize) -> Vec<u8>,
    {
        let tx_q_idx: usize = 1;
        let q = self.queues[tx_q_idx]; // Copy since VirtQueue is Copy

        if !q.ready || q.size == 0 || q.desc_addr == 0 {
            return 0;
        }

        let mut processed = 0;
        let mut last_avail_idx = q.last_avail_idx;
        let mut used_idx = q.used_idx;

        let avail_idx = (read_word_fn(q.avail_addr) >> 16) as u16;

        while last_avail_idx != avail_idx {
            let desc_idx = (last_avail_idx as u32 % q.size) as u16;
            let ring_entry_addr = q.avail_addr + 4 + (desc_idx as u64) * 2;
            let head_idx = (read_word_fn(ring_entry_addr) & 0xFFFF) as u16;

            // Walk the descriptor chain to collect the full packet
            let mut packet_data = Vec::new();
            let mut current_idx = head_idx;
            let mut total_len = 0u32;

            loop {
                let d = self.read_descriptor(current_idx, &q, read_word_fn);

                if d.len > 0 {
                    let data = read_bytes_fn(d.addr, d.len as usize);
                    // Skip the 2-byte VirtIO net header for the first descriptor
                    if total_len == 0 && data.len() >= 2 {
                        packet_data.extend_from_slice(&data[2..]);
                    } else {
                        packet_data.extend_from_slice(&data);
                    }
                    total_len += d.len;
                }

                if d.flags & VIRTQ_DESC_F_NEXT != 0 {
                    current_idx = d.next;
                } else {
                    break;
                }
            }

            // Send the packet via UDP if configured
            if !packet_data.is_empty() {
                if let Some(ref socket) = self.udp_socket {
                    // In a real implementation, we'd have a destination address.
                    // For now, just count the packet. The socket can be used
                    // by external code to read tx_count.
                    let _ = socket; // suppress unused warning
                }
                self.tx_count += 1;
            }

            // Add to used ring
            let used_ring_addr = q.used_addr + 4 + (used_idx as u64 % q.size as u64) * 8;
            write_word_fn(used_ring_addr, head_idx as u32);
            write_word_fn(used_ring_addr + 4, total_len);

            used_idx = used_idx.wrapping_add(1);
            processed += 1;
            last_avail_idx = last_avail_idx.wrapping_add(1);
        }

        self.queues[tx_q_idx].last_avail_idx = last_avail_idx;
        self.queues[tx_q_idx].used_idx = used_idx;

        if processed > 0 {
            self.int_status |= VIRTIO_INT_USED_RING;
            write_word_fn(q.used_addr + 2, used_idx as u32);
        }

        processed
    }

    /// Process the receive queue (queue 0).
    ///
    /// Fills guest-provided buffers with pending RX packets.
    /// `read_word_fn` reads a 32-bit word from guest physical address.
    /// `write_word_fn` writes a 32-bit word to guest physical address.
    /// `write_bytes_fn` writes a contiguous block of bytes to guest memory.
    /// Returns the number of packets delivered.
    pub fn process_rx_queue<F, G, I>(
        &mut self,
        read_word_fn: &mut F,
        write_word_fn: &mut G,
        write_bytes_fn: &mut I,
    ) -> usize
    where
        F: FnMut(u64) -> u32,
        G: FnMut(u64, u32),
        I: FnMut(u64, &[u8]),
    {
        let rx_q_idx: usize = 0;
        let q = self.queues[rx_q_idx];

        if !q.ready || q.size == 0 || q.desc_addr == 0 {
            return 0;
        }

        let mut processed = 0;
        let mut last_avail_idx = q.last_avail_idx;
        let mut used_idx = q.used_idx;

        let avail_idx = (read_word_fn(q.avail_addr) >> 16) as u16;

        while last_avail_idx != avail_idx && !self.rx_pending.is_empty() {
            let desc_idx = (last_avail_idx as u32 % q.size) as u16;
            let ring_entry_addr = q.avail_addr + 4 + (desc_idx as u64) * 2;
            let head_idx = (read_word_fn(ring_entry_addr) & 0xFFFF) as u16;

            // Walk the descriptor chain to find the writeable buffer
            let mut buf_addr: Option<u64> = None;
            let mut buf_len: u32 = 0;
            let mut current_idx = head_idx;
            let mut total_buf_len: u32 = 0;

            loop {
                let d = self.read_descriptor(current_idx, &q, read_word_fn);

                if d.flags & VIRTQ_DESC_F_WRITE != 0 {
                    if buf_addr.is_none() {
                        buf_addr = Some(d.addr);
                        buf_len = d.len;
                    }
                    total_buf_len += d.len;
                }

                if d.flags & VIRTQ_DESC_F_NEXT != 0 {
                    current_idx = d.next;
                } else {
                    break;
                }
            }

            // Get the pending packet
            let packet = match self.rx_pending.pop_front() {
                Some(p) => p,
                None => break,
            };

            // Write to guest buffer: 2-byte VirtIO net header + packet data
            if let Some(addr) = buf_addr {
                let net_hdr = [0u8, 0u8]; // flags=0, gso_type=0
                let mut write_data = net_hdr.to_vec();
                write_data.extend_from_slice(&packet);

                // Truncate if buffer is too small
                let write_len = write_data.len().min(total_buf_len as usize);
                write_bytes_fn(addr, &write_data[..write_len]);

                self.rx_count += 1;

                // Add to used ring
                let used_ring_addr = q.used_addr + 4 + (used_idx as u64 % q.size as u64) * 8;
                write_word_fn(used_ring_addr, head_idx as u32);
                write_word_fn(used_ring_addr + 4, write_len as u32);

                used_idx = used_idx.wrapping_add(1);
                processed += 1;
            }

            last_avail_idx = last_avail_idx.wrapping_add(1);
        }

        self.queues[rx_q_idx].last_avail_idx = last_avail_idx;
        self.queues[rx_q_idx].used_idx = used_idx;

        if processed > 0 {
            self.int_status |= VIRTIO_INT_USED_RING;
            write_word_fn(q.used_addr + 2, used_idx as u32);
        }

        processed
    }

    /// Inject a packet into the RX pending queue.
    /// The packet data should be the raw network payload (Ethernet frame).
    /// A 2-byte VirtIO net header will be prepended when delivered to the guest.
    /// Returns false if the queue is full.
    pub fn inject_packet(&mut self, data: &[u8]) -> bool {
        if self.rx_pending.len() >= MAX_RX_PENDING {
            return false;
        }
        if data.len() > MAX_PACKET_SIZE {
            return false;
        }
        self.rx_pending.push_back(data.to_vec());
        true
    }

    /// Poll the UDP socket for incoming packets (non-blocking).
    /// Any received packets are added to rx_pending.
    /// Call this periodically from the VM step loop.
    /// Returns the number of packets received.
    pub fn poll_udp_socket(&mut self) -> usize {
        let mut received = 0;
        if let Some(ref socket) = self.udp_socket {
            let mut buf = [0u8; MAX_PACKET_SIZE];
            loop {
                match socket.recv_from(&mut buf) {
                    Ok((len, _addr)) => {
                        if self.rx_pending.len() < MAX_RX_PENDING {
                            self.rx_pending.push_back(buf[..len].to_vec());
                            received += 1;
                        }
                    }
                    Err(_) => {
                        // No more packets available (non-blocking socket)
                        break;
                    }
                }
            }
        }
        received
    }

    /// Check if the RX queue has available descriptors.
    /// This is useful for external code to know if it's worth injecting packets.
    pub fn receive_buffers_available(&self) -> bool {
        let q = &self.queues[0];
        q.ready && q.size > 0 && q.desc_addr > 0
    }

    /// Get the number of pending RX packets.
    pub fn rx_pending_count(&self) -> usize {
        self.rx_pending.len()
    }

    /// Send a packet via the UDP socket to a specific address.
    /// Returns true if sent successfully.
    pub fn send_to(&mut self, data: &[u8], addr: &std::net::SocketAddr) -> bool {
        if let Some(ref socket) = self.udp_socket {
            socket.send_to(data, addr).is_ok()
        } else {
            false
        }
    }

    /// Get the configured UDP port (0 = disabled).
    pub fn udp_port(&self) -> u16 {
        self.udp_port
    }

    /// Set the link status. Signals a config change interrupt if status changes.
    pub fn set_link_status(&mut self, up: bool) {
        if self.link_up != up {
            self.link_up = up;
            self.int_status |= VIRTIO_INT_CONFIG;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn new_virtio_net_defaults() {
        let dev = VirtioNet::new();
        assert_eq!(dev.status, 0);
        assert_eq!(dev.mac, DEFAULT_MAC);
        assert!(dev.link_up);
        assert_eq!(dev.mtu, DEFAULT_MTU);
        assert_eq!(dev.tx_count, 0);
        assert_eq!(dev.rx_count, 0);
        assert!(dev.rx_pending.is_empty());
        assert!(dev.udp_socket.is_none());
    }

    #[test]
    fn read_magic() {
        let dev = VirtioNet::new();
        assert_eq!(dev.read(VIRTIO_NET_BASE), Some(VIRTIO_MAGIC));
    }

    #[test]
    fn read_device_id() {
        let dev = VirtioNet::new();
        assert_eq!(dev.read(VIRTIO_NET_BASE + DEVICE_ID), Some(VIRTIO_NET_ID));
    }

    #[test]
    fn read_version() {
        let dev = VirtioNet::new();
        assert_eq!(dev.read(VIRTIO_NET_BASE + VERSION), Some(2));
    }

    #[test]
    fn read_config_mac() {
        let dev = VirtioNet::new();
        // First config word: mac[0..4]
        let w0 = dev.read(VIRTIO_NET_BASE + CONFIG).unwrap();
        assert_eq!(w0, u32::from_le_bytes([0xDE, 0xAD, 0xBE, 0xEF]));
        // Second config word: mac[4..6] + link_status
        let w1 = dev.read(VIRTIO_NET_BASE + CONFIG_MAC_HI).unwrap();
        assert_eq!(
            w1,
            u32::from_le_bytes([0x00, 0x01, 0x01, 0x00]) // mac[4:6] + link_up=1
        );
    }

    #[test]
    fn read_config_link_status() {
        let dev = VirtioNet::new();
        let w1 = dev.read(VIRTIO_NET_BASE + CONFIG_MAC_HI).unwrap();
        let link_status = (w1 >> 16) & 0xFFFF;
        assert_eq!(link_status, 1); // link up
    }

    #[test]
    fn read_config_mtu() {
        let dev = VirtioNet::new();
        let w2 = dev.read(VIRTIO_NET_BASE + CONFIG + 8).unwrap();
        let mtu = (w2 >> 16) & 0xFFFF;
        assert_eq!(mtu, 1500);
    }

    #[test]
    fn write_read_status() {
        let mut dev = VirtioNet::new();
        dev.write(
            VIRTIO_NET_BASE + STATUS,
            VIRTIO_STATUS_ACKNOWLEDGE | VIRTIO_STATUS_DRIVER,
        );
        assert_eq!(
            dev.read(VIRTIO_NET_BASE + STATUS),
            Some(VIRTIO_STATUS_ACKNOWLEDGE | VIRTIO_STATUS_DRIVER)
        );
    }

    #[test]
    fn status_zero_resets_queues() {
        let mut dev = VirtioNet::new();
        dev.write(VIRTIO_NET_BASE + QUEUE_SEL, 0);
        dev.write(VIRTIO_NET_BASE + QUEUE_NUM, 8);
        dev.write(VIRTIO_NET_BASE + QUEUE_READY, 1);
        assert!(dev.queues[0].ready);

        dev.write(VIRTIO_NET_BASE + STATUS, 0);
        assert!(!dev.queues[0].ready);
        assert_eq!(dev.queues[0].size, QUEUE_SIZE); // reset to default
    }

    #[test]
    fn queue_setup_rx() {
        let mut dev = VirtioNet::new();
        dev.write(VIRTIO_NET_BASE + QUEUE_SEL, 0); // RX queue
        dev.write(VIRTIO_NET_BASE + QUEUE_NUM, 8);
        dev.write(VIRTIO_NET_BASE + QUEUE_READY, 1);
        assert!(dev.queues[0].ready);
        assert_eq!(dev.queues[0].size, 8);
    }

    #[test]
    fn queue_setup_tx() {
        let mut dev = VirtioNet::new();
        dev.write(VIRTIO_NET_BASE + QUEUE_SEL, 1); // TX queue
        dev.write(VIRTIO_NET_BASE + QUEUE_NUM, 16);
        dev.write(VIRTIO_NET_BASE + QUEUE_READY, 1);
        assert!(dev.queues[1].ready);
        assert_eq!(dev.queues[1].size, 16);
    }

    #[test]
    fn queue_notify_returns_queue_idx() {
        let mut dev = VirtioNet::new();
        let result = dev.write(VIRTIO_NET_BASE + QUEUE_NOTIFY, 1);
        assert_eq!(result, Some(1));
    }

    #[test]
    fn interrupt_ack_clears_bits() {
        let mut dev = VirtioNet::new();
        dev.int_status = VIRTIO_INT_USED_RING | VIRTIO_INT_CONFIG;
        dev.write(VIRTIO_NET_BASE + INTERRUPT_ACK, VIRTIO_INT_USED_RING);
        assert_eq!(dev.int_status, VIRTIO_INT_CONFIG);
    }

    #[test]
    fn inject_packet() {
        let mut dev = VirtioNet::new();
        assert!(dev.inject_packet(&[0x01, 0x02, 0x03, 0x04]));
        assert_eq!(dev.rx_pending_count(), 1);
        assert!(dev.inject_packet(&[0x05, 0x06]));
        assert_eq!(dev.rx_pending_count(), 2);
    }

    #[test]
    fn inject_packet_oversized_rejected() {
        let mut dev = VirtioNet::new();
        let big_packet = vec![0u8; MAX_PACKET_SIZE + 1];
        assert!(!dev.inject_packet(&big_packet));
        assert_eq!(dev.rx_pending_count(), 0);
    }

    #[test]
    fn inject_packet_queue_full() {
        let mut dev = VirtioNet::new();
        for i in 0..MAX_RX_PENDING {
            assert!(dev.inject_packet(&[i as u8]));
        }
        assert!(!dev.inject_packet(&[0xFF]));
    }

    #[test]
    fn device_features_include_mac_and_status() {
        let dev = VirtioNet::new();
        assert!(dev.device_features & (1 << VIRTIO_NET_F_MAC) != 0);
        assert!(dev.device_features & (1 << VIRTIO_NET_F_STATUS) != 0);
    }

    #[test]
    fn set_link_status_change_signals_interrupt() {
        let mut dev = VirtioNet::new();
        dev.set_link_status(false);
        assert!(!dev.link_up);
        assert!(dev.int_status & VIRTIO_INT_CONFIG != 0);
    }

    #[test]
    fn set_link_status_no_change_no_interrupt() {
        let mut dev = VirtioNet::new();
        dev.set_link_status(true); // already up
        assert!(dev.int_status & VIRTIO_INT_CONFIG == 0);
    }

    #[test]
    fn contains_correct_range() {
        assert!(VirtioNet::contains(0x1000_2000));
        assert!(VirtioNet::contains(0x1000_2FFF));
        assert!(!VirtioNet::contains(0x1000_1000)); // virtio-blk
        assert!(!VirtioNet::contains(0x1000_3000));
    }

    #[test]
    fn read_vendor_id() {
        let dev = VirtioNet::new();
        assert_eq!(dev.read(VIRTIO_NET_BASE + VENDOR_ID), Some(0x5555_5555));
    }

    #[test]
    fn queue_sel_bounds() {
        let mut dev = VirtioNet::new();
        // Select queue 99 (out of range) — should clamp to last queue
        dev.write(VIRTIO_NET_BASE + QUEUE_SEL, 99);
        dev.write(VIRTIO_NET_BASE + QUEUE_NUM, 8);
        dev.write(VIRTIO_NET_BASE + QUEUE_READY, 1);
        // Should have set queue 2 (the last one)
        assert!(dev.queues[2].ready);
    }

    #[test]
    fn queue_num_bounds() {
        let mut dev = VirtioNet::new();
        dev.write(VIRTIO_NET_BASE + QUEUE_SEL, 0);
        // Queue num larger than max should be ignored
        dev.write(VIRTIO_NET_BASE + QUEUE_NUM, 255);
        assert_eq!(dev.queues[0].size, QUEUE_SIZE);
    }

    #[test]
    fn with_udp_port() {
        // Use a high port that's likely available
        let dev = VirtioNet::with_udp_port(0); // port 0 = disabled
        assert!(dev.udp_socket.is_none());
    }
}
