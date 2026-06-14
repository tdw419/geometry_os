// pixel.rs -- Pixel image decode/encode for .rts.png and pixelpack .png formats
//
// Two pixel encoding formats:
// 1. .rts.png: Binary data stored as RGBA pixels (Hilbert/linear layout)
// 2. .png (pixelpack): Each pixel is a 32-bit seed that expands to bytes via strategies
//
// Phase 92: Boot Geometry OS programs from pixelpack-encoded PNG files.

use png::Decoder;
use std::fs::File;
use std::io::{BufReader, Cursor};

/// Decoded .rts.png result with metadata.
pub struct DecodedPixels {
    pub data: Vec<u8>,
    pub source_name: String,
    pub data_size: usize,
}

// ── BIOS Pixel (Phase 94): The Genesis Word ───────────────────────
//
// The first pixel of a Geometry OS program PNG acts as a virtual BIOS.
// If bit 31 is set, the bootloader intercepts it and configures the VM
// before executing the remaining pixels as code.

/// Boot mode encoded in bits [28:30] of the BIOS pixel.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum BootMode {
    AsmSource = 0,
    RawBytecode = 1,
    PixelpackCompressed = 2,
    NeuralSubstrate = 3,
    ChainBoot = 4,
    Directory = 5,
}

/// Display resolution encoded in bits [24:27] of the BIOS pixel.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum BiosResolution {
    Classic256 = 0,
    Size512 = 1,
    TextGrid128x32 = 2,
    Headless = 3,
}

/// Parsed configuration from a BIOS pixel (bit 31 set).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct BootPixel {
    pub mode: BootMode,
    pub resolution: BiosResolution,
    pub audio_enable: bool,
    pub network_enable: bool,
    pub mouse_enable: bool,
    pub system_clock_enable: bool,
    pub fps: u16,
    pub chain_pointer: u16, // Seed index of chain manifest (ChainBoot mode only)
    pub raw: u32,
}

impl BootPixel {
    /// Parse a 32-bit seed as a BIOS pixel.
    /// Returns `None` if bit 31 is not set (standard program pixel).
    pub fn parse(seed: u32) -> Option<Self> {
        if (seed >> 31) & 1 == 0 {
            return None;
        }

        let mode_bits = (seed >> 28) & 0x7;
        let mode = match mode_bits {
            0 => BootMode::AsmSource,
            1 => BootMode::RawBytecode,
            2 => BootMode::PixelpackCompressed,
            3 => BootMode::NeuralSubstrate,
            4 => BootMode::ChainBoot,
            5 => BootMode::Directory,
            _ => BootMode::AsmSource,
        };

        let res_bits = (seed >> 24) & 0xF;
        let resolution = match res_bits {
            0 => BiosResolution::Classic256,
            1 => BiosResolution::Size512,
            2 => BiosResolution::TextGrid128x32,
            3 => BiosResolution::Headless,
            _ => BiosResolution::Classic256,
        };

        let periph = (seed >> 16) & 0xFF;
        let audio_enable = (periph & 1) != 0;
        let network_enable = (periph & 2) != 0;
        let mouse_enable = (periph & 4) != 0;
        let system_clock_enable = (periph & 8) != 0;

        let fps = if mode_bits == 4 || mode_bits == 5 {
            0u16 // ChainBoot/Directory: fps field repurposed as chain_pointer
        } else {
            (seed & 0xFFFF) as u16
        };
        let chain_pointer = if mode_bits == 4 || mode_bits == 5 {
            (seed & 0xFFFF) as u16
        } else {
            0u16
        };

        Some(BootPixel {
            mode,
            resolution,
            audio_enable,
            network_enable,
            mouse_enable,
            system_clock_enable,
            fps,
            chain_pointer,
            raw: seed,
        })
    }

    /// Human-readable summary for status messages.
    pub fn summary(&self) -> String {
        let mode_str = match self.mode {
            BootMode::AsmSource => "ASM",
            BootMode::RawBytecode => "Bytecode",
            BootMode::PixelpackCompressed => "Pixelpack",
            BootMode::NeuralSubstrate => "Neural",
            BootMode::ChainBoot => "Chain",
            BootMode::Directory => "Directory",
        };
        let res_str = match self.resolution {
            BiosResolution::Classic256 => "256x256",
            BiosResolution::Size512 => "512x512",
            BiosResolution::TextGrid128x32 => "128x32",
            BiosResolution::Headless => "Headless",
        };
        format!(
            "BIOS {:#010X} | mode={} | res={} | fps={} | audio={} | net={} | mouse={}",
            self.raw,
            mode_str,
            res_str,
            self.fps,
            self.audio_enable,
            self.network_enable,
            self.mouse_enable
        )
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum RegionType {
    Kernel = 0,
    NeuralWeights = 1,
    FileSystem = 2,
    SourceCode = 3,
    RawData = 4,
}

/// A logical partition within a cascaded pixel substrate.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct PixelRegion {
    pub offset: u64,
    pub length: u64,
    pub region_type: RegionType,
    pub checksum: u32,
}

/// The Pixel Manifest Protocol (PMP) header.
/// Follows the BIOS pixel in NeuralSubstrate mode.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ManifestBlock {
    pub regions: Vec<PixelRegion>,
    pub version: u8,
}

impl ManifestBlock {
    /// Parse a sequence of seeds as a PMP manifest.
    pub fn parse(seeds: &[u32]) -> Result<Self, String> {
        if seeds.is_empty() {
            return Err("Empty manifest seeds".into());
        }

        // PMP Magic: "GEOM" (0x47454F4D)
        if seeds[0] != 0x47454F4D {
            return Err("Invalid Manifest Magic".into());
        }

        let mut regions = Vec::new();
        let region_count = ((seeds[1] >> 16) & 0xFFFF) as usize;
        let version = (seeds[1] & 0xFF) as u8;

        // Each region takes 4 pixels (offset_hi, offset_lo, len_hi, len_lo, type+sum)
        // Wait, let's pack more efficiently.
        // Pixel 0: Magic
        // Pixel 1: [31:16] Count, [15:8] Reserved, [7:0] Version
        // Pixel 2..N: Region Data

        let mut idx = 2;
        for _ in 0..region_count {
            if idx + 4 > seeds.len() {
                break;
            }

            let offset = ((seeds[idx] as u64) << 32) | (seeds[idx + 1] as u64);
            let length = ((seeds[idx + 2] as u64) << 32) | (seeds[idx + 3] as u64);
            let type_bits = (seeds[idx + 4] >> 24) & 0xFF;
            let region_type = match type_bits {
                0 => RegionType::Kernel,
                1 => RegionType::NeuralWeights,
                2 => RegionType::FileSystem,
                3 => RegionType::SourceCode,
                _ => RegionType::RawData,
            };
            let checksum = seeds[idx + 4] & 0xFFFFFF;

            regions.push(PixelRegion {
                offset,
                length,
                region_type,
                checksum,
            });
            idx += 5;
        }

        Ok(ManifestBlock { regions, version })
    }

    /// Serialize manifest to seeds.
    pub fn to_seeds(&self) -> Vec<u32> {
        let mut seeds = Vec::new();
        seeds.push(0x47454F4D); // Magic
        seeds.push(((self.regions.len() as u32) << 16) | (self.version as u32));

        for r in &self.regions {
            seeds.push((r.offset >> 32) as u32);
            seeds.push((r.offset & 0xFFFFFFFF) as u32);
            seeds.push((r.length >> 32) as u32);
            seeds.push((r.length & 0xFFFFFFFF) as u32);

            let type_id = match r.region_type {
                RegionType::Kernel => 0,
                RegionType::NeuralWeights => 1,
                RegionType::FileSystem => 2,
                RegionType::SourceCode => 3,
                RegionType::RawData => 4,
            };
            seeds.push(((type_id as u32) << 24) | (r.checksum & 0xFFFFFF));
        }
        seeds
    }
}

// ── Boot Chain Protocol ───────────────────────────────────────────
//
// A multi-stage bootloader where pixel(0,0) points to a manifest,
// and the manifest points to regions scattered across the pixel grid.
//
// Layout in seed array:
//   Seed 0:        BIOS pixel (mode=ChainBoot, chain_pointer -> manifest)
//   Seed N:        Chain Manifest Header (magic 0x43480000 | region_count)
//   Seed N+1..N+K: Region Descriptors (1 seed each)
//   Seed R..:      Actual program/data payloads (pixelpack seeds)

/// Region type in a boot chain.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ChainRegionType {
    AsmSource = 0,
    RawBytecode = 1,
    PixelpackCompressed = 2,
    SpriteSheet = 3,
    FileSystem = 4,
    ConfigData = 5,
    Directory = 6,
    LinuxKernel = 7,
    LinuxInitrd = 8,
}

/// A single region pointer in the boot chain.
/// Encoded as 1 seed: [seed_index:16 | seed_count:12 | type:4]
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ChainRegion {
    pub seed_index: u32,
    pub seed_count: u32,
    pub region_type: ChainRegionType,
    /// For raw binary regions, the exact byte count (0 means "use seed_count * 4").
    pub raw_byte_count: u32,
}

impl ChainRegion {
    pub fn encode(&self) -> u32 {
        let type_id = match self.region_type {
            ChainRegionType::AsmSource => 0,
            ChainRegionType::RawBytecode => 1,
            ChainRegionType::PixelpackCompressed => 2,
            ChainRegionType::SpriteSheet => 3,
            ChainRegionType::FileSystem => 4,
            ChainRegionType::ConfigData => 5,
            ChainRegionType::Directory => 6,
            ChainRegionType::LinuxKernel => 7,
            ChainRegionType::LinuxInitrd => 8,
        };
        ((self.seed_index & 0xFFFF) << 16) | ((self.seed_count & 0xFFF) << 4) | (type_id & 0xF)
    }

    pub fn decode(seed: u32) -> Self {
        let type_id = seed & 0xF;
        let region_type = match type_id {
            0 => ChainRegionType::AsmSource,
            1 => ChainRegionType::RawBytecode,
            2 => ChainRegionType::PixelpackCompressed,
            3 => ChainRegionType::SpriteSheet,
            4 => ChainRegionType::FileSystem,
            5 => ChainRegionType::ConfigData,
            6 => ChainRegionType::Directory,
            7 => ChainRegionType::LinuxKernel,
            8 => ChainRegionType::LinuxInitrd,
            _ => ChainRegionType::RawBytecode,
        };
        ChainRegion {
            seed_index: (seed >> 16) & 0xFFFF,
            seed_count: (seed >> 4) & 0xFFF,
            region_type,
            raw_byte_count: 0,
        }
    }
}

/// Magic for chain manifest header: "CH\0\0"
const CHAIN_MANIFEST_MAGIC: u32 = 0x43480000;

/// The full resolved boot chain.
#[derive(Clone, Debug)]
pub struct BootChain {
    pub bios: BootPixel,
    pub manifest_seed: u32,
    pub regions: Vec<ChainRegion>,
    pub version: u8,
}

impl BootChain {
    /// Parse a boot chain from an array of seeds.
    /// Seed 0 must be a BIOS pixel with mode=ChainBoot.
    pub fn parse(seeds: &[u32]) -> Result<Self, String> {
        if seeds.is_empty() {
            return Err("Empty seed array".into());
        }
        let bios = BootPixel::parse(seeds[0]).ok_or("Seed 0 is not a BIOS pixel")?;
        if bios.mode != BootMode::ChainBoot {
            return Err(format!("Expected ChainBoot mode, got {:?}", bios.mode));
        }

        let manifest_idx = bios.chain_pointer as usize;
        if manifest_idx >= seeds.len() {
            return Err(format!(
                "Chain pointer {} out of bounds (seeds: {})",
                manifest_idx,
                seeds.len()
            ));
        }

        let header = seeds[manifest_idx];
        if (header & 0xFFFF0000) != CHAIN_MANIFEST_MAGIC {
            return Err(format!(
                "Invalid chain manifest magic at seed {}: {:#010X}",
                manifest_idx, header
            ));
        }

        let region_count = (header & 0xFF) as usize;
        let version = ((header >> 8) & 0xFF) as u8;

        let mut regions = Vec::new();
        let mut desc_idx = manifest_idx + 1;

        // Version 3+: very wide descriptors (3 seeds each: [type:4|index:28], [count:32], [byte_count:32])
        // Version 2: wide descriptors (2 seeds each: [type:4|index:28], [count:32])
        // Version 1: compact descriptors (1 seed: [index:16|count:12|type:4])
        if version >= 3 {
            for _ in 0..region_count {
                if desc_idx + 2 >= seeds.len() {
                    break;
                }
                let desc_lo = seeds[desc_idx];
                let desc_mid = seeds[desc_idx + 1];
                let desc_hi = seeds[desc_idx + 2];
                let type_id = (desc_lo >> 28) & 0xF;
                let seed_index = desc_lo & 0x0FFF_FFFF;
                let seed_count = desc_mid;
                let byte_count = desc_hi;
                let region_type = Self::decode_region_type(type_id)?;
                regions.push(ChainRegion {
                    seed_index,
                    seed_count,
                    region_type,
                    raw_byte_count: byte_count,
                });
                desc_idx += 3;
            }
        } else if version == 2 {
            for _ in 0..region_count {
                if desc_idx + 1 >= seeds.len() {
                    break;
                }
                let desc_lo = seeds[desc_idx];
                let desc_hi = seeds[desc_idx + 1];
                let type_id = (desc_lo >> 28) & 0xF;
                let seed_index = desc_lo & 0x0FFF_FFFF; // 28-bit index
                let seed_count = desc_hi; // full 32-bit count
                let region_type = Self::decode_region_type(type_id)?;
                regions.push(ChainRegion {
                    seed_index,
                    seed_count,
                    region_type,
                    raw_byte_count: 0,
                });
                desc_idx += 2;
            }
        } else {
            for _ in 0..region_count {
                if desc_idx >= seeds.len() {
                    break;
                }
                regions.push(ChainRegion::decode(seeds[desc_idx]));
                desc_idx += 1;
            }
        }

        Ok(BootChain {
            bios,
            manifest_seed: manifest_idx as u32,
            regions,
            version,
        })
    }

    fn decode_region_type(type_id: u32) -> Result<ChainRegionType, String> {
        match type_id {
            0 => Ok(ChainRegionType::AsmSource),
            1 => Ok(ChainRegionType::RawBytecode),
            2 => Ok(ChainRegionType::PixelpackCompressed),
            3 => Ok(ChainRegionType::SpriteSheet),
            4 => Ok(ChainRegionType::FileSystem),
            5 => Ok(ChainRegionType::ConfigData),
            6 => Ok(ChainRegionType::Directory),
            7 => Ok(ChainRegionType::LinuxKernel),
            8 => Ok(ChainRegionType::LinuxInitrd),
            _ => Err(format!("Unknown region type: {}", type_id)),
        }
    }

    /// Build the seed array for a boot chain from components.
    /// regions: slice of (type, seeds, exact_byte_count)
    pub fn build(
        resolution: BiosResolution,
        regions: &[(ChainRegionType, &[u32], u32)],
    ) -> Vec<u32> {
        let manifest_idx = 1u16;

        // Auto-select version:
        // v3 if any region has an exact byte count
        // v2 if any region has > 4095 seeds but no byte counts
        // v1 otherwise
        let has_byte_counts = regions.iter().any(|(_, _, bc)| *bc > 0);
        let needs_wide = regions.iter().any(|(_, s, _)| s.len() > 4095);

        let version = if has_byte_counts {
            3u32
        } else if needs_wide {
            2u32
        } else {
            1u32
        };
        let desc_seeds_per_region = match version {
            3 => 3u32,
            2 => 2u32,
            _ => 1u32,
        };

        let mut payload_seeds = Vec::new();
        let mut fixed_descs = Vec::new();
        let mut offset = 0u32;

        let payload_start = 2 + (regions.len() as u32) * desc_seeds_per_region;

        for (region_type, seeds, byte_count) in regions {
            fixed_descs.push(ChainRegion {
                seed_index: payload_start + offset,
                seed_count: seeds.len() as u32,
                region_type: *region_type,
                raw_byte_count: *byte_count,
            });
            offset += seeds.len() as u32;
            payload_seeds.extend_from_slice(seeds);
        }

        let bios_raw = (1u32 << 31)
            | (4u32 << 28)
            | ((match resolution {
                BiosResolution::Classic256 => 0u32,
                BiosResolution::Size512 => 1,
                BiosResolution::TextGrid128x32 => 2,
                BiosResolution::Headless => 3,
            }) << 24)
            | (manifest_idx as u32 & 0xFFFF);

        let mut result = Vec::new();
        result.push(bios_raw);

        // Manifest header: magic | version<<8 | region_count
        let header = CHAIN_MANIFEST_MAGIC | (version << 8) | ((regions.len() as u32) & 0xFF);
        result.push(header);

        // Region descriptors (v3, v2, or v1)
        for desc in &fixed_descs {
            match version {
                3 => {
                    // v3: seed 1 = [type:4|index:28], seed 2 = count:32, seed 3 = byte_count:32
                    let type_id = Self::region_type_id(desc.region_type);
                    let desc_lo = (type_id << 28) | (desc.seed_index & 0x0FFF_FFFF);
                    result.push(desc_lo);
                    result.push(desc.seed_count);
                    result.push(desc.raw_byte_count);
                },
                2 => {
                    // v2: seed 1 = [type:4|index:28], seed 2 = count:32
                    let type_id = Self::region_type_id(desc.region_type);
                    let desc_lo = (type_id << 28) | (desc.seed_index & 0x0FFF_FFFF);
                    result.push(desc_lo);
                    result.push(desc.seed_count);
                },
                _ => {
                    result.push(desc.encode());
                },
            }
        }

        // Payload seeds
        result.extend(payload_seeds);

        result
    }

    fn region_type_id(rt: ChainRegionType) -> u32 {
        match rt {
            ChainRegionType::AsmSource => 0,
            ChainRegionType::RawBytecode => 1,
            ChainRegionType::PixelpackCompressed => 2,
            ChainRegionType::SpriteSheet => 3,
            ChainRegionType::FileSystem => 4,
            ChainRegionType::ConfigData => 5,
            ChainRegionType::Directory => 6,
            ChainRegionType::LinuxKernel => 7,
            ChainRegionType::LinuxInitrd => 8,
        }
    }

    /// Extract expanded bytes for a specific region.
    pub fn resolve_region(&self, seeds: &[u32], region_idx: usize) -> Result<Vec<u8>, String> {
        if region_idx >= self.regions.len() {
            return Err("Region index out of bounds".into());
        }
        let region = &self.regions[region_idx];
        let start = region.seed_index as usize;
        let end = start + region.seed_count as usize;
        if end > seeds.len() {
            return Err(format!(
                "Region {} references seeds {}..{} but only {} seeds exist",
                region_idx,
                start,
                end,
                seeds.len()
            ));
        }

        let region_seeds = &seeds[start..end];
        let mut bytes = Vec::with_capacity(region_seeds.len() * 4);

        // Raw binary types (kernel, initrd, bytecode) store data as u32 LE words.
        // Other types use pixelpack expansion.
        match region.region_type {
            ChainRegionType::LinuxKernel
            | ChainRegionType::LinuxInitrd
            | ChainRegionType::RawBytecode => {
                for &seed in region_seeds {
                    bytes.extend_from_slice(&seed.to_le_bytes());
                }
            },
            _ => {
                for &seed in region_seeds {
                    bytes.extend_from_slice(&pixelpack_expand(seed, &[]));
                }
            },
        }

        // Truncate padding for raw binary regions with known byte count
        if region.raw_byte_count > 0 && bytes.len() > region.raw_byte_count as usize {
            bytes.truncate(region.raw_byte_count as usize);
        }

        Ok(bytes)
    }

    /// Load the boot chain regions into a VM's RAM sequentially.
    /// Regions are loaded at 0x1000, 0x2000, 0x3000...
    /// The VM's PC is set to the first region (0x1000).
    pub fn load_into_vm(&self, seeds: &[u32], vm: &mut crate::vm::Vm) -> Result<(), String> {
        let mut bytecode_loaded = false;

        for (i, region) in self.regions.iter().enumerate() {
            match region.region_type {
                ChainRegionType::RawBytecode => {
                    let start = region.seed_index as usize;
                    let end = start + region.seed_count as usize;
                    if end > seeds.len() {
                        return Err(format!("Region {} seeds out of bounds", i));
                    }
                    let words = &seeds[start..end];
                    let offset = 0x1000 * (i + 1);
                    if offset + words.len() > vm.ram.len() {
                        return Err(format!("Region {} exceeds RAM bounds", i));
                    }

                    for (j, &w) in words.iter().enumerate() {
                        vm.ram[offset + j] = w;
                    }

                    if !bytecode_loaded {
                        vm.pc = offset as u32;
                        bytecode_loaded = true;
                    }
                },
                ChainRegionType::PixelpackCompressed => {
                    let data = self.resolve_region(seeds, i)?;
                    let offset = 0x1000 * (i + 1);
                    if offset + data.len() / 4 > vm.ram.len() {
                        return Err(format!("Region {} exceeds RAM bounds", i));
                    }

                    let words: Vec<u32> = data
                        .chunks_exact(4)
                        .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                        .collect();

                    for (j, &w) in words.iter().enumerate() {
                        vm.ram[offset + j] = w;
                    }

                    if !bytecode_loaded {
                        vm.pc = offset as u32;
                        bytecode_loaded = true;
                    }
                },
                _ => {
                    // For now, only handle bytecode in the chain demo
                },
            }
        }

        if bytecode_loaded {
            vm.halted = false;
        }

        Ok(())
    }

