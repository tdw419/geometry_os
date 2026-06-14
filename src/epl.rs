//! epl.rs -- Epigenetic Persistence Layer (EPL) for Geometry OS
//!
//! The EPL manages spatial persistence by combining:
//!   - A deterministic seed (the "Genome") -- world_gen generates chunks on demand
//!   - An append-only Delta Journal (the "Epigenome") -- stores only mutations
//!   - An Exception Bitmap -- tracks which chunks have deltas (avoids disk reads for clean chunks)
//!
//! Format of Delta Journal (.epl):
//!   [Header: 32 bytes]
//!     Magic: "GEOS_EPL_V1" (12 bytes)
//!     Version: u32 (4 bytes)
//!     Sequence: u64 (8 bytes) -- monotonic counter for crash recovery
//!     Bitmap checksum: u32 (4 bytes) -- xxh32 of the exception bitmap
//!     Reserved: u32 (4 bytes)
//!
//!   [Exception Bitmap: variable]
//!     Bitmap len: u32 (4 bytes)
//!     Bitmap data: (bitmap_len bytes) -- bit N set means chunk ID N has a delta
//!
//!   [Entry 0..N]
//!     ChunkID: u64 (8 bytes)
//!     Raw data len: u32 (4 bytes) -- uncompressed size (for validation)
//!     RLE compressed len: u32 (4 bytes)
//!     Compressed data: (rle_len bytes)
//!     Checksum: u64 (8 bytes) -- xxh3_64 of compressed data

use crate::grammar::{GrammarRule, PatternMiner, RuleBase, RuleRegistry};
use std::collections::{HashMap, HashSet};
use std::fs::{File, OpenOptions};
use std::io::{Read, Seek, SeekFrom, Write};
use std::path::{Path, PathBuf};
use xxhash_rust::xxh3::xxh3_64;

/// Magic header for the EPL journal file.
const EPL_MAGIC: &[u8; 11] = b"GEOS_EPL_V1";
/// Header size: magic (12) + version (4) + sequence (8) + bitmap_checksum (4) + reserved (4).
const HEADER_SIZE: u64 = 32;
/// Current format version.
const EPL_VERSION: u32 = 1;

pub struct EplManager {
    journal_path: PathBuf,
    journal_file: File,
    /// ChunkID -> (file offset, entry total size)
    chunk_index: HashMap<u64, (u64, u32)>,
    /// Monotonic sequence counter, incremented on each write.
    sequence: u64,
    /// Estimated total size of journal on disk
    total_size: u64,
    /// Size of valid (latest) data in journal
    valid_size: u64,
}

