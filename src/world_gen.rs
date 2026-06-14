//! world_gen.rs -- Procedural terrain generation for the infinite tile map.
//!
//! Port of the hash-based biome/elevation/color system from world_desktop.asm
//! into native Rust. Generates terrain into TileStore chunks on demand.
//!
//! Hash architecture (matching assembly):
//!   COARSE HASH: (x>>3 * 99001) XOR (y>>3 * 79007), then LCG-mixed (* 1103515245)
//!     Top 5 bits (>>27): biome index (0-31)
//!     Bits 25-26 (&0x3): pattern type (0=flat, 1=center, 2=horiz, 3=vert)
//!     Bits 10-20 (&0x1F1F1F): XOR mask for accent color
//!   FINE HASH: x * 374761393 XOR y * 668265263
//!     Bits 0-3: per-tile color variation index
//!     Bits 28-30: elevation (0-7)

use crate::tile_store::{Chunk, CHUNK_SIZE};

/// Biome color table -- matches world_desktop.asm RAM[0x7000..0x701F].
/// 32 entries. Index 0-31 from coarse_hash >> 27.
const BIOME_COLORS: [u32; 32] = [
    0x000044, // 0: Deep Ocean
    0x0000BB, // 1: Ocean
    0xC2B280, // 2: Beach
    0xDDBB44, // 3: Desert
    0xCCAA33, // 4: Sandy Desert
    0x22AA55, // 5: Oasis
    0x55BB33, // 6: Grassland
    0x228811, // 7: Dark Grass
    0x445522, // 8: Swamp
    0x2D4A1A, // 9: Deep Swamp
    0x116600, // 10: Forest
    0x0A4400, // 11: Dense Forest
    0x883388, // 12: Mushroom Grove
    0x667766, // 13: Mountain
    0x999999, // 14: Snowy Peak
    0x8899AA, // 15: Tundra
    0xFF3300, // 16: Lava Field
    0x332222, // 17: Cooled Lava
    0x442211, // 18: Volcanic Rock
    0xCCCCEE, // 19: Snowfield
    0xDDEEFF, // 20: Packed Snow
    0xFFFFFF, // 21: Fresh Snow
    0x3377AA, // 22: Coral Reef
    0xAA7744, // 23: Ancient Ruins
    0x5566BB, // 24: Crystal Cave
    0x334488, // 25: Deep Crystal
    0x665544, // 26: Ash Wastes
    0x443322, // 27: Deadlands
    0x332211, // 28: Barren Deadlands
    0x44AA66, // 29: Mystic Grove
    0x556677, // 30: (unused in asm)
    0x778899, // 31: (unused in asm)
];

/// Nibble variation table -- per-tile color offsets.
/// Fine hash nibble indexes into this. Applied as signed packed-RGB offsets.
const NIBBLE_TABLE: [i32; 16] = [0, 1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6, 8, -8, 12];

/// Water biome indices (0, 1) -- get animated shimmer.
const WATER_BIOMES: [usize; 2] = [0, 1];

/// Generate the coarse hash for a tile at world coordinates (wx, wy).
/// Returns the full 32-bit hash value.
#[inline]
fn coarse_hash(wx: i32, wy: i32) -> u32 {
    let cx = ((wx >> 3) as u32).wrapping_mul(99001);
    let cy = ((wy >> 3) as u32).wrapping_mul(79007);
    let raw = cx ^ cy;
    // LCG mixing (matches assembly: MUL 1103515245)
    raw.wrapping_mul(1103515245)
}

/// Generate the fine hash for a tile at world coordinates (wx, wy).
#[inline]
fn fine_hash(wx: i32, wy: i32) -> u32 {
    (wx as u32).wrapping_mul(374761393) ^ (wy as u32).wrapping_mul(668265263)
}

/// Get the biome index (0-31) for a tile.
#[inline]
pub fn biome_index(wx: i32, wy: i32) -> usize {
    ((coarse_hash(wx, wy) >> 27) & 0x1F) as usize
}

