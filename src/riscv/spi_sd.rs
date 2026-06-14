// riscv/spi_sd.rs -- SPI SD Card Controller (Phase 379)
//
// Emulates an SPI-connected SD card at MMIO address 0x10004000.
// Uses a simple register-based interface (not bit-banging) for
// efficient guest driver implementation.
//
// The backing store is a host file (sdcard.img), allowing persistent
// block storage that survives VM restarts.
//
// MMIO Register Map (base + offset):
//   0x00  SPI_CTRL      (W)  Command register: write to initiate operation
//                               0 = no-op, 1 = READ_BLOCK, 2 = WRITE_BLOCK
//   0x04  SPI_STATUS    (R)  Status register:
//                               bit 0: BUSY (1 = operation in progress)
//                               bit 1: ERROR (1 = last operation failed)
//                               bit 2: READY (1 = card inserted and initialized)
//   0x08  SPI_ADDR_LO   (R/W) Block address low 32 bits (512-byte sector)
//   0x0C  SPI_ADDR_HI   (R/W) Block address high 32 bits
//   0x10  SPI_DATA       (R/W) Data register: read/write 32 bits at a time
//                               Auto-increments internal data pointer by 4 bytes
//   0x14  SPI_DATA_IDX   (R)  Current byte index within block (0..511)
//   0x18  SPI_CARD_SIZE  (R)  Total number of 512-byte sectors (e.g., 0x3A0000 = 1.8GB)
//   0x1C  SPI_IRQ_EN     (R/W) Interrupt enable: bit 0 = operation complete
//   0x20  SPI_IRQ_STATUS (R)  Interrupt status: bit 0 = operation complete (write 1 to clear)
//
// Usage pattern for block read:
//   1. Write block number to SPI_ADDR_LO (and SPI_ADDR_HI if >4GB)
//   2. Write 1 to SPI_CTRL (READ_BLOCK)
//   3. Poll SPI_STATUS until BUSY=0 (or wait for IRQ)
//   4. Read 128 words from SPI_DATA (each read returns 4 bytes, auto-increments)
//
// Usage pattern for block write:
//   1. Write block number to SPI_ADDR_LO
//   2. Write 128 words to SPI_DATA (each write stores 4 bytes, auto-increments)
//   3. Write 2 to SPI_CTRL (WRITE_BLOCK)
//   4. Poll SPI_STATUS until BUSY=0 (or wait for IRQ)

use std::fs;
use std::io::{Read, Seek, SeekFrom, Write};
use std::path::PathBuf;

/// Base MMIO address for the SPI SD card controller.
pub const SPI_SD_BASE: u64 = 0x1000_4000;
/// Size of the MMIO register region.
pub const SPI_SD_SIZE: u64 = 0x1000;

/// Block size in bytes (standard SD card sector size).
pub const BLOCK_SIZE: usize = 512;

/// Default SD card image path (relative to project root).
pub const DEFAULT_SDCARD_IMG: &str = "sdcard.img";

/// SPI commands (written to SPI_CTRL).
const CMD_NONE: u32 = 0;
const CMD_READ_BLOCK: u32 = 1;
const CMD_WRITE_BLOCK: u32 = 2;

/// Status register bits.
const STATUS_BUSY: u32 = 1 << 0;
const STATUS_ERROR: u32 = 1 << 1;
const STATUS_READY: u32 = 1 << 2;

/// IRQ enable/status bits.
const IRQ_OP_COMPLETE: u32 = 1 << 0;

/// Register offsets.
const REG_CTRL: u64 = 0x00;
const REG_STATUS: u64 = 0x04;
const REG_ADDR_LO: u64 = 0x08;
const REG_ADDR_HI: u64 = 0x0C;
const REG_DATA: u64 = 0x10;
const REG_DATA_IDX: u64 = 0x14;
const REG_CARD_SIZE: u64 = 0x18;
const REG_IRQ_EN: u64 = 0x1C;
const REG_IRQ_STATUS: u64 = 0x20;