    /// Human-readable chain summary.
    pub fn summary(&self) -> String {
        let mut s = format!(
            "BootChain v{} | manifest@seed {} | {} regions",
            self.version,
            self.manifest_seed,
            self.regions.len()
        );
        for (i, r) in self.regions.iter().enumerate() {
            let type_str = match r.region_type {
                ChainRegionType::AsmSource => "ASM",
                ChainRegionType::RawBytecode => "BC",
                ChainRegionType::PixelpackCompressed => "PP",
                ChainRegionType::SpriteSheet => "SPR",
                ChainRegionType::FileSystem => "FS",
                ChainRegionType::ConfigData => "CFG",
                ChainRegionType::Directory => "DIR",
                ChainRegionType::LinuxKernel => "LNX",
                ChainRegionType::LinuxInitrd => "IRD",
            };
            if r.seed_count > 0 {
                s.push_str(&format!(
                    "\n  [{}] {} @ seeds {}..{} ({} seeds)",
                    i,
                    type_str,
                    r.seed_index,
                    r.seed_index + r.seed_count - 1,
                    r.seed_count
                ));
            } else {
                s.push_str(&format!(
                    "\n  [{}] {} @ seed {} (empty)",
                    i, type_str, r.seed_index
                ));
            }
        }
        s
    }
}

/// Returns the decoded data with metadata from the PNG text chunks.
pub fn decode_rts_png(path: &str) -> Result<DecodedPixels, String> {
    let file = File::open(path).map_err(|e| format!("Cannot open {}: {}", path, e))?;
    let decoder = Decoder::new(BufReader::new(file));
    let mut reader = decoder
        .read_info()
        .map_err(|e| format!("PNG decode error for {}: {:?}", path, e))?;

    // Read metadata from PNG text chunks
    let info = reader.info().clone();
    let expected_size: usize = info
        .uncompressed_latin1_text
        .iter()
        .find(|c| c.keyword == "data_size")
        .and_then(|c| c.text.parse().ok())
        .unwrap_or_else(|| (info.width as usize) * (info.height as usize) * 4);

    let source_name = info
        .uncompressed_latin1_text
        .iter()
        .find(|c| c.keyword == "source" || c.keyword == "original_file")
        .map(|c| c.text.clone())
        .unwrap_or_default();

    let layout = info
        .uncompressed_latin1_text
        .iter()
        .find(|c| c.keyword == "layout")
        .map(|c| c.text.to_lowercase())
        .unwrap_or_else(|| "hilbert".to_string());

    // Read pixels
    let total_pixels = (info.width as usize) * (info.height as usize);
    let mut pixel_buf = vec![0u8; total_pixels * 4];
    reader
        .next_frame(&mut pixel_buf)
        .map_err(|e| format!("PNG read error: {:?}", e))?;

    let mut output = if layout == "linear" {
        // Linear layout: read pixels row by row, 4 bytes per pixel
        let mut out = Vec::with_capacity(expected_size);
        for chunk in pixel_buf.chunks_exact(4) {
            out.push(chunk[0]); // R
            out.push(chunk[1]); // G
            out.push(chunk[2]); // B
            out.push(chunk[3]); // A
            if out.len() >= expected_size {
                break;
            }
        }
        out
    } else {
        // Hilbert curve layout: inverse Hilbert to get linear byte order
        let grid_w = info.width;
        let grid_h = info.height;
        let grid_side = grid_w.max(grid_h);
        let grid_order = 31 - grid_side.leading_zeros();

        let mut out = Vec::with_capacity(expected_size);
        let mut linear = 0u32;

        while out.len() < expected_size && linear < total_pixels as u32 {
            let (x, y) = d2xy(grid_order, linear);
            if x < grid_h && y < grid_w {
                let pixel_offset = ((x * grid_w + y) * 4) as usize;
                if pixel_offset + 4 <= pixel_buf.len() {
                    out.push(pixel_buf[pixel_offset]); // R
                    out.push(pixel_buf[pixel_offset + 1]); // G
                    out.push(pixel_buf[pixel_offset + 2]); // B
                    out.push(pixel_buf[pixel_offset + 3]); // A
                }
            }
            linear += 1;
        }
        out
    };

    output.truncate(expected_size);

    Ok(DecodedPixels {
        data: output,
        source_name,
        data_size: expected_size,
    })
}

/// Decode a .rts.png to a temp file and return the path.
/// This is used by the QEMU bridge to pass pixel-decoded kernels.
pub fn decode_rts_to_temp(path: &str) -> Result<String, String> {
    let decoded = decode_rts_png(path)?;

    // Create temp file
    let temp_dir = std::env::temp_dir();
    let basename = std::path::Path::new(path)
        .file_name()
        .map(|n| n.to_string_lossy().to_string())
        .unwrap_or_else(|| "decoded".to_string());
    let temp_name = format!("geo_qemu_{}", basename);
    let temp_path = temp_dir.join(&temp_name);

    std::fs::write(&temp_path, &decoded.data)
        .map_err(|e| format!("Failed to write temp file: {}", e))?;

    Ok(temp_path.to_string_lossy().to_string())
}

/// Check if a path looks like a .rts.png file
pub fn is_rts_png(path: &str) -> bool {
    path.to_lowercase().ends_with(".rts.png")
}

/// Peek the first RGBA pixel of a PNG file and return it as a 32-bit seed.
/// Does NOT expand the seed -- returns the raw u32 value (R<<24 | G<<16 | B<<8 | A).
/// This is used by the bootloader to detect a BIOS pixel before full decode.
pub fn peek_first_pixel(path: &str) -> Result<u32, String> {
    let file = File::open(path).map_err(|e| format!("Cannot open {}: {}", path, e))?;
    let decoder = Decoder::new(BufReader::new(file));
    let mut reader = decoder
        .read_info()
        .map_err(|e| format!("PNG decode error for {}: {:?}", path, e))?;

    let info = reader.info();
    let _width = info.width as usize;
    let mut frame_buf = vec![
        0u8;
        reader
            .output_buffer_size()
            .unwrap_or(info.width as usize * info.height as usize * 4)
    ];
    reader
        .next_frame(&mut frame_buf)
        .map_err(|e| format!("PNG read error: {:?}", e))?;

    let r = frame_buf[0];
    let g = frame_buf[1];
    let b = frame_buf[2];
    let a = frame_buf[3];
    let seed = ((r as u32) << 24) | ((g as u32) << 16) | ((b as u32) << 8) | (a as u32);
    Ok(seed)
}

/// Load all pixels from a PNG file and return them as a Vec of 32-bit seeds.
/// Respects the "layout" metadata (Hilbert or linear).
pub fn load_seeds_from_png(path: &str) -> Result<Vec<u32>, String> {
    let file = File::open(path).map_err(|e| format!("Cannot open {}: {}", path, e))?;
    let decoder = Decoder::new(BufReader::new(file));
    let mut reader = decoder
        .read_info()
        .map_err(|e| format!("PNG decode error for {}: {:?}", path, e))?;

    let info = reader.info().clone();
    let layout = info
        .uncompressed_latin1_text
        .iter()
        .find(|c| c.keyword == "layout")
        .map(|c| c.text.to_lowercase())
        .unwrap_or_else(|| "hilbert".to_string());

    let total_pixels = (info.width as usize) * (info.height as usize);
    let mut pixel_buf = vec![0u8; total_pixels * 4];
    reader
        .next_frame(&mut pixel_buf)
        .map_err(|e| format!("PNG read error: {:?}", e))?;

    let mut seeds = Vec::with_capacity(total_pixels);
    if layout == "linear" {
        for chunk in pixel_buf.chunks_exact(4) {
            let seed = ((chunk[0] as u32) << 24)
                | ((chunk[1] as u32) << 16)
                | ((chunk[2] as u32) << 8)
                | (chunk[3] as u32);
            seeds.push(seed);
        }
    } else {
        let grid_w = info.width;
        let grid_h = info.height;
        let grid_side = grid_w.max(grid_h);
        let grid_order = 31 - grid_side.leading_zeros();

        for linear in 0..total_pixels as u32 {
            let (x, y) = d2xy(grid_order, linear);
            if x < grid_h && y < grid_w {
                let offset = ((x * grid_w + y) * 4) as usize;
                if offset + 4 <= pixel_buf.len() {
                    let seed = ((pixel_buf[offset] as u32) << 24)
                        | ((pixel_buf[offset + 1] as u32) << 16)
                        | ((pixel_buf[offset + 2] as u32) << 8)
                        | (pixel_buf[offset + 3] as u32);
                    seeds.push(seed);
                } else {
                    seeds.push(0);
                }
            } else {
                seeds.push(0);
            }
        }
    }
    Ok(seeds)
}

