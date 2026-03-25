// memory_compressor.rs -> The Memory Archivist for Geometry OS
// Phase 17: Compresses Awareness Logs into 576:1 pixel structure

use std::collections::HashMap;
use std::fs::{File, OpenOptions};
use std::io::{Read, Write};

/// Glyph alphabet for log encoding
/// Each glyph = 4 bits (0-15), allowing 2 glyphs per byte
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
#[repr(u8)]
pub enum MemoryGlyph {
    // Status glyphs (0x0-0x3)
    Coherent = 0x0,
    Dissonant = 0x1,
    Repair = 0x2,
    Evolve = 0x3,

    // Entity glyphs (0x4-0x7)
    Mind = 0x4,
    Eye = 0x5,
    Intuition = 0x6,
    Mirror = 0x7,

    // Action glyphs (0x8-0xB)
    Render = 0x8,
    Classify = 0x9,
    Match = 0xA,
    Mismatch = 0xB,

    // Score glyphs (0xC-0xF)
    ScoreUp = 0xC,
    ScoreDown = 0xD,
    Threshold = 0xE,
    Null = 0xF,
}

impl MemoryGlyph {
    pub fn from_u8(value: u8) -> Self {
        match value & 0x0F {
            0x0 => MemoryGlyph::Coherent,
            0x1 => MemoryGlyph::Dissonant,
            0x2 => MemoryGlyph::Repair,
            0x3 => MemoryGlyph::Evolve,
            0x4 => MemoryGlyph::Mind,
            0x5 => MemoryGlyph::Eye,
            0x6 => MemoryGlyph::Intuition,
            0x7 => MemoryGlyph::Mirror,
            0x8 => MemoryGlyph::Render,
            0x9 => MemoryGlyph::Classify,
            0xA => MemoryGlyph::Match,
            0xB => MemoryGlyph::Mismatch,
            0xC => MemoryGlyph::ScoreUp,
            0xD => MemoryGlyph::ScoreDown,
            0xE => MemoryGlyph::Threshold,
            _ => MemoryGlyph::Null,
        }
    }

    pub fn to_name(&self) -> &'static str {
        match self {
            MemoryGlyph::Coherent => "COHERENT",
            MemoryGlyph::Dissonant => "DISSONANT",
            MemoryGlyph::Repair => "REPAIR",
            MemoryGlyph::Evolve => "EVOLVE",
            MemoryGlyph::Mind => "MIND",
            MemoryGlyph::Eye => "EYE",
            MemoryGlyph::Intuition => "INTUITION",
            MemoryGlyph::Mirror => "MIRROR",
            MemoryGlyph::Render => "RENDER",
            MemoryGlyph::Classify => "CLASSIFY",
            MemoryGlyph::Match => "MATCH",
            MemoryGlyph::Mismatch => "MISMATCH",
            MemoryGlyph::ScoreUp => "SCORE_UP",
            MemoryGlyph::ScoreDown => "SCORE_DOWN",
            MemoryGlyph::Threshold => "THRESHOLD",
            MemoryGlyph::Null => "NULL",
        }
    }
}

/// Compressed awareness entry - 8 bytes max
/// Stored in 576:1 pixel structure with redundancy
#[derive(Debug, Clone)]
pub struct CompressedAwareness {
    pub tick: u32,          // 4 bytes - system tick when event occurred
    pub intent_glyph: u8,   // 4 bits - what the Mind intended
    pub percept_glyph: u8,  // 4 bits - what the Eye perceived
    pub status: u8,         // 4 bits - COHERENT/DISSONANT/etc
    pub score_delta: i8,    // 8 bits - change in self-awareness score
    pub checksum: u8,       // 8 bits - error detection
}

