// riscv/virtio_blk.rs -- Virtio MMIO block device (Phase 206)
//
// Full virtio block device emulation using the MMIO transport.
// Implements virtqueue descriptor tables, available ring, and used ring
// so guest drivers can perform read/write operations via QUEUE_NOTIFY.
//
// The disk image can be backed by a host file for persistence.
//
// MMIO address map (base at 0x1000_1000, matching QEMU virt):
//   0x00  MagicValue       (R)  = 0x74726976 ("virt")
//   0x04  Version          (R)  = 2 (virtio 1.0)
//   0x08  DeviceID         (R)  = 2 (block device)
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
//   0x100 Config           (R)  device config (capacity, etc.)
//
// Virtqueue layout (in guest memory):
//   Descriptor table: array of VirtDesc (16 bytes each)
//   Available ring: flags(2) + idx(2) + ring[](2) + used_event(2)
//   Used ring: flags(2) + idx(2) + ring[](8) + avail_event(2)

/// Virtio MMIO base address.
pub const VIRTIO_BASE: u64 = 0x1000_1000;
/// Virtio MMIO size.
pub const VIRTIO_SIZE: u64 = 0x1000;

/// Register offsets.
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

/// Virtio block device ID.
const VIRTIO_BLK_ID: u32 = 2;

/// Block size (512 bytes).
pub const SECTOR_SIZE: u64 = 512;

/// Maximum virt queue size.
const QUEUE_SIZE: u32 = 16;

/// Virtio block device capacity (in 512-byte sectors).
const DEFAULT_SECTORS: u64 = 2048; // 1MB disk

/// Config capacity high word offset.
const CONFIG_CAPACITY_HI: u64 = CONFIG + 4;

/// Virtio status bits.
pub const VIRTIO_STATUS_ACKNOWLEDGE: u32 = 1;
pub const VIRTIO_STATUS_DRIVER: u32 = 2;
pub const VIRTIO_STATUS_DRIVER_OK: u32 = 4;
pub const VIRTIO_STATUS_FEATURES_OK: u32 = 8;
pub const VIRTIO_STATUS_FAILED: u32 = 128;


/// Virtio block request types.
const VIRTIO_BLK_T_IN: u32 = 0; // Read
const VIRTIO_BLK_T_OUT: u32 = 1; // Write

/// Virtio interrupt status bits.
const VIRTIO_INT_USED_RING: u32 = 1;

/// Virtio descriptor flags.
const VIRTQ_DESC_F_NEXT: u16 = 1;
const VIRTQ_DESC_F_WRITE: u16 = 2;

/// A single virtqueue descriptor (16 bytes in guest memory).
#[derive(Debug, Clone, Copy, Default)]
#[repr(C)]
struct VirtDesc {
    addr: u64,  // Guest physical address of buffer
    len: u32,   // Buffer length
    flags: u16, // VIRTQ_DESC_F_* flags
    next: u16,  // Next descriptor index (if VIRTQ_DESC_F_NEXT)
}

/// Per-queue state.
#[derive(Debug, Clone, Copy)]
struct VirtQueue {
    /// Queue size (number of entries).
    size: u32,
    /// Whether the queue is ready.
    ready: bool,
    /// Guest physical address of descriptor table.
    desc_addr: u64,
    /// Guest physical address of available ring.
    avail_addr: u64,
    /// Guest physical address of used ring.
    used_addr: u64,
    /// Last seen available index (driver's view).
    last_avail_idx: u16,
    /// Last written used index (device's view).
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

/// Virtio block request status (1 byte, written after data).
const VIRTIO_BLK_S_OK: u8 = 0;
const VIRTIO_BLK_S_IOERR: u8 = 1;

/// Host file path for persistent disk backing.
/// If set, disk is loaded from this file on creation and saved on write.
const DISK_IMAGE_PATH: &str = "disk.img";

/// Virtio block device.
#[derive(Clone, Debug)]
pub struct VirtioBlk {
    /// Disk image data.
    pub disk: Vec<u8>,
    /// Device status register.
    pub status: u32,
    /// Current queue selector.
    pub queue_sel: u32,
    /// Per-queue state (we support queues 0 and 1, but only use queue 0 for requests).
    queues: [VirtQueue; 2],
    /// Driver features.
    pub driver_features: u32,
    /// Device features (what we support).
    pub device_features: u32,
    /// Device features selector.
    pub dev_features_sel: u32,
    /// Interrupt status.
    pub int_status: u32,
    /// Whether the disk is read-only.
    pub read_only: bool,
    /// Host file path for persistent backing (None = in-memory only).
    host_file: Option<String>,
    /// Track if disk has been modified (for lazy save).
    pub dirty: bool,
}

impl Default for VirtioBlk {
    fn default() -> Self {
        Self::new()
    }
}

impl VirtioBlk {
    /// Create a new virtio block device with a zeroed disk of default size.
    /// Attempts to load from disk.img if it exists.
    pub fn new() -> Self {
        let host_file = DISK_IMAGE_PATH.to_string();
        let (disk, dirty) = Self::load_disk(&host_file);

        Self {
            disk,
            status: 0,
            queue_sel: 0,
            queues: [VirtQueue::default(), VirtQueue::default()],
            driver_features: 0,
            device_features: 0, // Minimal features — no negotiation needed
            dev_features_sel: 0,
            int_status: 0,
            read_only: false,
            host_file: Some(host_file),
            dirty,
        }
    }