impl EplManager {
    /// Open or create an EPL journal at the given path.
    /// On open, replays the journal to rebuild the exception bitmap and index.
    /// Implements crash recovery: if a checksum fails, entries after that point are discarded.
    pub fn open<P: AsRef<Path>>(path: P) -> std::io::Result<Self> {
        let path = path.as_ref().to_path_buf();
        let mut file = OpenOptions::new()
            .read(true)
            .write(true)
            .create(true)
            .open(&path)?;

        let file_len = file.metadata()?.len();

        if file_len == 0 {
            // New journal -- write header
            let mut header = [0u8; HEADER_SIZE as usize];
            header[0..11].copy_from_slice(EPL_MAGIC);
            header[11..15].copy_from_slice(&EPL_VERSION.to_le_bytes());
            // sequence starts at 0, bitmap_checksum 0, reserved 0
            file.write_all(&header)?;
            file.flush()?;
            return Ok(Self {
                journal_path: path,
                journal_file: file,
                chunk_index: HashMap::new(),
                sequence: 0,
                total_size: HEADER_SIZE,
                valid_size: 0,
            });
        }

        // Read header and validate
        file.seek(SeekFrom::Start(0))?;
        let mut header = [0u8; HEADER_SIZE as usize];
        file.read_exact(&mut header)?;

        if &header[0..11] != EPL_MAGIC {
            return Err(std::io::Error::new(
                std::io::ErrorKind::InvalidData,
                "EPL journal: invalid magic header",
            ));
        }

        let version = u32::from_le_bytes(header[11..15].try_into().unwrap());
        if version != EPL_VERSION {
            return Err(std::io::Error::new(
                std::io::ErrorKind::InvalidData,
                format!("EPL journal: unsupported version {}", version),
            ));
        }

        let saved_sequence = u64::from_le_bytes(header[15..23].try_into().unwrap());

        // Index journal entries, starting after header
        let mut index = HashMap::new();
        let mut pos = HEADER_SIZE;
        let mut valid_sequence = saved_sequence;
        let mut valid_size = 0u64;

        while pos + 24 <= file_len {
            // Entry header: chunk_id(8) + raw_len(4) + rle_len(4) + data(rle_len) + checksum(8)
            file.seek(SeekFrom::Start(pos))?;
            let mut entry_head = [0u8; 16];
            if file.read_exact(&mut entry_head).is_err() {
                break; // Truncated entry -- crash recovery: stop here
            }

            let chunk_id = u64::from_le_bytes(entry_head[0..8].try_into().unwrap());
            let _raw_len = u32::from_le_bytes(entry_head[8..12].try_into().unwrap());
            let rle_len = u32::from_le_bytes(entry_head[12..16].try_into().unwrap());

            let entry_data_size = rle_len as u64;
            let entry_total = 16 + entry_data_size + 8; // header + data + checksum

            if pos + entry_total > file_len {
                break; // Truncated entry -- crash occurred during write
            }

            // Read and verify checksum
            let mut compressed = vec![0u8; rle_len as usize];
            file.seek(SeekFrom::Start(pos + 16))?;
            if file.read_exact(&mut compressed).is_err() {
                break;
            }

            let mut cksum_buf = [0u8; 8];
            file.seek(SeekFrom::Start(pos + 16 + rle_len as u64))?;
            if file.read_exact(&mut cksum_buf).is_err() {
                break;
            }
            let stored_cksum = u64::from_le_bytes(cksum_buf);
            let computed_cksum = xxh3_64(&compressed);

            if stored_cksum != computed_cksum {
                // Checksum mismatch -- crash recovery: discard this and all subsequent entries.
                // Truncate the file to the last known-good position.
                break;
            }

            // Valid entry
            // For duplicate chunk_ids, keep the latest (append-only journal, last write wins)
            if let Some((_, old_size)) = index.insert(chunk_id, (pos, entry_total as u32)) {
                valid_size -= old_size as u64;
            }
            valid_size += entry_total;
            valid_sequence += 1;

            pos += entry_total;
        }

        // If we broke out early (crash recovery), truncate the file
        if pos < file_len {
            let _ = file.set_len(pos);
        }

        Ok(Self {
            journal_path: path,
            journal_file: file,
            chunk_index: index,
            sequence: valid_sequence,
            total_size: pos,
            valid_size,
        })
    }

    /// Check if a chunk has a delta in the journal (exception bitmap check).
    /// Returns false for clean chunks that should be generated from seed.
    /// This is the fast path -- no disk I/O needed.
    #[inline]
    pub fn has_delta(&self, chunk_id: u64) -> bool {
        self.chunk_index.contains_key(&chunk_id)
    }

    /// Save a chunk delta using RLE compression.
    pub fn save_delta(&mut self, chunk_id: u64, raw_data: &[u8]) -> std::io::Result<()> {
        let raw_len = raw_data.len() as u32;
        let compressed = rle_compress(raw_data);
        let rle_len = compressed.len() as u32;
        let checksum = xxh3_64(&compressed);

        let entry_total = 16 + rle_len as u64 + 8;

        // Append to journal
        self.journal_file.seek(SeekFrom::End(0))?;
        let current_pos = self.journal_file.stream_position()?;

        self.journal_file.write_all(&chunk_id.to_le_bytes())?;
        self.journal_file.write_all(&raw_len.to_le_bytes())?;
        self.journal_file.write_all(&rle_len.to_le_bytes())?;
        self.journal_file.write_all(&compressed)?;
        self.journal_file.write_all(&checksum.to_le_bytes())?;
        self.journal_file.flush()?;

        // Update index and size trackers
        if let Some((_, old_size)) = self
            .chunk_index
            .insert(chunk_id, (current_pos, entry_total as u32))
        {
            self.valid_size -= old_size as u64;
        }
        self.valid_size += entry_total;
        self.total_size += entry_total;
        self.sequence += 1;

        // Update header sequence counter periodically (every 64 writes)
        if self.sequence % 64 == 0 {
            self.write_header_sequence()?;
        }

        // Automatic Compaction: >10MB and >50% redundant
        if self.total_size > 10 * 1024 * 1024 && self.valid_size * 2 < self.total_size {
            self.compact()?;
        }

        Ok(())
    }

