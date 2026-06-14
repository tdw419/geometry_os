# Phase 203+: Binary Memory Palace Extension

**Goal:** Enable Memory Palace to store, retrieve, and convert binary data (ELF, BIOS ROM, disk images, firmware) with hex/base64/pixel encoding support.

## Why This Matters

Current Memory Palace stores only JSON/text metadata. Binary data (kernels, bootloaders, firmware, disk images) must be kept in external files. This limits:
- Self-contained boot chains (all components in Memory Palace)
- Spatial firmware management
- Binary application distribution
- "Screen as the Hard Drive" vision for ALL data, not just programs

## Design

### 1. Binary Metadata Format

```rust
// New field in ExportedBuilding
pub struct BinaryMetadata {
    /// Format type: "elf", "bios_rom", "disk_image", "raw", "pixelpack"
    pub format: String,
    
    /// Encoding: "base64", "hex", "pixels", "raw"
    pub encoding: String,
    
    /// Binary payload (base64 or hex encoded for JSON safety)
    pub data: String,
    
    /// Optional metadata
    pub entry_point: Option<String>,  // e.g., "0x80000000"
    pub architecture: Option<String>, // "x86_64", "riscv64", "arm"
    pub size_bytes: u64,
    pub checksum: String, // FNV-1a hash
}
```

### 2. Encoding Strategies

| Encoding | Best For | When To Use |
|----------|----------|-------------|
| **base64** | JSON metadata, small binaries (<1MB) | Default for building metadata |
| **hex** | Pixel-native hex strings, medium binaries | Firmware patches, bootloader images |
| **pixels** | Large binaries via pixelpack compression | Disk images, kernels, ROMs |
| **raw** | Coordinate metadata, chunked storage | Very large files stored across coordinates |

### 3. Binary ↔ Conversion API

```rust
impl BinaryMetadata {
    /// Load from file path
    pub fn from_file(path: &Path, format: &str, encoding: &str) -> Result<Self>;
    
    /// Convert between encodings
    pub fn convert_encoding(&mut self, to_encoding: &str) -> Result<()>;
    
    /// Extract to temporary file
    pub fn extract_to_temp(&self) -> Result<PathBuf>;
    
    /// Write directly to RAM
    pub fn inject_to_ram(&self, vm: &mut Vm, base_addr: u32) -> Result<()>;
}

// Hex ↔ Binary
pub fn hex_to_binary(hex: &str) -> Result<Vec<u8>>;
pub fn binary_to_hex(data: &[u8]) -> String;

// Base64 ↔ Binary
pub fn base64_to_binary(b64: &str) -> Result<Vec<u8>>;
pub fn binary_to_base64(data: &[u8]) -> String;

// Pixel ↔ Binary (via pixelpack)
pub fn binary_to_pixels(data: &[u8]) -> Result<Vec<u32>>;
pub fn pixels_to_binary(pixels: &[u32]) -> Result<Vec<u8>>;
```

### 4. Memory Palace Storage Patterns

#### Pattern A: Small binaries in building metadata (default)
```json
{
  "id": 42,
  "type": "firmware",
  "name": "BIOS ROM",
  "binary_metadata": {
    "format": "bios_rom",
    "encoding": "base64",
    "data": "UkU0/..."  // 64KB BIOS as base64
  }
}
```

#### Pattern B: Large binaries via pixelpack
```json
{
  "id": 43,
  "type": "disk",
  "name": "ubuntu-disk.img",
  "binary_metadata": {
    "format": "disk_image",
    "encoding": "pixels",
    "data_reference": "coordinate_range:0x10000-0x1FFFF",
    "size_bytes": 2147483648  // 2GB
  }
}
```

Binary data stored as pixel chain at coordinates, reference in metadata.

#### Pattern C: Chunked storage (for very large files)
```json
{
  "id": 44,
  "type": "archive",
  "name": "ubuntu-24.04.iso",
  "binary_chunks": [
    {"offset": 0, "length": 1048576, "coords": "0x20000-0x3FFFF"},
    {"offset": 1048576, "length": 1048576, "coords": "0x40000-0x5FFFF"},
    ...
  ]
}
```

