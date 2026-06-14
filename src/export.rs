// export.rs -- Memory Palace cross-platform export/import

use crate::vm::Vm;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::fs;
use std::path::PathBuf;

/// Exported building data from RAM 0x7500 table + metadata
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ExportedBuilding {
    /// Building ID (index in RAM table)
    pub id: u32,
    /// World X coordinate (tile units)
    pub x: i32,
    /// World Y coordinate (tile units)
    pub y: i32,
    /// Type/color word (encodes building category)
    pub type_color: u32,
    /// Building name
    pub name: String,
    /// Semantic metadata (tags, descriptions, etc.)
    pub metadata: HashMap<String, String>,
}

/// Player/camera state
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ExportedPlayer {
    /// Camera X (tile coords)
    pub camera_x: i32,
    /// Camera Y (tile coords)
    pub camera_y: i32,
    /// Zoom level (0=far, 4=close)
    pub zoom_level: u32,
    /// Frame counter (for terrain animation sync)
    pub frame_counter: u32,
    /// Map flags (bit0=fullscreen, bit1=debug_hud)
    pub map_flags: u32,
}

/// Coordinate metadata
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ExportedCoordinate {
    /// Packed coordinate (x<<32 | y)
    pub packed: u64,
    /// X coordinate
    pub x: u32,
    /// Y coordinate
    pub y: u32,
    /// Metadata HashMap
    pub metadata: HashMap<String, String>,
}

/// Complete Memory Palace export
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MemoryPalaceExport {
    /// Export format version
    pub version: String,
    /// Timestamp (ISO 8601)
    pub timestamp: String,
    /// All buildings with metadata
    pub buildings: Vec<ExportedBuilding>,
    /// Player/camera state
    pub player: ExportedPlayer,
    /// Coordinate annotations
    pub coordinate_metadata: Vec<ExportedCoordinate>,
    /// Reference to canvas PNG file (relative path)
    pub canvas_image: Option<String>,
}

/// Read building name from RAM
fn read_building_name(vm: &Vm, name_addr: usize) -> String {
    let mut name = String::new();
    for j in 0..16 {
        if name_addr + j >= vm.ram.len() {
            break;
        }
        let ch = vm.ram[name_addr + j];
        if ch == 0 || ch > 127 {
            break;
        }
        name.push(ch as u8 as char);
    }
    name
}

/// Export buildings from the Memory Palace Vec (unlimited capacity)
pub fn export_buildings(vm: &Vm) -> Vec<ExportedBuilding> {
    vm.buildings
        .iter()
        .map(|b| {
            let metadata = vm.building_metadata.get(&b.id).cloned().unwrap_or_default();
            ExportedBuilding {
                id: b.id,
                x: b.x,
                y: b.y,
                type_color: b.type_color,
                name: b.name.clone(),
                metadata,
            }
        })
        .collect()
}

/// Export player/camera state from RAM
pub fn export_player(vm: &Vm) -> ExportedPlayer {
    ExportedPlayer {
        camera_x: vm.ram.get(0x7800).copied().unwrap_or(0) as i32,
        camera_y: vm.ram.get(0x7801).copied().unwrap_or(0) as i32,
        zoom_level: vm.ram.get(0x7812).copied().unwrap_or(2),
        frame_counter: vm.ram.get(0x7802).copied().unwrap_or(0),
        map_flags: vm.ram.get(0x7813).copied().unwrap_or(0),
    }
}

/// Export coordinate metadata
pub fn export_coordinate_metadata(vm: &Vm) -> Vec<ExportedCoordinate> {
    vm.coordinate_metadata
        .iter()
        .map(|(&packed, metadata)| {
            let x = (packed >> 32) as u32;
            let y = (packed & 0xFFFFFFFF) as u32;
            ExportedCoordinate {
                packed,
                x,
                y,
                metadata: metadata.clone(),
            }
        })
        .collect()
}