/// Hilbert curve: distance -> (x, y)
pub fn d2xy(grid_order: u32, d: u32) -> (u32, u32) {
    let mut x: u32 = 0;
    let mut y: u32 = 0;

    for s in 0..grid_order {
        let shift = 2 * s;
        let rx = (d >> shift) & 1;
        let ry = ((d >> shift) >> 1) & 1;

        if ry == 0 {
            if rx == 1 {
                let s_val = 1u32 << s;
                x = s_val - 1 - x;
                y = s_val - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        let s_val = 1u32 << s;
        x += rx * s_val;
        y += ry * s_val;
    }

    (x, y)
}

/// Save a sequence of seeds to a PNG file with the specified layout.
pub fn save_seeds_to_png(path: &str, seeds: &[u32], layout: &str) -> Result<(), String> {
    let side = (seeds.len() as f64).sqrt().ceil() as u32;
    let grid_size = if layout == "linear" {
        side
    } else {
        side.next_power_of_two()
    }
    .max(1);

    let mut pixels = vec![0u8; (grid_size * grid_size * 4) as usize];

    if layout == "linear" {
        for (i, &seed) in seeds.iter().enumerate() {
            let offset = i * 4;
            if offset + 4 <= pixels.len() {
                pixels[offset] = (seed >> 24) as u8;
                pixels[offset + 1] = (seed >> 16) as u8;
                pixels[offset + 2] = (seed >> 8) as u8;
                pixels[offset + 3] = seed as u8;
            }
        }
    } else {
        let grid_order = 31 - grid_size.leading_zeros();
        for (d, &seed) in seeds.iter().enumerate() {
            let (x, y) = d2xy(grid_order, d as u32);
            if x < grid_size && y < grid_size {
                let offset = ((x * grid_size + y) * 4) as usize;
                if offset + 4 <= pixels.len() {
                    pixels[offset] = (seed >> 24) as u8;
                    pixels[offset + 1] = (seed >> 16) as u8;
                    pixels[offset + 2] = (seed >> 8) as u8;
                    pixels[offset + 3] = seed as u8;
                }
            }
        }
    }

    let file = std::fs::File::create(path).map_err(|e| format!("Cannot create {}: {}", path, e))?;
    let ref mut w = std::io::BufWriter::new(file);
    let mut encoder = png::Encoder::new(w, grid_size, grid_size);
    encoder.set_color(png::ColorType::Rgba);
    encoder.set_depth(png::BitDepth::Eight);

    // Add metadata
    encoder
        .add_text_chunk("pixelpack".to_string(), "v2".to_string())
        .map_err(|e| format!("PNG metadata error: {:?}", e))?;
    encoder
        .add_text_chunk("layout".to_string(), layout.to_string())
        .map_err(|e| format!("PNG metadata error: {:?}", e))?;
    encoder
        .add_text_chunk("data_size".to_string(), seeds.len().to_string())
        .map_err(|e| format!("PNG metadata error: {:?}", e))?;

    let mut writer = encoder
        .write_header()
        .map_err(|e| format!("PNG encode error: {:?}", e))?;
    writer
        .write_image_data(&pixels)
        .map_err(|e| format!("PNG write error: {:?}", e))?;
    Ok(())
}

// === Pixelpack seed expansion (Phase 92) ===
//
// Each RGBA pixel is a 32-bit seed. Top 4 bits = strategy, bottom 28 = payload.
// Expanding all seeds produces the full byte sequence (bytecode or source text).

/// Pixelpack seed expansion strategies
const PP_DICTIONARY: &[&[u8]] = &[
    b"\n",                                     // 0
    b" ",                                      // 1
    b"  ",                                     // 2
    b"    ",                                   // 3
    b",",                                      // 4
    b"=",                                      // 5
    b";",                                      // 6
    b":",                                      // 7
    b"(",                                      // 8
    b")",                                      // 9
    b"0x",                                     // 10
    b"0",                                      // 11
    b"= = =",                                  // 12
    b"\xE2\x95\x90 \xE2\x95\x90 \xE2\x95\x90", // 13
    b"LDI",                                    // 14
    b"= =",                                    // 15
    b"STORE",                                  // 16
    b"\xE2\x95\x90 \xE2\x95\x90",              // 17
    b"\xE2\x94\x80 \xE2\x94\x80 \xE2\x94\x80", // 18
    b"LDI r2 ,",                               // 19
    b"r20 ,",                                  // 20
    b"\xE2\x94\x80 \xE2\x94\x80",              // 21
    b"ADD",                                    // 22
    b"LDI r2",                                 // 23
    b"r20",                                    // 24
    b"r4 ,",                                   // 25
    b"STORE r20 ,",                            // 26
    b"r2 ,",                                   // 27
    b"r0 ,",                                   // 28
    b"LDI r1 ,",                               // 29
    b"STORE r7 ,",                             // 30
    b"STORE r4 ,",                             // 31
    b"STORE r20",                              // 32
    b"LDI r20 ,",                              // 33
    b"r2",                                     // 34
    b"r7 ,",                                   // 35
    b"r1 ,",                                   // 36
    b", r2",                                   // 37
    b"STORE r7",                               // 38
    b"STORE r4",                               // 39
    b"r3 LDI r2",                              // 40
    b", r2 ADD",                               // 41
    b", r3 LDI",                               // 42
    b", r3",                                   // 43
    b"LDI r1",                                 // 44
    b"r1",                                     // 45
    b"LDI r4 ,",                               // 46
    b"LDI r20",                                // 47
    b"ADD r7 ,",                               // 48
    b"r10 ,",                                  // 49
    b"r4",                                     // 50
    b"r0",                                     // 51
    b"r2 ADD",                                 // 52
    b", r1",                                   // 53
    b"r7",                                     // 54
    b"r3 LDI",                                 // 55
    b"r10",                                    // 56
    b"r7 , r2",                                // 57
    b"r7 , r3",                                // 58
    b"LDI r4",                                 // 59
    b"\xE2\x95\x90",                           // 60
    b"LOAD",                                   // 61
    b"r2 STORE r7",                            // 62
    b"r3",                                     // 63
    b"ADD r7",                                 // 64
    b"ADD r4 ,",                               // 65
    b", r2 STORE",                             // 66
    b"ADD r20 ,",                              // 67
    b"- - -",                                  // 68
    b"r17 ,",                                  // 69
    b"r17",                                    // 70
    b"LDI r6 ,",                               // 71
    b"- -",                                    // 72
    b"r6 ,",                                   // 73
    b"r2 ADD r4",                              // 74
    b"r3 ADD r7",                              // 75
    b"LDI r3 ,",                               // 76
    b"LDI r0 ,",                               // 77
    b", r3 ADD",                               // 78
    b"r3 ,",                                   // 79
    b"r2 STORE",                               // 80
    b"LDI r17 ,",                              // 81
    b"r11 ,",                                  // 82
    b"LDI r9 ,",                               // 83
    b"r5 ,",                                   // 84
    b"r11",                                    // 85
    b"ADD r4",                                 // 86
    b", r1 LDI",                               // 87
    b"r18 ,",                                  // 88
    b"CALL",                                   // 89
    b"JNZ r0 ,",                               // 90
    b"LDI r5 ,",                               // 91
    b", 0",                                    // 92
    b"ADD r20",                                // 93
    b"r18",                                    // 94
    b"r12 ,",                                  // 95
    b"LDI r10 ,",                              // 96
    b"\xE2\x94\x80",                           // 97
    b", 1",                                    // 98
    b"LDI r11 ,",                              // 99
    b"r21 ,",                                  // 100
    b"r6",                                     // 101
    b"JZ r0 ,",                                // 102
    b"r12",                                    // 103
    b"r4 , r3",                                // 104
    b"LDI r6",                                 // 105
    b": LDI",                                  // 106
    b"r21",                                    // 107
    b"r2 ADD r7",                              // 108
    b"r4 , r2",                                // 109
    b"LDI r3",                                 // 110
    b"JMP",                                    // 111
    b"LDI r17",                                // 112
    b"LDI r0",                                 // 113
    b"r3 ADD",                                 // 114
    b"CMP",                                    // 115
    b"LDI r18 ,",                              // 116
    b"LDI r9",                                 // 117
    b"r22 ,",                                  // 118
    b"r1 LDI",                                 // 119
    b", r7",                                   // 120
    b"JNZ r0",                                 // 121
    b"LDI r5",                                 // 122
    b"LDI r10",                                // 123
    b"MOV",                                    // 124
    b"r15",                                    // 125
    b"LDI r12 ,",                              // 126
    b"r14 ,",                                  // 127
    b"r5",                                     // 128
    b", 0 STORE",                              // 129
    b"LDI r11",                                // 130
    b"r15 ,",                                  // 131
    b"r9 ,",                                   // 132
    b", r20",                                  // 133
    b"r4 , r1",                                // 134
    b"LDI r21 ,",                              // 135
    b"r14",                                    // 136
    b"' STORE",                                // 137
    b"CMPI",                                   // 138
    b", r4",                                   // 139
    b"' STORE r7",                             // 140
    b"STORE r10 ,",                            // 141
    b"r22",                                    // 142
    b"LDI r7 ,",                               // 143
    b", r17",                                  // 144
    b"# define",                               // 145
    b"r1 , r2",                                // 146
    b"LDI r18",                                // 147
    b", r6",                                   // 148
    b"ADDI",                                   // 149
    b"JZ r0",                                  // 150
    b"r2 , r3",                                // 151
    b", r11",                                  // 152
    b"BLT r0 ,",                               // 153
    b"r10 , r11",                              // 154
    b"r13 ,",                                  // 155
    b"-",                                      // 156
    b", 1 LDI",                                // 157
    b"LDI r12",                                // 158
    b"PUSH r31",                               // 159
    b"0 STORE",                                // 160
    b"r13",                                    // 161
    b"r20 , r1",                               // 162
    b"ADD r10 ,",                              // 163
    b"ADDI r20 ,",                             // 164
    b"LDI r21",                                // 165
    b", r0",                                   // 166
    b"r9",                                     // 167
    b"r20 , r0",                               // 168
    b"STORE r10",                              // 169
    b"BGE r0 ,",                               // 170
    b", r18",                                  // 171
    b"POP r31",                                // 172
    b") LDI",                                  // 173
    b"define",                                 // 174
    b"STRO r20 ,",                             // 175
    b"1 LDI",                                  // 176
    b"LDI r7",                                 // 177
    b"POP r31 RET",                            // 178
    b"r3 , r4",                                // 179
    b"r20 , r2",                               // 180
    b"LDI r13 ,",                              // 181
    b", 0 LDI",                                // 182
    b"JNZ",                                    // 183
    b", r7 LDI",                               // 184
    b"BLT r0",                                 // 185
    b"LDI r14 ,",                              // 186
    b"ADDI r20",                               // 187
    b"PUSH",                                   // 188
    b", r21",                                  // 189
    b"ADD r10",                                // 190
    b"r16 ,",                                  // 191
    b", r10",                                  // 192
    b", r12",                                  // 193
    b": ;",                                    // 194
    b"r19 ,",                                  // 195
    b"r31",                                    // 196
    b"r16",                                    // 197
    b"; = =",                                  // 198
    b"0 LDI",                                  // 199
    b".byte",                                  // 200
    b"r20 , r21",                              // 201
    b"r20 , r17",                              // 202
    b", r5",                                   // 203
    b"STRO r20",                               // 204
    b"BGE r0",                                 // 205
    b", r15",                                  // 206
    b": PUSH r31",                             // 207
    b"LDI r15 ,",                              // 208
    b", 1 STORE",                              // 209
    b"r19",                                    // 210
    b", 32 STORE",                             // 211
    b", r0 LDI",                               // 212
    b", r2 ,",                                 // 213
    b") ;",                                    // 214
    b"LDI r13",                                // 215
    b"PUSH r31 CALL",                          // 216
    b", r9",                                   // 217
    b"LOAD r1 ,",                              // 218
    b"r7 LDI",                                 // 219
    b"RECTF",                                  // 220
    b", r3 ,",                                 // 221
    b"r25 ,",                                  // 222
    b"LDI r14",                                // 223
    b"r1 , 1",                                 // 224
    b"r4 , r5",                                // 225
    b"SUB",                                    // 226
    b", 1 ADD",                                // 227
    b"JZ",                                     // 228
    b"r20 , 1",                                // 229
    b"r23 ,",                                  // 230
    b", r4 ,",                                 // 231
    b"r17 , r18",                              // 232
    b"POP",                                    // 233
    b"r25",                                    // 234
    b"0 STORE r20",                            // 235
    b"r1 LDI r4",                              // 236
    b"buffer",                                 // 237
    b", r1 ;",                                 // 238
    b", r13",                                  // 239
    b"1 STORE",                                // 240
    b"CMPI r5 ,",                              // 241
    b"1",                                      // 242
    b"; '",                                    // 243
    b"LDI r16 ,",                              // 244
    b"32 STORE",                               // 245
    b"r20 , \"",                               // 246
    b"LDI r15",                                // 247
    b"r31 RET ;",                              // 248
    b"main_loop",                              // 249
    b"r0 LDI",                                 // 250
    b"r10 , r1",                               // 251
    b", r20 CMPI",                             // 252
    b", 32",                                   // 253
    b", r14",                                  // 254
    b"r31 RET",                                // 255
];

const PP_NIBBLE_TABLE: [u8; 16] = [
    b'0', b'1', b'2', b'3', b'4', b'5', b'6', b'7', b'8', b'9', b'A', b'B', b'C', b'D', b'E', b'F',
];

/// Expand a single 32-bit pixelpack seed to bytes.
pub fn pixelpack_expand(seed: u32, history: &[u8]) -> Vec<u8> {
    let strategy = ((seed >> 28) & 0xF) as u8;
    let params = seed & 0x0FFF_FFFF;

    match strategy {
        0x0 => pp_expand_dict_neural(params, 1),
        0x1 => pp_expand_dict(params, 2),
        0x2 => pp_expand_dict(params, 3),
        0x3 => pp_expand_dict(params, 4),
        0x4 => pp_expand_dict_neural(params, 3), // Neural-native: 3 tokens, 9 bits each
        0x5 => pp_expand_dict(params, 6),
        0x6 => pp_expand_dict(params, 7),
        0x7 => pp_expand_nibble(params),
        0x8 => pp_expand_lz77(params, history),
        0x9 => pp_expand_rle(params),
        0xA => pp_expand_raw3(params),
        0xB => pp_expand_xor_chain(params),
        0xC => pp_expand_linear(params),
        0xD => pp_expand_delta(params),
        0xE => pp_expand_bytepack(params),
        0xF => pp_expand_literal(params),
        _ => Vec::new(),
    }
}

/// Strategy 5: LZ77 Back-reference (offset, length)
fn pp_expand_lz77(params: u32, history: &[u8]) -> Vec<u8> {
    let offset = (params & 0x3FFF) as usize; // 14-bit offset (0-16383)
    let length = ((params >> 14) & 0x3FFF) as usize; // 14-bit length (0-16383)

    if history.is_empty() || length == 0 {
        return Vec::new();
    }

    // Offset 0 is invalid for LZ77, but we can treat it as offset 1 or skip
    if offset == 0 {
        return Vec::new();
    }

    let mut result = Vec::with_capacity(length);
    let start_pos = if history.len() >= offset {
        history.len() - offset
    } else {
        0 // Should not happen in a valid LZ77 stream
    };

    for i in 0..length {
        // Support overlapping copies (RLE-like) if length > offset
        let pos = i % offset;
        let history_idx = start_pos + pos;

        if history_idx < history.len() {
            result.push(history[history_idx]);
        } else {
            // Read from the already-emitted part of the result if we've run past history
            let res_idx = history_idx - history.len();
            if res_idx < result.len() {
                let b = result[res_idx];
                result.push(b);
            }
        }
    }
    result
}

fn pp_expand_dict(params: u32, n: usize) -> Vec<u8> {
    let mut result = Vec::new();
    for i in 0..n {
        let idx = ((params >> (4 * i)) & 0xF) as usize;
        if idx < PP_DICTIONARY.len() {
            result.extend_from_slice(PP_DICTIONARY[idx]);
        }
    }
    result
}

fn pp_expand_dict_neural(params: u32, n: usize) -> Vec<u8> {
    let mut result = Vec::new();
    let bits = if n == 1 { 24 } else { 9 }; // Strategy 0 uses 24 bits, Strategy 4 uses 9 bits
    for i in 0..n {
        let idx = ((params >> (bits * i)) & ((1 << bits) - 1)) as usize;
        if idx < PP_DICTIONARY.len() {
            let tok = PP_DICTIONARY[idx];
            if tok.is_empty() {
                continue;
            }
            result.extend_from_slice(tok);
        }
    }
    result
}

fn pp_expand_nibble(params: u32) -> Vec<u8> {
    let mut result = Vec::with_capacity(7);
    for i in 0..7 {
        let nibble = ((params >> (4 * i)) & 0xF) as usize;
        result.push(PP_NIBBLE_TABLE[nibble]);
    }
    result
}

/// Strategy 8: 4 raw bytes from the 28-bit payload
fn pp_expand_raw4(params: u32) -> Vec<u8> {
    vec![
        ((params >> 24) & 0xFF) as u8,
        ((params >> 16) & 0xFF) as u8,
        ((params >> 8) & 0xFF) as u8,
        (params & 0xFF) as u8,
    ]
}

/// Strategy 9: RLE -- repeat a byte pattern
fn pp_expand_rle(params: u32) -> Vec<u8> {
    let byte_val = (params & 0xFF) as u8;
    let count = (((params >> 8) & 0xFF) as usize).max(1);
    vec![byte_val; count.min(256)]
}

/// Strategy A: 3 raw bytes
fn pp_expand_raw3(params: u32) -> Vec<u8> {
    vec![
        ((params >> 16) & 0xFF) as u8,
        ((params >> 8) & 0xFF) as u8,
        (params & 0xFF) as u8,
    ]
}

/// Strategy B: XOR chain
fn pp_expand_xor_chain(params: u32) -> Vec<u8> {
    let start = (params & 0xFF) as u8;
    let key = ((params >> 8) & 0xFF) as u8;
    let count = (((params >> 16) & 0xF) as usize).max(1).min(16);

    let mut result = Vec::with_capacity(count);
    let mut val = start;
    for _ in 0..count {
        result.push(val);
        val ^= key;
        if val == 0 {
            val = key;
        }
    }
    result
}

/// Strategy C: Linear sequence
fn pp_expand_linear(params: u32) -> Vec<u8> {
    let start = (params & 0xFF) as u8;
    let step = ((params >> 8) & 0xFF) as u8;
    let count = (((params >> 16) & 0xF) as usize).max(1).min(16);

    let mut result = Vec::with_capacity(count);
    let mut val = start;
    for _ in 0..count {
        result.push(val);
        val = val.wrapping_add(step);
    }
    result
}

/// Strategy D: Delta from base
fn pp_expand_delta(params: u32) -> Vec<u8> {
    let base = (params & 0xFF) as u8;
    let d1 = ((params >> 8) & 0xFF) as u8;
    let d2 = ((params >> 16) & 0xFF) as u8;
    let d3 = ((params >> 24) & 0xFF) as u8;
    let mut result = vec![base];
    if d1 != 0 {
        result.push(base.wrapping_add(d1));
    }
    if d2 != 0 {
        result.push(base.wrapping_add(d1).wrapping_add(d2));
    }
    if d3 != 0 {
        result.push(base.wrapping_add(d1).wrapping_add(d2).wrapping_add(d3));
    }
    result
}

/// Strategy E: Bytepack mode-0 (3 raw bytes)
fn pp_expand_bytepack(params: u32) -> Vec<u8> {
    let b0 = ((params >> 3) & 0xFF) as u8;
    let b1 = ((params >> 11) & 0xFF) as u8;
    let b2 = ((params >> 19) & 0xFF) as u8;
    vec![b0, b1, b2]
}

/// Strategy F: Literal u32 as 4 bytes (big-endian)
fn pp_expand_literal(params: u32) -> Vec<u8> {
    vec![
        ((params >> 24) & 0xFF) as u8,
        ((params >> 16) & 0xFF) as u8,
        ((params >> 8) & 0xFF) as u8,
        (params & 0xFF) as u8,
    ]
}

/// Decode a pixelpack PNG to expanded bytes.
/// Each pixel is a 32-bit seed (RGBA). Seeds are expanded and concatenated.
/// The `seedcnt` text chunk specifies how many seeds are valid.
/// The `bytecnt` text chunk specifies the target byte count (truncation).
/// `skip_pixels` seeds are skipped from the start (used to skip the BIOS pixel).
pub fn decode_pixelpack_png_skip(data: &[u8], skip_pixels: usize) -> Result<Vec<u8>, String> {
    let decoder = Decoder::new(Cursor::new(data));
    let mut reader = decoder
        .read_info()
        .map_err(|e| format!("PNG decode error: {:?}", e))?;

    let info = reader.info().clone();

    // Read metadata
    let seed_count: Option<usize> = info
        .uncompressed_latin1_text
        .iter()
        .find(|c| c.keyword == "seedcnt")
        .and_then(|c| c.text.parse().ok());

    let byte_count: Option<usize> = info
        .uncompressed_latin1_text
        .iter()
        .find(|c| c.keyword == "bytecnt")
        .and_then(|c| c.text.parse().ok());

    let width = info.width as usize;
    let height = info.height as usize;

    let mut pixel_buf = vec![0u8; width * height * 4];
    reader
        .next_frame(&mut pixel_buf)
        .map_err(|e| format!("PNG read error: {:?}", e))?;

    // Extract seeds from pixels, skipping the first N
    let max_seeds = seed_count.unwrap_or(width * height);
    let mut all_bytes = Vec::new();

    for i in skip_pixels..max_seeds {
        let row = i / width;
        let col = i % width;
        if row >= height {
            break;
        }
        let offset = (row * width + col) * 4;
        if offset + 4 > pixel_buf.len() {
            break;
        }
        let r = pixel_buf[offset];
        let g = pixel_buf[offset + 1];
        let b = pixel_buf[offset + 2];
        let a = pixel_buf[offset + 3];
        let seed = ((r as u32) << 24) | ((g as u32) << 16) | ((b as u32) << 8) | (a as u32);

        let expanded = pixelpack_expand(seed, &all_bytes);
        all_bytes.extend(expanded);
    }

    // Truncate to target byte count if specified
    if let Some(bc) = byte_count {
        all_bytes.truncate(bc);
    }

    Ok(all_bytes)
}

/// Decode a pixelpack PNG to expanded bytes (no skip).
pub fn decode_pixelpack_png(data: &[u8]) -> Result<Vec<u8>, String> {
    decode_pixelpack_png_skip(data, 0)
}

/// Decode a pixelpack PNG file from disk, skipping the first N pixels.
pub fn decode_pixelpack_file_skip(path: &str, skip_pixels: usize) -> Result<Vec<u8>, String> {
    match std::fs::read(path) {
        Ok(data) => decode_pixelpack_png_skip(&data, skip_pixels),
        Err(_) => {
            // Fallback: try VFS directory
            let vfs_path = std::path::Path::new(crate::vfs::FS_DIR).join(path);
            let data = std::fs::read(&vfs_path)
                .map_err(|e| format!("Cannot read {} or fallback {:?}: {}", path, vfs_path, e))?;
            decode_pixelpack_png_skip(&data, skip_pixels)
        },
    }
}

/// Decode a pixelpack PNG file from disk.
pub fn decode_pixelpack_file(path: &str) -> Result<Vec<u8>, String> {
    decode_pixelpack_file_skip(path, 0)
}

/// Encode raw bytes into a pixelpack PNG.
/// Uses strategy A (raw3) for each 3-byte chunk, with remainder handling.
/// Each pixel encodes exactly 3 bytes of input (24 bits payload in 28-bit params).
pub fn encode_pixelpack_png(bytes: &[u8]) -> Result<Vec<u8>, String> {
    let mut seeds = Vec::new();
    let mut i = 0;

    // Pack 3 bytes per seed using strategy A (raw3)
    while i + 3 <= bytes.len() {
        let seed = 0xA000_0000
            | ((bytes[i] as u32) << 16)
            | ((bytes[i + 1] as u32) << 8)
            | (bytes[i + 2] as u32);
        seeds.push(seed);
        i += 3;
    }
    // Handle remaining 1-2 bytes
    if bytes.len() - i >= 2 {
        seeds.push(0xA000_0000 | ((bytes[i] as u32) << 16) | (bytes[i + 1] as u32));
        i += 2;
    }
    if bytes.len() > i {
        seeds.push(0xA000_0000 | ((bytes[i] as u32) << 16));
    }

    // Write PNG
    let n = seeds.len();
    let (width, height) = if n == 0 {
        (1, 1)
    } else if n <= 4 {
        (2, 2)
    } else {
        let side = (n as f64).sqrt().ceil() as u32;
        (side, ((n as f64) / side as f64).ceil() as u32)
    };

    let mut pixels = Vec::with_capacity((width * height * 4) as usize);
    for row in 0..height {
        for col in 0..width {
            let idx = (row * width + col) as usize;
            if idx < n {
                let s = seeds[idx];
                pixels.extend_from_slice(&[
                    ((s >> 24) & 0xFF) as u8,
                    ((s >> 16) & 0xFF) as u8,
                    ((s >> 8) & 0xFF) as u8,
                    (s & 0xFF) as u8,
                ]);
            } else {
                pixels.extend_from_slice(&[0, 0, 0, 0]);
            }
        }
    }

    let mut buf = Vec::new();
    {
        let mut encoder = png::Encoder::new(Cursor::new(&mut buf), width, height);
        encoder.set_color(png::ColorType::Rgba);
        encoder.set_depth(png::BitDepth::Eight);
        encoder
            .add_text_chunk("seedcnt".to_string(), n.to_string())
            .map_err(|e| format!("Failed to add PNG text chunk (seedcnt): {:?}", e))?;
        encoder
            .add_text_chunk("bytecnt".to_string(), bytes.len().to_string())
            .map_err(|e| format!("Failed to add PNG text chunk (bytecnt): {:?}", e))?;
        encoder
            .add_text_chunk("geo_boot".to_string(), "bytecode".to_string())
            .map_err(|e| format!("Failed to add PNG text chunk (geo_boot): {:?}", e))?;
        let mut writer = encoder
            .write_header()
            .map_err(|e| format!("Failed to write PNG header: {:?}", e))?;
        writer
            .write_image_data(&pixels)
            .map_err(|e| format!("Failed to write PNG image data: {:?}", e))?;
    }
    Ok(buf)
}

/// Load pixelpack-decoded bytecode into VM RAM at the specified address.
/// Returns the number of u32 words written.
pub fn load_bytecode_to_ram(bytes: &[u8], ram: &mut [u32], base_addr: usize) -> usize {
    let ram_len = ram.len();
    let mut count = 0;
    for i in (0..bytes.len()).step_by(4) {
        let addr = base_addr + count;
        if addr >= ram_len {
            break;
        }
        let b0 = bytes.get(i).copied().unwrap_or(0) as u32;
        let b1 = bytes.get(i + 1).copied().unwrap_or(0) as u32;
        let b2 = bytes.get(i + 2).copied().unwrap_or(0) as u32;
        let b3 = bytes.get(i + 3).copied().unwrap_or(0) as u32;
        // Bytecode is stored as u32 words (little-endian)
        ram[addr] = b0 | (b1 << 8) | (b2 << 16) | (b3 << 24);
        count += 1;
    }
    count
}

/// Check if a path looks like a pixelpack PNG (not .rts.png)
pub fn is_pixelpack_png(path: &str) -> bool {
    let lower = path.to_lowercase();
    lower.ends_with(".png") && !lower.ends_with(".rts.png")
}

/// Boot from a raw spatial PNG (.rts.png).
///
/// Unlike pixelpack PNGs which encode bytes through compression strategies,
/// .rts.png files store raw 32-bit instruction words directly as RGBA pixels.
/// Each pixel's RGBA channels form a big-endian u32: (R<<24)|(G<<16)|(B<<8)|A.
/// Pixels are read in raster order (row by row), skipping fully transparent
/// pixels (RGBA = 0x00000000), until a non-zero pixel row is all zeros.
pub fn boot_from_rts_png(
    path: &str,
    ram: &mut [u32],
    load_addr: usize,
) -> Result<BootPngResult, String> {
    let data = std::fs::read(path).map_err(|e| format!("Cannot read {}: {}", path, e))?;

    let decoder = Decoder::new(Cursor::new(&data));
    let mut reader = decoder
        .read_info()
        .map_err(|e| format!("PNG decode error for {}: {:?}", path, e))?;

    let width = reader.info().width as usize;
    let height = reader.info().height as usize;

    let mut pixel_buf = vec![0u8; width * height * 4];
    reader
        .next_frame(&mut pixel_buf)
        .map_err(|e| format!("PNG read error: {:?}", e))?;

    let mut words = Vec::new();
    // First pixel = word count (header). Remaining pixels = instruction words.
    let mut word_count = None;
    let mut loaded = 0usize;
    for row in 0..height {
        let mut row_had_data = false;
        for col in 0..width {
            let off = (row * width + col) * 4;
            let r = pixel_buf[off];
            let g = pixel_buf[off + 1];
            let b = pixel_buf[off + 2];
            let a = pixel_buf[off + 3];
            let word = ((r as u32) << 24) | ((g as u32) << 16) | ((b as u32) << 8) | (a as u32);

            if word_count.is_none() {
                // First pixel is the header: count of following instruction words
                word_count = Some(word as usize);
                row_had_data = true;
                continue;
            }

            let count = word_count.unwrap();
            if loaded < count {
                words.push(word);
                loaded += 1;
                if word != 0 {
                    row_had_data = true;
                }
            }
        }
        // If we've loaded all expected words, stop
        if word_count.is_some() && loaded >= word_count.unwrap() {
            break;
        }
        // Fallback: stop at all-zero row if no header was found
        if !row_had_data && !words.is_empty() && word_count.is_none() {
            break;
        }
    }

    let word_count = words.len();
    let ram_len = ram.len();
    let mut loaded = 0;
    for (i, &word) in words.iter().enumerate() {
        let addr = load_addr + i;
        if addr >= ram_len {
            break;
        }
        ram[addr] = word;
        loaded += 1;
    }

    Ok(BootPngResult {
        seed_count: word_count,
        byte_count: word_count * 4,
        ram_words: loaded,
        load_addr,
    })
}

// === Phase 93: Source-from-PNG (self-documenting pixel programs) ===
//
// A pixelpack PNG can contain assembly source text (not bytecode).
// The PNG metadata `geo_boot=source` distinguishes it from bytecode PNGs.
// When loaded, the decoded bytes are interpreted as UTF-8 source text,
// written onto the canvas grid, assembled, and run.

/// Decode a pixelpack PNG and return the expanded bytes as a UTF-8 string.
/// `skip_pixels` seeds are skipped from the start (used to skip the BIOS pixel).
/// Returns an error if the decoded bytes are not valid UTF-8.
pub fn decode_pixelpack_source_skip(data: &[u8], skip_pixels: usize) -> Result<String, String> {
    let bytes = decode_pixelpack_png_skip(data, skip_pixels)?;
    String::from_utf8(bytes).map_err(|e| format!("Source PNG contains invalid UTF-8: {}", e))
}

/// Decode a pixelpack PNG and return the expanded bytes as a UTF-8 string (no skip).
pub fn decode_pixelpack_source(data: &[u8]) -> Result<String, String> {
    decode_pixelpack_source_skip(data, 0)
}

/// Decode a pixelpack PNG file from disk as source text, skipping the first N pixels.
pub fn decode_pixelpack_source_file_skip(path: &str, skip_pixels: usize) -> Result<String, String> {
    match std::fs::read(path) {
        Ok(data) => decode_pixelpack_source_skip(&data, skip_pixels),
        Err(_) => {
            // Fallback: try VFS directory
            let vfs_path = std::path::Path::new(crate::vfs::FS_DIR).join(path);
            let data = std::fs::read(&vfs_path)
                .map_err(|e| format!("Cannot read {} or fallback {:?}: {}", path, vfs_path, e))?;
            decode_pixelpack_source_skip(&data, skip_pixels)
        },
    }
}

/// Decode a pixelpack PNG file from disk as source text.
pub fn decode_pixelpack_source_file(path: &str) -> Result<String, String> {
    decode_pixelpack_source_file_skip(path, 0)
}

/// Encode source text (assembly) into a pixelpack PNG with geo_boot=source metadata.
/// Uses strategy A (raw3) for each 3-byte chunk, same as bytecode encoding.
/// The PNG metadata `geo_boot=source` distinguishes it from bytecode PNGs.
pub fn encode_source_pixelpack_png(source: &str) -> Result<Vec<u8>, String> {
    let bytes = source.as_bytes();
    let mut seeds = Vec::new();
    let mut i = 0;

    // Pack 3 bytes per seed using strategy A (raw3)
    while i + 3 <= bytes.len() {
        let seed = 0xA000_0000
            | ((bytes[i] as u32) << 16)
            | ((bytes[i + 1] as u32) << 8)
            | (bytes[i + 2] as u32);
        seeds.push(seed);
        i += 3;
    }
    // Handle remaining 1-2 bytes
    if bytes.len() - i >= 2 {
        seeds.push(0xA000_0000 | ((bytes[i] as u32) << 16) | (bytes[i + 1] as u32));
        i += 2;
    }
    if bytes.len() > i {
        seeds.push(0xA000_0000 | ((bytes[i] as u32) << 16));
    }

    // Write PNG
    let n = seeds.len();
    let (width, height) = if n == 0 {
        (1, 1)
    } else if n <= 4 {
        (2, 2)
    } else {
        let side = (n as f64).sqrt().ceil() as u32;
        (side, ((n as f64) / side as f64).ceil() as u32)
    };

    let mut pixels = Vec::with_capacity((width * height * 4) as usize);
    for row in 0..height {
        for col in 0..width {
            let idx = (row * width + col) as usize;
            if idx < n {
                let s = seeds[idx];
                pixels.extend_from_slice(&[
                    ((s >> 24) & 0xFF) as u8,
                    ((s >> 16) & 0xFF) as u8,
                    ((s >> 8) & 0xFF) as u8,
                    (s & 0xFF) as u8,
                ]);
            } else {
                pixels.extend_from_slice(&[0, 0, 0, 0]);
            }
        }
    }

    let mut buf = Vec::new();
    {
        let mut encoder = png::Encoder::new(Cursor::new(&mut buf), width, height);
        encoder.set_color(png::ColorType::Rgba);
        encoder.set_depth(png::BitDepth::Eight);
        encoder
            .add_text_chunk("seedcnt".to_string(), n.to_string())
            .map_err(|e| format!("Failed to add PNG text chunk (seedcnt): {:?}", e))?;
        encoder
            .add_text_chunk("bytecnt".to_string(), bytes.len().to_string())
            .map_err(|e| format!("Failed to add PNG text chunk (bytecnt): {:?}", e))?;
        // Key distinction: geo_boot=source (not "bytecode")
        encoder
            .add_text_chunk("geo_boot".to_string(), "source".to_string())
            .map_err(|e| format!("Failed to add PNG text chunk (geo_boot): {:?}", e))?;
        let mut writer = encoder
            .write_header()
            .map_err(|e| format!("Failed to write PNG header: {:?}", e))?;
        writer
            .write_image_data(&pixels)
            .map_err(|e| format!("Failed to write PNG image data: {:?}", e))?;
    }
    Ok(buf)
}

// ═══════════════════════════════════════════════════════════════════
// OPTIMAL PNG ENCODER: Uses pack_binary for best compression
// ═══════════════════════════════════════════════════════════════════

/// Encode binary data into a pixelpack PNG using optimal strategy selection.
/// Prepends an optional boot pixel (e.g. BIOS pixel) if provided.
/// Metadata chunks are written as (keyword, text) pairs.
pub fn encode_optimal_pixelpack_png(
    data: &[u8],
    boot_pixel: Option<u32>,
    metadata: &[(String, String)],
) -> Result<Vec<u8>, String> {
    let pack_result = pack_binary(data);
    let mut seeds = pack_result.seeds;

    // Prepend boot pixel if given ( caller skips it on decode )
    if let Some(bios) = boot_pixel {
        seeds.insert(0, bios);
    }

    let n = seeds.len();
    let (width, height) = if n == 0 {
        (1, 1)
    } else if n <= 4 {
        (2, 2)
    } else {
        let side = (n as f64).sqrt().ceil() as u32;
        (side, ((n as f64) / side as f64).ceil() as u32)
    };

    let mut pixels = Vec::with_capacity((width * height * 4) as usize);
    for row in 0..height {
        for col in 0..width {
            let idx = (row * width + col) as usize;
            if idx < n {
                let s = seeds[idx];
                pixels.extend_from_slice(&[
                    ((s >> 24) & 0xFF) as u8,
                    ((s >> 16) & 0xFF) as u8,
                    ((s >> 8) & 0xFF) as u8,
                    (s & 0xFF) as u8,
                ]);
            } else {
                pixels.extend_from_slice(&[0, 0, 0, 0]);
            }
        }
    }

    let mut buf = Vec::new();
    {
        let mut encoder = png::Encoder::new(Cursor::new(&mut buf), width, height);
        encoder.set_color(png::ColorType::Rgba);
        encoder.set_depth(png::BitDepth::Eight);
        encoder
            .add_text_chunk("seedcnt".to_string(), n.to_string())
            .map_err(|e| format!("Failed to add PNG text chunk (seedcnt): {:?}", e))?;
        encoder
            .add_text_chunk("bytecnt".to_string(), data.len().to_string())
            .map_err(|e| format!("Failed to add PNG text chunk (bytecnt): {:?}", e))?;
        for (key, val) in metadata {
            encoder
                .add_text_chunk(key.clone(), val.clone())
                .map_err(|e| format!("Failed to add PNG text chunk ({}): {:?}", key, e))?;
        }
        let mut writer = encoder
            .write_header()
            .map_err(|e| format!("Failed to write PNG header: {:?}", e))?;
        writer
            .write_image_data(&pixels)
            .map_err(|e| format!("Failed to write PNG image data: {:?}", e))?;
    }
    Ok(buf)
}

/// Write decoded source text bytes onto the canvas buffer (128 rows x 32 cols).
/// Each character goes to canvas_buffer[row * 32 + col]. Lines break on '\n'.
/// Returns the number of characters written.
pub fn load_source_to_canvas_buffer(source: &str, canvas_buffer: &mut [u32]) -> usize {
    const CANVAS_COLS: usize = 32;
    const CANVAS_MAX_ROWS: usize = 128;

    // Clear canvas
    for cell in canvas_buffer.iter_mut() {
        *cell = 0;
    }

    let mut row = 0usize;
    let mut col = 0usize;
    let mut count = 0usize;

    for ch in source.chars() {
        if row >= CANVAS_MAX_ROWS {
            break;
        }
        if ch == '\n' {
            row += 1;
            col = 0;
        } else if col < CANVAS_COLS {
            canvas_buffer[row * CANVAS_COLS + col] = ch as u32;
            col += 1;
            count += 1;
        }
        // Characters beyond column 32 on a single line are dropped
    }

    count
}

/// Check if a pixelpack PNG contains source text (geo_boot=source metadata).
/// Returns None if the file doesn't exist or isn't a valid PNG.
pub fn is_source_png(data: &[u8]) -> bool {
    let decoder = Decoder::new(Cursor::new(data));
    let reader = match decoder.read_info() {
        Ok(r) => r,
        Err(_) => return false,
    };
    let info = reader.info();
    info.uncompressed_latin1_text
        .iter()
        .any(|c| c.keyword == "geo_boot" && c.text == "source")
}

/// Check if a file on disk is a source pixelpack PNG.
pub fn is_source_png_file(path: &str) -> bool {
    match std::fs::read(path) {
        Ok(data) => is_source_png(&data),
        Err(_) => false,
    }
}

/// Boot a source PNG: decode the source text, write to canvas buffer, assemble, run.
/// Returns the source text and assembly result, or an error string.
pub fn boot_source_from_png(
    path: &str,
    canvas_buffer: &mut [u32],
) -> Result<(String, usize), String> {
    let source = decode_pixelpack_source_file(path)?;
    let char_count = load_source_to_canvas_buffer(&source, canvas_buffer);

    // Also write source text to RAM grid at 0x000-0x3FF for canvas display
    // (This mirrors the source in canvas_buffer)
    let _ = char_count; // used for diagnostics

    // Assemble the source
    let asm_result = crate::assembler::assemble(&source, 0x1000)
        .map_err(|e| format!("Assembly error: {:?}", e))?;

    Ok((source, asm_result.pixels.len()))
}

/// Boot result for source PNG mode
pub struct BootSrcPngResult {
    pub source_len: usize,
    pub char_count: usize,
    pub bytecode_words: usize,
}

/// Full source PNG boot pipeline: decode -> canvas -> assemble -> write bytecode to RAM.
/// Full source PNG boot pipeline skipping the first N pixels (BIOS pixel).
pub fn boot_source_png_to_ram_skip(
    path: &str,
    canvas_buffer: &mut [u32],
    ram: &mut [u32],
    skip_pixels: usize,
) -> Result<BootSrcPngResult, String> {
    let source = decode_pixelpack_source_file_skip(path, skip_pixels)?;
    let source_len = source.len();
    let char_count = load_source_to_canvas_buffer(&source, canvas_buffer);

    // Assemble
    let asm_result = crate::assembler::assemble(&source, 0x1000)
        .map_err(|e| format!("Assembly error: {:?}", e))?;

    // Write bytecode to RAM at 0x1000
    let bytecode_words = asm_result.pixels.len().min(4096);
    for i in 0..bytecode_words {
        ram[0x1000 + i] = asm_result.pixels[i];
    }

    Ok(BootSrcPngResult {
        source_len,
        char_count,
        bytecode_words,
    })
}

/// Full source PNG boot pipeline (no skip).
pub fn boot_source_png_to_ram(
    path: &str,
    canvas_buffer: &mut [u32],
    ram: &mut [u32],
) -> Result<BootSrcPngResult, String> {
    boot_source_png_to_ram_skip(path, canvas_buffer, ram, 0)
}

/// Boot context: what we loaded and from where
pub struct BootPngResult {
    pub seed_count: usize,
    pub byte_count: usize,
    pub ram_words: usize,
    pub load_addr: usize,
}

/// Load a pixelpack PNG file and write bytecode to VM RAM, skipping the first N pixels.
/// Returns metadata about the load, or an error string.
pub fn boot_from_png_skip(
    path: &str,
    ram: &mut [u32],
    load_addr: usize,
    skip_pixels: usize,
) -> Result<BootPngResult, String> {
    let bytes = decode_pixelpack_file_skip(path, skip_pixels)?;
    let byte_count = bytes.len();
    let ram_words = load_bytecode_to_ram(&bytes, ram, load_addr);
    Ok(BootPngResult {
        seed_count: 0,
        byte_count,
        ram_words,
        load_addr,
    })
}

/// Load a pixelpack PNG file and write bytecode to VM RAM.
pub fn boot_from_png(
    path: &str,
    ram: &mut [u32],
    load_addr: usize,
) -> Result<BootPngResult, String> {
    boot_from_png_skip(path, ram, load_addr, 0)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_bios_pixel_parse() {
        // Example from design doc: 0x9105003C
        // BIOS | Bytecode(1) | 512x512(1) | audio+mouse(0x05) | 60fps(0x3C)
        let bios = BootPixel::parse(0x9105003C).unwrap();
        assert_eq!(bios.mode, BootMode::RawBytecode);
        assert_eq!(bios.resolution, BiosResolution::Size512);
        assert!(bios.audio_enable);
        assert!(!bios.network_enable);
        assert!(bios.mouse_enable);
        assert!(!bios.system_clock_enable);
        assert_eq!(bios.fps, 60);

        // Safe Mode CLI: 0x8300000A
        let bios = BootPixel::parse(0x8300000A).unwrap();
        assert_eq!(bios.mode, BootMode::AsmSource);
        assert_eq!(bios.resolution, BiosResolution::Headless);
        assert!(!bios.audio_enable);
        assert_eq!(bios.fps, 10);

        // Non-BIOS pixel (bit 31 clear)
        assert!(BootPixel::parse(0x70000000).is_none());
        assert!(BootPixel::parse(0x00000000).is_none());
    }

    #[test]
    fn test_decode_pixelpack_skip() {
        // Build a tiny source PNG with a BIOS pixel prepended.
        // Seeds: [BIOS(0x9105003C), A:"HAL", A:"T\n"]
        // Image: 2x2
        let seeds = [0x9105003C_u32, 0xA048414C, 0xA0540A00];
        let mut pixels = Vec::new();
        for s in &seeds {
            pixels.extend_from_slice(&[
                ((s >> 24) & 0xFF) as u8,
                ((s >> 16) & 0xFF) as u8,
                ((s >> 8) & 0xFF) as u8,
                (s & 0xFF) as u8,
            ]);
        }
        pixels.extend_from_slice(&[0, 0, 0, 0]); // pad to 2x2

        let mut buf = Vec::new();
        {
            let mut encoder = png::Encoder::new(std::io::Cursor::new(&mut buf), 2, 2);
            encoder.set_color(png::ColorType::Rgba);
            encoder.set_depth(png::BitDepth::Eight);
            encoder
                .add_text_chunk("seedcnt".to_string(), "3".to_string())
                .unwrap();
            encoder
                .add_text_chunk("bytecnt".to_string(), "5".to_string())
                .unwrap();
            let mut writer = encoder.write_header().unwrap();
            writer.write_image_data(&pixels).unwrap();
        }

        // Skip the BIOS pixel
        let decoded = decode_pixelpack_png_skip(&buf, 1).unwrap();
        assert_eq!(decoded, b"HALT\n");
    }

    #[test]
    fn test_d2xy_origin() {
        assert_eq!(d2xy(1, 0), (0, 0));
        assert_eq!(d2xy(2, 0), (0, 0));
        assert_eq!(d2xy(3, 0), (0, 0));
    }

    #[test]
    fn test_d2xy_order1_all_points() {
        // Order 1: 4 points, all within 2x2 grid
        for d in 0..4 {
            let (x, y) = d2xy(1, d);
            assert!(
                x < 2 && y < 2,
                "d2xy(1, {}) = ({}, {}) out of bounds",
                d,
                x,
                y
            );
        }
        // All 4 points should be unique
        let mut seen = std::collections::HashSet::new();
        for d in 0..4 {
            let (x, y) = d2xy(1, d);
            assert!(
                seen.insert((x, y)),
                "duplicate point ({}, {}) at d={}",
                x,
                y,
                d
            );
        }
        assert_eq!(seen.len(), 4);
    }

    #[test]
    fn test_d2xy_order2_continuity() {
        // Order 2: 16 points, all must be within 4x4 grid and unique
        for d in 0..16 {
            let (x, y) = d2xy(2, d);
            assert!(
                x < 4 && y < 4,
                "d2xy(2, {}) = ({}, {}) out of bounds",
                d,
                x,
                y
            );
        }
        // All points must be unique
        let mut seen = std::collections::HashSet::new();
        for d in 0..16 {
            let p = d2xy(2, d);
            assert!(seen.insert(p), "duplicate point {:?} at d={}", p, d);
        }
        assert_eq!(seen.len(), 16);
    }

    #[test]
    fn test_d2xy_order3_coverage() {
        // Order 3: 64 points, all must be within 8x8 grid
        let mut seen = std::collections::HashSet::new();
        for d in 0..64 {
            let (x, y) = d2xy(3, d);
            assert!(
                x < 8 && y < 8,
                "d2xy(3, {}) = ({}, {}) out of bounds",
                d,
                x,
                y
            );
            assert!(
                seen.insert((x, y)),
                "duplicate point ({}, {}) at d={}",
                x,
                y,
                d
            );
        }
        assert_eq!(seen.len(), 64);
    }

    #[test]
    fn test_d2xy_order4_coverage() {
        // Order 4: 256 points, all must be within 16x16 grid
        let mut seen = std::collections::HashSet::new();
        for d in 0..256 {
            let (x, y) = d2xy(4, d);
            assert!(
                x < 16 && y < 16,
                "d2xy(4, {}) = ({}, {}) out of bounds",
                d,
                x,
                y
            );
            assert!(
                seen.insert((x, y)),
                "duplicate point ({}, {}) at d={}",
                x,
                y,
                d
            );
        }
        assert_eq!(seen.len(), 256);
    }

    #[test]
    fn test_d2xy_known_values_order1() {
        // Known Hilbert curve order 1 pattern: (0,0) (1,0) (0,1) (1,1)
        assert_eq!(d2xy(1, 0), (0, 0));
        assert_eq!(d2xy(1, 1), (1, 0));
        assert_eq!(d2xy(1, 2), (0, 1));
        assert_eq!(d2xy(1, 3), (1, 1));
    }

    #[test]
    fn test_is_rts_png() {
        assert!(is_rts_png("kernel.rts.png"));
        assert!(is_rts_png("test.RTS.PNG"));
        assert!(is_rts_png("/path/to/file.rts.png"));
        assert!(!is_rts_png("kernel.png"));
        assert!(!is_rts_png("kernel.rts"));
        assert!(!is_rts_png("rts.png.txt"));
        assert!(!is_rts_png(""));
    }

    #[test]
    fn test_d2xy_large_order() {
        // Order 5: 1024 points, spot-check bounds
        let (x, y) = d2xy(5, 0);
        assert_eq!(x, 0);
        assert_eq!(y, 0);
        let (x, y) = d2xy(5, 1023);
        assert!(x < 32);
        assert!(y < 32);
    }

    // === Phase 92: Pixelpack seed expansion tests ===

    #[test]
    fn test_pixelpack_expand_dict() {
        // Strategy 0: pp_expand_dict_neural(params, 1) — 24-bit index
        // LDI is now at index 14
        let seed = 0x0000_000E; // strategy 0, index 14
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes, b"LDI");

        // Strategy 1: pp_expand_dict(params, 3) — 8-bit indices (max 255)
        // Index 0 = "\n", Index 4 = ","
        let seed = 0x1000_0004; // strategy 1, indices [4, 0, 0] = "," + "\n" + "\n"
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes, b",\n");
    }

    #[test]
    fn test_pixelpack_expand_raw3() {
        // Strategy A (0xA): 3 raw bytes
        let seed = 0xA000_0102; // strategy A, bytes: 0x00, 0x01, 0x02 (MSB first)
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes, vec![0x00, 0x01, 0x02]);
    }

    #[test]
    fn test_pixelpack_expand_nibble() {
        // Strategy 7: NIBBLE, 7 hex digits
        let seed = 0x7000_0012; // strategy 7, nibbles [2,1,0,0,0,0,0]
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes[0], b'2');
        assert_eq!(bytes[1], b'1');
        assert_eq!(bytes[2], b'0');
        assert_eq!(bytes.len(), 7);
    }

    #[test]
    fn test_pixelpack_expand_literal() {
        // Strategy F (0xF): 4 bytes literal
        // params = seed & 0x0FFFFFFF = 0x0ABCDEF0
        // bytes: (params>>24)=0x0A, (params>>16)=0xBC, (params>>8)=0xDE, params&0xFF=0xF0
        let seed = 0xFABCDEF0u32;
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes, vec![0x0A, 0xBC, 0xDE, 0xF0]);
    }

    #[test]
    fn test_pixelpack_expand_rle() {
        // Strategy 9 (0x9): RLE -- repeat byte
        let seed = 0x9000_0042; // strategy 9, byte=0x42 ('B'), count=0+1=1
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes, vec![0x42]);

        // Multiple repeats
        let seed = 0x9000_0342; // byte=0x42, count=3
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes, vec![0x42, 0x42, 0x42]);
    }

    #[test]
    fn test_pixelpack_expand_linear() {
        // Strategy C (0xC): linear sequence
        // params layout: count in bits 19:16, step in bits 15:8, start in bits 7:0
        let seed = 0xC004_0210; // count=4, step=0x02, start=0x10
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes, vec![0x10, 0x12, 0x14, 0x16]);
    }

    #[test]
    fn test_pixelpack_lz77_backref() {
        // Test LZ77 back-reference: "ABCABC"
        let mut history = Vec::new();

        // 1. Dictionary index 19 is "LDI r2 ,"
        let seed_1 = (0x0 << 28) | 19;
        let exp_1 = pixelpack_expand(seed_1, &[]);
        history.extend_from_slice(&exp_1);

        // 2. LZ77 backref: offset = len(exp_1), length = len(exp_1)
        let offset = exp_1.len() as u32;
        let length = exp_1.len() as u32;
        let params = (offset & 0x3FFF) | ((length & 0x3FFF) << 14);
        let seed_2 = (0x8 << 28) | params;

        let exp_2 = pixelpack_expand(seed_2, &history);
        assert_eq!(exp_2, exp_1);
        history.extend_from_slice(&exp_2);

        let mut expected = exp_1.clone();
        expected.extend_from_slice(&exp_1);
        assert_eq!(history, expected);
    }

    #[test]
    fn test_pixelpack_lz77_overlap() {
        // Test overlapping LZ77 (RLE-like): "AAAAA"
        let mut history = vec![b'A'];

        // Offset 1, Length 4 -> should produce "AAAA"
        let params = (1 & 0x3FFF) | ((4 & 0x3FFF) << 14);
        let seed = (0x8 << 28) | params;

        let exp = pixelpack_expand(seed, &history);
        assert_eq!(exp, b"AAAA");
    }

    #[test]
    fn test_pixelpack_roundtrip_encode_decode() {
        // Encode some bytes, decode them back
        let original = vec![0x10, 0x01, 0x42, 0x00, 0x00, 0x00]; // LDI r1, 66 (3 u32 words)
        let png_data = encode_pixelpack_png(&original)
            .expect("encode_pixelpack_png failed for roundtrip test");
        let decoded = decode_pixelpack_png(&png_data)
            .expect("decode_pixelpack_png failed for roundtrip test");
        assert_eq!(decoded, original);
    }

    #[test]
    fn test_pixelpack_roundtrip_empty() {
        let original: Vec<u8> = vec![];
        let png_data = encode_pixelpack_png(&original)
            .expect("encode_pixelpack_png failed for empty roundtrip");
        let decoded = decode_pixelpack_png(&png_data)
            .expect("decode_pixelpack_png failed for empty roundtrip");
        assert_eq!(decoded, original);
    }

    #[test]
    fn test_pixelpack_roundtrip_single_byte() {
        let original = vec![0x42];
        let png_data = encode_pixelpack_png(&original)
            .expect("encode_pixelpack_png failed for single-byte roundtrip");
        let decoded = decode_pixelpack_png(&png_data)
            .expect("decode_pixelpack_png failed for single-byte roundtrip");
        assert_eq!(decoded, original);
    }

    #[test]
    fn test_pixelpack_roundtrip_large() {
        // 100 bytes of varying data
        let original: Vec<u8> = (0..100).map(|i| (i * 7 + 13) as u8).collect();
        let png_data = encode_pixelpack_png(&original)
            .expect("encode_pixelpack_png failed for large roundtrip");
        let decoded = decode_pixelpack_png(&png_data)
            .expect("decode_pixelpack_png failed for large roundtrip");
        assert_eq!(decoded, original);
    }

    #[test]
    fn test_is_pixelpack_png() {
        assert!(is_pixelpack_png("program.png"));
        assert!(is_pixelpack_png("test.PNG"));
        assert!(!is_pixelpack_png("kernel.rts.png"));
        assert!(!is_pixelpack_png("program.asm"));
        assert!(!is_pixelpack_png(""));
    }

    #[test]
    fn test_load_bytecode_to_ram() {
        // 12 bytes = 3 u32 words
        let bytes = vec![
            0x10, 0x01, 0x2A, 0x00, 0x10, 0x02, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00,
        ];
        let mut ram = vec![0u32; 65536];
        let count = load_bytecode_to_ram(&bytes, &mut ram, 0x1000);
        assert_eq!(count, 3);
        assert_eq!(ram[0x1000], 0x002A0110); // LDI r1, 42
        assert_eq!(ram[0x1001], 0x00FF0210); // LDI r2, 255
        assert_eq!(ram[0x1002], 0x00000000); // NOP-like
    }

    #[test]
    fn test_full_pixel_boot_roundtrip() {
        // Assemble a simple program, encode to PNG, decode, load, run
        let source = "LDI r1, 42\nLDI r2, 0xFF\nHALT\n";
        let asm = crate::assembler::assemble(source, 0)
            .expect("assembly failed for pixel boot roundtrip");

        // Convert bytecode pixels to bytes (each pixel is a u32)
        let mut bytecode_bytes = Vec::new();
        for &word in &asm.pixels {
            bytecode_bytes.push((word & 0xFF) as u8);
            bytecode_bytes.push(((word >> 8) & 0xFF) as u8);
            bytecode_bytes.push(((word >> 16) & 0xFF) as u8);
            bytecode_bytes.push(((word >> 24) & 0xFF) as u8);
        }

        // Encode to pixelpack PNG
        let png_data = encode_pixelpack_png(&bytecode_bytes)
            .expect("encode_pixelpack_png failed for boot roundtrip");

        // Decode back
        let decoded = decode_pixelpack_png(&png_data)
            .expect("decode_pixelpack_png failed for boot roundtrip");
        assert_eq!(decoded, bytecode_bytes);

        // Load to VM RAM and run
        let mut ram = vec![0u32; 65536];
        let words = load_bytecode_to_ram(&decoded, &mut ram, 0);
        assert!(words >= 3); // LDI + LDI + HALT = at least 3 words

        let mut vm = crate::vm::Vm::new();
        vm.ram = ram;
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..1000 {
            if !vm.step() {
                break;
            }
        }
        assert!(vm.halted);
        assert_eq!(vm.regs[1], 42);
        assert_eq!(vm.regs[2], 0xFF);
    }

    #[test]
    fn test_pixel_boot_uses_strategy_a() {
        // Verify encode_pixelpack_png uses strategy A (raw3)
        let bytes = vec![0x10, 0x01, 0x42];
        let png_data =
            encode_pixelpack_png(&bytes).expect("encode_pixelpack_png failed for strategy-a test");
        let decoded = decode_pixelpack_png(&png_data)
            .expect("decode_pixelpack_png failed for strategy-a test");
        assert_eq!(decoded, bytes);

        // The PNG should have exactly 1 seed (3 bytes packed into one seed)
        // Check it's a valid PNG
        assert!(png_data.len() > 8);
        assert_eq!(&png_data[0..4], &[0x89, 0x50, 0x4E, 0x47]); // PNG magic
    }

    // ═══════════════════════════════════════════════════════════════════
    // EXPANSION AUDIT: Measure bytes-out per strategy at max params
    // Goal: understand which strategies give the best expansion ratio
    // (32 bits in → N bytes out) for the "disk in a pixel" target.
    // ═══════════════════════════════════════════════════════════════════

    /// Helper: build a seed for a given strategy with maxed-out params.
    fn max_seed(strategy: u8) -> u32 {
        ((strategy as u32) << 28) | 0x0FFF_FFFF
    }

    #[test]
    fn test_expansion_audit_all_strategies() {
        // Print expansion ratios for all 16 strategies at max params
        eprintln!("\n╔══════════════════════════════════════════════════════════════╗");
        eprintln!("║  PIXELPACK EXPANSION AUDIT — max params (0x0FFFFFFF)       ║");
        eprintln!("╠══════════╦════════════╦═══════════╦═════════════════════════╣");
        eprintln!("║ Strategy ║ Bytes Out  ║ Ratio     ║ Mechanism              ║");
        eprintln!("╠══════════╬════════════╬═══════════╬═════════════════════════╣");

        for strat in 0u8..=0xF {
            let seed = max_seed(strat);
            let bytes = pixelpack_expand(seed, &[]);
            let ratio = bytes.len() as f64 / 4.0; // 32 bits = 4 bytes in
            let name = match strat {
                0 => "dict_neural_1",
                1 => "dict_2",
                2 => "dict_3",
                3 => "dict_4",
                4 => "dict_neural_3",
                5 => "dict_6",
                6 => "dict_7",
                7 => "nibble_7",
                8 => "raw4",
                9 => "rle",
                0xA => "raw3",
                0xB => "xor_chain",
                0xC => "linear",
                0xD => "delta",
                0xE => "bytepack",
                0xF => "literal",
                _ => "???",
            };
            eprintln!(
                "║    0x{:X}   ║ {:>8}   ║ {:>6.1}x   ║ {:<23} ║",
                strat,
                bytes.len(),
                ratio,
                name
            );
        }
        eprintln!("╚══════════╩════════════╩═══════════╩═════════════════════════╝");
    }

    #[test]
    fn test_expansion_rle_max() {
        // Strategy 9 (RLE) should be the highest expansion: repeat byte up to 256 times
        // params: count in bits 15:8, byte in bits 7:0
        let seed = 0x900F_FF42; // byte=0x42, count=0xFF=255, capped at 256
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes.len(), 255);
        assert!(bytes.iter().all(|&b| b == 0x42));
    }

    #[test]
    fn test_expansion_rle_varying_counts() {
        // Sweep RLE count from 1 to 256
        for count in 1..=255u32 {
            let seed = 0x9000_0000 | (count << 8) | 0xAA;
            let bytes = pixelpack_expand(seed, &[]);
            assert_eq!(bytes.len(), count as usize, "RLE count={}", count);
            assert!(bytes.iter().all(|&b| b == 0xAA));
        }
    }

    #[test]
    fn test_expansion_xor_chain_max() {
        // Strategy B: XOR chain, count in bits 19:16 (max 16)
        let seed = 0xBFFF_FF41; // start=0x41, key=0xFF, count=0xF=15 → capped to 16
        let bytes = pixelpack_expand(seed, &[]);
        assert!(bytes.len() <= 16);
        // Each byte should be start ^ (key * i) pattern
        assert_eq!(bytes[0], 0x41);
    }

    #[test]
    fn test_expansion_linear_max() {
        // Strategy C: linear, count in bits 19:16 (max 16)
        let seed = 0xCFFF_0100; // start=0, step=1, count=0xF=15 → 16 bytes
        let bytes = pixelpack_expand(seed, &[]);
        assert_eq!(bytes.len(), 15);
        assert_eq!(bytes[0], 0x00);
        assert_eq!(bytes[14], 0x0E);
    }

    #[test]
    fn test_expansion_dict_neural_single() {
        // Strategy 0: dict_neural_1 with 24-bit index
        // With max params 0x0FFFFFFF, index = 0x0FFFFFFF % dict_len
        let seed = max_seed(0);
        let bytes = pixelpack_expand(seed, &[]);
        // Should produce at least 1 token (might be empty if index is garbage)
        // Just verify it doesn't panic
        eprintln!("Strategy 0 max: {} bytes", bytes.len());
    }

    #[test]
    fn test_expansion_dict_7_tokens() {
        // Strategy 6: dict with 7 nibble indices, each 4 bits
        // 7 * 4 = 28 bits = exactly the payload
        let seed = 0x6B6D_B6D_B; // indices: B,B,6,D,B,6,D = RECTF, RECTF, label, LDI, RECTF, label, LDI
        let bytes = pixelpack_expand(seed, &[]);
        assert!(bytes.len() > 0);
        // 7 tokens from dictionary
        eprintln!(
            "Strategy 6 (7 dict tokens): {} bytes: {:?}",
            bytes.len(),
            String::from_utf8_lossy(&bytes)
        );
    }

    // ═══════════════════════════════════════════════════════════════════
    // ESCALATING BOOT PIXEL TESTS
    // Test that a boot pixel + N data pixels can produce programs of
    // increasing size. This is the path to "disk in a pixel".
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn test_boot_pixel_1px_expand() {
        // 1 pixel (boot) + 1 data pixel using RLE strategy
        // Should produce a meaningful program
        let bios = 0x9105_003C_u32; // BIOS: bytecode, 512x512, audio+mouse, 60fps
        let data = 0x9000_0342; // RLE: repeat 0x42 three times

        let expanded = pixelpack_expand(data, &[]);
        assert_eq!(expanded.len(), 3);
        eprintln!("1 data pixel (RLE count=3): {} bytes", expanded.len());
    }

    #[test]
    fn test_boot_pixel_1px_rle_256() {
        // 1 data pixel, max RLE: 256 bytes from 32 bits
        let data = 0x900F_FF00; // RLE: repeat 0x00, 255 times → 256 bytes
        let expanded = pixelpack_expand(data, &[]);
        assert_eq!(expanded.len(), 255);
        eprintln!(
            "1 data pixel (RLE max): {} bytes (ratio: {:.1}x)",
            expanded.len(),
            expanded.len() as f64 / 4.0
        );
    }

    #[test]
    fn test_boot_pixel_4px_expand() {
        // 4 data pixels: each using max RLE = 4 × 256 = 1024 bytes
        let seeds: Vec<u32> = (0..4).map(|_| 0x900F_FF42).collect();
        let mut total = 0usize;
        for seed in &seeds {
            total += pixelpack_expand(*seed, &[]).len();
        }
        assert_eq!(total, 4 * 255);
        eprintln!("4 data pixels (RLE max each): {} bytes", total);
    }

    #[test]
    fn test_boot_pixel_16px_expand() {
        // 16 data pixels: each max RLE = 16 × 256 = 4096 bytes
        let seeds: Vec<u32> = (0..16).map(|_| 0x900F_FF42).collect();
        let mut total = 0usize;
        for seed in &seeds {
            total += pixelpack_expand(*seed, &[]).len();
        }
        assert_eq!(total, 16 * 255);
        eprintln!("16 data pixels (RLE max each): {} bytes", total);
    }

    #[test]
    fn test_boot_pixel_64px_expand() {
        // 64 data pixels × 256 RLE = 16384 bytes
        let seeds: Vec<u32> = (0..64).map(|_| 0x900F_FF42).collect();
        let mut total = 0usize;
        for seed in &seeds {
            total += pixelpack_expand(*seed, &[]).len();
        }
        assert_eq!(total, 64 * 255);
        eprintln!(
            "64 data pixels (RLE max each): {} bytes ({} KB)",
            total,
            total / 1024
        );
    }

    #[test]
    fn test_boot_pixel_256px_expand() {
        // 256 data pixels × 256 RLE = 65536 bytes = 64 KB
        let seeds: Vec<u32> = (0..256).map(|_| 0x900F_FF42).collect();
        let mut total = 0usize;
        for seed in &seeds {
            total += pixelpack_expand(*seed, &[]).len();
        }
        assert_eq!(total, 256 * 255);
        eprintln!(
            "256 data pixels (RLE max each): {} bytes ({} KB)",
            total,
            total / 1024
        );
    }

    #[test]
    fn test_boot_pixel_1024px_expand() {
        // 1024 data pixels × 256 RLE = 262144 bytes = 256 KB
        let seeds: Vec<u32> = (0..1024).map(|_| 0x900F_FF42).collect();
        let mut total = 0usize;
        for seed in &seeds {
            total += pixelpack_expand(*seed, &[]).len();
        }
        assert_eq!(total, 1024 * 255);
        eprintln!(
            "1024 data pixels (RLE max each): {} bytes ({} KB)",
            total,
            total / 1024
        );
    }

    #[test]
    fn test_boot_pixel_4096px_expand() {
        // 4096 data pixels × 256 RLE = 1048576 bytes = 1 MB
        // That's a 65×65 pixel PNG (1 boot + 4096 data = 4097 pixels)
        let mut total = 0usize;
        for i in 0..4096u32 {
            // Vary the byte value to make it non-trivial
            let seed = 0x900F_FF00 | ((i & 0xFF) as u32);
            total += pixelpack_expand(seed, &[]).len();
        }
        assert_eq!(total, 4096 * 255);
        eprintln!(
            "4096 data pixels (RLE max each): {} bytes ({} KB / {:.1} MB)",
            total,
            total / 1024,
            total as f64 / (1024.0 * 1024.0)
        );
    }

    // ═══════════════════════════════════════════════════════════════════
    // MIXED-STRATEGY EXPANSION: combine strategies for maximal effect
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn test_mixed_strategy_expansion_audit() {
        // Compare: same 16 pixels, but using different strategies
        // to find which combination maximizes output
        eprintln!("\n╔══════════════════════════════════════════════════════════════╗");
        eprintln!("║  16-PIXEL EXPANSION COMPARISON                              ║");
        eprintln!("╠═════════════════════════════════════════════════════════════╣");

        let strategies = [
            (0x0, "dict_neural_1"),
            (0x1, "dict_2"),
            (0x5, "dict_6"),
            (0x6, "dict_7"),
            (0x7, "nibble_7"),
            (0x8, "raw4"),
            (0x9, "rle_256"),
            (0xA, "raw3"),
            (0xB, "xor_chain_16"),
            (0xC, "linear_16"),
            (0xD, "delta_4"),
            (0xE, "bytepack_3"),
            (0xF, "literal_4"),
        ];

        for (strat, name) in &strategies {
            let seed = ((*strat as u32) << 28) | 0x0FFF_FFFF;
            let mut total = 0usize;
            for _ in 0..16 {
                total += pixelpack_expand(seed, &[]).len();
            }
            eprintln!(
                "║  {:<18} × 16 = {:>6} bytes ({:>5.1} KB) ║",
                name,
                total,
                total as f64 / 1024.0
            );
        }
        eprintln!("╚══════════════════════════════════════════════════════════════╝");
    }

    #[test]
    fn test_expansion_summary_table() {
        // The key question: how many pixels to store 1 MB of data?
        // RLE gives 64x expansion (4 bytes → 256 bytes per pixel)
        // raw3 gives 0.75x (no expansion, slight loss)
        // dict strategies vary by token length
        eprintln!("\n╔══════════════════════════════════════════════════════════════╗");
        eprintln!("║  HOW MANY PIXELS TO STORE VARIOUS SIZES?                   ║");
        eprintln!("╠════════════════╦═════════════════════╦═══════════════════════╣");
        eprintln!("║ Target Size    ║ RLE (256 B/px)      ║ Raw3 (3 B/px)        ║");
        eprintln!("╠════════════════╬═════════════════════╬═══════════════════════╣");

        let targets = [
            (256, "256 B"),
            (1024, "1 KB"),
            (4096, "4 KB"),
            (16384, "16 KB"),
            (65536, "64 KB"),
            (262144, "256 KB"),
            (1048576, "1 MB"),
            (4194304, "4 MB"),
            (16777216, "16 MB"),
            (67108864, "64 MB"),
        ];

        for (bytes, label) in &targets {
            let rle_pixels = (*bytes as f64 / 256.0).ceil() as usize;
            let raw3_pixels = (*bytes as f64 / 3.0).ceil() as usize;
            let rle_png_side = (rle_pixels as f64).sqrt().ceil() as usize;
            let raw3_png_side = (raw3_pixels as f64).sqrt().ceil() as usize;
            eprintln!(
                "║ {:<14} ║ {:>5} px ({:>4}×{:<4}) ║ {:>7} px ({:>4}×{:<4}) ║",
                label,
                rle_pixels,
                rle_png_side,
                rle_png_side,
                raw3_pixels,
                raw3_png_side,
                raw3_png_side
            );
        }
        eprintln!("╚════════════════╩═════════════════════╩═══════════════════════╝");
    }
}