## Deliverables

### 1. Binary Metadata Extension
- [x] 203b.d1.1 Add `BinaryMetadata` struct to `src/export.rs`
- [x] 203b.d1.2 Extend `ExportedBuilding` with optional `binary_data` field
- [x] 203b.d1.3 Update JSON serialization to include binary metadata
  _Files: src/export.rs_
  _~150 LOC_

### 2. Encoding Conversion Utilities
- [x] 203b.d2.t1 Hex ↔ Binary conversion (`hex_to_binary`, `binary_to_hex`) (`hex_to_binary`, `binary_to_hex`)
- [x] 203b.d2.t2 Base64 ↔ Binary conversion (`base64_to_binary`, `binary_to_base64`)
- [x] 203b.d2.t3 Pixel ↔ Binary conversion (via pixelpack PNG encoding)
  _Files: src/encoding.rs (new), src/mcp_server.rs, src/main.rs_
  _~200 LOC_

### 3. Binary Import/Export API
- [x] 203b.d3.t1 Load binary file into building metadata (CLI: `import_binary <path> <building_id> [format] [encoding]`)
  - CLI command: `import_binary <file> <building_id> <format> <encoding>`
- [x] 203b.d3.t2 Export binary from building to file (CLI: `export_binary <building_id> <output_path>` - stub implemented)
  - CLI command: `export_binary <building_id> <output_path>`
- [x] 203b.d3.t3 Inject binary directly to RAM (CLI: `binary_inject <building_id> <ram_addr>` - stub implemented)
  - CLI command: `binary_inject <building_id> <ram_addr>`
  - Hypervisor command: `HYPERVISOR_LOAD r0 building_id`
  _Files: src/cli.rs, src/vm/ops_binary.rs (new)_
  _~300 LOC_

### 4. Coordinate Metadata Binary Storage
- [x] 203b.d4.t1 Store binary data in coordinate metadata (CLI: `coord_set_binary <x> <y> <format> <file>`)
  - CLI command: `coord_set_binary <x> <y> <format> <file>`
  - Get metadata: `coord_get_binary <x> <y>`
- [ ] 203b.d4.t2 Binary chunk management (deferred - coordinate storage sufficient for now)
  - CLI command: `binary_chunk_add <building_id> <offset> <file>`
  - `binary_chunk_list <building_id>`
  _Files: src/vm/io.rs, src/vm/metadata.rs_
  _~250 LOC_

### 5. Hypervisor Integration
- [ ] 203b.d5.t1 Boot Linux from Memory Palace binary
  - Config: `kernel=building:42 initrd=building:43`
  - Building 42 = ubuntu kernel (base64)
  - Building 43 = initrd (pixelpack)
- [ ] 203b.d5.t2 Chain boot from binary sequence
  - `boot_chain [building_ids...]` command
  - Loads each binary in order (bootloader → kernel → initrd)
  _Files: src/qemu/bridge.rs, src/riscv/live.rs_
  _~150 LOC_

## Technical Notes

### Performance Considerations
- **base64**: 33% overhead, CPU-efficient, good for JSON
- **hex**: 50% overhead, human-readable, pixel-native
- **pixelpack**: Variable compression (2-10x), best for large files
- **raw coordinates**: No encoding overhead, requires chunked storage

### Memory Limits
- JSON export size limit: ~1MB (practical)
- Building metadata limit: ~512KB (base64 ~384KB binary)
- For larger files: Use pixelpack encoding or coordinate chunking

### Security
- Binary metadata stored unencrypted (Memory Palace is public API)
- No sandboxing for executed binaries
- Mitigation: Document that binary execution requires trust

### Backward Compatibility
- Existing Memory Palace files without `binary_data` field work unchanged
- New fields optional in `ExportedBuilding`
- Phase-203 export/import still works without binary support

## Risks

| Risk | Mitigation |
|------|------------|
| JSON export size bloat | Use pixelpack for large binaries, coordinate chunking for huge files |
| Hex/pixel encoding errors | Add checksum validation, automatic re-encoding on import |
| Binary injection to RAM | Validate bounds, require explicit user approval for executable formats |
| Coordinate storage conflicts | Use dedicated binary storage regions (e.g., 0x10000-0x1FFFF) |