/// SPI SD Card Controller state.
pub struct SpiSd {
    /// Whether the card image was found and opened.
    card_present: bool,
    /// Path to the backing image file.
    image_path: PathBuf,
    /// Total number of 512-byte sectors.
    total_sectors: u32,
    /// Block address for next operation (low 32 bits).
    addr_lo: u32,
    /// Block address for next operation (high 32 bits).
    addr_hi: u32,
    /// Data buffer for the current block (512 bytes).
    data_buf: [u8; BLOCK_SIZE],
    /// Current byte index within the data buffer (auto-increments on DATA reads/writes).
    data_idx: usize,
    /// Status register.
    status: u32,
    /// IRQ enable mask.
    irq_enable: u32,
    /// IRQ status (pending interrupts).
    irq_status: u32,
    /// Error message from last failed operation (for debugging).
    last_error: String,
}

impl Default for SpiSd {
    fn default() -> Self {
        Self::new()
    }
}

impl SpiSd {
    /// Create a new SPI SD card controller.
    /// Attempts to open `sdcard.img` in the current directory.
    /// If not found, creates a small (1MB) blank image.
    pub fn new() -> Self {
        let image_path = PathBuf::from(DEFAULT_SDCARD_IMG);
        Self::with_path(&image_path)
    }

    /// Create a controller with a specific image path.
    pub fn with_path(image_path: &PathBuf) -> Self {
        let (card_present, total_sectors) = if image_path.exists() {
            match fs::metadata(image_path) {
                Ok(meta) => {
                    let size = meta.len() as u64;
                    let sectors = (size / BLOCK_SIZE as u64) as u32;
                    (true, sectors)
                },
                Err(_) => (false, 0),
            }
        } else {
            // Create a small default image (1MB = 2048 sectors)
            let sectors: u32 = 2048;
            let size = sectors as u64 * BLOCK_SIZE as u64;
            if let Err(e) = Self::create_blank_image(image_path, size) {
                eprintln!("[spi_sd] Failed to create default image: {}", e);
                (false, 0)
            } else {
                (true, sectors)
            }
        };

        Self {
            card_present,
            image_path: image_path.clone(),
            total_sectors,
            addr_lo: 0,
            addr_hi: 0,
            data_buf: [0u8; BLOCK_SIZE],
            data_idx: 0,
            status: if card_present { STATUS_READY } else { 0 },
            irq_enable: 0,
            irq_status: 0,
            last_error: String::new(),
        }
    }

    /// Create a blank SD card image file of the given size.
    pub fn create_blank_image(path: &PathBuf, size: u64) -> std::io::Result<()> {
        let file = fs::File::create(path)?;
        file.set_len(size)?;
        Ok(())
    }

    /// Create a blank SD card image and reinitialize.
    pub fn format_card(&mut self, size_mb: u32) -> bool {
        let size = (size_mb as u64) * 1024 * 1024;
        match Self::create_blank_image(&self.image_path, size) {
            Ok(()) => {
                self.total_sectors = (size / BLOCK_SIZE as u64) as u32;
                self.card_present = true;
                self.status = STATUS_READY;
                self.last_error.clear();
                true
            },
            Err(e) => {
                self.last_error = format!("format failed: {}", e);
                false
            },
        }
    }

    /// Check if an address falls within the SPI SD card MMIO range.
    pub fn contains(addr: u64) -> bool {
        (SPI_SD_BASE..SPI_SD_BASE + SPI_SD_SIZE).contains(&addr)
    }