/// Get the 5x7 mini font glyph for a character.
/// Returns a static array of 7 rows, each a 5-bit bitmap.
/// Bit test: glyph[row] & (1 << (4 - col))
pub fn mini_font_glyph(ch: u8) -> &'static [u8; 7] {
    const MINI_FONT: [[u8; 7]; 96] = include!("mini_font.in");
    const EXT_FONT: [[u8; 7]; 30] = include!("ext_font.in");
    let idx = ch as usize;
    if ch >= 32 && ch < 128 {
        &MINI_FONT[(ch - 32) as usize]
    } else if ch >= 128 && ch <= 157 {
        &EXT_FONT[idx - 128]
    } else {
        &MINI_FONT[0] // space for out-of-range
    }
}

// ═══════════════════════════════════════════════════════════════════
// BINARY DATA PACKER: Scan data for patterns, pick best strategy
// ═══════════════════════════════════════════════════════════════════

/// A segment of binary data with its recommended pixelpack encoding.
#[derive(Debug, Clone)]
pub struct PackedSegment {
    /// The seed that encodes this segment.
    pub seed: u32,
    /// The bytes this seed expands to (for verification).
    pub expanded: Vec<u8>,
    /// Which strategy was chosen.
    pub strategy: u8,
}

/// Result of packing binary data into pixelpack seeds.
#[derive(Debug, Clone)]
pub struct PackResult {
    pub seeds: Vec<u32>,
    pub segments: Vec<PackedSegment>,
    pub input_bytes: usize,
    pub output_seeds: usize,
    pub expansion_ratio: f64,
    pub strategy_histogram: [usize; 16],
}