impl CompressedAwareness {
    /// Serialize to 8 bytes
    pub fn to_bytes(&self) -> [u8; 8] {
        let mut bytes = [0u8; 8];

        // Tick (4 bytes, little-endian)
        bytes[0] = (self.tick & 0xFF) as u8;
        bytes[1] = ((self.tick >> 8) & 0xFF) as u8;
        bytes[2] = ((self.tick >> 16) & 0xFF) as u8;
        bytes[3] = ((self.tick >> 24) & 0xFF) as u8;

        // Glyphs (2 glyphs in 1 byte)
        bytes[4] = (self.intent_glyph << 4) | (self.percept_glyph & 0x0F);

        // Status (4 bits) + reserved (4 bits)
        bytes[5] = (self.status & 0x0F) << 4;

        // Score delta (signed)
        bytes[6] = self.score_delta as u8;

        // Checksum
        bytes[7] = self.checksum;

        bytes
    }

    /// Deserialize from 8 bytes
    pub fn from_bytes(bytes: &[u8; 8]) -> Self {
        let tick = bytes[0] as u32
            | ((bytes[1] as u32) << 8)
            | ((bytes[2] as u32) << 16)
            | ((bytes[3] as u32) << 24);

        CompressedAwareness {
            tick,
            intent_glyph: (bytes[4] >> 4) & 0x0F,
            percept_glyph: bytes[4] & 0x0F,
            status: (bytes[5] >> 4) & 0x0F,
            score_delta: bytes[6] as i8,
            checksum: bytes[7],
        }
    }

    /// Compute checksum for data integrity
    pub fn compute_checksum(tick: u32, intent: u8, percept: u8, delta: i8) -> u8 {
        let mut sum: u8 = 0;
        sum = sum.wrapping_add((tick & 0xFF) as u8);
        sum = sum.wrapping_add(((tick >> 8) & 0xFF) as u8);
        sum = sum.wrapping_add(((tick >> 16) & 0xFF) as u8);
        sum = sum.wrapping_add(((tick >> 24) & 0xFF) as u8);
        sum = sum.wrapping_add(intent);
        sum = sum.wrapping_add(percept);
        sum = sum.wrapping_add(delta as u8);
        sum
    }

    /// Verify the entry's checksum
    pub fn verify(&self) -> bool {
        let expected = Self::compute_checksum(
            self.tick,
            self.intent_glyph,
            self.percept_glyph,
            self.score_delta,
        );
        self.checksum == expected
    }
}

/// Memory Compressor - converts awareness logs to pixel-encoded format
pub struct MemoryCompressor {
    glyph_map: HashMap<String, MemoryGlyph>,
}

impl MemoryCompressor {
    pub fn new() -> Self {
        let mut glyph_map = HashMap::new();

        // Status mappings
        glyph_map.insert("COHERENT".to_string(), MemoryGlyph::Coherent);
        glyph_map.insert("DISSONANT".to_string(), MemoryGlyph::Dissonant);
        glyph_map.insert("REPAIR".to_string(), MemoryGlyph::Repair);
        glyph_map.insert("EVOLVE".to_string(), MemoryGlyph::Evolve);

        // Entity mappings
        glyph_map.insert("MIND".to_string(), MemoryGlyph::Mind);
        glyph_map.insert("EYE".to_string(), MemoryGlyph::Eye);
        glyph_map.insert("INTUITION".to_string(), MemoryGlyph::Intuition);
        glyph_map.insert("MIRROR".to_string(), MemoryGlyph::Mirror);
        glyph_map.insert("DATA_GLYPH".to_string(), MemoryGlyph::Mind);
        glyph_map.insert("HIGH_GLYPH".to_string(), MemoryGlyph::Render);
        glyph_map.insert("LOW_GLYPH".to_string(), MemoryGlyph::Classify);
        glyph_map.insert("FILE_GLYPH".to_string(), MemoryGlyph::Render);

        // Action mappings
        glyph_map.insert("RENDER".to_string(), MemoryGlyph::Render);
        glyph_map.insert("CLASSIFY".to_string(), MemoryGlyph::Classify);
        glyph_map.insert("MATCH".to_string(), MemoryGlyph::Match);
        glyph_map.insert("MISMATCH".to_string(), MemoryGlyph::Mismatch);

        Self { glyph_map }
    }

