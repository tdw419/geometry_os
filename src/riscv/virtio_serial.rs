// riscv/virtio_serial.rs -- Virtio serial console device
//
// Virtio MMIO serial port (DeviceID=3, console).
// Provides a byte-stream channel between guest and host.
//
// Two virtqueues:
//   Queue 0 (rx): host -> guest.  The guest provides empty receive buffers;
//                 the device fills them when data arrives from the host.
//   Queue 1 (tx): guest -> host.  The guest sends data; the device consumes
//                 it and forwards to a host-side callback/channel.
//
// The payload is raw bytes -- the JSON (or any other) protocol sits above
// this transport.  Guest userspace writes to /dev/vport0p1.
//
// MMIO address map (base at 0x1000_6000):
//   Identical to the standard virtio MMIO layout (see virtio_blk.rs).
//   No device-specific config space beyond the transport registers.

/// Virtio serial MMIO base address.
pub const VIRTIO_SERIAL_BASE: u64 = 0x1000_6000;
/// Virtio serial MMIO size.
pub const VIRTIO_SERIAL_SIZE: u64 = 0x1000;

/// Register offsets (standard virtio MMIO).
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

/// Virtio magic value ("virt" in little-endian).
const VIRTIO_MAGIC: u32 = 0x7472_6976;

/// Virtio console device ID.
const VIRTIO_SERIAL_ID: u32 = 3;

/// Maximum virtqueue size.
const QUEUE_SIZE: u32 = 64;

/// Virtio status bits.
pub const VIRTIO_STATUS_ACKNOWLEDGE: u32 = 1;
pub const VIRTIO_STATUS_DRIVER: u32 = 2;
pub const VIRTIO_STATUS_DRIVER_OK: u32 = 4;
pub const VIRTIO_STATUS_FEATURES_OK: u32 = 8;
pub const VIRTIO_STATUS_FAILED: u32 = 128;

/// Virtio interrupt status bits.
const VIRTIO_INT_USED_RING: u32 = 1;

/// Virtio descriptor flags.
const VIRTQ_DESC_F_NEXT: u16 = 1;
const VIRTQ_DESC_F_WRITE: u16 = 2;

/// Virtio serial config space (minimal -- just columns/rows for console).
/// Guest can read this to get the console dimensions, but we keep it zeroed.
#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
struct SerialConfig {
    cols: u16,
    rows: u16,
}

/// A single virtqueue descriptor (16 bytes in guest memory).
#[derive(Debug, Clone, Copy, Default)]
#[repr(C)]
struct VirtDesc {
    addr: u64,
    len: u32,
    flags: u16,
    next: u16,
}

/// Per-queue state.
#[derive(Debug, Clone, Copy)]
struct VirtQueue {
    size: u32,
    ready: bool,
    desc_addr: u64,
    avail_addr: u64,
    used_addr: u64,
    last_avail_idx: u16,
    used_idx: u16,
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

/// Host-side callback type for data received from the guest (tx).
/// The callback receives the raw byte stream and can process it
/// (e.g. parse JSON, forward to a channel, etc).
pub type TxCallback = Box<dyn FnMut(&[u8]) + Send>;

/// Virtio serial device.
pub struct VirtioSerial {
    /// Device status register.
    pub status: u32,
    /// Current queue selector.
    pub queue_sel: u32,
    /// Per-queue state: queue 0 = rx, queue 1 = tx.
    queues: [VirtQueue; 2],
    /// Driver features.
    pub driver_features: u32,
    /// Device features.
    pub device_features: u32,
    /// Device features selector.
    pub dev_features_sel: u32,
    /// Interrupt status.
    pub int_status: u32,
    /// Console config.
    config: SerialConfig,
    /// Host-side TX callback: called with bytes the guest sends.
    /// None until explicitly set by the hypervisor host code.
    tx_callback: Option<TxCallback>,
    /// Outbound byte buffer (guest -> host).
    /// Accumulated by process_tx_queue. The VM thread loop drains this
    /// alongside SBI/UART output, so data always reaches the host
    /// even when no tx_callback is installed.
    pub tx_buf: Vec<u8>,
    /// Inbound byte buffer (host -> guest).
    /// Data queued here will be pushed into rx virtqueue buffers
    /// the next time the guest kicks the rx queue (or when the host
    /// injects data via inject_rx()).
    rx_buffer: Vec<u8>,
}

impl std::fmt::Debug for VirtioSerial {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("VirtioSerial")
            .field("status", &self.status)
            .field("queue_sel", &self.queue_sel)
            .field("queues", &self.queues)
            .field("driver_features", &self.driver_features)
            .field("device_features", &self.device_features)
            .field("dev_features_sel", &self.dev_features_sel)
            .field("int_status", &self.int_status)
            .field("config", &self.config)
            .field("has_tx_callback", &self.tx_callback.is_some())
            .field("rx_buffer_len", &self.rx_buffer.len())
            .finish()
    }
}