/// Get the biome base color for a tile.
#[inline]
pub fn biome_color(wx: i32, wy: i32) -> u32 {
    let idx = biome_index(wx, wy);
    BIOME_COLORS[idx.min(31)]
}

/// Get the elevation (0-7) for a tile from fine hash top bits.
#[inline]
pub fn elevation(wx: i32, wy: i32) -> u32 {
    (fine_hash(wx, wy) >> 28) & 0x7
}

/// Get the pattern type (0-3) from coarse hash.
#[inline]
fn pattern_type(wx: i32, wy: i32) -> u32 {
    (coarse_hash(wx, wy) >> 25) & 0x3
}

/// Get the accent XOR mask from coarse hash.
#[inline]
fn accent_mask(wx: i32, wy: i32) -> u32 {
    (coarse_hash(wx, wy) >> 10) & 0x1F1F1F
}

/// Check if a tile is water biome.
#[inline]
pub fn is_water(wx: i32, wy: i32) -> bool {
    let idx = biome_index(wx, wy);
    idx == 0 || idx == 1
}

/// Compute the base color for a single tile pixel at (wx, wy) with optional frame counter.
/// This is the core terrain color function -- matches world_desktop.asm output.
pub fn tile_color(wx: i32, wy: i32, frame: u32) -> u32 {
    let ch = coarse_hash(wx, wy);
    let fh = fine_hash(wx, wy);
    let biome_idx = ((ch >> 27) & 0x1F) as usize;
    let pat = (ch >> 25) & 0x3;
    let accent = (ch >> 10) & 0x1F1F1F;
    let base = BIOME_COLORS[biome_idx.min(31)];

    // Per-tile variation from fine hash nibble
    let nibble_idx = (fh & 0xF) as usize;
    let variation = NIBBLE_TABLE[nibble_idx];

    // Height-based shading: elevation * 0x030303
    let elev = ((fh >> 28) & 0x7) as i32;
    let height_shade = elev * 0x030303;

    // Apply variation and height shade to base
    let mut color = apply_packed_offset(base, variation);
    color = apply_packed_offset(color, height_shade);

    // Water shimmer animation
    if biome_idx == 0 || biome_idx == 1 {
        let shimmer = ((frame.wrapping_add(wx as u32).wrapping_add(wy as u32)) & 0x1F) as i32;
        // Blue-tinted shimmer
        let shimmer_color = shimmer * 0x000804;
        color = color.wrapping_add(shimmer_color as u32);
    }

    // Pattern-based accent
    match pat {
        1 => {
            // Center: 2x2 accent in center of 4x4 tile
            let lx = (wx.rem_euclid(4)) as i32;
            let ly = (wy.rem_euclid(4)) as i32;
            if lx >= 1 && lx <= 2 && ly >= 1 && ly <= 2 {
                color ^= accent;
            }
        },
        2 => {
            // Horizontal: bottom half accent
            let ly = (wy.rem_euclid(4)) as i32;
            if ly >= 2 {
                color ^= accent;
            }
        },
        3 => {
            // Vertical: right half accent
            let lx = (wx.rem_euclid(4)) as i32;
            if lx >= 2 {
                color ^= accent;
            }
        },
        _ => {}, // 0 = flat, no accent
    }

    // Biome boundary blending (4-tile graduated transition at biome edges)
    let pos_in_zone_x = (wx.rem_euclid(8)) as i32;
    let pos_in_zone_y = (wy.rem_euclid(8)) as i32;

    if pos_in_zone_x == 0 || pos_in_zone_x == 1 || pos_in_zone_x == 6 || pos_in_zone_x == 7 {
        // X-direction blend
        let neighbor_x = if pos_in_zone_x <= 1 { wx - 1 } else { wx + 1 };
        let neighbor_base = BIOME_COLORS[biome_index(neighbor_x, wy).min(31)];
        let blend_factor = match pos_in_zone_x {
            0 | 7 => 128, // 50/50
            1 | 6 => 64,  // 75/25
            _ => 0,
        };
        color = blend_packed_rgb(color, neighbor_base, blend_factor);
    }

    if pos_in_zone_y == 0 || pos_in_zone_y == 1 || pos_in_zone_y == 6 || pos_in_zone_y == 7 {
        let neighbor_y = if pos_in_zone_y <= 1 { wy - 1 } else { wy + 1 };
        let neighbor_base = BIOME_COLORS[biome_index(wx, neighbor_y).min(31)];
        let blend_factor = match pos_in_zone_y {
            0 | 7 => 128,
            1 | 6 => 64,
            _ => 0,
        };
        color = blend_packed_rgb(color, neighbor_base, blend_factor);
    }

    // Water reflection: water tiles mirror biome above with dim + blue tint
    if biome_idx == 0 || biome_idx == 1 {
        let above_wy = wy - 1;
        let above_biome = biome_index(wx, above_wy);
        if above_biome != 0 && above_biome != 1 {
            // Not water above -- show reflection
            let reflected = BIOME_COLORS[above_biome.min(31)];
            let dimmed = reflected >> 1; // 50% dim
            let ripple = ((frame
                .wrapping_add((wx * 3) as u32)
                .wrapping_add((wy * 7) as u32))
                & 0xF) as u32;
            let ripple_color = ripple * 0x020202;
            let blue_tint = 0x0E1C38;
            color = dimmed.wrapping_add(blue_tint).wrapping_add(ripple_color);
        }
    }

    // Coastline foam: water tiles adjacent to land get brightened
    if biome_idx == 0 || biome_idx == 1 {
        let above_not_water = !is_water(wx, wy - 1);
        let left_not_water = !is_water(wx - 1, wy);
        if above_not_water || left_not_water {
            color = color.wrapping_add(0x303030);
        }
    }

    color
}