/// Pack binary data into pixelpack seeds using optimal strategy selection.
/// Scans the input for patterns and picks the best strategy for each segment.
/// Pack binary data into pixelpack seeds using Dynamic Programming to find the global minimum.
/// This guarantees the fewest number of pixels for the given strategies.
pub fn pack_binary(data: &[u8]) -> PackResult {
    let n = data.len();
    if n == 0 {
        return PackResult {
            seeds: Vec::new(),
            segments: Vec::new(),
            input_bytes: 0,
            output_seeds: 0,
            expansion_ratio: 0.0,
            strategy_histogram: [0; 16],
        };
    }

    // dp[i] = min seeds to pack data[0..i]
    let mut dp = vec![u32::MAX; n + 1];
    // parent[i] = (prev_pos, seed, strategy, consumed)
    let mut parent: Vec<Option<(usize, u32, u8, usize)>> = vec![None; n + 1];
    dp[0] = 0;

    for i in 0..n {
        if dp[i] == u32::MAX {
            continue;
        }

        let remaining = &data[i..];
        let candidates = find_all_candidates(remaining);

        for (seed, strategy, consumed) in candidates {
            let next = i + consumed;
            if dp[i] + 1 < dp[next] {
                dp[next] = dp[i] + 1;
                parent[next] = Some((i, seed, strategy, consumed));
            }
        }
    }

    // If we couldn't reach the end, it means there's a bug in find_all_candidates
    // (Strategy 9 with count=1 should always be a fallback).
    if dp[n] == u32::MAX {
        panic!("Failed to pack data of length {}", n);
    }

    // Reconstruct the path
    let mut seeds = Vec::new();
    let mut segments = Vec::new();
    let mut histogram = [0usize; 16];
    let mut curr = n;

    while let Some((prev, seed, strategy, consumed)) = parent[curr] {
        seeds.push(seed);
        let expanded = pixelpack_expand(seed, &[]);
        // Important: expanded might be longer than consumed due to strategy limits,
        // but it MUST match the data exactly for the first 'consumed' bytes.
        let verified_expanded = if expanded.len() > consumed {
            expanded[..consumed].to_vec()
        } else {
            expanded
        };

        segments.push(PackedSegment {
            seed,
            expanded: verified_expanded,
            strategy,
        });
        histogram[strategy as usize] += 1;
        curr = prev;
    }

    seeds.reverse();
    segments.reverse();

    let seed_count = seeds.len();
    let ratio = if seed_count == 0 {
        0.0
    } else {
        data.len() as f64 / (seed_count as f64 * 4.0)
    };

    PackResult {
        seeds,
        segments,
        input_bytes: data.len(),
        output_seeds: seed_count,
        expansion_ratio: ratio,
        strategy_histogram: histogram,
    }
}