impl Default for VirtioSerial {
    fn default() -> Self {
        Self::new()
    }
}

impl VirtioSerial {
    /// Create a new virtio serial device.
    pub fn new() -> Self {
        Self {
            status: 0,
            queue_sel: 0,
            queues: [VirtQueue::default(), VirtQueue::default()],
            driver_features: 0,
            device_features: 0, // Minimal features
            dev_features_sel: 0,
            int_status: 0,
            config: SerialConfig::default(),
            tx_callback: None,
            tx_buf: Vec::new(),
            rx_buffer: Vec::new(),
        }
    }

    /// Install a host-side callback for guest-transmitted data.
    /// Called whenever the guest writes data to the tx virtqueue.
    pub fn set_tx_callback(&mut self, cb: TxCallback) {
        self.tx_callback = Some(cb);
    }

    /// Queue data from the host side to be delivered to the guest.
    /// The next time the guest kicks the rx virtqueue (or the hypervisor
    /// calls process_rx_available), this data will be written into
    /// guest-provided receive buffers.
    pub fn inject_rx(&mut self, data: &[u8]) {
        self.rx_buffer.extend_from_slice(data);
    }

    /// Drain all accumulated TX data (guest -> host).
    /// Returns the bytes and clears the internal buffer.
    /// Called by the VM thread loop to forward serial output.
    pub fn drain_tx(&mut self) -> Vec<u8> {
        std::mem::take(&mut self.tx_buf)
    }

    /// Check if address is in virtio serial MMIO range.
    pub fn contains(addr: u64) -> bool {
        (VIRTIO_SERIAL_BASE..VIRTIO_SERIAL_BASE + VIRTIO_SERIAL_SIZE).contains(&addr)
    }

    /// Get mutable reference to the currently selected queue.
    fn current_queue(&mut self) -> &mut VirtQueue {
        let idx = self.queue_sel.min(1) as usize;
        &mut self.queues[idx]
    }

    /// Read a 32-bit word from virtio MMIO space.
    pub fn read(&self, addr: u64) -> Option<u32> {
        let offset = addr - VIRTIO_SERIAL_BASE;
        match offset {
            MAGIC_VALUE => Some(VIRTIO_MAGIC),
            VERSION => Some(2),
            DEVICE_ID => Some(VIRTIO_SERIAL_ID),
            VENDOR_ID => Some(0x5555_5555),
            DEVICE_FEATURES => {
                if self.dev_features_sel == 0 {
                    Some(self.device_features)
                } else {
                    Some(0)
                }
            },
            STATUS => Some(self.status),
            QUEUE_NUM_MAX => Some(QUEUE_SIZE),
            QUEUE_READY => {
                let idx = self.queue_sel.min(1) as usize;
                Some(if self.queues[idx].ready { 1 } else { 0 })
            },
            INTERRUPT_STATUS => Some(self.int_status),
            CONFIG_GENERATION => Some(0),
            CONFIG => {
                // cols (lower 16 bits) | rows (upper 16 bits)
                Some((self.config.cols as u32) | ((self.config.rows as u32) << 16))
            },
            _ => Some(0),
        }
    }

    /// Write a 32-bit word to virtio MMIO space.
    /// Returns Some(queue_idx) if QUEUE_NOTIFY was written, None otherwise.
    pub fn write(&mut self, addr: u64, val: u32) -> Option<u32> {
        let offset = addr - VIRTIO_SERIAL_BASE;
        match offset {
            DEVICE_FEATURES_SEL => {
                self.dev_features_sel = val;
            },
            DRIVER_FEATURES => {
                self.driver_features = val;
            },
            DRIVER_FEATURES_SEL => {},
            STATUS => {
                self.status = val;
                if val == 0 {
                    self.queues = [VirtQueue::default(), VirtQueue::default()];
                }
            },
            QUEUE_SEL => {
                self.queue_sel = val;
            },
            QUEUE_NUM => {
                let q = self.current_queue();
                if val > 0 && val <= QUEUE_SIZE {
                    q.size = val;
                }
            },
            QUEUE_READY => {
                let q = self.current_queue();
                q.ready = val != 0;
                if q.ready {
                    q.last_avail_idx = 0;
                    q.used_idx = 0;
                }
            },
            QUEUE_DESC_LOW => {
                let q = self.current_queue();
                q.desc_addr = (q.desc_addr & 0xFFFF_FFFF_0000_0000) | (val as u64);
            },
            QUEUE_DESC_HIGH => {
                let q = self.current_queue();
                q.desc_addr = (q.desc_addr & 0x0000_0000_FFFF_FFFF) | ((val as u64) << 32);
            },
            QUEUE_AVAIL_LOW => {
                let q = self.current_queue();
                q.avail_addr = (q.avail_addr & 0xFFFF_FFFF_0000_0000) | (val as u64);
            },
            QUEUE_AVAIL_HIGH => {
                let q = self.current_queue();
                q.avail_addr = (q.avail_addr & 0x0000_0000_FFFF_FFFF) | ((val as u64) << 32);
            },
            QUEUE_USED_LOW => {
                let q = self.current_queue();
                q.used_addr = (q.used_addr & 0xFFFF_FFFF_0000_0000) | (val as u64);
            },
            QUEUE_USED_HIGH => {
                let q = self.current_queue();
                q.used_addr = (q.used_addr & 0x0000_0000_FFFF_FFFF) | ((val as u64) << 32);
            },
            QUEUE_NOTIFY => {
                return Some(val);
            },
            INTERRUPT_ACK => {
                self.int_status &= !val;
            },
            _ => {},
        }
        None
    }