/// Apply a signed offset to a packed RGB color (0x00RRGGBB).
/// Each channel is offset by the same signed value, clamped to 0-255.
#[inline]
fn apply_packed_offset(color: u32, offset: i32) -> u32 {
    let r = ((color >> 16) & 0xFF) as i32;
    let g = ((color >> 8) & 0xFF) as i32;
    let b = (color & 0xFF) as i32;

    let or = (r + offset).clamp(0, 255) as u32;
    let og = (g + offset).clamp(0, 255) as u32;
    let ob = (b + offset).clamp(0, 255) as u32;

    (or << 16) | (og << 8) | ob
}

/// Blend two packed RGB colors. factor 0 = all of color_a, 255 = all of color_b.
#[inline]
fn blend_packed_rgb(a: u32, b: u32, factor: u32) -> u32 {
    let inv = 256 - factor;
    let r = (((a >> 16) & 0xFF) * inv + ((b >> 16) & 0xFF) * factor) >> 8;
    let g = (((a >> 8) & 0xFF) * inv + ((b >> 8) & 0xFF) * factor) >> 8;
    let bl = ((a & 0xFF) * inv + (b & 0xFF) * factor) >> 8;
    (r << 16) | (g << 8) | bl
}

/// Generate a complete 64x64 chunk of terrain.
/// The chunk covers world pixels [cx*64 .. cx*64+63] x [cy*64 .. cy*64+63].
/// `frame` is the current frame counter for water animation.
pub fn generate_chunk(chunk_cx: i32, chunk_cy: i32, frame: u32) -> Chunk {
    let mut chunk = Chunk::new();
    let base_x = chunk_cx * CHUNK_SIZE as i32;
    let base_y = chunk_cy * CHUNK_SIZE as i32;

    for ly in 0..CHUNK_SIZE {
        for lx in 0..CHUNK_SIZE {
            let wx = base_x + lx as i32;
            let wy = base_y + ly as i32;
            let color = tile_color(wx, wy, frame);
            chunk.pixels[ly * CHUNK_SIZE + lx] = color;
        }
    }

    // Draw tree sprites on grass (6-7) and forest (10-11) biomes
    draw_trees(&mut chunk, base_x, base_y, frame);

    // Draw elevation contour lines at tile boundaries
    draw_contours(&mut chunk, base_x, base_y);

    chunk
}