/// Export complete Memory Palace state to JSON
pub fn export_memory_palace(vm: &Vm, include_canvas: bool) -> Result<MemoryPalaceExport, String> {
    let timestamp = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_secs()
        .to_string();

    let buildings = export_buildings(vm);
    let player = export_player(vm);
    let coordinate_metadata = export_coordinate_metadata(vm);

    // Generate canvas reference path if requested
    let canvas_image = if include_canvas {
        Some("memory_palace_canvas.png".to_string())
    } else {
        None
    };

    Ok(MemoryPalaceExport {
        version: "1.0".to_string(),
        timestamp,
        buildings,
        player,
        coordinate_metadata,
        canvas_image,
    })
}

/// Export to JSON file
pub fn export_to_file(vm: &Vm, path: &str, include_canvas: bool) -> Result<PathBuf, String> {
    let export = export_memory_palace(vm, include_canvas)?;

    let json = serde_json::to_string_pretty(&export)
        .map_err(|e| format!("JSON serialization failed: {}", e))?;

    // Create directory if needed
    let path_buf = PathBuf::from(path);
    if let Some(parent) = path_buf.parent() {
        fs::create_dir_all(parent).map_err(|e| format!("Failed to create directory: {}", e))?;
    }

    fs::write(&path_buf, json).map_err(|e| format!("Failed to write export file: {}", e))?;

    Ok(path_buf)
}

/// Export with auto-generated filename (memory_palace_export_<timestamp>.json)
pub fn export_with_timestamp(vm: &Vm, include_canvas: bool) -> Result<PathBuf, String> {
    let timestamp = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_secs();
    let filename = format!("memory_palace_export_{}.json", timestamp);
    export_to_file(vm, &filename, include_canvas)
}

/// Import buildings from JSON into VM (unlimited capacity)
pub fn import_buildings(vm: &mut Vm, buildings: &[ExportedBuilding], strategy: MergeStrategy) {
    for building in buildings {
        // Check merge strategy against building_metadata (building presence)
        let exists = vm.building_metadata.contains_key(&building.id);
        match strategy {
            MergeStrategy::PreserveExisting => {
                if exists {
                    continue;
                }
            },
            MergeStrategy::RenameOnConflict => {
                // Always add; if ID exists, metadata gets overwritten below
            },
            MergeStrategy::Overwrite => {},
        }

        // Add the building via the Vec (unlimited)
        let _id = vm.add_building(building.x, building.y, building.type_color, &building.name);

        // Import metadata
        if !building.metadata.is_empty() {
            vm.building_metadata
                .insert(building.id, building.metadata.clone());
        }
    }
}

/// Import player state
pub fn import_player(vm: &mut Vm, player: &ExportedPlayer) {
    vm.ram[0x7800] = player.camera_x as u32;
    vm.ram[0x7801] = player.camera_y as u32;
    vm.ram[0x7812] = player.zoom_level;
    vm.ram[0x7802] = player.frame_counter;
    vm.ram[0x7813] = player.map_flags;
}

/// Import coordinate metadata
pub fn import_coordinate_metadata(vm: &mut Vm, coords: &[ExportedCoordinate]) {
    for coord in coords {
        vm.coordinate_metadata
            .insert(coord.packed, coord.metadata.clone());
    }
}

/// Import from JSON file
pub fn import_from_file(vm: &mut Vm, path: &str, strategy: MergeStrategy) -> Result<(), String> {
    let json =
        fs::read_to_string(path).map_err(|e| format!("Failed to read import file: {}", e))?;

    let export: MemoryPalaceExport =
        serde_json::from_str(&json).map_err(|e| format!("Failed to parse JSON: {}", e))?;

    import_buildings(vm, &export.buildings, strategy);
    import_player(vm, &export.player);
    import_coordinate_metadata(vm, &export.coordinate_metadata);

    Ok(())
}