    /// Read a 32-bit register.
    pub fn read(&mut self, addr: u64) -> Option<u32> {
        let offset = addr - SPI_SD_BASE;
        match offset {
            REG_CTRL => Some(0), // CTRL is write-only
            REG_STATUS => Some(self.status),
            REG_ADDR_LO => Some(self.addr_lo),
            REG_ADDR_HI => Some(self.addr_hi),
            REG_DATA => {
                if self.data_idx + 4 <= BLOCK_SIZE {
                    let val = u32::from_le_bytes([
                        self.data_buf[self.data_idx],
                        self.data_buf[self.data_idx + 1],
                        self.data_buf[self.data_idx + 2],
                        self.data_buf[self.data_idx + 3],
                    ]);
                    self.data_idx += 4;
                    Some(val)
                } else {
                    Some(0) // past end of block
                }
            },
            REG_DATA_IDX => Some(self.data_idx as u32),
            REG_CARD_SIZE => Some(self.total_sectors),
            REG_IRQ_EN => Some(self.irq_enable),
            REG_IRQ_STATUS => Some(self.irq_status),
            _ => Some(0), // unmapped registers read as 0
        }
    }

    /// Write a 32-bit register. Returns Some(()) if an IRQ should be raised.
    pub fn write(&mut self, addr: u64, val: u32) -> Option<()> {
        let offset = addr - SPI_SD_BASE;
        match offset {
            REG_CTRL => {
                match val {
                    CMD_READ_BLOCK => self.do_read_block(),
                    CMD_WRITE_BLOCK => self.do_write_block(),
                    CMD_NONE => {},
                    _ => {
                        self.status |= STATUS_ERROR;
                        self.last_error = format!("unknown command: {}", val);
                    },
                }
                // Check if we should raise an IRQ
                if self.irq_enable & IRQ_OP_COMPLETE != 0 && self.irq_status & IRQ_OP_COMPLETE != 0
                {
                    return Some(());
                }
                None
            },
            REG_STATUS => {
                // Status is mostly read-only, but writing clears ERROR bit
                if val & STATUS_ERROR == 0 {
                    self.status &= !STATUS_ERROR;
                }
                None
            },
            REG_ADDR_LO => {
                self.addr_lo = val;
                None
            },
            REG_ADDR_HI => {
                self.addr_hi = val;
                None
            },
            REG_DATA => {
                if self.data_idx + 4 <= BLOCK_SIZE {
                    let bytes = val.to_le_bytes();
                    self.data_buf[self.data_idx] = bytes[0];
                    self.data_buf[self.data_idx + 1] = bytes[1];
                    self.data_buf[self.data_idx + 2] = bytes[2];
                    self.data_buf[self.data_idx + 3] = bytes[3];
                    self.data_idx += 4;
                }
                None
            },
            REG_IRQ_EN => {
                self.irq_enable = val;
                None
            },
            REG_IRQ_STATUS => {
                // Write 1 to clear
                self.irq_status &= !val;
                None
            },
            _ => None, // unmapped registers ignore writes
        }
    }

    /// Execute a block read operation.
    fn do_read_block(&mut self) {
        if !self.card_present {
            self.status |= STATUS_ERROR;
            self.last_error = "no card present".to_string();
            self.irq_status |= IRQ_OP_COMPLETE;
            return;
        }

        let block_addr = ((self.addr_hi as u64) << 32) | (self.addr_lo as u64);
        if block_addr >= self.total_sectors as u64 {
            self.status |= STATUS_ERROR;
            self.last_error = format!(
                "block {} out of range (max {})",
                block_addr, self.total_sectors
            );
            self.irq_status |= IRQ_OP_COMPLETE;
            return;
        }

        let byte_offset = block_addr * BLOCK_SIZE as u64;

        match fs::File::open(&self.image_path) {
            Ok(mut file) => match file.seek(SeekFrom::Start(byte_offset)) {
                Ok(_) => match file.read_exact(&mut self.data_buf) {
                    Ok(()) => {
                        self.data_idx = 0;
                        self.status &= !(STATUS_ERROR | STATUS_BUSY);
                        self.status |= STATUS_READY;
                        self.last_error.clear();
                    },
                    Err(e) => {
                        self.status |= STATUS_ERROR;
                        self.last_error = format!("read error at block {}: {}", block_addr, e);
                    },
                },
                Err(e) => {
                    self.status |= STATUS_ERROR;
                    self.last_error = format!("seek error at block {}: {}", block_addr, e);
                },
            },
            Err(e) => {
                self.status |= STATUS_ERROR;
                self.last_error = format!("open error: {}", e);
            },
        }

        self.irq_status |= IRQ_OP_COMPLETE;
    }