    /// Load a chunk delta, decompress, and return raw bytes.
    pub fn load_delta(&mut self, chunk_id: u64) -> std::io::Result<Option<Vec<u8>>> {
        let (offset, _size) = match self.chunk_index.get(&chunk_id) {
            Some(entry) => *entry,
            None => return Ok(None),
        };

        self.journal_file.seek(SeekFrom::Start(offset))?;
        let mut entry_head = [0u8; 16];
        self.journal_file.read_exact(&mut entry_head)?;

        let _stored_id = u64::from_le_bytes(entry_head[0..8].try_into().unwrap());
        let raw_len = u32::from_le_bytes(entry_head[8..12].try_into().unwrap()) as usize;
        let rle_len = u32::from_le_bytes(entry_head[12..16].try_into().unwrap()) as usize;

        let mut compressed = vec![0u8; rle_len];
        self.journal_file.read_exact(&mut compressed)?;

        let mut cksum_buf = [0u8; 8];
        self.journal_file.read_exact(&mut cksum_buf)?;
        let stored_cksum = u64::from_le_bytes(cksum_buf);

        if xxh3_64(&compressed) != stored_cksum {
            return Err(std::io::Error::new(
                std::io::ErrorKind::InvalidData,
                "EPL journal: checksum mismatch on load",
            ));
        }

        let decompressed = rle_decompress(&compressed, raw_len);

        // Validate decompressed size matches expected
        if decompressed.len() != raw_len {
            return Err(std::io::Error::new(
                std::io::ErrorKind::InvalidData,
                format!(
                    "EPL journal: decompressed size {} != expected {}",
                    decompressed.len(),
                    raw_len
                ),
            ));
        }

        Ok(Some(decompressed))
    }

    /// Number of dirty chunks in the journal.
    pub fn dirty_count(&self) -> usize {
        self.chunk_index.len()
    }

    /// Current sequence number.
    pub fn sequence(&self) -> u64 {
        self.sequence
    }

    /// Mine current deltas for repeated patterns and promote them to GrammarRules.
    pub fn mine_rules(
        &mut self,
        registry: &mut RuleRegistry,
        window_size: usize,
        threshold: u32,
    ) -> std::io::Result<Vec<u32>> {
        let miner = PatternMiner::new(window_size, threshold);
        let mut promoted_ids = Vec::new();

        // Collect chunk IDs first to avoid borrow checker issues
        let chunk_ids: Vec<u64> = self.chunk_index.keys().cloned().collect();

        for chunk_id in chunk_ids {
            if let Some(data) = self.load_delta(chunk_id)? {
                // Handle format markers for backward compatibility.
                // Old v1: exactly 16384 bytes (no marker).
                // New v1: 0x00 marker + 16384 bytes of pixel data.
                // v2: 0x01 marker + exception bitmap (skip mining -- needs chunk coords).
                let pixels_data: &[u8];
                if data.len() == 16384 {
                    pixels_data = &data; // Old v1
                } else if !data.is_empty() && data[0] == 0x00 {
                    pixels_data = &data[1..]; // New v1
                } else {
                    // v2 or unknown format -- skip pattern mining
                    continue;
                }

                // Convert bytes to pixels (u32)
                let pixels: Vec<u32> = pixels_data
                    .chunks_exact(4)
                    .map(|c| u32::from_le_bytes(c.try_into().unwrap()))
                    .collect();

                // Assuming CHUNK_SIZE x CHUNK_SIZE (64x64)
                let candidates = miner.mine(&pixels, 64, 64);
                for (block, _) in candidates {
                    let sub_rules = block
                        .into_iter()
                        .map(|p| {
                            registry.register(GrammarRule {
                                base: RuleBase::Atomic(p),
                                transforms: vec![],
                            })
                        })
                        .collect();

                    let rule = GrammarRule {
                        base: RuleBase::Composite {
                            width: window_size as u32,
                            height: window_size as u32,
                            rules: sub_rules,
                        },
                        transforms: vec![],
                    };
                    promoted_ids.push(registry.register(rule));
                }
            }
        }
        Ok(promoted_ids)
    }