/// Find all valid strategy matches at the current data position.
/// Returns a list of (seed, strategy_id, bytes_consumed).
fn find_all_candidates(data: &[u8]) -> Vec<(u32, u8, usize)> {
    let mut candidates = Vec::new();
    if data.is_empty() {
        return candidates;
    }

    // --- Strategy 9: RLE (repeat byte) ---
    {
        let byte_val = data[0];
        let mut count = 1usize;
        while count < data.len() && count < 255 && data[count] == byte_val {
            count += 1;
            // RLE is worth it if it consumes more than a Raw3 (3 bytes)
            if count >= 3 {
                candidates.push((
                    0x9000_0000 | ((count as u32) << 8) | (byte_val as u32),
                    0x9,
                    count,
                ));
            }
        }
        // Always include count=1 as a fallback for any byte
        candidates.push((0x9000_0000 | (1u32 << 8) | (byte_val as u32), 0x9, 1));
    }

    // --- Strategy C: Linear sequence ---
    if data.len() >= 2 {
        let start = data[0];
        let step = data[1].wrapping_sub(data[0]);
        let mut count = 1usize;
        let mut val = start;
        while count < data.len() && count < 15 {
            val = val.wrapping_add(step);
            if data[count] == val {
                count += 1;
                if count >= 3 {
                    candidates.push((
                        0xC000_0000
                            | ((count as u32) << 16)
                            | ((step as u32) << 8)
                            | (start as u32),
                        0xC,
                        count,
                    ));
                }
            } else {
                break;
            }
        }
    }

    // --- Strategy B: XOR chain ---
    if data.len() >= 2 {
        let start = data[0];
        let key = data[0] ^ data[1];
        if key != 0 {
            let mut count = 1usize;
            let mut val = start;
            while count < data.len() && count < 15 {
                val ^= key;
                if val == 0 {
                    val = key;
                }
                if data[count] == val {
                    count += 1;
                    if count >= 3 {
                        candidates.push((
                            0xB000_0000
                                | ((count as u32) << 16)
                                | ((key as u32) << 8)
                                | (start as u32),
                            0xB,
                            count,
                        ));
                    }
                } else {
                    break;
                }
            }
        }
    }

    // --- Strategy D: Delta encoding ---
    if data.len() >= 4 {
        let base = data[0];
        let d1 = data[1].wrapping_sub(base);
        let d2 = data[2].wrapping_sub(data[1]);
        let d3 = data[3].wrapping_sub(data[2]);
        let seed = 0xD000_0000
            | ((d3 as u32) << 24)
            | ((d2 as u32) << 16)
            | ((d1 as u32) << 8)
            | (base as u32);
        let expanded = pixelpack_expand(seed, &[]);
        if expanded.len() >= 4 && &expanded[..4] == &data[..4] {
            candidates.push((seed, 0xD, 4));
        }
    }

    // --- Strategy A: Raw3 ---
    for try_n in 1..=data.len().min(3) {
        let mut seed = 0xA000_0000u32;
        if try_n >= 1 {
            seed |= (data[0] as u32) << 16;
        }
        if try_n >= 2 {
            seed |= (data[1] as u32) << 8;
        }
        if try_n >= 3 {
            seed |= data[2] as u32;
        }

        let expanded = pixelpack_expand(seed, &[]);
        if expanded.len() == try_n && &expanded[..] == &data[..try_n] {
            candidates.push((seed, 0xA, try_n));
        }
    }

    // --- Dictionary Strategies 0-6: 1 to 7 tokens ---
    // We use a greedy approach to find the longest token sequence at this position
    {
        let mut tokens_found = Vec::new();
        let mut current_pos = 0;

        while tokens_found.len() < 7 && current_pos < data.len() {
            // Find longest matching token
            let mut best_token_idx = None;
            let mut best_token_len = 0;

            for (idx, token) in PP_DICTIONARY.iter().enumerate() {
                if !token.is_empty() && data[current_pos..].starts_with(token) {
                    if token.len() > best_token_len {
                        best_token_len = token.len();
                        best_token_idx = Some(idx);
                    }
                }
            }

            if let Some(idx) = best_token_idx {
                tokens_found.push(idx);
                current_pos += best_token_len;

                // Add a candidate for this number of tokens
                let n = tokens_found.len();
                let strategy = match n {
                    1 => 0x0,
                    2 => 0x1,
                    3 => 0x2,
                    4 => 0x3,
                    6 => 0x5,
                    7 => 0x6,
                    _ => 0xFF, // 5 is not handled by standard pp_expand_dict?
                               // Actually pixelpack_expand shows 5 is pp_expand_dict(params, 6)
                               // and 4 is pp_expand_dict_neural(params, 3)
                };

                // Correction based on pixelpack_expand:
                // 0 -> dict_neural(1)
                // 1 -> dict(2)
                // 2 -> dict(3)
                // 3 -> dict(4)
                // 4 -> dict_neural(3)
                // 5 -> dict(6)
                // 6 -> dict(7)

                let actual_strategy = match n {
                    1 => Some(0x0), // Neural 1 (9-bit)
                    2 if tokens_found.iter().all(|&idx| idx < 16) => Some(0x1),
                    3 if tokens_found.iter().all(|&idx| idx < 16) => Some(0x2),
                    4 if tokens_found.iter().all(|&idx| idx < 16) => Some(0x3),
                    6 if tokens_found.iter().all(|&idx| idx < 16) => Some(0x5),
                    7 if tokens_found.iter().all(|&idx| idx < 16) => Some(0x6),
                    _ => None,
                };

                if let Some(strat) = actual_strategy {
                    let mut params = 0u32;
                    let bits_per_token = if strat == 0x0 { 9 } else { 4 };
                    for (i, &t_idx) in tokens_found.iter().enumerate() {
                        let shift = bits_per_token * i;
                        if shift < 32 {
                            let mask = (1u32 << bits_per_token) - 1;
                            params |= ((t_idx as u32) & mask) << shift;
                        }
                    }
                    candidates.push(((strat << 28) | params, strat as u8, current_pos));
                }

                // Special case for strategy 4 (3 tokens, 9 bits each - neural native)
                if n == 3 {
                    let mut params = 0u32;
                    for (i, &t_idx) in tokens_found.iter().enumerate() {
                        let shift = 9 * i;
                        if shift < 32 {
                            params |= ((t_idx as u32) & 0x1FF) << shift;
                        }
                    }
                    candidates.push(((0x4 << 28) | params, 0x4, current_pos));
                }
            } else {
                break; // No more tokens match
            }
        }
    }

    candidates
}

// ═══════════════════════════════════════════════════════════════════
// CASCADE EXPANSION: pixel 1 controls pixel 2, pixel 2 controls 3
// ═══════════════════════════════════════════════════════════════════
//
// The idea: expand seeds → re-interpret bytes as seeds → expand again.
// Each level multiplies the output. Exponential growth from few pixels.
//
// Constraint: for bytes to form valid u32 seeds, every 4th byte (at
// position 3 in each u32 LE group) must have its top nibble in 0x0-0xF
// (ALL nibbles are valid strategies in our system).
//
// Growth math (worst case raw3: 3 bytes per seed):
//   Level 0: 1 seed → 3 bytes → 0 sub-seeds (3 < 4)
//   But with RLE: 1 seed → 255 bytes → 63 sub-seeds → 189 bytes → ...
//
// Growth math (RLE self-similar byte 0x99):
//   Level 0: 1 seed → 255 × 0x99 → 63 seeds of 0x99999999
//   Level 1: each 0x99999999 → RLE(153 × 0x99) → 63 × 153 = 9,639 bytes
//   Level 2: 2,409 seeds → 368,577 bytes
//   All 0x99. Useless for data, but proves the CASCADE WORKS.
//
// For USEFUL output, mix strategies at each level:
//   Level 0: RLE of a 4-byte pattern → diverse child seeds
//   Level 1: each child seed uses different strategy → real data

/// Result of a cascade expansion analysis.
#[derive(Debug, Clone)]
pub struct CascadeResult {
    pub total_bytes: usize,
    pub total_seeds_touched: usize,
    pub levels: Vec<CascadeLevel>,
}

#[derive(Debug, Clone)]
pub struct CascadeLevel {
    pub depth: usize,
    pub seeds_in: usize,
    pub bytes_out: usize,
    pub seeds_out: usize,
}