## Integration with Existing Work

### Phase-201 (Checkpointing)
- Binary data included in checkpoint exports
- Canvas PNG already handles binary graphics data

### Phase-202 (Multi-Modal Metadata)
- `BinaryMetadata` extends multi-modal support
- Format/encoding fields follow metadata API conventions

### Phase-203 (Cross-Platform Export/Import)
- JSON export already supports arbitrary fields
- Import merge strategies apply to binary metadata

### Linux Boot (Future)
- Ubuntu kernel stored as building: `kernel=building:42`
- Disk image stored as pixelpack: `disk=pixels:0x20000-0x5FFFF`
- Self-contained boot: All components in Memory Palace

## Example Workflows

### 1. Store Ubuntu Kernel
```bash
# Load bzImage into Memory Palace
import_binary ~/zion/images/ubuntu/bzImage 42 elf base64

# Later: boot from Memory Palace
HYPERVISOR r0  ; r0 = "arch=x86_64 kernel=building:42 ram=512M"
```

### 2. Create Self-Contained Linux Boot
```bash
# Store all components
import_binary ~/zion/images/bzImage 10 elf base64
import_binary ~/zion/images/initrd 11 cpio base64
import_binary ~/zion/images/rootfs.ext4 12 disk_image pixelpack

# Chain boot from stored binaries
boot_chain [10, 11, 12]  ; kernel → initrd → rootfs
```

### 3. BIOS ROM in Memory Palace
```bash
# Store BIOS ROM at boot address
import_binary ~/zion/images/bios.bin 99 bios_rom hex
binary_inject 99 0xFFFF0  ; Load to BIOS ROM address
```

### 4. Pixel-Native Firmware
```bash
# Encode firmware as pixel chain
import_binary ~/firmware/uart.bin 50 raw pixels

# Firmware rendered as building on map
# Can be visually inspected, modified with pixel tools
```

## Test Plan

### Unit Tests
- [ ] Hex ↔ Binary round-trip (all byte values 0-255)
- [ ] Base64 ↔ Binary round-trip
- [ ] Pixel ↔ Binary round-trip (via pixelpack)
- [ ] BinaryMetadata serialization/deserialization
- [ ] Checksum validation

### Integration Tests
- [ ] Import bzImage, verify base64 encoding
- [ ] Export building binary, verify matches original
- [ ] Inject kernel to RAM, verify memory contents
- [ ] Chain boot from 3 stored binaries
- [ ] Large file chunking (>1MB stored across coordinates)

### Performance Tests
- [ ] Import 1GB disk image via pixelpack (should complete <30s)
- [ ] Hex encoding 10MB binary (should complete <5s)
- [ ] Export 512KB BIOS ROM (should complete <2s)

## Timeline

**Phase 203+: Binary Memory Palace Extension**

- **Week 1**: Binary metadata + encoding utilities (Deliverables 1-2)
  - 350 LOC, 8 unit tests
  
- **Week 2**: Binary import/export API (Deliverables 3)
  - 300 LOC, 5 integration tests
  
- **Week 3**: Coordinate storage + hypervisor integration (Deliverables 4-5)
  - 400 LOC, 4 integration tests, 1 Linux boot test

**Total: ~1050 LOC, 17 tests, 3 weeks**

## Success Criteria

1. ✅ Can store any binary file in Memory Palace (building metadata or coordinates)
2. ✅ Can convert between binary/hex/base64/pixel encodings
3. ✅ Can boot Linux kernel stored as building metadata
4. ✅ Can create self-contained boot chain entirely from Memory Palace
5. ✅ JSON export/import works with binary data (backwards compatible)
6. ✅ Performance: Import 100MB binary via pixelpack in <10s

## Future Extensions (Not in Scope)

- Binary compression (gzip, zstd)
- Binary encryption (AES)
- Binary hashing/verification (SHA256)
- Binary streaming (large files without full load)
- Binary diffing (store only changes)
- Binary versioning in Memory Palace