    /// Execute a block write operation.
    fn do_write_block(&mut self) {
        if !self.card_present {
            self.status |= STATUS_ERROR;
            self.last_error = "no card present".to_string();
            self.irq_status |= IRQ_OP_COMPLETE;
            return;
        }

        let block_addr = ((self.addr_hi as u64) << 32) | (self.addr_lo as u64);
        if block_addr >= self.total_sectors as u64 {
            self.status |= STATUS_ERROR;
            self.last_error = format!(
                "block {} out of range (max {})",
                block_addr, self.total_sectors
            );
            self.irq_status |= IRQ_OP_COMPLETE;
            return;
        }

        let byte_offset = block_addr * BLOCK_SIZE as u64;

        match fs::OpenOptions::new()
            .read(true)
            .write(true)
            .open(&self.image_path)
        {
            Ok(mut file) => match file.seek(SeekFrom::Start(byte_offset)) {
                Ok(_) => match file.write_all(&self.data_buf) {
                    Ok(()) => {
                        self.data_idx = 0;
                        self.status &= !(STATUS_ERROR | STATUS_BUSY);
                        self.status |= STATUS_READY;
                        self.last_error.clear();
                    },
                    Err(e) => {
                        self.status |= STATUS_ERROR;
                        self.last_error = format!("write error at block {}: {}", block_addr, e);
                    },
                },
                Err(e) => {
                    self.status |= STATUS_ERROR;
                    self.last_error = format!("seek error at block {}: {}", block_addr, e);
                },
            },
            Err(e) => {
                self.status |= STATUS_ERROR;
                self.last_error = format!("open error: {}", e);
            },
        }

        self.irq_status |= IRQ_OP_COMPLETE;
    }

    /// Read a single byte at the given MMIO address.
    pub fn read_byte(&mut self, addr: u64) -> u8 {
        let word = self.read(addr & !3).unwrap_or(0);
        let byte_off = (addr & 3) as usize;
        ((word >> (byte_off * 8)) & 0xFF) as u8
    }

    /// Get the total number of sectors.
    pub fn sector_count(&self) -> u32 {
        self.total_sectors
    }

    /// Get whether the card is present.
    pub fn is_present(&self) -> bool {
        self.card_present
    }

    /// Get the last error message.
    pub fn last_error(&self) -> &str {
        &self.last_error
    }

    /// Directly read sectors from the backing image (for testing/debugging).
    pub fn read_sectors_direct(&self, start_sector: u64, count: u32) -> Option<Vec<u8>> {
        if !self.card_present {
            return None;
        }
        let byte_offset = start_sector * BLOCK_SIZE as u64;
        let byte_count = count as usize * BLOCK_SIZE;
        let mut buf = vec![0u8; byte_count];

        let mut file = fs::File::open(&self.image_path).ok()?;
        file.seek(SeekFrom::Start(byte_offset)).ok()?;
        file.read_exact(&mut buf).ok()?;
        Some(buf)
    }

    /// Directly write sectors to the backing image (for testing/debugging).
    pub fn write_sectors_direct(&mut self, start_sector: u64, data: &[u8]) -> bool {
        if !self.card_present {
            return false;
        }
        let byte_offset = start_sector * BLOCK_SIZE as u64;

        match fs::OpenOptions::new()
            .read(true)
            .write(true)
            .open(&self.image_path)
        {
            Ok(mut file) => {
                if file.seek(SeekFrom::Start(byte_offset)).is_err() {
                    return false;
                }
                file.write_all(data).is_ok()
            },
            Err(_) => false,
        }
    }