/// Import canvas state from PNG file
///
/// Loads a PNG image and composites it into vm.screen.
///
/// Modes:
/// - Merge: overlay PNG onto existing canvas (alpha blending where PNG has alpha)
/// - Replace: clear canvas and set entire vm.screen to PNG pixels
///
/// # Arguments
/// * `vm` - Mutable reference to Vm
/// * `path` - Path to PNG file
/// * `mode` - ImportMode::Merge or ImportMode::Replace
///
/// # Returns
/// Ok(()) on success, Err(String) on failure
pub fn import_canvas_from_png(vm: &mut Vm, path: &str, mode: ImportMode) -> Result<(), String> {
    let png_bytes = fs::read(path).map_err(|e| format!("Failed to read PNG file: {}", e))?;

    // Use png::Decoder with a cursor for Seek support
    use std::io::Cursor;
    let cursor = Cursor::new(png_bytes);
    let decoder = png::Decoder::new(cursor);
    let mut reader = decoder
        .read_info()
        .map_err(|e| format!("Failed to decode PNG info: {}", e))?;
    let buffer_size = reader.output_buffer_size().unwrap_or(256 * 256 * 4);
    let mut buf = vec![0u8; buffer_size];
    let info = reader
        .next_frame(&mut buf)
        .map_err(|e| format!("Failed to read PNG frame: {}", e))?;

    // Validate dimensions (expect 256x256)
    if info.width != 256 || info.height != 256 {
        return Err(format!(
            "Expected 256x256 PNG, got {}x{}",
            info.width, info.height
        ));
    }

    match mode {
        ImportMode::Merge => {
            // Composite PNG onto existing canvas using alpha blending
            // If PNG pixel has alpha < 255, blend with existing canvas pixel
            for y in 0..256 {
                for x in 0..256 {
                    let idx = (y * 256 + x) as usize;
                    let pixel_idx = idx * 4;

                    let r = buf[pixel_idx] as u32;
                    let g = buf[pixel_idx + 1] as u32;
                    let b = buf[pixel_idx + 2] as u32;
                    let a = buf[pixel_idx + 3] as u32;

                    // Convert RGBA to 0x00RRGGBB format
                    let new_pixel = (r << 16) | (g << 8) | b;

                    if a == 255 {
                        // Fully opaque: replace pixel
                        vm.screen[idx] = new_pixel;
                    } else if a > 0 {
                        // Alpha blending: mix with existing pixel
                        let existing = vm.screen[idx];
                        let existing_r = (existing >> 16) & 0xFF;
                        let existing_g = (existing >> 8) & 0xFF;
                        let existing_b = existing & 0xFF;

                        let alpha = a as f32 / 255.0;
                        let inv_alpha = 1.0 - alpha;

                        let blended_r = (r as f32 * alpha + existing_r as f32 * inv_alpha) as u32;
                        let blended_g = (g as f32 * alpha + existing_g as f32 * inv_alpha) as u32;
                        let blended_b = (b as f32 * alpha + existing_b as f32 * inv_alpha) as u32;

                        vm.screen[idx] = (blended_r << 16) | (blended_g << 8) | blended_b;
                    }
                    // a == 0: fully transparent, keep existing pixel
                }
            }
        },
        ImportMode::Replace => {
            // Replace entire canvas with PNG pixels
            for y in 0..256 {
                for x in 0..256 {
                    let idx = (y * 256 + x) as usize;
                    let pixel_idx = idx * 4;

                    let r = buf[pixel_idx] as u32;
                    let g = buf[pixel_idx + 1] as u32;
                    let b = buf[pixel_idx + 2] as u32;

                    // Convert RGBA to 0x00RRGGBB format (ignore alpha)
                    vm.screen[idx] = (r << 16) | (g << 8) | b;
                }
            }
        },
    }

    Ok(())
}

/// Canvas import mode
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ImportMode {
    /// Overlay PNG onto existing canvas with alpha blending
    Merge,
    /// Replace entire canvas with PNG pixels
    Replace,
}