    /// Process the TX virtqueue (queue 1).
    ///
    /// The guest has written data and kicked the queue. Read all
    /// descriptor chains, extract the byte stream from each, and
    /// invoke the host-side callback.
    ///
    /// Returns the number of descriptors processed.
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
        let q_idx = 1;
        let q = self.queues[q_idx];

        if !q.ready || q.size == 0 || q.desc_addr == 0 {
            return 0;
        }

        let mut processed = 0;
        let mut last_avail_idx = q.last_avail_idx;
        let mut used_idx = q.used_idx;

        let avail_idx = (read_word_fn(q.avail_addr) >> 16) as u16;

        while last_avail_idx != avail_idx {
            let desc_idx = (last_avail_idx as u32 % q.size) as u16;

            // Read available ring entry
            let ring_entry_addr = q.avail_addr + 4 + (desc_idx as u64) * 2;
            let head_idx = (read_word_fn(ring_entry_addr) & 0xFFFF) as u16;

            // Walk the descriptor chain, collecting all data bytes
            let mut data = Vec::new();
            let mut current_idx = head_idx;
            loop {
                let d = self.read_descriptor(current_idx, &q, read_word_fn);
                // Read data from the descriptor buffer
                let chunk = read_bytes_fn(d.addr, d.len as usize);
                data.extend_from_slice(&chunk);

                if d.flags & VIRTQ_DESC_F_NEXT != 0 {
                    current_idx = d.next;
                } else {
                    break;
                }
            }

            // Invoke host callback with the received data
            if !data.is_empty() {
                if let Some(ref mut cb) = self.tx_callback {
                    cb(&data);
                }
                // Always accumulate into tx_buf so the VM thread can drain it
                self.tx_buf.extend_from_slice(&data);
            }

            // Add to used ring
            let used_ring_addr = q.used_addr + 4 + (used_idx as u64 % q.size as u64) * 8;
            write_word_fn(used_ring_addr, head_idx as u32);
            write_word_fn(used_ring_addr + 4, data.len() as u32);

            used_idx = used_idx.wrapping_add(1);
            processed += 1;
            last_avail_idx = last_avail_idx.wrapping_add(1);
        }

        self.queues[q_idx].last_avail_idx = last_avail_idx;
        self.queues[q_idx].used_idx = used_idx;

        if processed > 0 {
            self.int_status |= VIRTIO_INT_USED_RING;
            write_word_fn(q.used_addr + 2, used_idx as u32);
        }