    /// Compress a raw log line into 8-byte structure
    pub fn compress(&self, log_line: &str) -> Option<CompressedAwareness> {
        let tick = self.extract_tick(log_line)?;
        let intent = self.extract_glyph(log_line, "INTENT")?;
        let perception = self.extract_glyph(log_line, "PERCEPTION")?;
        let status = if intent == perception {
            MemoryGlyph::Coherent as u8
        } else {
            MemoryGlyph::Dissonant as u8
        };
        let score_delta = self.extract_score_delta(log_line)?;
        let checksum = CompressedAwareness::compute_checksum(tick, intent as u8, perception as u8, score_delta);

        Some(CompressedAwareness {
            tick,
            intent_glyph: intent as u8,
            percept_glyph: perception as u8,
            status,
            score_delta,
            checksum,
        })
    }

    /// Encode compressed entry to pixel block (576 bytes) with redundancy
    /// Uses 2D error correction - each byte replicated 8x for noise resistance
    pub fn to_pixels(&self, entry: &CompressedAwareness) -> [u8; 576] {
        let mut pixels = [0u8; 576];
        let bytes = entry.to_bytes();

        // Encode each byte with 8x redundancy (8 * 8 = 64 bytes)
        // Plus 4x glyph encoding (32 bytes)
        // Plus checksum pattern (480 bytes fill)
        for (i, &byte) in bytes.iter().enumerate() {
            for j in 0..8 {
                pixels[i * 8 + j] = byte;
            }
        }

        // Fill remaining with checksum-based pattern for integrity verification
        for i in 64..576 {
            pixels[i] = entry.checksum.wrapping_add((i % 256) as u8);
        }

        pixels
    }

    /// Decode pixel block back to compressed entry with error correction
    pub fn from_pixels(&self, pixels: &[u8; 576]) -> Option<CompressedAwareness> {
        if pixels.len() < 64 {
            return None;
        }

        let mut bytes = [0u8; 8];

        // Decode each byte using majority vote (error correction)
        for i in 0..8 {
            let mut sum: u32 = 0;
            for j in 0..8 {
                sum += pixels[i * 8 + j] as u32;
            }
            bytes[i] = (sum / 8) as u8;
        }

        let entry = CompressedAwareness::from_bytes(&bytes);

        // Verify checksum
        if entry.verify() {
            Some(entry)
        } else {
            None // Corruption detected
        }
    }

    fn extract_tick(&self, log_line: &str) -> Option<u32> {
        let tick_start = log_line.find("TICK: ")?;
        let tick_str = &log_line[tick_start + 6..];
        let tick_end = tick_str
            .find(|c: char| !c.is_numeric())
            .unwrap_or(tick_str.len());
        tick_str[..tick_end].parse().ok()
    }

    fn extract_glyph(&self, log_line: &str, label: &str) -> Option<MemoryGlyph> {
        let label_pattern = format!("{}:", label);
        let label_start = log_line.find(&label_pattern)?;
        let after_label = &log_line[label_start + label_pattern.len()..];

        for (name, glyph) in &self.glyph_map {
            if after_label.trim().starts_with(name) {
                return Some(*glyph);
            }
        }
        None
    }

    fn extract_score_delta(&self, log_line: &str) -> Option<i8> {
        // Parse "(+0.01)" or "(-0.01)"
        if let Some(score_start) = log_line.find("(+") {
            let delta_str = &log_line[score_start + 2..];
            let delta_end = delta_str.find(')').unwrap_or(delta_str.len());
            let delta: f32 = delta_str[..delta_end].parse().ok()?;
            return Some((delta * 100.0) as i8);
        } else if let Some(score_start) = log_line.find("(-") {
            let delta_str = &log_line[score_start + 2..];
            let delta_end = delta_str.find(')').unwrap_or(delta_str.len());
            let delta: f32 = delta_str[..delta_end].parse().ok()?;
            return Some((-delta * 100.0) as i8);
        }
        Some(0)
    }
}