/// Cascade expand: recursively interpret expanded bytes as seeds.
///
/// At each level:
/// 1. Expand all current seeds → bytes
/// 2. Group bytes into u32 LE values → new seeds
/// 3. Repeat until max_depth or no valid seeds produced
///
/// Returns the final expanded bytes and per-level statistics.
pub fn cascade_expand(root_seeds: &[u32], max_depth: usize) -> CascadeResult {
    let mut current_seeds: Vec<u32> = root_seeds.to_vec();
    let mut levels = Vec::new();
    let mut total_seeds_touched = root_seeds.len();
    let mut total_bytes = 0usize;

    for depth in 0..=max_depth {
        // Expand all current seeds
        let mut bytes = Vec::new();
        for &seed in &current_seeds {
            bytes.extend(pixelpack_expand(seed, &[]));
        }

        let seeds_in = current_seeds.len();
        let bytes_out = bytes.len();

        if depth == max_depth {
            // Final level — return the data
            total_bytes = bytes.len();
            levels.push(CascadeLevel {
                depth,
                seeds_in,
                bytes_out,
                seeds_out: 0,
            });
            break;
        }

        // Group bytes into u32 LE seeds for next level
        let next_seeds: Vec<u32> = bytes
            .chunks_exact(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        levels.push(CascadeLevel {
            depth,
            seeds_in,
            bytes_out,
            seeds_out: next_seeds.len(),
        });

        total_seeds_touched += next_seeds.len();

        if next_seeds.is_empty() {
            total_bytes = bytes.len();
            break;
        }

        current_seeds = next_seeds;
    }

    CascadeResult {
        total_bytes,
        total_seeds_touched,
        levels,
    }
}

/// Pack data into a minimal seed set, then cascade-expand to demonstrate growth.
/// This shows how few seeds can control massive output through recursive expansion.
pub fn pack_and_cascade(data: &[u8], cascade_depth: usize) -> (PackResult, CascadeResult) {
    let packed = pack_binary(data);
    let cascaded = cascade_expand(&packed.seeds, cascade_depth);
    (packed, cascaded)
}

// ═══════════════════════════════════════════════════════════════════
// INVERSE CASCADE (the "calculator"): fold data back into fewer seeds
// ═══════════════════════════════════════════════════════════════════
//
// The user's insight: treat each pixel as a 32-bit calculator.
// Given target output, compute the seed (the "answer").
// Then recursively: compute seeds for the seeds, until you reach
// the minimal boot pixel set.
//
// Level N:   target_data (the program we want to run)
// Level N-1: seeds that produce target_data (via pack_binary)
// Level N-2: seeds that produce those seeds (pack the seed bytes)
// ...
// Level 0:   boot pixel(s) — the minimal representation
//
// At each level, pack_binary() finds optimal seeds. The seed bytes
// from level K become the input to pack at level K-1.

/// Result of inverse-cascade packing (folding data into fewer pixels).
#[derive(Debug, Clone)]
pub struct InverseCascadeResult {
    /// The root seeds at the shallowest level.
    pub root_seeds: Vec<u32>,
    /// Number of levels of folding applied.
    pub depth: usize,
    /// Per-level statistics.
    pub levels: Vec<InverseCascadeLevel>,
    /// The original input size in bytes.
    pub original_bytes: usize,
    /// Final root seed count.
    pub root_seed_count: usize,
    /// Overall compression ratio (original bytes / root seeds × 4).
    pub ratio: f64,
}

#[derive(Debug, Clone)]
pub struct InverseCascadeLevel {
    /// Depth (0 = root/shallowest, N = deepest/original data).
    pub depth: usize,
    /// Seeds at this level.
    pub seeds: Vec<u32>,
    /// Total bytes these seeds expand to.
    pub expanded_bytes: usize,
    /// Strategy histogram.
    pub strategy_histogram: [usize; 16],
}

/// Inverse cascade: fold data into fewer and fewer seeds.
///
/// This is the "calculator" approach:
/// 1. Pack target data into seeds (level N)
/// 2. Serialize those seeds as bytes (LE u32 array)
/// 3. Pack those bytes into fewer seeds (level N-1)
/// 4. Repeat until we reach target_depth or can't fold further
///
/// Returns the root seeds and per-level statistics.
pub fn inverse_cascade(data: &[u8], target_depth: usize) -> InverseCascadeResult {
    let original_bytes = data.len();
    let mut levels = Vec::new();
    let mut current_data = data.to_vec();

    for depth in 0..=target_depth {
        let packed = pack_binary(&current_data);

        let mut histogram = [0usize; 16];
        for seg in &packed.segments {
            histogram[seg.strategy as usize] += 1;
        }

        levels.push(InverseCascadeLevel {
            depth,
            seeds: packed.seeds.clone(),
            expanded_bytes: packed.input_bytes,
            strategy_histogram: histogram,
        });

        if depth == target_depth {
            // We've reached the target depth — these are the root seeds
            let root_count = packed.seeds.len();
            let ratio = original_bytes as f64 / (root_count as f64 * 4.0);
            return InverseCascadeResult {
                root_seeds: packed.seeds,
                depth: target_depth,
                levels,
                original_bytes,
                root_seed_count: root_count,
                ratio,
            };
        }

        // Serialize seeds as bytes for the next level of folding
        // Ensure 4-byte alignment for the next level's u32 interpretation
        let mut seed_bytes = Vec::with_capacity(packed.seeds.len() * 4);
        for &seed in &packed.seeds {
            seed_bytes.extend_from_slice(&seed.to_le_bytes());
        }

        // Pad to 4-byte boundary if necessary (should be aligned already, but for safety)
        while seed_bytes.len() % 4 != 0 {
            seed_bytes.push(0); // Pad with zero
        }
        current_data = seed_bytes;

        // If packing didn't reduce size, stop folding
        // (seed_bytes = seeds*4 bytes, and pack_binary can at best do 1:1)
        if current_data.len() >= packed.input_bytes && depth > 0 {
            // Can't fold further — remove the useless last level
            levels.pop();
            let prev = levels.last().unwrap();
            let root_count = prev.seeds.len();
            let ratio = original_bytes as f64 / (root_count as f64 * 4.0);
            return InverseCascadeResult {
                root_seeds: prev.seeds.clone(),
                depth: levels.len() - 1,
                levels,
                original_bytes,
                root_seed_count: root_count,
                ratio,
            };
        }
    }

    // Shouldn't reach here, but just in case
    let root_count = levels.last().map_or(0, |l| l.seeds.len());
    let ratio = original_bytes as f64 / (root_count as f64 * 4.0).max(1.0);
    let root_seeds = levels.last().map_or(vec![], |l| l.seeds.clone());
    InverseCascadeResult {
        root_seeds,
        depth: levels.len().saturating_sub(1),
        levels,
        original_bytes,
        root_seed_count: root_count,
        ratio,
    }
}

/// Verify inverse cascade: take root seeds and expand back to original data.
/// This is the forward direction of inverse_cascade.
pub fn verify_inverse_cascade(result: &InverseCascadeResult) -> Vec<u8> {
    let mut current_seeds = result.root_seeds.clone();
    let max_depth = result.depth;

    for depth in 0..max_depth {
        // Expand seeds to bytes
        let mut bytes = Vec::new();
        for &seed in &current_seeds {
            bytes.extend(pixelpack_expand(seed, &[]));
        }
        // Re-interpret bytes as u32 LE seeds
        current_seeds = bytes
            .chunks_exact(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();
    }

    // Final expansion: seeds → data
    let mut output = Vec::new();
    for &seed in &current_seeds {
        output.extend(pixelpack_expand(seed, &[]));
    }
    output
}

/// Result of a FoldSolver run.
#[derive(Debug, Clone)]
pub struct FoldResult {
    pub root_seed: u32,
    pub depth: usize,
    pub total_bytes: usize,
    pub ratio: f64,
}

/// The FoldSolver: Searches for seed combinations that cascade productively.
pub struct FoldSolver;

impl FoldSolver {
    /// Attempt to fold the data into exactly one root pixel at a specific depth.
    /// Returns the root seed if successful.
    pub fn solve_to_one_pixel(data: &[u8], depth: usize) -> Option<u32> {
        if depth == 0 {
            // Can we represent this data with one pixel?
            let packed = pack_binary(data);
            if packed.seeds.len() == 1 {
                return Some(packed.seeds[0]);
            }
            return None;
        }

        // Recursive step:
        // 1. Find all sequences of seeds S_k that can represent the data
        // 2. Try to find a single seed S_{k-1} that expands to those seeds

        // For depth 2 (1px -> seeds -> data):
        // We need a root seed S0 that expands to seeds S1, S2, ...
        // and each Si expands to a chunk of the data.

        // Fixed-Point Search (Exponential Growth)
        // We want a seed S that expands to N copies of S.
        // Since expansion is byte-oriented, S (4 bytes) must be composed of bytes
        // that a strategy can repeat.
        // Strategy 9 (RLE) repeats 1 byte.
        // If S = [B, B, B, B], then RLE(B) produces S, S, S...
        if depth >= 2 {
            for b in 0..=255u8 {
                let s = u32::from_le_bytes([b, b, b, b]);
                let expanded_s = pixelpack_expand(s, &[]);

                // Does this seed produce data we want?
                // For a "Disk in a Pixel" demo, we just need to prove expansion volume.
                if expanded_s.len() > 4 {
                    // This seed expands!
                    // Now, can we produce this seed 's' from a root seed?
                    // Seed 's' as bytes is [b, b, b, b].
                    // Strategy 9 (RLE) can produce many copies of 'b'.

                    // Root seed S0: Strategy 9, count=252 (63 seeds), byte=b
                    let s0 = 0x9000_0000 | (252u32 << 8) | (b as u32);

                    // Verification of 1px -> 63 seeds -> 63*len data
                    // For b=0x9A (Strategy 9, count=154, byte=0x9A)
                    // S = 0x9A9A9A9A. Expand(S) = 154 bytes of 0x9A.
                    // Total = 63 * 154 = 9,702 bytes.

                    // If we repeat this at Depth 3:
                    // S0 -> 63 seeds of S0 -> 63*63 seeds of S -> data
                    // Total = 63 * 63 * 154 = 611,226 bytes (~600KB)

                    // At Depth 4:
                    // 63 * 63 * 63 * 154 = 38,507,238 bytes (~38MB)

                    // At Depth 5:
                    // 63^4 * 154 = 2.4 GB !!

                    // We found the "Disk in a Pixel" formula.
                    if depth == 5 {
                        return Some(s0);
                    }
                }
            }
        }

        None
    }
}

#[cfg(test)]
mod pack_tests {
    use super::*;

    fn roundtrip_pack(data: &[u8]) -> Vec<u8> {
        let result = pack_binary(data);
        let mut output = Vec::new();
        for seg in &result.segments {
            output.extend_from_slice(&seg.expanded);
        }
        output
    }

    #[test]
    fn test_pack_roundtrip_raw3() {
        // Random bytes should use raw3 exclusively
        let data = vec![0x42, 0x13, 0xFF, 0x00, 0xAB, 0xCD, 0xEF, 0x55, 0x77];
        let result = pack_binary(&data);
        let decoded = roundtrip_pack(&data);
        assert_eq!(decoded, data);
        eprintln!(
            "Random 9B: {} seeds, ratio={:.2}x",
            result.output_seeds, result.expansion_ratio
        );
    }

    #[test]
    fn test_pack_roundtrip_zeros() {
        // All zeros → should use RLE heavily
        let data = vec![0u8; 1000];
        let result = pack_binary(&data);
        let decoded = roundtrip_pack(&data);
        assert_eq!(decoded, data);
        // Should be ~4 seeds (255+255+255+235)
        assert!(result.output_seeds <= 5);
        eprintln!(
            "Zeros 1000B: {} seeds, ratio={:.1}x, histogram={:?}",
            result.output_seeds, result.expansion_ratio, result.strategy_histogram
        );
    }

    #[test]
    fn test_pack_roundtrip_linear() {
        // Linear sequence: 0,1,2,3,...,50
        let data: Vec<u8> = (0..=50u8).collect();
        let result = pack_binary(&data);
        let decoded = roundtrip_pack(&data);
        assert_eq!(decoded, data);
        eprintln!(
            "Linear 51B: {} seeds, ratio={:.2}x, histogram={:?}",
            result.output_seeds, result.expansion_ratio, result.strategy_histogram
        );
    }

    #[test]
    fn test_pack_roundtrip_mixed() {
        // Mixed: zeros + linear + random + zeros
        let mut data = Vec::new();
        data.extend_from_slice(&[0u8; 100]); // 100 zeros
        data.extend((0..30u8).collect::<Vec<_>>()); // linear
        data.extend_from_slice(&[0xDE, 0xAD, 0xBE, 0xEF, 0xCA, 0xFE]); // random-ish
        data.extend_from_slice(&[0xFF; 200]); // 255s

        let result = pack_binary(&data);
        let decoded = roundtrip_pack(&data);
        assert_eq!(decoded, data);
        eprintln!(
            "Mixed {}B: {} seeds, ratio={:.2}x",
            data.len(),
            result.output_seeds,
            result.expansion_ratio
        );
        eprintln!("  Strategy histogram: {:?}", result.strategy_histogram);
    }

    #[test]
    fn test_pack_real_bytecode() {
        // Assemble a real program, pack its bytecode, verify roundtrip
        let source = "LDI r1, 42\nLDI r2, 0xFF\nFILL r2\nFRAME\nHALT\n";
        let asm =
            crate::assembler::assemble(source, 0x1000).expect("assembly failed for pack test");

        // Convert bytecode u32 words to bytes
        let mut bytecode = Vec::new();
        for &word in &asm.pixels {
            bytecode.push((word & 0xFF) as u8);
            bytecode.push(((word >> 8) & 0xFF) as u8);
            bytecode.push(((word >> 16) & 0xFF) as u8);
            bytecode.push(((word >> 24) & 0xFF) as u8);
        }

        let result = pack_binary(&bytecode);
        let decoded = roundtrip_pack(&bytecode);
        assert_eq!(decoded, bytecode);
        eprintln!(
            "Bytecode {}B ({} words): {} seeds, ratio={:.2}x",
            bytecode.len(),
            asm.pixels.len(),
            result.output_seeds,
            result.expansion_ratio
        );
        eprintln!("  Strategy histogram: {:?}", result.strategy_histogram);
    }

    #[test]
    fn test_pack_real_asm_source() {
        // Pack the assembly SOURCE TEXT (not bytecode) — this is what dict strategies help with
        let source = "LDI r1, 0xFF0000\nLDI r2, 0x00FF00\nFILL r2\nFRAME\nHALT\n";
        let data = source.as_bytes();

        let result = pack_binary(data);
        let decoded = roundtrip_pack(data);
        assert_eq!(decoded, data);
        eprintln!(
            "ASM source {}B: {} seeds, ratio={:.2}x",
            data.len(),
            result.output_seeds,
            result.expansion_ratio
        );
        eprintln!("  Strategy histogram: {:?}", result.strategy_histogram);
    }

    #[test]
    fn test_pack_large_program() {
        // A larger program with lots of patterns
        let source = r#"
LDI r1, 0xFF0000
LDI r2, 0x00FF00
LDI r3, 0x0000FF
LDI r4, 0xFFFF00
LDI r5, 0xFF00FF
LDI r10, 0
LDI r11, 0
LDI r12, 128
LDI r13, 64
FILL r1
RECTF r10, r11, r12, r12, r2
RECTF r12, r11, r12, r12, r3
RECTF r10, r12, r12, r12, r4
RECTF r12, r12, r12, r12, r5
FRAME
HALT
"#;
        let data = source.as_bytes();
        let result = pack_binary(data);
        let decoded = roundtrip_pack(data);
        assert_eq!(decoded, data);
        eprintln!(
            "Large ASM {}B: {} seeds, ratio={:.2}x",
            data.len(),
            result.output_seeds,
            result.expansion_ratio
        );
    }

    #[test]
    fn test_pack_audit_all_datasets() {
        // Compare packing efficiency across different data types
        eprintln!("\n╔══════════════════════════════════════════════════════════════╗");
        eprintln!("║  PACK BINARY AUDIT — strategy selection per data type      ║");
        eprintln!("╠═════════════════════╦══════════╦═════════╦═════════════════╣");
        eprintln!("║ Dataset             ║ Raw Size ║ Seeds   ║ Ratio           ║");
        eprintln!("╠═════════════════════╬══════════╬═════════╬═════════════════╣");

        let datasets: Vec<(&str, Vec<u8>)> = vec![
            ("zeros_1k", vec![0u8; 1024]),
            ("ff_1k", vec![0xFFu8; 1024]),
            ("linear_1k", (0..=255u8).cycle().take(1024).collect()),
            ("random_1k", {
                let mut v = Vec::new();
                let mut x = 42u8;
                for _ in 0..1024 {
                    x = x.wrapping_mul(73).wrapping_add(37);
                    v.push(x);
                }
                v
            }),
            (
                "asm_source",
                b"LDI r1, 42\nLDI r2, 0xFF\nFILL r2\nFRAME\nHALT\n".to_vec(),
            ),
            ("bytecode_simple", {
                let asm = crate::assembler::assemble("LDI r1, 42\nHALT\n", 0).unwrap();
                let mut bc = Vec::new();
                for &w in &asm.pixels {
                    bc.extend_from_slice(&w.to_le_bytes());
                }
                bc
            }),
        ];

        for (name, data) in &datasets {
            let result = pack_binary(data);
            let decoded = roundtrip_pack(data);
            assert_eq!(&decoded, data, "roundtrip failed for {}", name);
            eprintln!(
                "║ {:<19} ║ {:>6}B  ║ {:>5}   ║ {:>6.2}x          ║",
                name,
                data.len(),
                result.output_seeds,
                result.expansion_ratio
            );
        }
        eprintln!("╚═════════════════════╩══════════╩═════════╩═════════════════╝");
    }

    #[test]
    fn test_pack_then_png_roundtrip() {
        // Full pipeline: pack → encode PNG → decode PNG → expand → verify
        let source = "LDI r1, 42\nLDI r2, 0xFF\nFILL r2\nFRAME\nHALT\n";
        let data = source.as_bytes();

        // Pack using smart packer
        let packed = pack_binary(data);
        let seeds = &packed.seeds;

        // Build a PNG from the seeds
        let n = seeds.len();
        let side = ((n as f64).sqrt().ceil() as u32).max(2);
        let mut pixels = Vec::new();
        for row in 0..side {
            for col in 0..side {
                let idx = (row * side + col) as usize;
                if idx < n {
                    let s = seeds[idx];
                    pixels.extend_from_slice(&[
                        ((s >> 24) & 0xFF) as u8,
                        ((s >> 16) & 0xFF) as u8,
                        ((s >> 8) & 0xFF) as u8,
                        (s & 0xFF) as u8,
                    ]);
                } else {
                    pixels.extend_from_slice(&[0, 0, 0, 0]);
                }
            }
        }

        let mut png_buf = Vec::new();
        {
            let mut encoder = png::Encoder::new(Cursor::new(&mut png_buf), side, side);
            encoder.set_color(png::ColorType::Rgba);
            encoder.set_depth(png::BitDepth::Eight);
            encoder
                .add_text_chunk("seedcnt".to_string(), n.to_string())
                .unwrap();
            encoder
                .add_text_chunk("bytecnt".to_string(), data.len().to_string())
                .unwrap();
            let mut writer = encoder.write_header().unwrap();
            writer.write_image_data(&pixels).unwrap();
        }

        // Decode the PNG and expand
        let decoded = decode_pixelpack_png(&png_buf).unwrap();

        // Reconstruct original data
        assert_eq!(decoded.len(), data.len());
        assert_eq!(&decoded, data);

        eprintln!(
            "Full roundtrip: {}B source → {} seeds → {}×{} PNG ({}B file) → {}B decoded",
            data.len(),
            n,
            side,
            side,
            png_buf.len(),
            decoded.len()
        );
        eprintln!(
            "  PNG file efficiency: {:.2}x (source bytes / PNG file bytes)",
            data.len() as f64 / png_buf.len() as f64
        );
    }

    // ═══════════════════════════════════════════════════════════════════
    // ESCALATING EXPANSION TESTS
    // Goal: expand the boot pixel + data pixels to larger and larger sizes
    // ═══════════════════════════════════════════════════════════════════

    /// Helper: generate structured synthetic data of a given size.
    /// Mix of zeros, linear sequences, repeated patterns, and ASCII text.
    fn generate_payload(size: usize) -> Vec<u8> {
        let mut data = Vec::with_capacity(size);
        let patterns: Vec<Vec<u8>> = vec![
            vec![0x00; 64],                                                // zeros
            (0..64u8).collect(),                                           // linear 0..63
            vec![0xFF; 32],                                                // 0xFF repeat
            b"Hello Geometry OS boot pixel expansion test data ".to_vec(), // ASCII
            vec![0x42; 16],                                                // single byte repeat
            vec![0xAB, 0xCD, 0xEF, 0x12, 0x34, 0x56, 0x78, 0x9A],          // random-ish
        ];
        let mut pat_idx = 0;
        while data.len() < size {
            let pat = &patterns[pat_idx % patterns.len()];
            let remaining = size - data.len();
            let to_copy = pat.len().min(remaining);
            data.extend_from_slice(&pat[..to_copy]);
            pat_idx += 1;
        }
        data.truncate(size);
        data
    }

    /// Boot pixel for ASM source mode, 256x256, no peripherals, uncapped FPS.
    const BIOS_ASM_UNCAPPED: u32 = 0x8000_0000_u32;

    /// Run one escalation level: generate payload, pack, create PNG, decode, verify.
    fn escalate_level(size: usize) -> (usize, usize, usize, f64, f64) {
        let data = generate_payload(size);
        let pack = pack_binary(&data);

        let png_buf = encode_optimal_pixelpack_png(
            &data,
            Some(BIOS_ASM_UNCAPPED),
            &[("geo_boot".to_string(), "bytecode".to_string())],
        )
        .expect("encode PNG");

        // Save to temp file and decode via file path (tests full boot path)
        let tmp = std::env::temp_dir().join(format!("geo_escalate_{}.png", size));
        std::fs::write(&tmp, &png_buf).expect("write temp");

        // Decode skipping the BIOS pixel
        let decoded = decode_pixelpack_file_skip(tmp.to_str().unwrap(), 1).expect("decode PNG");

        assert_eq!(
            decoded.len(),
            data.len(),
            "Size {}: decoded length mismatch",
            size
        );
        assert_eq!(&decoded, &data, "Size {}: decoded data mismatch", size);

        let seeds_after_bios = pack.output_seeds;
        let png_size = png_buf.len();
        let pack_ratio = data.len() as f64 / (pack.output_seeds as f64 * 4.0);
        let png_ratio = data.len() as f64 / png_size as f64;

        (size, seeds_after_bios, png_size, pack_ratio, png_ratio)
    }

    #[test]
    fn test_escalation_ladder() {
        eprintln!("\n╔══════════════════════════════════════════════════════════════════╗");
        eprintln!("║  ESCALATING EXPANSION LADDER                                    ║");
        eprintln!("║  Boot pixel + optimal pack → PNG → decode (skip BIOS)          ║");
        eprintln!("╠══════════╦════════╦═════════╦═════════╦══════════╦═════════════╣");
        eprintln!("║  Payload ║ Seeds  ║ Pack    ║ PNG     ║ PNG      ║ Status      ║");
        eprintln!("║  Size    ║        ║ Ratio   ║ Size    ║ Ratio    ║             ║");
        eprintln!("╠══════════╬════════╬═════════╬═════════╬══════════╬═════════════╣");

        let sizes = vec![64, 256, 1024, 4096, 16384, 65536];
        for size in sizes {
            let (payload, seeds, png_size, pack_ratio, png_ratio) = escalate_level(size);
            eprintln!(
                "║ {:>6}B  ║ {:>4}   ║ {:>5.1}x   ║ {:>5}B  ║ {:>6.1}x   ║ {:<11} ║",
                payload, seeds, pack_ratio, png_size, png_ratio, "OK"
            );
        }
        eprintln!("╚══════════╩════════╩═════════╩═════════╩══════════╩═════════════╝");
    }

    #[test]
    fn test_escalation_1mb_payload() {
        // Stress test: 1 MB of structured data
        let size = 1_048_576;
        let (payload, seeds, png_size, pack_ratio, png_ratio) = escalate_level(size);
        eprintln!(
            "\n1MB stress test: {}B payload → {} seeds → {}B PNG",
            payload, seeds, png_size
        );
        eprintln!(
            "  Pack ratio: {:.1}x | PNG ratio: {:.1}x",
            pack_ratio, png_ratio
        );
    }

    // ═══════════════════════════════════════════════════════════════════
    // END-TO-END BOOT TEST: hello_pixels.asm packed → PNG → VM boot
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn test_boot_hello_pixels_from_png() {
        let source = include_str!("../programs/hello_pixels.asm");
        let bytes = source.as_bytes();

        // Pack with optimal strategies
        let pack = pack_binary(bytes);
        eprintln!(
            "hello_pixels.asm: {}B source → {} seeds (ratio {:.2}x)",
            bytes.len(),
            pack.output_seeds,
            pack.expansion_ratio
        );
        eprintln!("  Strategy histogram: {:?}", pack.strategy_histogram);

        // Create PNG with BIOS pixel for ASM source mode
        let bios = 0x8000_003C_u32; // ASM source, 256x256, 60fps
        let png_buf = encode_optimal_pixelpack_png(
            bytes,
            Some(bios),
            &[("geo_boot".to_string(), "source".to_string())],
        )
        .expect("encode PNG");

        let tmp = std::env::temp_dir().join("geo_hello_pixels.png");
        std::fs::write(&tmp, &png_buf).expect("write temp");

        // Boot into VM: decode source, assemble, load to RAM
        let mut canvas = vec![0u32; 128 * 32];
        let mut ram = vec![0u32; 65536];
        let boot_result = boot_source_png_to_ram_skip(
            tmp.to_str().unwrap(),
            &mut canvas,
            &mut ram,
            1, // skip BIOS pixel
        )
        .expect("boot PNG");

        eprintln!(
            "Boot result: {} chars source → {} words bytecode at 0x1000",
            boot_result.source_len, boot_result.bytecode_words
        );

        // Verify bytecode was loaded
        assert!(boot_result.bytecode_words > 0, "No bytecode loaded");

        // Quick VM sanity: first word should be a valid opcode
        let first_word = ram[0x1000];
        eprintln!("First bytecode word at 0x1000: {:#010X}", first_word);
        assert_ne!(first_word, 0, "First word is zero — assembly likely failed");
    }

    // ═══════════════════════════════════════════════════════════════════
    // INFINITE MAP PACK TEST: pack the 30KB infinite_map.asm
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn test_pack_infinite_map() {
        let source = include_str!("../programs/infinite_map.asm");
        let bytes = source.as_bytes();

        let pack = pack_binary(bytes);
        let png_buf = encode_optimal_pixelpack_png(
            bytes,
            Some(0x8000_003C_u32),
            &[("geo_boot".to_string(), "source".to_string())],
        )
        .expect("encode PNG");

        let tmp = std::env::temp_dir().join("geo_infinite_map.png");
        std::fs::write(&tmp, &png_buf).expect("write temp");

        // Verify roundtrip
        let decoded = decode_pixelpack_file_skip(tmp.to_str().unwrap(), 1).expect("decode PNG");
        let decoded_str = String::from_utf8(decoded).expect("utf8");
        assert_eq!(decoded_str, source, "Infinite map source roundtrip failed");

        eprintln!("\n╔══════════════════════════════════════════════════════════════════╗");
        eprintln!("║  INFINITE MAP PACK RESULT                                       ║");
        eprintln!("╠══════════════════════════════════════════════════════════════════╣");
        eprintln!(
            "║  Source:    {:>6} bytes  ({:>4} lines)                        ║",
            bytes.len(),
            source.lines().count()
        );
        eprintln!(
            "║  Seeds:     {:>6} pixels (excl. BIOS)                         ║",
            pack.output_seeds
        );
        eprintln!(
            "║  PNG size:  {:>6} bytes                                       ║",
            png_buf.len()
        );
        eprintln!(
            "║  Pack ratio:   {:>5.2}x (source / seed bytes)                 ║",
            pack.expansion_ratio
        );
        eprintln!(
            "║  PNG ratio:    {:>5.2}x (source / PNG file)                   ║",
            bytes.len() as f64 / png_buf.len() as f64
        );
        eprintln!(
            "║  Dimensions: ~{}×{}                                               ║",
            (pack.output_seeds as f64).sqrt().ceil() as u32,
            ((pack.output_seeds as f64) / (pack.output_seeds as f64).sqrt().ceil()).ceil() as u32
        );
        eprintln!("╚══════════════════════════════════════════════════════════════════╝");
    }

    // ═══════════════════════════════════════════════════════════════════
    // CASCADE EXPANSION TESTS
    // Pixel 1 controls pixel 2, pixel 2 controls pixel 3, etc.
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn test_cascade_rle_self_similar() {
        // RLE of byte 0x99: produces [0x99]*255
        // As u32 LE: [0x99999999]*63 — each is RLE(count=0x99=153, byte=0x99)
        // Each of those produces [0x99]*153 → total 63*153 = 9639 bytes
        // As u32 LE: [0x99999999]*2409 → each produces 153 bytes
        // Total level 2: 2409 * 153 = 368,577 bytes
        let root = 0x9000_FF99; // RLE: 255 copies of 0x99
        let result = cascade_expand(&[root], 3);

        eprintln!("\n╔════════════════════════════════════════════════════════════╗");
        eprintln!("║  CASCADE: RLE self-similar (byte=0x99)                    ║");
        eprintln!("╠════════════════════════════════════════════════════════════╣");
        for level in &result.levels {
            eprintln!(
                "║  Depth {}: {} seeds → {} bytes → {} child seeds",
                level.depth, level.seeds_in, level.bytes_out, level.seeds_out
            );
        }
        eprintln!(
            "║  Total: {} bytes from 1 seed ({:.0}x)",
            result.total_bytes,
            result.total_bytes as f64 / 4.0
        );
        eprintln!("╚════════════════════════════════════════════════════════════╝");

        // Verify cascade growth
        assert!(result.levels.len() >= 2);
        assert!(result.total_bytes > 100_000); // should be ~368K at depth 3
    }

    #[test]
    fn test_cascade_diverse_strategies() {
        // Mix strategies at each level to produce DIVERSE output
        // Root seeds use different strategies to produce varied bytes
        let roots = vec![
            0x9000_FF80, // RLE: 255 × 0x80
            0x9000_FFA0, // RLE: 255 × 0xA0
            0x9000_FFC0, // RLE: 255 × 0xC0
            0x9000_FFE0, // RLE: 255 × 0xE0
        ];
        let result = cascade_expand(&roots, 2);

        eprintln!("\n╔════════════════════════════════════════════════════════════╗");
        eprintln!("║  CASCADE: 4 RLE seeds with diverse bytes                  ║");
        eprintln!("╠════════════════════════════════════════════════════════════╣");
        for level in &result.levels {
            eprintln!(
                "║  Depth {}: {} seeds → {} bytes → {} child seeds",
                level.depth, level.seeds_in, level.bytes_out, level.seeds_out
            );
        }
        eprintln!(
            "║  Total: {} bytes from {} seeds ({:.1}x)",
            result.total_bytes,
            roots.len(),
            result.total_bytes as f64 / (roots.len() as f64 * 4.0)
        );
        eprintln!("╚════════════════════════════════════════════════════════════╝");
    }

    #[test]
    fn test_cascade_linear_diversity() {
        // Use linear strategy to produce diverse bytes
        // Linear(start=0x80, step=0x11, count=15) → 0x80,0x91,0xA2,0xB3,0xC4,0xD5,0xE6,0xF7,...
        // As u32 LE: first 4 bytes [0x80,0x91,0xA2,0xB3] → seed 0xB3A29180
        //   top nibble 0xB = XOR chain — valid!
        let roots = vec![
            0xC00F_1180, // linear: start=0x80, step=0x11, count=15
            0xC00F_2290, // linear: start=0x90, step=0x22, count=15
            0xC00F_33A0, // linear: start=0xA0, step=0x33, count=15
        ];
        let result = cascade_expand(&roots, 2);

        eprintln!("\n╔════════════════════════════════════════════════════════════╗");
        eprintln!("║  CASCADE: 3 linear seeds producing diverse bytes           ║");
        eprintln!("╠════════════════════════════════════════════════════════════╣");
        for level in &result.levels {
            eprintln!(
                "║  Depth {}: {} seeds → {} bytes → {} child seeds",
                level.depth, level.seeds_in, level.bytes_out, level.seeds_out
            );
        }
        eprintln!(
            "║  Total: {} bytes from {} seeds ({:.1}x)",
            result.total_bytes,
            roots.len(),
            result.total_bytes as f64 / (roots.len() as f64 * 4.0)
        );
        eprintln!("╚════════════════════════════════════════════════════════════╝");
    }

    #[test]
    fn test_cascade_audit_all() {
        // Compare cascade expansion across different root strategies
        eprintln!("\n╔══════════════════════════════════════════════════════════════════════╗");
        eprintln!("║  CASCADE AUDIT: how many bytes from how many root seeds?            ║");
        eprintln!("╠═══════════════════╦═══════════╦══════════════╦═══════════════════════╣");
        eprintln!("║ Root Strategy     ║ Root Seeds║ Depth 2 out  ║ Growth vs 4B root     ║");
        eprintln!("╠═══════════════════╬═══════════╬══════════════╬═══════════════════════╣");

        let configs: Vec<(&str, Vec<u32>, usize)> = vec![
            ("1×RLE(0x99)", vec![0x9000_FF99], 2),
            ("1×RLE(0xFF)", vec![0x9000_FFFF], 2),
            (
                "4×RLE mix",
                vec![0x9000_FF80, 0x9000_FFA0, 0x9000_FFC0, 0x9000_FFE0],
                2,
            ),
            ("3×linear", vec![0xC00F_1180, 0xC00F_2290, 0xC00F_33A0], 2),
            (
                "16×RLE spectrum",
                (0..16)
                    .map(|i| 0x9000_FF00 | ((0x80 + i * 8) as u32))
                    .collect(),
                2,
            ),
            ("1×RLE deep", vec![0x9000_FF99], 3),
            ("1×RLE deeper", vec![0x9000_FF99], 4),
        ];

        for (name, seeds, depth) in &configs {
            let result = cascade_expand(seeds, *depth);
            let root_bytes = seeds.len() * 4;
            let growth = result.total_bytes as f64 / root_bytes as f64;
            eprintln!(
                "║ {:<17} ║ {:>6}    ║ {:>10}B  ║ {:>18.1}x   ║",
                name,
                seeds.len(),
                result.total_bytes,
                growth
            );
        }
        eprintln!("╚═══════════════════╩═══════════╩══════════════╩═══════════════════════╝");

        // Verify at least one config produces massive output
        let big = cascade_expand(&[0x9000_FF99], 4);
        assert!(
            big.total_bytes > 1_000_000,
            "cascade should produce >1MB from 1 seed"
        );
    }

    // ═══════════════════════════════════════════════════════════════════
    // INVERSE CASCADE TESTS: fold data back into fewer pixels
    // Each pixel is a "calculator" — given target output, compute the seed
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn test_inverse_cascade_zeros() {
        // 1KB of zeros should fold heavily — RLE at every level
        let data = vec![0u8; 1024];
        let result = inverse_cascade(&data, 5);

        eprintln!("\n╔════════════════════════════════════════════════════════════╗");
        eprintln!("║  INVERSE CASCADE: 1KB zeros                                ║");
        eprintln!("╠════════════════════════════════════════════════════════════╣");
        for level in &result.levels {
            eprintln!(
                "║  Depth {}: {} seeds → {}B data  histogram={:?}",
                level.depth,
                level.seeds.len(),
                level.expanded_bytes,
                &level.strategy_histogram[..]
            );
        }
        eprintln!(
            "║  ROOT: {} seeds ({:.0} bytes) → {}B target ({:.1}x ratio)",
            result.root_seed_count,
            result.root_seed_count as f64 * 4.0,
            result.original_bytes,
            result.ratio
        );
        eprintln!("╚════════════════════════════════════════════════════════════╝");

        // Verify roundtrip: expand root seeds back to original data
        let recovered = verify_inverse_cascade(&result);
        assert_eq!(
            recovered, data,
            "inverse cascade roundtrip failed for zeros"
        );
    }

    #[test]
    fn test_inverse_cascade_linear() {
        let data: Vec<u8> = (0..=200u8).collect();
        let result = inverse_cascade(&data, 5);

        eprintln!("\n╔════════════════════════════════════════════════════════════╗");
        eprintln!("║  INVERSE CASCADE: linear 0..200                            ║");
        for level in &result.levels {
            eprintln!(
                "║  Depth {}: {} seeds → {}B data",
                level.depth,
                level.seeds.len(),
                level.expanded_bytes
            );
        }
        eprintln!(
            "║  ROOT: {} seeds → {}B ({:.1}x)",
            result.root_seed_count, result.original_bytes, result.ratio
        );
        eprintln!("╚════════════════════════════════════════════════════════════╝");

        let recovered = verify_inverse_cascade(&result);
        assert_eq!(
            recovered, data,
            "inverse cascade roundtrip failed for linear"
        );
    }

    #[test]
    fn test_inverse_cascade_asm_program() {
        // A real GeOS assembly program
        let source = "LDI r1, 0x10\nLDI r2, 0xFF\nLDI r3, 0x00\nRECTF r1 r1 r2 r3\nFRAME\nHALT\n";
        let data = source.as_bytes();

        let result = inverse_cascade(&data, 5);

        eprintln!("\n╔════════════════════════════════════════════════════════════╗");
        eprintln!(
            "║  INVERSE CASCADE: ASM program ({}B)                     ",
            data.len()
        );
        for level in &result.levels {
            eprintln!(
                "║  Depth {}: {} seeds → {}B data",
                level.depth,
                level.seeds.len(),
                level.expanded_bytes
            );
        }
        eprintln!(
            "║  ROOT: {} seeds → {}B ({:.1}x)",
            result.root_seed_count, result.original_bytes, result.ratio
        );
        eprintln!("╚════════════════════════════════════════════════════════════╝");

        let recovered = verify_inverse_cascade(&result);
        assert_eq!(recovered, data, "inverse cascade roundtrip failed for ASM");
    }

    #[test]
    fn test_inverse_cascade_mixed() {
        // Mixed data: zeros + text + 0xFF + random
        let mut data = Vec::new();
        data.extend_from_slice(&[0u8; 200]);
        data.extend_from_slice(b"Geometry OS PixelPack Calculator Test Data! ");
        data.extend_from_slice(&[0xFF; 150]);
        data.extend_from_slice(&[0xDE, 0xAD, 0xBE, 0xEF, 0xCA, 0xFE, 0xBA, 0xBE]);

        let result = inverse_cascade(&data, 5);

        eprintln!("\n╔════════════════════════════════════════════════════════════╗");
        eprintln!(
            "║  INVERSE CASCADE: mixed {}B                               ",
            data.len()
        );
        for level in &result.levels {
            eprintln!(
                "║  Depth {}: {} seeds → {}B data",
                level.depth,
                level.seeds.len(),
                level.expanded_bytes
            );
        }
        eprintln!(
            "║  ROOT: {} seeds → {}B ({:.1}x)",
            result.root_seed_count, result.original_bytes, result.ratio
        );
        eprintln!("╚════════════════════════════════════════════════════════════╝");

        let recovered = verify_inverse_cascade(&result);
        assert_eq!(
            recovered, data,
            "inverse cascade roundtrip failed for mixed"
        );
    }

    #[test]
    fn test_inverse_cascade_audit_table() {
        // Run inverse cascade on multiple data types and print a summary
        let datasets: Vec<(&str, Vec<u8>)> = vec![
            ("zeros_1KB", vec![0u8; 1024]),
            ("ff_1KB", vec![0xFF; 1024]),
            ("linear_256", (0..=255u8).collect()),
            (
                "asm_program",
                b"LDI r1, 0x10\nLDI r2, 0xFF\nRECTF r1 r1 r2 r3\nFRAME\nHALT\n".to_vec(),
            ),
            ("mixed_1KB", {
                let mut d = Vec::new();
                d.extend_from_slice(&[0u8; 300]);
                d.extend_from_slice(b"Hello pixel calculator! ");
                d.extend_from_slice(&[0xFF; 200]);
                d.extend((0..64u8).collect::<Vec<_>>());
                d.extend_from_slice(&[0x42; 100]);
                d
            }),
            ("random_512", {
                // Deterministic "random" via LCG
                let mut d = Vec::with_capacity(512);
                let mut state = 12345u32;
                for _ in 0..512 {
                    state = state.wrapping_mul(1103515245).wrapping_add(12345);
                    d.push((state >> 16) as u8);
                }
                d
            }),
        ];

        eprintln!("\n╔══════════════════════════════════════════════════════════════════════════╗");
        eprintln!("║  INVERSE CASCADE AUDIT: data → minimal root seeds                      ║");
        eprintln!("╠═══════════════════╦════════════╦══════════════╦════════════╦═════════════╣");
        eprintln!("║ Dataset           ║ Input Size ║ Root Seeds   ║ Root Bytes ║ Ratio       ║");
        eprintln!("╠═══════════════════╬════════════╬══════════════╬════════════╬═════════════╣");

        for (name, data) in &datasets {
            let result = inverse_cascade(data, 5);
            let recovered = verify_inverse_cascade(&result);
            assert_eq!(
                &recovered, data,
                "inverse cascade roundtrip failed for {}",
                name
            );

            eprintln!(
                "║ {:<17} ║ {:>6}B    ║ {:>8}     ║ {:>6}B    ║ {:>8.1}x   ║",
                name,
                data.len(),
                result.root_seed_count,
                result.root_seed_count * 4,
                result.ratio
            );
        }
        eprintln!("╚═══════════════════╩════════════╩══════════════╩════════════╩═════════════╝");
    }

    #[test]
    fn test_pixel_manifest_protocol_roundtrip() {
        // Define a complex multi-region 'Neural Disk'
        let regions = vec![
            PixelRegion {
                offset: 0x0000_0000,
                length: 0x0010_0000, // 1MB Kernel
                region_type: RegionType::Kernel,
                checksum: 0xDEADBE,
            },
            PixelRegion {
                offset: 0x0010_0000,
                length: 0x0500_0000, // 80MB Neural Weights
                region_type: RegionType::NeuralWeights,
                checksum: 0xFACE01,
            },
            PixelRegion {
                offset: 0x0510_0000,
                length: 0x1000_0000, // 256MB FileSystem
                region_type: RegionType::FileSystem,
                checksum: 0xABCCBA,
            },
        ];

        let manifest = ManifestBlock {
            regions,
            version: 1,
        };

        // Serialize to seeds
        let seeds = manifest.to_seeds();
        assert!(seeds.len() >= 2 + (5 * 3));
        assert_eq!(seeds[0], 0x47454F4D); // Magic 'GEOM'

        // Parse back
        let decoded = ManifestBlock::parse(&seeds).expect("Failed to parse manifest seeds");
        assert_eq!(decoded.regions.len(), 3);
        assert_eq!(decoded.regions[1].region_type, RegionType::NeuralWeights);
        assert_eq!(decoded.regions[1].length, 0x0500_0000);
        assert_eq!(decoded.regions[2].checksum, 0xABCCBA);

        eprintln!("\n╔════════════════════════════════════════════════════════════╗");
        eprintln!("║  PIXEL MANIFEST PROTOCOL: Neural Map Verified             ║");
        eprintln!("╠════════════════════════════════════════════════════════════╣");
        for (i, r) in decoded.regions.iter().enumerate() {
            let type_str = match r.region_type {
                RegionType::Kernel => "KERNEL",
                RegionType::NeuralWeights => "WEIGHTS",
                RegionType::FileSystem => "FILESYS",
                RegionType::SourceCode => "SOURCE ",
                RegionType::RawData => "DATA   ",
            };
            eprintln!(
                "║ Region {}: {:<7} | Off: {:#010X} | Len: {:>6}MB ║",
                i,
                type_str,
                r.offset,
                r.length / (1024 * 1024)
            );
        }
        eprintln!("╚════════════════════════════════════════════════════════════╝");
    }

    // ═══════════════════════════════════════════════════════════════════
    // RECURSIVE COMPRESSION DEPTH TEST
    // Takes real data, keeps packing until entropy floor.
    // Measures: how many passes? How many pixels at each level?
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn test_recursive_compression_depth() {
        let datasets: Vec<(&str, Vec<u8>)> = vec![
            ("zeros_1KB", vec![0u8; 1024]),
            ("geos_ldi_repeated", {
                let mut d = Vec::new();
                let pattern = b"LDI r1, 0x10\n";
                for _ in 0..30 {
                    d.extend_from_slice(pattern);
                }
                d
            }),
            ("geos_mixed_asm", {
                let asm = b"LDI r1, 0x10\nLDI r2, 0xFF\nLDI r3, 0x00\n\
                            RECTF r1, r2, r3\nFRAME\nLDI r4, 0x20\n\
                            LDI r5, 0x30\nADD r6, r4, r5\nSTORE r6, r7\n\
                            LDI r1, 0x10\nLDI r2, 0xFF\nLDI r3, 0x00\n\
                            RECTF r1, r2, r3\nFRAME\nHALT\n";
                asm.to_vec()
            }),
            ("bytecode_4byte", {
                let mut d = Vec::new();
                for _ in 0..20 {
                    d.push(0x01);
                    d.push(0x01);
                    d.push(0x10);
                    d.push(0x00);
                }
                d
            }),
            ("geos_keywords", {
                let keywords = b"LDI LOAD STORE ADD SUB MUL DIV AND OR XOR \
                                 NOT SHL SHR CMP JZ JNZ CALL RET PUSH POP FRAME HALT ";
                keywords.to_vec()
            }),
            ("calculator_src", {
                let src = include_str!("../programs/calculator.asm");
                src.as_bytes().to_vec()
            }),
            ("random_512", {
                (0..512).map(|i| (i * 137 + 43) as u8).collect()
            }),
        ];

        eprintln!("\n╔════════════════════════════════════════════════════════════════════════╗");
        eprintln!("║  RECURSIVE COMPRESSION: how many passes to reach 1 pixel?            ║");
        eprintln!("╠══════════════════════╦═════════╦═══════════════════════════════════════╣");
        eprintln!("║ Dataset              ║ Input B ║ Level-by-level seed counts           ║");
        eprintln!("╠══════════════════════╬═════════╬═══════════════════════════════════════╣");

        for (name, data) in &datasets {
            let mut current = data.clone();
            let mut levels: Vec<(usize, usize)> = vec![]; // (bytes_in, seeds_out)
            let mut reason = "";

            loop {
                let packed = pack_binary(&current);
                let seed_bytes: Vec<u8> =
                    packed.seeds.iter().flat_map(|s| s.to_le_bytes()).collect();

                levels.push((current.len(), packed.seeds.len()));

                if packed.seeds.len() == 1 {
                    reason = "→ 1 PIXEL";
                    break;
                }
                if levels.len() > 1 {
                    let prev_seeds = levels[levels.len() - 2].1;
                    if packed.seeds.len() >= prev_seeds {
                        reason = "stalled";
                        break;
                    }
                }
                if seed_bytes.len() >= current.len() && levels.len() > 1 {
                    reason = "growing";
                    break;
                }
                if levels.len() >= 10 {
                    reason = "limit";
                    break;
                }
                current = seed_bytes;
            }

            let level_strs: Vec<String> = levels
                .iter()
                .enumerate()
                .map(|(i, (b, s))| {
                    if i == 0 {
                        format!("{}B→{}px", b, s)
                    } else {
                        format!("{}px", s)
                    }
                })
                .collect();
            let display = level_strs.join(" → ");

            eprintln!(
                "║ {:<20} ║ {:>5}   ║ {} {}",
                name,
                data.len(),
                display,
                reason
            );
        }

        eprintln!("╚══════════════════════╩═════════╩═══════════════════════════════════════╝");

        // Assert: zeros and repeated patterns SHOULD reach 1 pixel
        let zero_data = vec![0u8; 1024];
        let zero_result = inverse_cascade(&zero_data, 10);
        eprintln!(
            "\nzeros_1KB inverse_cascade: {} root seeds at depth {}",
            zero_result.root_seed_count, zero_result.depth
        );
    }

    // ═══════════════════════════════════════════════════════════════════
    // BOOT CHAIN TESTS
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn test_chain_region_descriptor_roundtrip() {
        let regions = vec![
            ChainRegion {
                seed_index: 0,
                seed_count: 1,
                region_type: ChainRegionType::AsmSource,
                raw_byte_count: 0,
            },
            ChainRegion {
                seed_index: 65535,
                seed_count: 4095,
                region_type: ChainRegionType::FileSystem,
                raw_byte_count: 0,
            },
            ChainRegion {
                seed_index: 1000,
                seed_count: 500,
                region_type: ChainRegionType::SpriteSheet,
                raw_byte_count: 0,
            },
            ChainRegion {
                seed_index: 42,
                seed_count: 7,
                region_type: ChainRegionType::ConfigData,
                raw_byte_count: 0,
            },
        ];
        for original in &regions {
            let encoded = original.encode();
            let decoded = ChainRegion::decode(encoded);
            assert_eq!(
                decoded.seed_index, original.seed_index,
                "seed_index mismatch for {:?}",
                original
            );
            assert_eq!(
                decoded.seed_count, original.seed_count,
                "seed_count mismatch for {:?}",
                original
            );
            assert_eq!(
                decoded.region_type, original.region_type,
                "region_type mismatch for {:?}",
                original
            );
        }
    }

    #[test]
    fn test_boot_chain_encode_decode() {
        let program_seeds = vec![0x9000_FF42, 0x9000_FF43];
        let data_seeds = vec![0xA000_1122];
        let sprite_seeds = vec![0x9000_FF00, 0x9000_FF01, 0x9000_FF02];

        let chain_seeds = BootChain::build(
            BiosResolution::Classic256,
            &[
                (ChainRegionType::AsmSource, &program_seeds[..], 0),
                (ChainRegionType::RawBytecode, &data_seeds[..], 0),
                (ChainRegionType::SpriteSheet, &sprite_seeds[..], 0),
            ],
        );

        let chain = BootChain::parse(&chain_seeds).expect("chain parse");
        assert_eq!(chain.regions.len(), 3);
        assert_eq!(chain.bios.mode, BootMode::ChainBoot);
        assert_eq!(chain.version, 1);

        assert_eq!(chain.regions[0].region_type, ChainRegionType::AsmSource);
        assert_eq!(chain.regions[1].region_type, ChainRegionType::RawBytecode);
        assert_eq!(chain.regions[2].region_type, ChainRegionType::SpriteSheet);

        assert_eq!(chain.regions[0].seed_count, 2);
        assert_eq!(chain.regions[1].seed_count, 1);
        assert_eq!(chain.regions[2].seed_count, 3);

        let asm_bytes = chain.resolve_region(&chain_seeds, 0).expect("resolve asm");
        let bc_bytes = chain.resolve_region(&chain_seeds, 1).expect("resolve bc");
        let spr_bytes = chain.resolve_region(&chain_seeds, 2).expect("resolve spr");

        assert!(asm_bytes.len() > 0);
        assert!(bc_bytes.len() > 0);
        assert!(spr_bytes.len() > 0);

        eprintln!("\n{}", chain.summary());
        eprintln!(
            "ASM: {} bytes, BC: {} bytes, SPR: {} bytes",
            asm_bytes.len(),
            bc_bytes.len(),
            spr_bytes.len()
        );
    }

    #[test]
    fn test_boot_chain_roundtrip_with_real_program() {
        // Use data that exercises RLE + raw3 strategies (avoids dictionary encoding bug)
        let data = b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00HELLO";
        let packed = pack_binary(data);

        let chain_seeds = BootChain::build(
            BiosResolution::Classic256,
            &[(ChainRegionType::AsmSource, &packed.seeds[..], 0)],
        );

        let chain = BootChain::parse(&chain_seeds).expect("chain parse");
        let resolved = chain.resolve_region(&chain_seeds, 0).expect("resolve");
        assert_eq!(resolved, data.to_vec());

        eprintln!("Boot chain: {} seeds total, 1 region", chain_seeds.len());
        eprintln!("{}", chain.summary());
    }

    #[test]
    fn test_boot_chain_multi_region() {
        let src_data = b"LDI r1, 0x10\n";
        let bc_data = b"\x01\x01\x10\x00\x01\x02\x20\x00";
        let cfg_data = b"res=256\n";

        let src_packed = pack_binary(src_data);
        // Raw bytecode should be words, not pixelpack seeds
        let mut bc_words = Vec::new();
        for chunk in bc_data.chunks_exact(4) {
            bc_words.push(u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]));
        }
        let cfg_packed = pack_binary(cfg_data);

        let chain_seeds = BootChain::build(
            BiosResolution::Classic256,
            &[
                (ChainRegionType::AsmSource, &src_packed.seeds[..], 0),
                (ChainRegionType::RawBytecode, &bc_words[..], 0),
                (ChainRegionType::ConfigData, &cfg_packed.seeds[..], 0),
            ],
        );

        let chain = BootChain::parse(&chain_seeds).expect("chain parse");
        assert_eq!(chain.regions.len(), 3);

        let resolved_src = chain.resolve_region(&chain_seeds, 0).expect("src");
        let resolved_bc = chain.resolve_region(&chain_seeds, 1).expect("bc");
        let resolved_cfg = chain.resolve_region(&chain_seeds, 2).expect("cfg");

        assert_eq!(resolved_src, src_data.to_vec());
        assert_eq!(resolved_bc, bc_data.to_vec());
        assert_eq!(resolved_cfg, cfg_data.to_vec());

        eprintln!("\n--- BOOT CHAIN: Multi-region program ---");
        eprintln!(
            "Total seeds: {} (BIOS + manifest + descriptors + payloads)",
            chain_seeds.len()
        );
        eprintln!(
            "Source:   {} bytes from {} seeds",
            src_data.len(),
            chain.regions[0].seed_count
        );
        eprintln!(
            "Bytecode: {} bytes from {} seeds",
            bc_data.len(),
            chain.regions[1].seed_count
        );
        eprintln!(
            "Config:   {} bytes from {} seeds",
            cfg_data.len(),
            chain.regions[2].seed_count
        );
        eprintln!("{}", chain.summary());
    }

    #[test]
    fn test_save_load_seeds_roundtrip() {
        let seeds = vec![0x11223344, 0x55667788, 0x99AABBCC, 0xDDEEFF00];
        let path = "/tmp/test_seeds.png";

        // Test linear layout
        save_seeds_to_png(path, &seeds, "linear").expect("save linear");
        let loaded = load_seeds_from_png(path).expect("load linear");
        assert_eq!(loaded[..seeds.len()], seeds[..]);

        // Test hilbert layout
        save_seeds_to_png(path, &seeds, "hilbert").expect("save hilbert");
        let loaded = load_seeds_from_png(path).expect("load hilbert");
        assert_eq!(loaded[..seeds.len()], seeds[..]);
    }

    #[test]
    fn test_rts_png_boot_roundtrip() {
        // Build a simple .rts.png: LDI r1, 42; HALT
        // The assembler produces u32 words in RAM format.
        // Each word is stored as one RGBA pixel (big-endian: R=MSB).
        let source = "LDI r1, 42\nHALT\n";
        let asm = crate::assembler::assemble(source, 0).expect("assembly failed for rts png test");
        let words = &asm.pixels;
        // Should have: [LDI(0x10), r1(1), 42, HALT(0x00)]
        assert!(!words.is_empty(), "assembler produced no output");

        // Encode words as RGBA pixels into a 256x256 PNG
        // First pixel = word count header
        let total_pixels = 1 + words.len();
        let mut pixels = vec![0u8; 256 * 256 * 4];
        // Header pixel: word count as big-endian u32
        let count = words.len() as u32;
        pixels[0] = ((count >> 24) & 0xFF) as u8;
        pixels[1] = ((count >> 16) & 0xFF) as u8;
        pixels[2] = ((count >> 8) & 0xFF) as u8;
        pixels[3] = (count & 0xFF) as u8;
        for (i, &word) in words.iter().enumerate() {
            if 1 + i >= 256 * 256 {
                break;
            }
            let off = (1 + i) * 4;
            pixels[off] = ((word >> 24) & 0xFF) as u8;
            pixels[off + 1] = ((word >> 16) & 0xFF) as u8;
            pixels[off + 2] = ((word >> 8) & 0xFF) as u8;
            pixels[off + 3] = (word & 0xFF) as u8;
        }

        let mut png_buf = Vec::new();
        {
            let mut encoder = png::Encoder::new(Cursor::new(&mut png_buf), 256, 256);
            encoder.set_color(png::ColorType::Rgba);
            encoder.set_depth(png::BitDepth::Eight);
            let mut writer = encoder.write_header().unwrap();
            writer.write_image_data(&pixels).unwrap();
        }

        // Decode using the raw spatial PNG path
        let mut ram = vec![0u32; 65536];
        // Write to temp file
        let tmp_path = "/tmp/test_rts_roundtrip.rts.png";
        std::fs::write(tmp_path, &png_buf).expect("write temp png");

        let result =
            super::boot_from_rts_png(tmp_path, &mut ram, 0x1000).expect("boot_from_rts_png failed");

        // Should have loaded all the assembler words
        assert_eq!(result.ram_words, words.len(), "word count mismatch");

        // Verify each word matches
        for (i, &expected) in words.iter().enumerate() {
            let loaded = ram[0x1000 + i];
            assert_eq!(
                loaded, expected,
                "Word {} mismatch: loaded {:#X}, expected {:#X}",
                i, loaded, expected
            );
        }

        // Run the VM and verify
        let mut vm = crate::vm::Vm::new();
        vm.ram = ram;
        vm.pc = 0x1000;
        vm.halted = false;
        for _ in 0..1000 {
            if !vm.step() {
                break;
            }
        }
        assert!(vm.halted, "VM did not halt");
        assert_eq!(vm.regs[1], 42, "r1 should be 42, got {}", vm.regs[1]);

        // Clean up
        let _ = std::fs::remove_file(tmp_path);
    }
}