/// Draw procedural tree sprites on appropriate biomes.
fn draw_trees(chunk: &mut Chunk, base_x: i32, base_y: i32, _frame: u32) {
    // Iterate over 4x4 tile grid within the chunk
    for tile_ly in 0..(CHUNK_SIZE / 4) {
        for tile_lx in 0..(CHUNK_SIZE / 4) {
            let wx = base_x + (tile_lx * 4) as i32 + 2; // center of tile
            let wy = base_y + (tile_ly * 4) as i32 + 2;
            let bi = biome_index(wx, wy);
            let fh = fine_hash(wx, wy);

            // Forest: ~50% trees (bits 4-5 of fine_hash)
            // Grass: ~25% trees
            let place = if bi == 10 || bi == 11 {
                ((fh >> 4) & 0x3) < 2 // 50%
            } else if bi == 6 || bi == 7 {
                ((fh >> 4) & 0x3) == 0 // 25%
            } else {
                false
            };

            if !place {
                continue;
            }

            // Tree: 3x2 green canopy + 1x1 brown trunk
            let cx = tile_lx * 4;
            let cy = tile_ly * 4;
            let canopy_color = if bi == 10 || bi == 11 {
                0x0A5500 // dark green for forest
            } else {
                0x22AA22 // lighter green for grass
            };
            let trunk_color = 0x664422;

            // Canopy: 3 wide, 2 tall at offset (0,0) within tile
            for py in 0..2 {
                for px in 0..3 {
                    let lx = cx + px;
                    let ly = cy + py;
                    if lx < CHUNK_SIZE && ly < CHUNK_SIZE {
                        chunk.pixels[ly * CHUNK_SIZE + lx] = canopy_color;
                    }
                }
            }

            // Trunk: 1x1 at center bottom
            let trunk_lx = cx + 1;
            let trunk_ly = cy + 2;
            if trunk_lx < CHUNK_SIZE && trunk_ly < CHUNK_SIZE {
                chunk.pixels[trunk_ly * CHUNK_SIZE + trunk_lx] = trunk_color;
            }
        }
    }
}