    /// Check if an IRQ is pending.
    pub fn irq_pending(&self) -> bool {
        (self.irq_status & self.irq_enable & IRQ_OP_COMPLETE) != 0
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;
    use tempfile::TempDir;

    fn make_test_card() -> (TempDir, SpiSd) {
        let dir = TempDir::new().unwrap();
        let path = dir.path().join("test_sd.img");
        // Create a 64KB test image (128 sectors)
        let sectors = 128u32;
        let size = sectors as u64 * BLOCK_SIZE as u64;
        SpiSd::create_blank_image(&path, size).unwrap();
        let sd = SpiSd::with_path(&path);
        assert!(sd.is_present());
        assert_eq!(sd.sector_count(), sectors);
        (dir, sd)
    }

    #[test]
    fn test_spi_sd_contains() {
        assert!(SpiSd::contains(SPI_SD_BASE));
        assert!(SpiSd::contains(SPI_SD_BASE + 0x20));
        assert!(!SpiSd::contains(SPI_SD_BASE - 1));
        assert!(!SpiSd::contains(SPI_SD_BASE + SPI_SD_SIZE));
    }

    #[test]
    fn test_spi_sd_init() {
        let (_dir, sd) = make_test_card();
        assert!(sd.is_present());
        assert_eq!(sd.sector_count(), 128);
        assert_eq!(sd.status, STATUS_READY);
    }

    #[test]
    fn test_spi_sd_read_status() {
        let (_dir, mut sd) = make_test_card();
        let status = sd.read(SPI_SD_BASE + REG_STATUS).unwrap();
        assert_eq!(status & STATUS_READY, STATUS_READY);
        assert_eq!(status & STATUS_BUSY, 0);
        assert_eq!(status & STATUS_ERROR, 0);
    }

    #[test]
    fn test_spi_sd_read_card_size() {
        let (_dir, mut sd) = make_test_card();
        let size = sd.read(SPI_SD_BASE + REG_CARD_SIZE).unwrap();
        assert_eq!(size, 128);
    }

    #[test]
    fn test_spi_sd_write_read_block() {
        let (_dir, mut sd) = make_test_card();

        // Write test data to sector 0
        let test_data: [u8; BLOCK_SIZE] = {
            let mut d = [0u8; BLOCK_SIZE];
            for i in 0..BLOCK_SIZE {
                d[i] = (i & 0xFF) as u8;
            }
            d
        };

        // Write via MMIO
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 0); // block 0
        sd.data_buf.copy_from_slice(&test_data);
        sd.data_idx = BLOCK_SIZE; // mark buffer as full
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_WRITE_BLOCK);

        // Verify no error
        let status = sd.read(SPI_SD_BASE + REG_STATUS).unwrap();
        assert_eq!(status & STATUS_ERROR, 0, "write error: {}", sd.last_error());