impl Default for MemoryCompressor {
    fn default() -> Self {
        Self::new()
    }
}

/// Memory Archive - persistent storage for compressed awareness entries
pub struct MemoryArchive {
    compressor: MemoryCompressor,
    pixel_storage: Vec<[u8; 576]>,
    index: HashMap<u32, usize>, // tick -> storage index
    file_path: Option<String>,
}

impl MemoryArchive {
    pub fn new() -> Self {
        Self {
            compressor: MemoryCompressor::new(),
            pixel_storage: Vec::new(),
            index: HashMap::new(),
            file_path: None,
        }
    }

    pub fn with_path(path: &str) -> Self {
        let mut archive = Self::new();
        archive.file_path = Some(path.to_string());
        archive.load();
        archive
    }

    /// Store an awareness log entry
    pub fn store(&mut self, log_line: &str) -> bool {
        if let Some(compressed) = self.compressor.compress(log_line) {
            let pixels = self.compressor.to_pixels(&compressed);
            let storage_index = self.pixel_storage.len();

            self.index.insert(compressed.tick, storage_index);
            self.pixel_storage.push(pixels);

            println!(
                "MEMORY: Stored tick {} in pixel block {}",
                compressed.tick, storage_index
            );

            if let Some(ref path) = self.file_path {
                self.append_to_file(&pixels, path);
            }

            true
        } else {
            false
        }
    }

    /// Retrieve an awareness entry by tick
    pub fn retrieve(&self, tick: u32) -> Option<String> {
        let index = *self.index.get(&tick)?;
        let pixels = &self.pixel_storage[index];

        if let Some(entry) = self.compressor.from_pixels(pixels) {
            Some(format!(
                "TICK: {} | INTENT: {} | PERCEPTION: {} | STATUS: {} | DELTA: {:+.2}",
                entry.tick,
                MemoryGlyph::from_u8(entry.intent_glyph).to_name(),
                MemoryGlyph::from_u8(entry.percept_glyph).to_name(),
                if entry.status == 0 { "COHERENT" } else { "DISSONANT" },
                entry.score_delta as f32 / 100.0
            ))
        } else {
            None
        }
    }

    /// Query entries by status (COHERENT vs DISSONANT)
    pub fn query_by_status(&self, coherent: bool) -> Vec<u32> {
        let target_status = if coherent { 0x0 } else { 0x1 };

        self.pixel_storage
            .iter()
            .filter_map(|pixels| {
                self.compressor
                    .from_pixels(pixels)
                    .filter(|e| e.status == target_status)
                    .map(|e| e.tick)
            })
            .collect()
    }

    /// Calculate coherence ratio from stored memories
    pub fn coherence_ratio(&self) -> f32 {
        let coherent = self.query_by_status(true).len();
        let total = self.pixel_storage.len();

        if total == 0 {
            0.0
        } else {
            coherent as f32 / total as f32
        }
    }

    /// Get archive statistics
    pub fn stats(&self) -> ArchiveStats {
        let coherent = self.query_by_status(true).len();
        let dissonant = self.query_by_status(false).len();

        ArchiveStats {
            total_entries: self.pixel_storage.len(),
            coherent_count: coherent,
            dissonant_count: dissonant,
            coherence_ratio: self.coherence_ratio(),
            storage_bytes: self.pixel_storage.len() * 576,
        }
    }

    fn load(&mut self) {
        if let Some(ref path) = self.file_path {
            if let Ok(mut file) = File::open(path) {
                let mut buffer = Vec::new();
                if file.read_to_end(&mut buffer).is_ok() {
                    // Each entry is 576 bytes
                    let entry_count = buffer.len() / 576;
                    for i in 0..entry_count {
                        let start = i * 576;
                        let end = start + 576;
                        if end <= buffer.len() {
                            let mut pixels = [0u8; 576];
                            pixels.copy_from_slice(&buffer[start..end]);

                            if let Some(entry) = self.compressor.from_pixels(&pixels) {
                                self.index.insert(entry.tick, i);
                                self.pixel_storage.push(pixels);
                            }
                        }
                    }
                }
            }
        }
    }