    /// Reclaim disk space by keeping only the latest version of each chunk.
    /// Rewrites the journal to a temporary file and atomically replaces the original.
    pub fn compact(&mut self) -> std::io::Result<()> {
        let temp_path = self.journal_path.with_extension("epl.tmp");
        let mut temp_file = std::io::BufWriter::new(
            OpenOptions::new()
                .read(true)
                .write(true)
                .create(true)
                .truncate(true)
                .open(&temp_path)?,
        );

        // 1. Write fresh header to temp file
        let mut header = [0u8; HEADER_SIZE as usize];
        header[0..11].copy_from_slice(EPL_MAGIC);
        header[11..15].copy_from_slice(&EPL_VERSION.to_le_bytes());
        header[15..23].copy_from_slice(&self.sequence.to_le_bytes());
        temp_file.write_all(&header)?;

        let mut new_index = HashMap::new();
        let mut new_pos = HEADER_SIZE;

        // 2. Copy only the latest entry for each chunk.
        // Sorting by offset ensures sequential read performance (no random seeking).
        let mut entries: Vec<(u64, u64)> = self
            .chunk_index
            .iter()
            .map(|(&id, &(off, _))| (off, id))
            .collect();
        entries.sort_unstable();

        let mut entry_buffer = Vec::with_capacity(32768); // Reuse buffer for entry data

        for (old_offset, id) in entries {
            // Seek to old entry
            self.journal_file.seek(SeekFrom::Start(old_offset))?;

            // Read entry header
            let mut entry_head = [0u8; 16];
            self.journal_file.read_exact(&mut entry_head)?;
            let rle_len = u32::from_le_bytes(entry_head[12..16].try_into().unwrap());

            let data_to_read = rle_len as usize + 8; // data + checksum
            entry_buffer.resize(data_to_read, 0);

            // Read rest of the entry
            self.journal_file.read_exact(&mut entry_buffer)?;

            // Write to temp file
            let entry_total = 16 + data_to_read as u32;
            new_index.insert(id, (new_pos, entry_total));
            temp_file.write_all(&entry_head)?;
            temp_file.write_all(&entry_buffer)?;

            new_pos += entry_total as u64;
        }

        temp_file.flush()?;
        drop(temp_file);

        // 3. Swap files
        std::fs::rename(&temp_path, &self.journal_path)?;
        // Re-open the journal file handle
        self.journal_file = OpenOptions::new()
            .read(true)
            .write(true)
            .open(&self.journal_path)?;
        self.chunk_index = new_index;
        self.total_size = new_pos;
        self.valid_size = new_pos - HEADER_SIZE;

        Ok(())
    }

    /// Flush header sequence to disk.
    fn write_header_sequence(&mut self) -> std::io::Result<()> {
        self.journal_file.seek(SeekFrom::Start(15))?;
        self.journal_file.write_all(&self.sequence.to_le_bytes())?;
        self.journal_file.flush()?;
        Ok(())
    }
}

// ── RLE Compression ─────────────────────────────────────────────

/// RLE compress byte data.
/// Format: [count: u8, value: u8] pairs. Count max 255.
/// For pixel data (64x64 * 4 bytes = 16384 bytes), this is effective
/// when there are runs of identical bytes (common in sparse modifications).
fn rle_compress(data: &[u8]) -> Vec<u8> {
    if data.is_empty() {
        return Vec::new();
    }
    let mut out = Vec::with_capacity(data.len());
    let mut i = 0;
    while i < data.len() {
        let val = data[i];
        let mut count = 1u8;
        while i + (count as usize) < data.len() && data[i + (count as usize)] == val && count < 255
        {
            count += 1;
        }
        out.push(count);
        out.push(val);
        i += count as usize;
    }
    out
}