    /// Create a virtio block device with a custom disk image (in-memory only).
    pub fn with_disk(disk: Vec<u8>) -> Self {
        let mut dev = Self::new();
        dev.disk = disk;
        dev.host_file = None; // In-memory only
        dev
    }

    /// Load disk from host file. Returns (disk_data, was_loaded_from_file).
    fn load_disk(path: &str) -> (Vec<u8>, bool) {
        match std::fs::read(path) {
            Ok(data) if !data.is_empty() => {
                eprintln!(
                    "[virtio-blk] Loaded disk image from {}: {} bytes ({} sectors)",
                    path,
                    data.len(),
                    data.len() / SECTOR_SIZE as usize
                );
                (data, false)
            }
            Ok(_) | Err(_) => {
                // Create new zeroed disk
                let disk = vec![0u8; (DEFAULT_SECTORS * SECTOR_SIZE) as usize];
                (disk, false)
            }
        }
    }

    /// Save disk to host file if dirty and backing file is configured.
    pub fn save_disk(&mut self) -> bool {
        if let Some(ref path) = self.host_file {
            if self.dirty {
                match std::fs::write(path, &self.disk) {
                    Ok(_) => {
                        eprintln!(
                            "[virtio-blk] Saved disk image to {}: {} bytes",
                            path,
                            self.disk.len()
                        );
                        self.dirty = false;
                        return true;
                    }
                    Err(e) => {
                        eprintln!("[virtio-blk] Failed to save disk: {}", e);
                    }
                }
            }
        }
        false
    }

    /// Check if address is in virtio MMIO range.
    pub fn contains(addr: u64) -> bool {
        (VIRTIO_BASE..VIRTIO_BASE + VIRTIO_SIZE).contains(&addr)
    }

    /// Get mutable reference to the currently selected queue.
    fn current_queue(&mut self) -> &mut VirtQueue {
        let idx = self.queue_sel.min(1) as usize;
        &mut self.queues[idx]
    }

    /// Read a 32-bit word from virtio MMIO space.
    pub fn read(&self, addr: u64) -> Option<u32> {
        let offset = addr - VIRTIO_BASE;
        match offset {
            MAGIC_VALUE => Some(VIRTIO_MAGIC),
            VERSION => Some(2), // virtio 1.0
            DEVICE_ID => Some(VIRTIO_BLK_ID),
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
                let idx = self.queue_sel.min(1) as usize;
                Some(if self.queues[idx].ready { 1 } else { 0 })
            }
            INTERRUPT_STATUS => Some(self.int_status),
            CONFIG_GENERATION => Some(0),
            CONFIG => {
                // First 8 bytes of config: capacity in sectors (little-endian u64)
                let cap = (self.disk.len() as u64) / SECTOR_SIZE;
                Some((cap & 0xFFFF_FFFF) as u32)
            }
            CONFIG_CAPACITY_HI => {
                let cap = (self.disk.len() as u64) / SECTOR_SIZE;
                Some((cap >> 32) as u32)
            }
            _ => Some(0),
        }
    }