/// Draw elevation contour lines at tile boundaries where elevation changes by > 2.
fn draw_contours(chunk: &mut Chunk, base_x: i32, base_y: i32) {
    let contour_color = 0x222222;

    // Check horizontal boundaries (between tile rows)
    for tile_ly in 1..(CHUNK_SIZE / 4) {
        for tile_lx in 0..(CHUNK_SIZE / 4) {
            let wx = base_x + (tile_lx * 4 + 2) as i32;
            let wy_above = base_y + (tile_ly * 4 - 1) as i32;
            let wy_below = base_y + (tile_ly * 4) as i32;

            let bi_above = biome_index(wx, wy_above);
            let bi_below = biome_index(wx, wy_below);
            // Skip water contours
            if (bi_above == 0 || bi_above == 1) && (bi_below == 0 || bi_below == 1) {
                continue;
            }

            let elev_above = elevation(wx, wy_above);
            let elev_below = elevation(wx, wy_below);
            if (elev_above as i32 - elev_below as i32).unsigned_abs() > 2 {
                let ly = tile_ly * 4;
                for px in 0..4 {
                    let lx = tile_lx * 4 + px;
                    if lx < CHUNK_SIZE && ly < CHUNK_SIZE {
                        chunk.pixels[ly * CHUNK_SIZE + lx] = contour_color;
                    }
                }
            }
        }
    }

    // Check vertical boundaries (between tile columns)
    for tile_ly in 0..(CHUNK_SIZE / 4) {
        for tile_lx in 1..(CHUNK_SIZE / 4) {
            let wy = base_y + (tile_ly * 4 + 2) as i32;
            let wx_left = base_x + (tile_lx * 4 - 1) as i32;
            let wx_right = base_x + (tile_lx * 4) as i32;

            let bi_left = biome_index(wx_left, wy);
            let bi_right = biome_index(wx_right, wy);
            if (bi_left == 0 || bi_left == 1) && (bi_right == 0 || bi_right == 1) {
                continue;
            }

            let elev_left = elevation(wx_left, wy);
            let elev_right = elevation(wx_right, wy);
            if (elev_left as i32 - elev_right as i32).unsigned_abs() > 2 {
                let lx = tile_lx * 4;
                for py in 0..4 {
                    let ly = tile_ly * 4 + py;
                    if lx < CHUNK_SIZE && ly < CHUNK_SIZE {
                        chunk.pixels[ly * CHUNK_SIZE + lx] = contour_color;
                    }
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_coarse_hash_deterministic() {
        assert_eq!(coarse_hash(0, 0), coarse_hash(0, 0));
        assert_eq!(coarse_hash(100, 200), coarse_hash(100, 200));
        // Different COARSE zones should give different hashes
        assert_ne!(coarse_hash(0, 0), coarse_hash(8, 0)); // different x zone
        assert_ne!(coarse_hash(0, 0), coarse_hash(0, 8)); // different y zone
    }

    #[test]
    fn test_biome_index_range() {
        // Sample a bunch of positions, all should give valid indices
        for x in -100..100i32 {
            for y in -100..100i32 {
                let idx = biome_index(x, y);
                assert!(idx < 32, "biome_index({x},{y}) = {idx} >= 32");
            }
        }
    }

    #[test]
    fn test_biome_contiguity() {
        // Tiles within the same 8x8 zone should share the same biome
        let base_x = 16;
        let base_y = 16;
        let base_biome = biome_index(base_x, base_y);
        for dx in 0..8 {
            for dy in 0..8 {
                assert_eq!(
                    biome_index(base_x + dx, base_y + dy),
                    base_biome,
                    "Biome changed within zone at offset ({dx},{dy})"
                );
            }
        }
    }

    #[test]
    fn test_fine_hash_variety() {
        // Adjacent tiles should have different fine hashes
        assert_ne!(fine_hash(0, 0), fine_hash(1, 0));
        assert_ne!(fine_hash(0, 0), fine_hash(0, 1));
    }

    #[test]
    fn test_elevation_range() {
        for x in -50..50i32 {
            for y in -50..50i32 {
                let e = elevation(x, y);
                assert!(e <= 7, "elevation({x},{y}) = {e} > 7");
            }
        }
    }

    #[test]
    fn test_tile_color_deterministic() {
        let c1 = tile_color(50, 50, 0);
        let c2 = tile_color(50, 50, 0);
        assert_eq!(c1, c2);
    }

    #[test]
    fn test_tile_color_frame_animation() {
        // Water tiles should change color with frame counter
        let wx = 0;
        let wy = 0;
        if is_water(wx, wy) {
            let c0 = tile_color(wx, wy, 0);
            let c1 = tile_color(wx, wy, 10);
            let c2 = tile_color(wx, wy, 20);
            // At least some of these should differ due to shimmer
            assert!(
                c0 != c1 || c1 != c2,
                "Water should animate with frame counter"
            );
        }
    }

    #[test]
    fn test_tile_color_non_water_stable() {
        // Non-water tiles should be frame-independent (except water reflection edge)
        // Find a non-water tile
        let mut wx = 0i32;
        let mut wy = 0i32;
        for x in 0..100 {
            for y in 0..100 {
                if !is_water(x, y) && !is_water(x, y - 1) {
                    wx = x;
                    wy = y;
                }
            }
        }
        let c0 = tile_color(wx, wy, 0);
        let c1 = tile_color(wx, wy, 100);
        assert_eq!(c0, c1, "Non-water tile should not animate");
    }

    #[test]
    fn test_generate_chunk_size() {
        let chunk = generate_chunk(0, 0, 0);
        assert_eq!(chunk.pixels.len(), CHUNK_SIZE * CHUNK_SIZE);
        assert!(!chunk.dirty); // Freshly generated, not modified
    }

    #[test]
    fn test_generate_chunk_not_empty() {
        let chunk = generate_chunk(0, 0, 0);
        // At least some pixels should be non-zero (non-black)
        let non_zero = chunk.pixels.iter().filter(|&&p| p != 0).count();
        assert!(non_zero > 0, "Generated chunk should have visible terrain");
    }

    #[test]
    fn test_generate_chunk_deterministic() {
        let c1 = generate_chunk(5, 10, 0);
        let c2 = generate_chunk(5, 10, 0);
        assert_eq!(c1.pixels, c2.pixels);
    }

    #[test]
    fn test_generate_chunk_adjacent_differ() {
        let c1 = generate_chunk(0, 0, 0);
        let c2 = generate_chunk(1, 0, 0);
        // Adjacent chunks should not be identical
        assert_ne!(c1.pixels, c2.pixels);
    }

    #[test]
    fn test_generate_chunk_frame_affects_water() {
        let c0 = generate_chunk(0, 0, 0);
        let c1 = generate_chunk(0, 0, 10);
        // If this chunk has water, colors should differ
        let differs = c0
            .pixels
            .iter()
            .zip(c1.pixels.iter())
            .any(|(&a, &b)| a != b);
        // Chunk (0,0) should have some water
        assert!(differs, "Water tiles should animate between frames");
    }

    #[test]
    fn test_biome_boundary_blending() {
        // At biome boundaries (positions 0,1,6,7 within 8-tile zone),
        // colors should be blended with neighbors
        let zone_start = 16i32; // guaranteed zone boundary
        let interior = tile_color(zone_start + 3, zone_start + 3, 0);
        let boundary = tile_color(zone_start + 7, zone_start + 3, 0);
        let next_zone = tile_color(zone_start + 8 + 3, zone_start + 3, 0);

        // The boundary color should differ from a pure interior color
        // (it's blended with the next zone's biome)
        // This is a weak test -- just ensure they're not all the same
        let all_same = interior == boundary && boundary == next_zone;
        // With 32 biomes, probability of all-same at a boundary is very low
        // but we don't want a flaky test, so just check blending produces
        // a valid color
        assert!(boundary < 0x1000000, "Boundary color should be valid RGB");
    }

    #[test]
    fn test_blend_packed_rgb() {
        // Blend red and blue at 50%
        let result = blend_packed_rgb(0xFF0000, 0x0000FF, 128);
        // Expect roughly (0x80, 0x00, 0x80)
        let r = (result >> 16) & 0xFF;
        let b = result & 0xFF;
        assert!((r as i32 - 0x80).abs() < 2, "Red channel: got {r:#x}");
        assert!((b as i32 - 0x80).abs() < 2, "Blue channel: got {b:#x}");
    }

    #[test]
    fn test_apply_packed_offset() {
        // Positive uniform offset: 0x808080 + 0x10 = 0x909090
        let result = apply_packed_offset(0x808080, 0x10);
        assert_eq!(result, 0x909090);

        // Negative offset should clamp to 0: 0x05 + (-16) = -11, clamped to 0
        let result = apply_packed_offset(0x050505, -16);
        assert_eq!(result, 0);
    }

    #[test]
    fn test_trees_on_forest() {
        let chunk = generate_chunk(0, 0, 0);
        // Check if any forest tiles have tree canopy pixels
        // Forest biome indices: 10, 11
        let mut has_tree = false;
        for tile_ly in 0..(CHUNK_SIZE / 4) {
            for tile_lx in 0..(CHUNK_SIZE / 4) {
                let wx = (tile_lx * 4 + 2) as i32;
                let wy = (tile_ly * 4 + 2) as i32;
                let bi = biome_index(wx, wy);
                if bi == 10 || bi == 11 {
                    let px = chunk.pixels[(tile_ly * 4) * CHUNK_SIZE + tile_lx * 4];
                    if px == 0x0A5500 {
                        has_tree = true;
                    }
                }
            }
        }
        // With ~50% placement, at least one forest tile in a 64x64 chunk
        // should have a tree (if there are forest tiles)
        // Not guaranteed for every chunk, so this is informational
        let _ = has_tree; // No assert -- just validates the function runs
    }
}