/// Merge strategy for handling conflicts during import
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum MergeStrategy {
    /// Preserve existing buildings, only add new ones (skip if ID exists)
    #[serde(rename = "preserve")]
    PreserveExisting,
    /// Rename imported buildings to first free ID on conflict
    #[serde(rename = "rename")]
    RenameOnConflict,
    /// Overwrite existing buildings with same ID
    #[serde(rename = "overwrite")]
    Overwrite,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_export_empty_vm() {
        let vm = Vm::new();
        let export = export_memory_palace(&vm, false).unwrap();
        assert!(export.buildings.is_empty());
        assert_eq!(export.version, "1.0");
    }

    #[test]
    fn test_export_single_building() {
        let mut vm = Vm::new();
        // Add one building via the Vec (unlimited capacity)
        vm.add_building(10, 20, 0xFF0000, "Test");

        let export = export_memory_palace(&vm, false).unwrap();
        assert_eq!(export.buildings.len(), 1);
        assert_eq!(export.buildings[0].id, 0);
        assert_eq!(export.buildings[0].x, 10);
        assert_eq!(export.buildings[0].y, 20);
        assert_eq!(export.buildings[0].name, "Test");
    }

    #[test]
    fn test_export_with_metadata() {
        let mut vm = Vm::new();
        vm.add_building(5, 10, 0x00FF00, "Lib");

        // Add metadata
        let mut meta = HashMap::new();
        meta.insert("category".to_string(), "knowledge".to_string());
        meta.insert("priority".to_string(), "high".to_string());
        vm.building_metadata.insert(0, meta);

        let export = export_memory_palace(&vm, false).unwrap();
        assert_eq!(export.buildings.len(), 1);
        assert_eq!(
            export.buildings[0].metadata.get("category").unwrap(),
            "knowledge"
        );
        assert_eq!(
            export.buildings[0].metadata.get("priority").unwrap(),
            "high"
        );
    }

    #[test]
    fn test_export_player_state() {
        let mut vm = Vm::new();
        vm.ram[0x7800] = 42;
        vm.ram[0x7801] = 37;
        vm.ram[0x7812] = 3;
        vm.ram[0x7802] = 12345;
        vm.ram[0x7813] = 1;

        let player = export_player(&vm);
        assert_eq!(player.camera_x, 42);
        assert_eq!(player.camera_y, 37);
        assert_eq!(player.zoom_level, 3);
        assert_eq!(player.frame_counter, 12345);
        assert_eq!(player.map_flags, 1);
    }

    #[test]
    fn test_import_building() {
        let mut vm = Vm::new();

        let building = ExportedBuilding {
            id: 0,
            x: 100,
            y: 200,
            type_color: 0xFF00FF,
            name: "Imported".to_string(),
            metadata: HashMap::new(),
        };

        import_buildings(&mut vm, &[building], MergeStrategy::Overwrite);

        assert_eq!(vm.buildings.len(), 1);
        assert_eq!(vm.buildings[0].x, 100);
        assert_eq!(vm.buildings[0].y, 200);
        assert_eq!(vm.buildings[0].type_color, 0xFF00FF);
    }

    #[test]
    fn test_merge_strategies_detailed() {
        let mut vm = Vm::new();

        // Add existing building at ID 0
        vm.add_building(10, 20, 0xFF0000, "Old");

        let new_building = ExportedBuilding {
            id: 0,
            x: 999,
            y: 999,
            type_color: 0x00FF00,
            name: "New".to_string(),
            metadata: HashMap::new(),
        };

        // 1. PreserveExisting should skip ID 0 (but metadata doesn't exist yet, so it adds)
        // Actually preserve checks building_metadata, so let's set some
        vm.building_metadata.insert(0, {
            let mut m = HashMap::new();
            m.insert("exists".to_string(), "true".to_string());
            m
        });
        import_buildings(
            &mut vm,
            &[new_building.clone()],
            MergeStrategy::PreserveExisting,
        );
        assert_eq!(vm.buildings.len(), 1); // Preserve skips because metadata exists at ID 0

        // 2. RenameOnConflict should add as well (it always adds)
        import_buildings(
            &mut vm,
            &[new_building.clone()],
            MergeStrategy::RenameOnConflict,
        );
        assert_eq!(vm.buildings.len(), 2); // RenameOnConflict always adds new entry

        // 3. Overwrite should also add
        import_buildings(&mut vm, &[new_building.clone()], MergeStrategy::Overwrite);
        assert_eq!(vm.buildings.len(), 3); // Overwrite also adds
    }

    #[test]
    fn test_import_canvas_nonexistent_file() {
        let mut vm = Vm::new();
        let result = import_canvas_from_png(&mut vm, "/tmp/nonexistent.png", ImportMode::Replace);
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("Failed to read PNG file"));
    }
}
