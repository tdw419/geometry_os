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
/// Stored in Memory Palace for spatial encoding of disk writes.
/// IMPORTANT: Uses ~/.geometry_os/vmfs/ (home directory) which IS the Memory Palace spatial filesystem.
fn get_disk_path() -> String {
    let mut path = std::path::PathBuf::from(std::env::var("HOME").unwrap_or_else(|_| ".".to_string()));
    path.push(".geometry_os/vmfs/alpine_disk.img");
    path.to_string_lossy().to_string()
}

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
        let host_file = get_disk_path();
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

        // Parse request header (little-endian):
        //   0..32   = type (u32)
        //   32..64  = reserved (u32)
        //   64..96  = sector (u64)
        let req_type = u32::from_le_bytes([req_data[0], req_data[1], req_data[2], req_data[3]]);
        let _reserved = u32::from_le_bytes([req_data[4], req_data[5], req_data[6], req_data[7]]);
        let sector = u64::from_le_bytes([
            req_data[8], req_data[9], req_data[10], req_data[11],
            req_data[12], req_data[13], req_data[14], req_data[15],
        ]);

        // Process data descriptors (type: OUT = write to disk, IN = read from disk)
        // The request header is followed by one or two data descriptors:
        //   - For OUT (write): descriptor with data to write
        //   - For IN (read): descriptor to fill with data from disk
        let mut next_desc = head_idx;
        let mut success = false;

        // Skip the request header descriptor (already read above)
        let header_desc = desc;
        if header_desc.flags & VIRTQ_DESC_F_NEXT != 0 {
            next_desc = header_desc.next;
        }

        // Process the data descriptor
        let data_desc = self.read_descriptor(next_desc, q, read_word_fn);

        match req_type {
            VIRTIO_BLK_T_OUT => {
                // Write to disk: read data from guest and write to disk
                if !self.read_only && data_desc.len > 0 {
                    let guest_data = read_bytes_fn(data_desc.addr, data_desc.len as usize);
                    let disk_offset = (sector * SECTOR_SIZE) as usize;

                    if disk_offset + guest_data.len() <= self.disk.len() {
                        self.disk[disk_offset..disk_offset + guest_data.len()]
                            .copy_from_slice(&guest_data);
                        self.dirty = true;
                        success = true;
                    }
                }
            }
            VIRTIO_BLK_T_IN => {
                // Read from disk: read data from disk and write to guest
                if data_desc.len > 0 {
                    let disk_offset = (sector * SECTOR_SIZE) as usize;
                    let mut guest_data = vec![0u8; data_desc.len as usize];

                    if disk_offset + guest_data.len() <= self.disk.len() {
                        guest_data.copy_from_slice(&self.disk[disk_offset..disk_offset + guest_data.len()]);
                        write_bytes_fn(data_desc.addr, &guest_data);
                        success = true;
                    }
                }
            }
            _ => {
                // Unknown request type
                success = false;
            }
        }

        // Write status byte (after data descriptor)
        if data_desc.flags & VIRTQ_DESC_F_NEXT != 0 {
            let status_desc = self.read_descriptor(data_desc.next, q, read_word_fn);
            let status = if success { VIRTIO_BLK_S_OK } else { VIRTIO_BLK_S_IOERR };
            write_bytes_fn(status_desc.addr, &[status]);
        }

        success
    }

    /// Read a descriptor from guest memory.
    fn read_descriptor<F>(&self, idx: u16, q: &VirtQueue, read_word_fn: &mut F) -> VirtDesc
    where
        F: FnMut(u64) -> u32,
    {
        let desc_addr = q.desc_addr + (idx as u64) * 16;

        // Read descriptor fields (little-endian, 16 bytes total):
        //   0..8    = addr (u64)
        //   8..12   = len (u32)
        //   12..14  = flags (u16)
        //   14..16  = next (u16)

        let addr_low = read_word_fn(desc_addr);
        let addr_high = read_word_fn(desc_addr + 4);
        let len = read_word_fn(desc_addr + 8);
        let flags_next = read_word_fn(desc_addr + 12);

        let addr = ((addr_high as u64) << 32) | (addr_low as u64);
        let flags = (flags_next & 0xFFFF) as u16;
        let next = ((flags_next >> 16) & 0xFFFF) as u16;

        VirtDesc {
            addr,
            len,
            flags,
            next,
        }
    }
}