        processed
    }

    /// Process the RX virtqueue (queue 0).
    ///
    /// The guest has provided empty receive buffers. Fill them with
    /// any data that has been queued from the host side via inject_rx().
    ///
    /// Returns the number of descriptors processed.
    pub fn process_rx_queue<F, G>(
        &mut self,
        read_word_fn: &mut F,
        write_word_fn: &mut G,
        write_bytes_fn: &mut dyn FnMut(u64, &[u8]),
    ) -> usize
    where
        F: FnMut(u64) -> u32,
        G: FnMut(u64, u32),
    {
        let q_idx = 0;
        let q = self.queues[q_idx];

        if !q.ready || q.size == 0 || q.desc_addr == 0 {
            return 0;
        }

        if self.rx_buffer.is_empty() {
            return 0;
        }

        let mut processed = 0;
        let mut last_avail_idx = q.last_avail_idx;
        let mut used_idx = q.used_idx;
        let mut rx_offset = 0;

        let avail_idx = (read_word_fn(q.avail_addr) >> 16) as u16;

        while last_avail_idx != avail_idx && rx_offset < self.rx_buffer.len() {
            let desc_idx = (last_avail_idx as u32 % q.size) as u16;

            let ring_entry_addr = q.avail_addr + 4 + (desc_idx as u64) * 2;
            let head_idx = (read_word_fn(ring_entry_addr) & 0xFFFF) as u16;

            // Walk the descriptor chain -- find writable buffers
            let mut written = 0usize;
            let mut current_idx = head_idx;
            loop {
                let d = self.read_descriptor(current_idx, &q, read_word_fn);
                if d.flags & VIRTQ_DESC_F_WRITE != 0 {
                    // Writable buffer -- fill with rx data
                    let remaining = self.rx_buffer.len() - rx_offset;
                    let count = remaining.min(d.len as usize);
                    if count > 0 {
                        write_bytes_fn(d.addr, &self.rx_buffer[rx_offset..rx_offset + count]);
                        rx_offset += count;
                        written += count;
                    }
                }

                if d.flags & VIRTQ_DESC_F_NEXT != 0 {
                    current_idx = d.next;
                } else {
                    break;
                }
            }

            // Add to used ring
            let used_ring_addr = q.used_addr + 4 + (used_idx as u64 % q.size as u64) * 8;
            write_word_fn(used_ring_addr, head_idx as u32);
            write_word_fn(used_ring_addr + 4, written as u32);

            used_idx = used_idx.wrapping_add(1);
            processed += 1;
            last_avail_idx = last_avail_idx.wrapping_add(1);
        }

        // Consume delivered bytes from the rx buffer
        self.rx_buffer.drain(0..rx_offset);

        self.queues[q_idx].last_avail_idx = last_avail_idx;
        self.queues[q_idx].used_idx = used_idx;

        if processed > 0 {
            self.int_status |= VIRTIO_INT_USED_RING;
            write_word_fn(q.used_addr + 2, used_idx as u32);
        }

        processed
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
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_mmio_magic_and_id() {
        let dev = VirtioSerial::new();
        assert_eq!(dev.read(VIRTIO_SERIAL_BASE), Some(VIRTIO_MAGIC));
        assert_eq!(
            dev.read(VIRTIO_SERIAL_BASE + DEVICE_ID),
            Some(VIRTIO_SERIAL_ID)
        );
        assert_eq!(dev.read(VIRTIO_SERIAL_BASE + VERSION), Some(2));
    }

    #[test]
    fn test_contains() {
        assert!(VirtioSerial::contains(0x1000_6000));
        assert!(VirtioSerial::contains(0x1000_6FFF));
        assert!(!VirtioSerial::contains(0x1000_5000));
        assert!(!VirtioSerial::contains(0x1000_7000));
    }

    #[test]
    fn test_queue_setup() {
        let mut dev = VirtioSerial::new();
        // Select queue 0
        assert_eq!(dev.write(VIRTIO_SERIAL_BASE + QUEUE_SEL, 0), None);
        assert_eq!(dev.write(VIRTIO_SERIAL_BASE + QUEUE_NUM, 8), None);
        // Queue should report not ready
        assert_eq!(dev.read(VIRTIO_SERIAL_BASE + QUEUE_READY), Some(0));
        // Mark ready
        assert_eq!(dev.write(VIRTIO_SERIAL_BASE + QUEUE_READY, 1), None);
        assert_eq!(dev.read(VIRTIO_SERIAL_BASE + QUEUE_READY), Some(1));
    }

    #[test]
    fn test_status_reset() {
        let mut dev = VirtioSerial::new();
        dev.write(VIRTIO_SERIAL_BASE + QUEUE_SEL, 1);
        dev.write(VIRTIO_SERIAL_BASE + QUEUE_NUM, 8);
        dev.write(VIRTIO_SERIAL_BASE + QUEUE_READY, 1);
        // Reset
        dev.write(VIRTIO_SERIAL_BASE + STATUS, 0);
        // Queues should be reset
        assert_eq!(dev.queues[1].ready, false);
    }

    #[test]
    fn test_inject_rx() {
        let mut dev = VirtioSerial::new();
        dev.inject_rx(b"hello");
        assert_eq!(&dev.rx_buffer, b"hello");
        dev.inject_rx(b" world");
        assert_eq!(&dev.rx_buffer, b"hello world");
    }

    #[test]
    fn test_tx_callback() {
        let mut dev = VirtioSerial::new();
        let received = std::sync::Arc::new(std::sync::Mutex::new(Vec::new()));
        let received_clone = received.clone();
        dev.set_tx_callback(Box::new(move |data: &[u8]| {
            received_clone.lock().unwrap().extend_from_slice(data);
        }));

        // Simulate what process_tx_queue would do internally by invoking callback
        if let Some(ref mut cb) = dev.tx_callback {
            cb(b"test data");
        }
        assert_eq!(&*received.lock().unwrap(), b"test data");
    }
}