    /// Write a 32-bit word to virtio MMIO space.
    /// Returns Some(queue_sel) if QUEUE_NOTIFY was written (caller must process),
    /// None otherwise.
    pub fn write(&mut self, addr: u64, val: u32) -> Option<u32> {
        let offset = addr - VIRTIO_BASE;
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
                    self.queues = [VirtQueue::default(), VirtQueue::default()];
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
                // Reset queue state when ready changes
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
                // Return the queue index to kick — caller processes the queue
                return Some(val);
            }
            INTERRUPT_ACK => {
                // Acknowledge interrupts by clearing the corresponding bits
                self.int_status &= !val;
            }
            _ => {}
        }
        None
    }

    /// Process all pending requests on a virtqueue.
    ///
    /// This reads the descriptor table, available ring, and used ring
    /// from guest memory (provided by the bus's read_word/read_byte callbacks).
    ///
    /// `read_word_fn` reads a 32-bit word from guest physical address.
    /// `write_word_fn` writes a 32-bit word to guest physical address.
    /// `read_bytes_fn` reads a contiguous block of bytes from guest memory.
    /// `write_bytes_fn` writes a contiguous block of bytes to guest memory.
    ///
    /// Returns the number of requests processed.
    pub fn process_queue<F, G, H, I>(
        &mut self,
        queue_idx: u32,
        read_word_fn: &mut F,
        write_word_fn: &mut G,
        read_bytes_fn: &mut H,
        write_bytes_fn: &mut I,
    ) -> usize
    where
        F: FnMut(u64) -> u32,
        G: FnMut(u64, u32),
        H: FnMut(u64, usize) -> Vec<u8>,
        I: FnMut(u64, &[u8]),
    {
        let q_idx = queue_idx.min(1) as usize;
        let q = self.queues[q_idx]; // Copy since VirtQueue is now Copy

        if !q.ready || q.size == 0 || q.desc_addr == 0 {
            return 0;
        }

        let mut processed = 0;
        let mut last_avail_idx = q.last_avail_idx;
        let mut used_idx = q.used_idx;

        // Read the available ring index (u16 at avail_addr + 2).
        // read_word_fn reads u32 at avail_addr, which contains flags(u16) | idx(u16).
        // idx is at the upper 16 bits: read_word_fn(avail_addr) >> 16.
        let avail_idx = (read_word_fn(q.avail_addr) >> 16) as u16;

        // Process all new available entries
        while last_avail_idx != avail_idx {
            let desc_idx = (last_avail_idx as u32 % q.size) as u16;

            // Read available ring entry: ring[] at avail_addr + 4 + desc_idx * 2
            let ring_entry_addr = q.avail_addr + 4 + (desc_idx as u64) * 2;
            let head_idx = (read_word_fn(ring_entry_addr) & 0xFFFF) as u16;

            // Process the descriptor chain
            let _success = self.process_descriptor_chain(
                head_idx,
                &q,
                read_word_fn,
                read_bytes_fn,
                write_bytes_fn,
            );

            // Add to used ring
            let used_ring_addr = q.used_addr + 4 + (used_idx as u64 % q.size as u64) * 8;

            // Write used ring entry: id(4) + len(4)
            // id = head descriptor index
            write_word_fn(used_ring_addr, head_idx as u32);
            // len = total bytes consumed (0 means all for block device)
            write_word_fn(used_ring_addr + 4, 0);

            // Update used index (write after all entries for this batch)
            used_idx = used_idx.wrapping_add(1);

            processed += 1;
            last_avail_idx = last_avail_idx.wrapping_add(1);
        }

        self.queues[q_idx].last_avail_idx = last_avail_idx;
        self.queues[q_idx].used_idx = used_idx;

        if processed > 0 {
            // Signal interrupt: used buffer notification
            self.int_status |= VIRTIO_INT_USED_RING;

            // Write the updated used index to guest memory
            write_word_fn(q.used_addr + 2, used_idx as u32);
        }

        processed
    }

    /// Process a single descriptor chain starting from head_idx.
    fn process_descriptor_chain<F, H, I>(
        &mut self,
        head_idx: u16,
        q: &VirtQueue,
        read_word_fn: &mut F,
        read_bytes_fn: &mut H,
        write_bytes_fn: &mut I,
    ) -> bool
    where
        F: FnMut(u64) -> u32,
        H: FnMut(u64, usize) -> Vec<u8>,
        I: FnMut(u64, &[u8]),
    {
        // Read the first descriptor to get the request header
        let desc = self.read_descriptor(head_idx, q, read_word_fn);
        if desc.len < 16 {
            return false;
        }

        // Read the block request header (16 bytes)
        let req_data = read_bytes_fn(desc.addr, 16);
        if req_data.len() < 16 {
            return false;
        }

        let req_type = u32::from_le_bytes([req_data[0], req_data[1], req_data[2], req_data[3]]);
        let sector = u64::from_le_bytes([
            req_data[8],
            req_data[9],
            req_data[10],
            req_data[11],
            req_data[12],
            req_data[13],
            req_data[14],
            req_data[15],
        ]);

        // Walk the chain to find the data buffer and status byte
        let mut current_idx = head_idx;
        let mut data_buf: Option<(u64, u32)> = None; // (addr, len)
        let mut status_addr: Option<u64> = None;

        loop {
            let d = self.read_descriptor(current_idx, q, read_word_fn);

            // First descriptor is the request header (already read), skip it
            if current_idx != head_idx {
                if d.flags & VIRTQ_DESC_F_WRITE != 0 {
                    // Writable buffer — could be data (for reads) or status
                    if d.len >= 512 && data_buf.is_none() {
                        data_buf = Some((d.addr, d.len));
                    } else if status_addr.is_none() {
                        status_addr = Some(d.addr);
                    }
                } else {
                    // Read-only buffer — data for writes
                    if d.len >= 512 && data_buf.is_none() {
                        data_buf = Some((d.addr, d.len));
                    }
                }
            } else {
                // For write requests, the data buffer might follow in the chain
                // Check if there's a next descriptor with data
            }

            if d.flags & VIRTQ_DESC_F_NEXT != 0 {
                current_idx = d.next;
            } else {
                break;
            }
        }

        // If we didn't find data/status from chain walking, look at the second
        // descriptor more carefully
        if data_buf.is_none() || status_addr.is_none() {
            // Re-walk the chain collecting all descriptors
            let mut descs: Vec<(VirtDesc, u16)> = Vec::new();
            let mut idx = head_idx;
            loop {
                let d = self.read_descriptor(idx, q, read_word_fn);
                descs.push((d, idx));
                if d.flags & VIRTQ_DESC_F_NEXT != 0 {
                    idx = d.next;
                } else {
                    break;
                }
            }

            // Typical layout:
            // desc[0] = request header (16 bytes, read-only)
            // desc[1] = data buffer (512+ bytes, read-only for write, writable for read)
            // desc[2] = status byte (1 byte, writable)
            for (i, (d, _di)) in descs.iter().enumerate() {
                if i == 0 {
                    continue; // Skip request header
                }
                if d.flags & VIRTQ_DESC_F_WRITE != 0 {
                    if status_addr.is_none() && d.len == 1 {
                        status_addr = Some(d.addr);
                    } else if data_buf.is_none() && d.len >= 512 {
                        data_buf = Some((d.addr, d.len));
                    }
                } else {
                    if data_buf.is_none() && d.len >= 512 {
                        data_buf = Some((d.addr, d.len));
                    }
                }
            }

            // Fallback: if status not found, use last writable descriptor
            if status_addr.is_none() {
                for (d, _) in descs.iter().skip(1) {
                    if d.flags & VIRTQ_DESC_F_WRITE != 0 {
                        status_addr = Some(d.addr);
                        break;
                    }
                }
            }
            // Fallback: if data not found, use first non-header descriptor
            if data_buf.is_none() && descs.len() > 1 {
                let d = &descs[1].0;
                if d.len >= 512 {
                    data_buf = Some((d.addr, d.len));
                }
            }
        }

        // Execute the request
        let status = match (req_type, data_buf) {
            (VIRTIO_BLK_T_IN, Some((buf_addr, buf_len))) => {
                // Read: copy from disk to guest memory
                let start = (sector * SECTOR_SIZE) as usize;
                let count = (buf_len as usize).min(SECTOR_SIZE as usize);
                if start + count <= self.disk.len() {
                    let data = self.disk[start..start + count].to_vec();
                    write_bytes_fn(buf_addr, &data);
                    VIRTIO_BLK_S_OK
                } else {
                    VIRTIO_BLK_S_IOERR
                }
            }
            (VIRTIO_BLK_T_OUT, Some((buf_addr, buf_len))) => {
                // Write: copy from guest memory to disk
                if self.read_only {
                    VIRTIO_BLK_S_IOERR
                } else {
                    let start = (sector * SECTOR_SIZE) as usize;
                    let count = (buf_len as usize).min(SECTOR_SIZE as usize);
                    if start + count <= self.disk.len() {
                        let data = read_bytes_fn(buf_addr, count);
                        self.disk[start..start + data.len()].copy_from_slice(&data);
                        self.dirty = true;
                        VIRTIO_BLK_S_OK
                    } else {
                        VIRTIO_BLK_S_IOERR
                    }
                }
            }
            _ => VIRTIO_BLK_S_IOERR,
        };

        // Write status byte
        if let Some(addr) = status_addr {
            write_bytes_fn(addr, &[status]);
        }

        status == VIRTIO_BLK_S_OK
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

    /// Read sectors from the disk image (direct API, bypasses virtqueue).
    /// Returns the data at the given sector offset, or None if out of range.
    pub fn read_sectors(&self, sector: u64, count: u32) -> Option<Vec<u8>> {
        let start = (sector * SECTOR_SIZE) as usize;
        let len = (count as usize) * (SECTOR_SIZE as usize);
        if start + len > self.disk.len() {
            return None;
        }
        Some(self.disk[start..start + len].to_vec())
    }

    /// Write sectors to the disk image (direct API, bypasses virtqueue).
    /// Returns true if the write succeeded.
    pub fn write_sectors(&mut self, sector: u64, data: &[u8]) -> bool {
        if self.read_only {
            return false;
        }
        let start = (sector * SECTOR_SIZE) as usize;
        if start + data.len() > self.disk.len() {
            return false;
        }
        self.disk[start..start + data.len()].copy_from_slice(data);
        self.dirty = true;
        true
    }

    /// Disk capacity in 512-byte sectors.
    pub fn capacity(&self) -> u64 {
        (self.disk.len() as u64) / SECTOR_SIZE
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn new_virtio_defaults() {
        let dev = VirtioBlk::new();
        assert_eq!(dev.status, 0);
        assert!(dev.disk.len() >= (DEFAULT_SECTORS * SECTOR_SIZE) as usize);
    }

    #[test]
    fn read_magic() {
        let dev = VirtioBlk::new();
        assert_eq!(dev.read(VIRTIO_BASE), Some(VIRTIO_MAGIC));
    }

    #[test]
    fn read_version() {
        let dev = VirtioBlk::new();
        assert_eq!(dev.read(VIRTIO_BASE + VERSION), Some(2));
    }

    #[test]
    fn read_device_id() {
        let dev = VirtioBlk::new();
        assert_eq!(dev.read(VIRTIO_BASE + DEVICE_ID), Some(VIRTIO_BLK_ID));
    }

    #[test]
    fn write_read_status() {
        let mut dev = VirtioBlk::new();
        dev.write(
            VIRTIO_BASE + STATUS,
            VIRTIO_STATUS_ACKNOWLEDGE | VIRTIO_STATUS_DRIVER,
        );
        assert_eq!(
            dev.read(VIRTIO_BASE + STATUS),
            Some(VIRTIO_STATUS_ACKNOWLEDGE | VIRTIO_STATUS_DRIVER)
        );
    }

    #[test]
    fn status_zero_resets_queues() {
        let mut dev = VirtioBlk::new();
        dev.write(VIRTIO_BASE + QUEUE_SEL, 0);
        dev.write(VIRTIO_BASE + QUEUE_NUM, 8);
        dev.write(VIRTIO_BASE + QUEUE_READY, 1);
        assert_eq!(dev.queues[0].ready, true);

        // Reset via status = 0
        dev.write(VIRTIO_BASE + STATUS, 0);
        assert_eq!(dev.queues[0].ready, false);
        assert_eq!(dev.queues[0].size, QUEUE_SIZE);
    }

    #[test]
    fn config_capacity() {
        let dev = VirtioBlk::new();
        let lo = dev.read(VIRTIO_BASE + CONFIG).expect("read should succeed");
        let hi = dev
            .read(VIRTIO_BASE + CONFIG + 4)
            .expect("read should succeed");
        let capacity = lo as u64 | ((hi as u64) << 32);
        assert_eq!(capacity, DEFAULT_SECTORS);
    }

    #[test]
    fn queue_num_max() {
        let dev = VirtioBlk::new();
        assert_eq!(dev.read(VIRTIO_BASE + QUEUE_NUM_MAX), Some(QUEUE_SIZE));
    }

    #[test]
    fn write_read_queue_ready() {
        let mut dev = VirtioBlk::new();
        dev.write(VIRTIO_BASE + QUEUE_SEL, 0);
        dev.write(VIRTIO_BASE + QUEUE_READY, 1);
        assert_eq!(dev.read(VIRTIO_BASE + QUEUE_READY), Some(1));
    }

    #[test]
    fn queue_descriptor_address() {
        let mut dev = VirtioBlk::new();
        dev.write(VIRTIO_BASE + QUEUE_SEL, 0);
        dev.write(VIRTIO_BASE + QUEUE_DESC_LOW, 0x8000);
        dev.write(VIRTIO_BASE + QUEUE_DESC_HIGH, 0x0000);
        assert_eq!(dev.queues[0].desc_addr, 0x8000);

        // Set high bits
        dev.write(VIRTIO_BASE + QUEUE_DESC_LOW, 0x0000);
        dev.write(VIRTIO_BASE + QUEUE_DESC_HIGH, 0x0001);
        assert_eq!(dev.queues[0].desc_addr, 0x0001_0000_0000u64);
    }

    #[test]
    fn queue_avail_used_address() {
        let mut dev = VirtioBlk::new();
        dev.write(VIRTIO_BASE + QUEUE_SEL, 0);
        dev.write(VIRTIO_BASE + QUEUE_AVAIL_LOW, 0x9000);
        assert_eq!(dev.queues[0].avail_addr, 0x9000);

        dev.write(VIRTIO_BASE + QUEUE_USED_LOW, 0xA000);
        assert_eq!(dev.queues[0].used_addr, 0xA000);
    }

    #[test]
    fn queue_notify_returns_queue_idx() {
        let mut dev = VirtioBlk::new();
        // Writing to QUEUE_NOTIFY should return Some(queue_idx)
        let result = dev.write(VIRTIO_BASE + QUEUE_NOTIFY, 0);
        assert_eq!(result, Some(0));

        // Writing to non-QUEUE_NOTIFY should return None
        let result = dev.write(VIRTIO_BASE + STATUS, 1);
        assert_eq!(result, None);
    }

    #[test]
    fn interrupt_ack_clears_bits() {
        let mut dev = VirtioBlk::new();
        dev.int_status = VIRTIO_INT_USED_RING;
        dev.write(VIRTIO_BASE + INTERRUPT_ACK, VIRTIO_INT_USED_RING);
        assert_eq!(dev.int_status, 0);
    }

    #[test]
    fn read_write_sectors() {
        let mut dev = VirtioBlk::with_disk(vec![0u8; 512]);
        let data = vec![0xABu8; 512];
        assert!(dev.write_sectors(0, &data));
        let read = dev.read_sectors(0, 1).expect("operation should succeed");
        assert_eq!(read, data);
    }

    #[test]
    fn read_out_of_range_returns_none() {
        let dev = VirtioBlk::with_disk(vec![0u8; 1024]);
        assert!(dev.read_sectors(3, 1).is_none()); // 3*512=1536 > 1024
    }

    #[test]
    fn write_out_of_range_returns_false() {
        let mut dev = VirtioBlk::with_disk(vec![0u8; 1024]);
        let data = vec![0u8; 512];
        assert!(!dev.write_sectors(3, &data)); // 3*512=1536 > 1024
    }

    #[test]
    fn custom_disk_image() {
        let dev = VirtioBlk::with_disk(vec![0xFFu8; 1024]);
        assert_eq!(dev.capacity(), 2); // 1024 / 512 = 2 sectors
    }

    #[test]
    fn read_only_prevents_writes() {
        let mut dev = VirtioBlk::with_disk(vec![0u8; 1024]);
        dev.read_only = true;
        assert!(!dev.write_sectors(0, &[0xAB; 512]));
    }

    #[test]
    fn dirty_flag_set_on_write() {
        let mut dev = VirtioBlk::with_disk(vec![0u8; 1024]);
        assert!(!dev.dirty);
        dev.write_sectors(0, &[0xAB; 512]);
        assert!(dev.dirty);
    }

    #[test]
    fn process_queue_read_request() {
        let mut dev = VirtioBlk::with_disk(vec![0u8; 2048]); // 4 sectors
                                                             // Pre-fill sector 0 with known data
        dev.disk[0..14].copy_from_slice(b"Hello, virtio!");

        // Set up queue 0
        dev.write(VIRTIO_BASE + QUEUE_SEL, 0);
        dev.write(VIRTIO_BASE + QUEUE_NUM, 4);
        dev.write(VIRTIO_BASE + QUEUE_READY, 1);
        dev.write(VIRTIO_BASE + QUEUE_DESC_LOW, 0x1000);
        dev.write(VIRTIO_BASE + QUEUE_AVAIL_LOW, 0x1100);
        dev.write(VIRTIO_BASE + QUEUE_USED_LOW, 0x1200);

        // Simulated guest memory: 16KB at 0x0
        let mut mem = vec![0u32; 8192]; // 32KB — must cover desc(0x1000), avail(0x1100), used(0x1200), header(0x2000), data(0x3000), status(0x4000)
        let mem_ptr = mem.as_mut_ptr();
        let mem_len = mem.len();

        let mut read_word = |addr: u64| -> u32 {
            let idx = (addr / 4) as usize;
            if idx < mem_len {
                unsafe { *mem_ptr.add(idx) }
            } else {
                0
            }
        };
        let mut write_word = move |addr: u64, val: u32| {
            let idx = (addr / 4) as usize;
            if idx < mem_len {
                unsafe {
                    *mem_ptr.add(idx) = val;
                }
            }
        };
        let mem_bytes = mem.as_mut_ptr() as *mut u8;
        let mem_byte_len = mem_len * 4;
        let mut read_bytes = |addr: u64, len: usize| -> Vec<u8> {
            let mut data = vec![0u8; len];
            for i in 0..len {
                let idx = (addr as usize).wrapping_add(i);
                if idx < mem_byte_len {
                    unsafe {
                        data[i] = *mem_bytes.add(idx);
                    }
                }
            }
            data
        };
        let mut write_bytes = move |addr: u64, data: &[u8]| {
            for (i, &b) in data.iter().enumerate() {
                let idx = (addr as usize).wrapping_add(i);
                if idx < mem_byte_len {
                    unsafe {
                        *mem_bytes.add(idx) = b;
                    }
                }
            }
        };

        // Set up descriptor chain in guest memory:
        // desc[0]: request header (16 bytes, read-only) at guest PA 0x2000
        // desc[1]: data buffer (512 bytes, writable) at guest PA 0x3000
        // desc[2]: status byte (1 byte, writable) at guest PA 0x4000

        // desc[0]: addr=0x2000, len=16, flags=VIRTQ_DESC_F_NEXT, next=1
        mem[0x1000 / 4] = 0x2000; // addr_lo
        mem[0x1004 / 4] = 0; // addr_hi
        mem[0x1008 / 4] = 16; // len = 16
        mem[0x100C / 4] = (VIRTQ_DESC_F_NEXT as u16 as u32) | (1 << 16); // flags=NEXT, next=1

        // desc[1]: addr=0x3000, len=512, flags=VIRTQ_DESC_F_WRITE|NEXT, next=2
        mem[0x1010 / 4] = 0x3000;
        mem[0x1014 / 4] = 0;
        mem[0x1018 / 4] = 512; // len = 512
        mem[0x101C / 4] = ((VIRTQ_DESC_F_WRITE | VIRTQ_DESC_F_NEXT) as u16 as u32) | (2 << 16); // flags=WRITE|NEXT, next=2

        // desc[2]: addr=0x4000, len=1, flags=VIRTQ_DESC_F_WRITE, next=0
        mem[0x1020 / 4] = 0x4000;
        mem[0x1024 / 4] = 0;
        mem[0x1028 / 4] = 1; // len = 1
        mem[0x102C / 4] = VIRTQ_DESC_F_WRITE as u16 as u32; // flags=WRITE, next=0

        // Write request header at 0x2000: type=READ(0), sector=0
        // type (4 bytes) = 0
        // reserved (4 bytes) = 0
        // sector (8 bytes) = 0
        mem[0x2000 / 4] = 0; // type = T_IN
        mem[0x2004 / 4] = 0; // reserved
        mem[0x2008 / 4] = 0; // sector lo
        mem[0x200C / 4] = 0; // sector hi

        // Available ring at 0x1100: packed flags(u16)|idx(u16), ring[0]
        mem[0x1100 / 4] = 1 << 16; // flags=0 (low 16), idx=1 (high 16)
        mem[0x1104 / 4] = 0; // ring[0] = 0 (head descriptor index)

        // Process the queue
        let count = dev.process_queue(
            0,
            &mut read_word,
            &mut write_word,
            &mut read_bytes,
            &mut write_bytes,
        );

        assert_eq!(count, 1);

        // Verify data was read into the buffer at 0x3000
        let data = read_bytes(0x3000, 16);
        assert_eq!(&data[..b"Hello, virtio!".len()], b"Hello, virtio!");

        // Verify status byte at 0x4000
        let status = read_word(0x4000) as u8;
        assert_eq!(status, VIRTIO_BLK_S_OK);

        // Verify interrupt was raised
        assert_ne!(dev.int_status & VIRTIO_INT_USED_RING, 0);
    }

    #[test]
    fn process_queue_write_request() {
        let mut dev = VirtioBlk::with_disk(vec![0u8; 2048]);

        // Set up queue 0
        dev.write(VIRTIO_BASE + QUEUE_SEL, 0);
        dev.write(VIRTIO_BASE + QUEUE_NUM, 4);
        dev.write(VIRTIO_BASE + QUEUE_READY, 1);
        dev.write(VIRTIO_BASE + QUEUE_DESC_LOW, 0x1000);
        dev.write(VIRTIO_BASE + QUEUE_AVAIL_LOW, 0x1100);
        dev.write(VIRTIO_BASE + QUEUE_USED_LOW, 0x1200);

        let mut mem = vec![0u32; 8192]; // 32KB — must cover all descriptor addresses up to 0x4000+
        let mem_ptr = mem.as_mut_ptr();
        let mem_len = mem.len();

        let mut read_word = |addr: u64| -> u32 {
            let idx = (addr / 4) as usize;
            if idx < mem_len {
                unsafe { *mem_ptr.add(idx) }
            } else {
                0
            }
        };
        let mut write_word = move |addr: u64, val: u32| {
            let idx = (addr / 4) as usize;
            if idx < mem_len {
                unsafe {
                    *mem_ptr.add(idx) = val;
                }
            }
        };
        let mem_bytes = mem.as_mut_ptr() as *mut u8;
        let mem_byte_len = mem_len * 4;
        let mut read_bytes = |addr: u64, len: usize| -> Vec<u8> {
            let mut data = vec![0u8; len];
            for i in 0..len {
                let idx = (addr as usize).wrapping_add(i);
                if idx < mem_byte_len {
                    unsafe {
                        data[i] = *mem_bytes.add(idx);
                    }
                }
            }
            data
        };
        let mut write_bytes = move |addr: u64, data: &[u8]| {
            for (i, &b) in data.iter().enumerate() {
                let idx = (addr as usize).wrapping_add(i);
                if idx < mem_byte_len {
                    unsafe {
                        *mem_bytes.add(idx) = b;
                    }
                }
            }
        };

        // desc[0]: request header at 0x2000 (read-only, chain to desc 1)
        mem[0x1000 / 4] = 0x2000;
        mem[0x1004 / 4] = 0;
        mem[0x1008 / 4] = 16; // len = 16
        mem[0x100C / 4] = (VIRTQ_DESC_F_NEXT as u16 as u32) | (1 << 16); // flags=NEXT, next=1

        // desc[1]: data buffer at 0x3000 (read-only for write, chain to desc 2)
        mem[0x1010 / 4] = 0x3000;
        mem[0x1014 / 4] = 0;
        mem[0x1018 / 4] = 512; // len = 512
        mem[0x101C / 4] = (VIRTQ_DESC_F_NEXT as u16 as u32) | (2 << 16); // flags=NEXT, next=2

        // desc[2]: status byte at 0x4000 (writable)
        mem[0x1020 / 4] = 0x4000;
        mem[0x1024 / 4] = 0;
        mem[0x1028 / 4] = 1; // len = 1
        mem[0x102C / 4] = VIRTQ_DESC_F_WRITE as u16 as u32; // flags=WRITE, next=0

        // Write request header: type=WRITE(1), sector=1
        mem[0x2000 / 4] = VIRTIO_BLK_T_OUT; // type = T_OUT
        mem[0x2004 / 4] = 0; // reserved
        mem[0x2008 / 4] = 1; // sector lo = 1
        mem[0x200C / 4] = 0; // sector hi

        // Write data to sector at 0x3000
        let test_data = b"TestData123456789!";
        for (i, &b) in test_data.iter().enumerate() {
            unsafe {
                *mem_bytes.add((0x3000 + i as u64) as usize) = b;
            }
        }

        // Available ring: packed flags(u16)|idx(u16), ring[0]
        mem[0x1100 / 4] = 1 << 16; // flags=0, idx=1
        mem[0x1104 / 4] = 0; // ring[0] = 0

        // Process
        let count = dev.process_queue(
            0,
            &mut read_word,
            &mut write_word,
            &mut read_bytes,
            &mut write_bytes,
        );
        assert_eq!(count, 1);

        // Verify data was written to disk sector 1
        let sector_data = dev.read_sectors(1, 1).unwrap();
        assert_eq!(&sector_data[0..test_data.len()], test_data);

        // Verify status
        let status = read_word(0x4000) as u8;
        assert_eq!(status, VIRTIO_BLK_S_OK);

        // Verify dirty flag
        assert!(dev.dirty);
    }

    #[test]
    fn process_queue_out_of_bounds_returns_error() {
        let mut dev = VirtioBlk::with_disk(vec![0u8; 512]); // Only 1 sector

        dev.write(VIRTIO_BASE + QUEUE_SEL, 0);
        dev.write(VIRTIO_BASE + QUEUE_NUM, 4);
        dev.write(VIRTIO_BASE + QUEUE_READY, 1);
        dev.write(VIRTIO_BASE + QUEUE_DESC_LOW, 0x1000);
        dev.write(VIRTIO_BASE + QUEUE_AVAIL_LOW, 0x1100);
        dev.write(VIRTIO_BASE + QUEUE_USED_LOW, 0x1200);

        let mut mem = vec![0u32; 8192]; // 32KB — must cover all descriptor addresses up to 0x4000+
        let mem_ptr = mem.as_mut_ptr();
        let mem_len = mem.len();

        let mut read_word = |addr: u64| -> u32 {
            let idx = (addr / 4) as usize;
            if idx < mem_len {
                unsafe { *mem_ptr.add(idx) }
            } else {
                0
            }
        };
        let mut write_word = move |addr: u64, val: u32| {
            let idx = (addr / 4) as usize;
            if idx < mem_len {
                unsafe {
                    *mem_ptr.add(idx) = val;
                }
            }
        };
        let mem_bytes = mem.as_mut_ptr() as *mut u8;
        let mem_byte_len = mem_len * 4;
        let mut read_bytes = |addr: u64, len: usize| -> Vec<u8> {
            let mut data = vec![0u8; len];
            for i in 0..len {
                let idx = (addr as usize).wrapping_add(i);
                if idx < mem_byte_len {
                    unsafe {
                        data[i] = *mem_bytes.add(idx);
                    }
                }
            }
            data
        };
        let mut write_bytes = move |addr: u64, data: &[u8]| {
            for (i, &b) in data.iter().enumerate() {
                let idx = (addr as usize).wrapping_add(i);
                if idx < mem_byte_len {
                    unsafe {
                        *mem_bytes.add(idx) = b;
                    }
                }
            }
        };

        // desc[0]: request header at 0x2000
        mem[0x1000 / 4] = 0x2000;
        mem[0x1004 / 4] = 0;
        mem[0x1008 / 4] = 16; // len = 16
        mem[0x100C / 4] = (VIRTQ_DESC_F_NEXT as u16 as u32) | (1 << 16); // flags=NEXT, next=1
                                                                         // desc[1]: data buffer at 0x3000
        mem[0x1010 / 4] = 0x3000;
        mem[0x1014 / 4] = 0;
        mem[0x1018 / 4] = 512; // len = 512
        mem[0x101C / 4] = ((VIRTQ_DESC_F_WRITE | VIRTQ_DESC_F_NEXT) as u16 as u32) | (2 << 16); // flags=WRITE|NEXT, next=2
                                                                                                // desc[2]: status at 0x4000
        mem[0x1020 / 4] = 0x4000;
        mem[0x1024 / 4] = 0;
        mem[0x1028 / 4] = 1; // len = 1
        mem[0x102C / 4] = VIRTQ_DESC_F_WRITE as u16 as u32; // flags=WRITE, next=0

        // Read request for sector 99 (way out of bounds)
        mem[0x2000 / 4] = VIRTIO_BLK_T_IN;
        mem[0x2004 / 4] = 0;
        mem[0x2008 / 4] = 99; // sector 99
        mem[0x200C / 4] = 0;

        mem[0x1100 / 4] = 1 << 16; // flags=0, idx=1
        mem[0x1104 / 4] = 0; // ring[0] = 0

        let count = dev.process_queue(
            0,
            &mut read_word,
            &mut write_word,
            &mut read_bytes,
            &mut write_bytes,
        );
        assert_eq!(count, 1);

        // Should get IOERR status
        let status = read_word(0x4000) as u8;
        assert_eq!(status, VIRTIO_BLK_S_IOERR);
    }

    #[test]
    fn save_disk_persists_to_file() {
        let tmp = std::env::temp_dir().join("geo_test_disk.img");
        let path_str = tmp.to_str().unwrap().to_string();

        // Create a device with a specific path
        let mut dev = VirtioBlk::with_disk(vec![0u8; 1024]);
        dev.host_file = Some(path_str.clone());
        dev.write_sectors(0, &[0x42; 512]);
        assert!(dev.dirty);

        // Save
        assert!(dev.save_disk());
        assert!(!dev.dirty);

        // Verify file exists and has content
        let data = std::fs::read(&tmp).unwrap();
        assert_eq!(data.len(), 1024);
        assert_eq!(data[0], 0x42);

        // Clean up
        let _ = std::fs::remove_file(&tmp);
    }

    #[test]
    fn load_disk_from_file() {
        let tmp = std::env::temp_dir().join("geo_test_disk_load.img");
        // Write a known disk image
        let disk_data = vec![0xCCu8; 2048];
        std::fs::write(&tmp, &disk_data).unwrap();

        // Load via the internal method
        let (loaded, dirty) = VirtioBlk::load_disk(tmp.to_str().unwrap());
        assert_eq!(loaded.len(), 2048);
        assert!(!dirty);

        // Clean up
        let _ = std::fs::remove_file(&tmp);
    }

    #[test]
    fn queue_not_ready_returns_zero_processed() {
        let mut dev = VirtioBlk::with_disk(vec![0u8; 1024]);
        dev.write(VIRTIO_BASE + QUEUE_SEL, 0);
        // Don't set QUEUE_READY

        let mut mem = vec![0u32; 8192]; // 32KB — must cover all descriptor addresses up to 0x4000+
        let mut read_word = |addr: u64| -> u32 {
            let idx = (addr / 4) as usize;
            if idx < mem.len() {
                mem[idx]
            } else {
                0
            }
        };
        let mut write_word = |_addr: u64, _val: u32| {};
        let mut read_bytes = |_addr: u64, _len: usize| -> Vec<u8> { vec![] };
        let mut write_bytes = |_addr: u64, _data: &[u8]| {};

        let count = dev.process_queue(
            0,
            &mut read_word,
            &mut write_word,
            &mut read_bytes,
            &mut write_bytes,
        );
        assert_eq!(count, 0);
    }
}