        // Read back via MMIO
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 0); // block 0
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_READ_BLOCK);

        let status = sd.read(SPI_SD_BASE + REG_STATUS).unwrap();
        assert_eq!(status & STATUS_ERROR, 0, "read error: {}", sd.last_error());

        // Verify data
        for i in 0..BLOCK_SIZE {
            assert_eq!(sd.data_buf[i], test_data[i], "mismatch at byte {}", i);
        }
    }

    #[test]
    fn test_spi_sd_data_register_auto_increment() {
        let (_dir, mut sd) = make_test_card();

        // Write 4 words via data register
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 5); // sector 5
        sd.write(SPI_SD_BASE + REG_DATA, 0x01020304);
        sd.write(SPI_SD_BASE + REG_DATA, 0x05060708);
        sd.write(SPI_SD_BASE + REG_DATA, 0x090A0B0C);
        sd.write(SPI_SD_BASE + REG_DATA, 0x0D0E0F10);
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_WRITE_BLOCK);

        // Read back
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 5);
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_READ_BLOCK);

        let w0 = sd.read(SPI_SD_BASE + REG_DATA).unwrap();
        let w1 = sd.read(SPI_SD_BASE + REG_DATA).unwrap();
        let w2 = sd.read(SPI_SD_BASE + REG_DATA).unwrap();
        let w3 = sd.read(SPI_SD_BASE + REG_DATA).unwrap();

        assert_eq!(w0, 0x01020304);
        assert_eq!(w1, 0x05060708);
        assert_eq!(w2, 0x090A0B0C);
        assert_eq!(w3, 0x0D0E0F10);

        // Data index should have advanced
        let idx = sd.read(SPI_SD_BASE + REG_DATA_IDX).unwrap();
        assert_eq!(idx, 16); // 4 words * 4 bytes
    }

    #[test]
    fn test_spi_sd_out_of_range() {
        let (_dir, mut sd) = make_test_card();

        // Try reading sector beyond the card
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 999);
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_READ_BLOCK);

        let status = sd.read(SPI_SD_BASE + REG_STATUS).unwrap();
        assert_eq!(status & STATUS_ERROR, STATUS_ERROR);
        assert!(!sd.last_error().is_empty());
    }

    #[test]
    fn test_spi_sd_irq_status() {
        let (_dir, mut sd) = make_test_card();

        // Enable IRQ
        sd.write(SPI_SD_BASE + REG_IRQ_EN, IRQ_OP_COMPLETE);

        // Do a read
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 0);
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_READ_BLOCK);

        // Check IRQ pending
        assert!(sd.irq_pending());

        // Read IRQ status
        let irq = sd.read(SPI_SD_BASE + REG_IRQ_STATUS).unwrap();
        assert_eq!(irq & IRQ_OP_COMPLETE, IRQ_OP_COMPLETE);

        // Clear IRQ
        sd.write(SPI_SD_BASE + REG_IRQ_STATUS, IRQ_OP_COMPLETE);
        let irq = sd.read(SPI_SD_BASE + REG_IRQ_STATUS).unwrap();
        assert_eq!(irq & IRQ_OP_COMPLETE, 0);
    }

    #[test]
    fn test_spi_sd_multiple_sectors() {
        let (_dir, mut sd) = make_test_card();

        // Write pattern to sector 0
        let pattern_a = [0xAAu8; BLOCK_SIZE];
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 0);
        sd.data_buf.copy_from_slice(&pattern_a);
        sd.data_idx = BLOCK_SIZE;
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_WRITE_BLOCK);

        // Write pattern to sector 1
        let pattern_b = [0xBBu8; BLOCK_SIZE];
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 1);
        sd.data_buf.copy_from_slice(&pattern_b);
        sd.data_idx = BLOCK_SIZE;
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_WRITE_BLOCK);

        // Read back sector 0
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 0);
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_READ_BLOCK);
        assert_eq!(sd.data_buf[0], 0xAA);

        // Read back sector 1
        sd.write(SPI_SD_BASE + REG_ADDR_LO, 1);
        sd.write(SPI_SD_BASE + REG_CTRL, CMD_READ_BLOCK);
        assert_eq!(sd.data_buf[0], 0xBB);
    }

    #[test]
    fn test_spi_sd_direct_read_write() {
        let (_dir, mut sd) = make_test_card();

        // Write via direct API
        let data = vec![0xDE, 0xAD, 0xBE, 0xEF];
        let mut full_block = vec![0u8; BLOCK_SIZE];
        full_block[..4].copy_from_slice(&data);
        assert!(sd.write_sectors_direct(10, &full_block));

        // Read back via direct API
        let read_back = sd.read_sectors_direct(10, 1).unwrap();
        assert_eq!(&read_back[..4], &data[..]);
    }
}