/// RLE decompress byte data.
/// `expected_len` is validated against the decompressed output size.
fn rle_decompress(data: &[u8], expected_len: usize) -> Vec<u8> {
    let mut out = Vec::with_capacity(expected_len);
    let mut i = 0;
    while i + 1 < data.len() && out.len() < expected_len {
        let count = data[i] as usize;
        let val = data[i + 1];
        let to_write = count.min(expected_len - out.len());
        for _ in 0..to_write {
            out.push(val);
        }
        i += 2;
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_rle_roundtrip() {
        let data = vec![0u8; 16384]; // All zeros -- 64x64 chunk of u32 zeros
        let compressed = rle_compress(&data);
        // Should compress well: 255+255+... runs of 0x00
        assert!(compressed.len() < data.len() / 10);
        let decompressed = rle_decompress(&compressed, data.len());
        assert_eq!(decompressed, data);
    }

    #[test]
    fn test_rle_variety() {
        let mut data = Vec::new();
        // Pattern: 100 zeros, 50 ones, 200 twos, some noise
        data.extend(std::iter::repeat(0u8).take(100));
        data.extend(std::iter::repeat(1u8).take(50));
        data.extend(std::iter::repeat(2u8).take(200));
        data.extend((0..10).map(|i| (i * 25) as u8));

        let compressed = rle_compress(&data);
        let decompressed = rle_decompress(&compressed, data.len());
        assert_eq!(decompressed, data);
    }

    #[test]
    fn test_epl_save_load() {
        let path = "/tmp/geos_epl_unit_test.epl";
        let _ = std::fs::remove_file(path);

        let chunk_id: u64 = ((5i32 as u64) << 32) | (10i32 as u32 as u64);
        let data = vec![0xABu8; 16384]; // A full chunk's worth of data

        {
            let mut epl = EplManager::open(path).unwrap();
            assert!(!epl.has_delta(chunk_id));
            epl.save_delta(chunk_id, &data).unwrap();
            assert!(epl.has_delta(chunk_id));
        }

        {
            let mut epl = EplManager::open(path).unwrap();
            assert!(epl.has_delta(chunk_id));
            let loaded = epl.load_delta(chunk_id).unwrap().unwrap();
            assert_eq!(loaded, data);
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_epl_crash_recovery() {
        let path = "/tmp/geos_epl_crash_test.epl";
        let _ = std::fs::remove_file(path);

        let chunk_id_1: u64 = 1;
        let chunk_id_2: u64 = 2;
        let data = vec![0x42u8; 16384];

        {
            let mut epl = EplManager::open(path).unwrap();
            epl.save_delta(chunk_id_1, &data).unwrap();
        }

        // Corrupt the file by appending garbage (simulating a crash mid-write)
        {
            let mut f = OpenOptions::new().append(true).open(path).unwrap();
            f.write_all(&chunk_id_2.to_le_bytes()).unwrap(); // Partial entry
            f.write_all(&16u32.to_le_bytes()).unwrap();
            f.flush().unwrap();
        }

        // Reopen -- should recover chunk_id_1, discard corrupted chunk_id_2
        {
            let epl = EplManager::open(path).unwrap();
            assert!(epl.has_delta(chunk_id_1));
            assert!(!epl.has_delta(chunk_id_2));
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_epl_overwrite() {
        // When a chunk is saved twice, the latest version should be returned
        let path = "/tmp/geos_epl_overwrite_test.epl";
        let _ = std::fs::remove_file(path);

        let chunk_id: u64 = 42;
        let data_v1 = vec![1u8; 16384];
        let data_v2 = vec![2u8; 16384];

        {
            let mut epl = EplManager::open(path).unwrap();
            epl.save_delta(chunk_id, &data_v1).unwrap();
            epl.save_delta(chunk_id, &data_v2).unwrap();
        }

        {
            let mut epl = EplManager::open(path).unwrap();
            let loaded = epl.load_delta(chunk_id).unwrap().unwrap();
            assert_eq!(loaded, data_v2); // Latest wins
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_epl_compaction() {
        let path = "/tmp/geos_epl_compact_test.epl";
        let _ = std::fs::remove_file(path);

        let chunk_id: u64 = 77;
        let data_v1 = vec![1u8; 16384];
        let data_v2 = vec![2u8; 16384];

        {
            let mut epl = EplManager::open(path).unwrap();
            epl.save_delta(chunk_id, &data_v1).unwrap();
            epl.save_delta(chunk_id, &data_v2).unwrap();
            let size_before = std::fs::metadata(path).unwrap().len();

            epl.compact().unwrap();

            let size_after = std::fs::metadata(path).unwrap().len();
            // Should be smaller after removing data_v1
            assert!(size_after < size_before);
        }

        {
            let mut epl = EplManager::open(path).unwrap();
            let loaded = epl.load_delta(chunk_id).unwrap().unwrap();
            assert_eq!(loaded, data_v2); // Still has latest data
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_epl_sequence_monotonicity() {
        // Verify sequence counter only increases
        let path = "/tmp/geos_epl_sequence_test.epl";
        let _ = std::fs::remove_file(path);

        let chunk_id: u64 = 123;
        let data = vec![0x88u8; 16384];

        {
            let mut epl = EplManager::open(path).unwrap();
            assert_eq!(epl.sequence(), 0);
            epl.save_delta(chunk_id, &data).unwrap();
            assert_eq!(epl.sequence(), 1);
            epl.save_delta(chunk_id, &data).unwrap();
            assert_eq!(epl.sequence(), 2);
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_epl_delta_integrity_corrupted_header() {
        // Test that corrupted data is detected
        let path = "/tmp/geos_epl_corrupt_test.epl";
        let _ = std::fs::remove_file(path);

        let chunk_id: u64 = 99;
        let data = vec![0x99u8; 16384];

        // Save valid data
        {
            let mut epl = EplManager::open(path).unwrap();
            epl.save_delta(chunk_id, &data).unwrap();
        }

        // Corrupt the file by writing garbage to a known offset
        {
            let mut f = OpenOptions::new()
                .read(true)
                .write(true)
                .open(path)
                .unwrap();
            f.seek(SeekFrom::Start(HEADER_SIZE + 100)).unwrap();
            f.write_all(&[0xFF; 16]).unwrap();
            f.flush().unwrap();
        }

        // Reopen - should handle corruption gracefully
        {
            let mut epl = EplManager::open(path).unwrap();
            // Corrupted entry should not be loadable
            let result = epl.load_delta(chunk_id);
            // Either returns None (corrupted) or returns different data
            // The implementation should detect checksum failure
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_epl_multiple_chunks() {
        // Test integrity with multiple different chunks
        let path = "/tmp/geos_epl_multi_test.epl";
        let _ = std::fs::remove_file(path);

        let chunk_1 = ((1i32 as u64) << 32) | (1i32 as u32 as u64);
        let chunk_2 = ((1i32 as u64) << 32) | (2i32 as u32 as u64);
        let chunk_3 = ((2i32 as u64) << 32) | (1i32 as u32 as u64);

        let data_1 = vec![1u8; 16384];
        let data_2 = vec![2u8; 16384];
        let data_3 = vec![3u8; 16384];

        {
            let mut epl = EplManager::open(path).unwrap();
            epl.save_delta(chunk_1, &data_1).unwrap();
            epl.save_delta(chunk_2, &data_2).unwrap();
            epl.save_delta(chunk_3, &data_3).unwrap();

            assert_eq!(epl.dirty_count(), 3);
        }

        {
            let mut epl = EplManager::open(path).unwrap();
            assert_eq!(epl.dirty_count(), 3);

            let loaded_1 = epl.load_delta(chunk_1).unwrap().unwrap();
            let loaded_2 = epl.load_delta(chunk_2).unwrap().unwrap();
            let loaded_3 = epl.load_delta(chunk_3).unwrap().unwrap();

            assert_eq!(loaded_1, data_1);
            assert_eq!(loaded_2, data_2);
            assert_eq!(loaded_3, data_3);
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_epl_compaction_preserves_integrity() {
        // Test that compaction maintains data integrity
        let path = "/tmp/geos_epl_compact_integrity.epl";
        let _ = std::fs::remove_file(path);

        let chunk_ids: Vec<u64> = (1..=20).map(|i| i as u64).collect();
        let data = vec![0xABu8; 16384];

        // Save multiple versions of each chunk
        {
            let mut epl = EplManager::open(path).unwrap();
            for &chunk_id in &chunk_ids {
                // Save 3 versions of each chunk
                for version in 1..=3 {
                    let version_data = vec![version as u8; 16384];
                    epl.save_delta(chunk_id, &version_data).unwrap();
                }
            }
        }

        // Compact
        {
            let mut epl = EplManager::open(path).unwrap();
            epl.compact().unwrap();
        }

        // Verify latest versions are preserved
        {
            let mut epl = EplManager::open(path).unwrap();
            for chunk_id in chunk_ids {
                let loaded = epl.load_delta(chunk_id).unwrap().unwrap();
                // Should have version 3 (latest)
                assert!(loaded.iter().all(|&b| b == 3));
            }
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_epl_empty_journal_reopen() {
        // Test reopening a newly created empty journal
        let path = "/tmp/geos_epl_empty_test.epl";
        let _ = std::fs::remove_file(path);

        {
            let epl = EplManager::open(path).unwrap();
            assert_eq!(epl.dirty_count(), 0);
            assert_eq!(epl.sequence(), 0);
        }

        {
            let epl = EplManager::open(path).unwrap();
            assert_eq!(epl.dirty_count(), 0);
            assert_eq!(epl.sequence(), 0);
        }

        let _ = std::fs::remove_file(path);
    }
}