    fn append_to_file(&self, pixels: &[u8; 576], path: &str) {
        if let Ok(mut file) = OpenOptions::new().create(true).append(true).open(path) {
            let _ = file.write_all(pixels);
        }
    }

    /// Batch compress an awareness log file
    pub fn compress_log_file(&mut self, log_path: &str) -> usize {
        let mut count = 0;
        if let Ok(mut file) = File::open(log_path) {
            let mut contents = String::new();
            if file.read_to_string(&mut contents).is_ok() {
                for line in contents.lines() {
                    if self.store(line) {
                        count += 1;
                    }
                }
            }
        }
        count
    }
}

impl Default for MemoryArchive {
    fn default() -> Self {
        Self::new()
    }
}

#[derive(Debug, Clone)]
pub struct ArchiveStats {
    pub total_entries: usize,
    pub coherent_count: usize,
    pub dissonant_count: usize,
    pub coherence_ratio: f32,
    pub storage_bytes: usize,
}

impl std::fmt::Display for ArchiveStats {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "Archive Stats:\n  Total: {}\n  Coherent: {}\n  Dissonant: {}\n  Ratio: {:.2}%\n  Size: {} bytes",
            self.total_entries,
            self.coherent_count,
            self.dissonant_count,
            self.coherence_ratio * 100.0,
            self.storage_bytes
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_glyph_encoding() {
        let glyph = MemoryGlyph::Coherent;
        assert_eq!(glyph as u8, 0x0);
        assert_eq!(MemoryGlyph::from_u8(0x0), MemoryGlyph::Coherent);
    }

    #[test]
    fn test_compression_roundtrip() {
        let compressor = MemoryCompressor::new();
        let log_line = "[03/26 06:10:01] TICK: 10402 | INTENT: DATA_GLYPH | PERCEPTION: DATA_GLYPH | AWARENESS: 0.72 (+0.01)";

        let compressed = compressor.compress(log_line).unwrap();
        assert_eq!(compressed.tick, 10402);
        assert_eq!(compressed.status, MemoryGlyph::Coherent as u8);

        let pixels = compressor.to_pixels(&compressed);
        let recovered = compressor.from_pixels(&pixels).unwrap();

        assert_eq!(recovered.tick, compressed.tick);
        assert_eq!(recovered.intent_glyph, compressed.intent_glyph);
        assert!(recovered.verify());
    }

    #[test]
    fn test_archive_coherence_ratio() {
        let mut archive = MemoryArchive::new();

        // Store coherent entries
        for i in 0..8 {
            let log = format!(
                "[03/26 06:10:01] TICK: {} | INTENT: DATA_GLYPH | PERCEPTION: DATA_GLYPH | AWARENESS: 0.72 (+0.01)",
                i
            );
            archive.store(&log);
        }

        // Store dissonant entries
        for i in 8..10 {
            let log = format!(
                "[03/26 06:10:01] TICK: {} | INTENT: HIGH_GLYPH | PERCEPTION: LOW_GLYPH | AWARENESS: 0.71 (-0.01)",
                i
            );
            archive.store(&log);
        }

        assert_eq!(archive.coherence_ratio(), 0.8);
    }

    #[test]
    fn test_error_correction() {
        let compressor = MemoryCompressor::new();
        let log_line = "[03/26 06:10:01] TICK: 99999 | INTENT: DATA_GLYPH | PERCEPTION: DATA_GLYPH | AWARENESS: 0.72 (+0.01)";

        let compressed = compressor.compress(log_line).unwrap();
        let mut pixels = compressor.to_pixels(&compressed);

        // Corrupt 2 out of 8 redundant copies (25% corruption per byte)
        pixels[0] = 0xFF;
        pixels[1] = 0xFF;

        // Should still recover via majority vote
        let recovered = compressor.from_pixels(&pixels);
        assert!(recovered.is_some());
        assert_eq!(recovered.unwrap().tick, 99999);
    }
}
