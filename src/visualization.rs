// Hilbert Visualization - SEE the RAM texture
//
// Renders the 4096x4096 texture data as a PNG using Hilbert curve mapping
// so nearby addresses appear as nearby pixels. Color-coded by opcode.
// After running the self-replicator, you can SEE the program as a colored
// region and its copy at address 100.
//
// Three visual layers:
//   1. Program code — colored by opcode (blue=LDI, orange=ADD, white=HALT, etc.)
//   2. Font atlas — at 0xF00000, rendered with a distinct purple tint
//   3. Text output — addresses written by CHAR instructions, shown in green

use crate::assembler::op;
use crate::font_atlas::FONT_BASE;
use crate::substrate::{Substrate, TEXTURE_SIZE};
use image::{ImageBuffer, Rgb};

/// Classification of a substrate address for visualization purposes.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum AddressClass {
    /// Empty / uninitialized memory (value == 0)
    Empty,
    /// Program code (contains valid opcodes)
    Code,
    /// Font atlas data (FONT_BASE..FONT_BASE+1024)
    FontAtlas,
    /// Text output region (written by CHAR instructions — 8-byte bitmaps)
    TextOutput,
    /// Data (non-zero values that aren't recognized code or font)
    Data,
}

/// Font atlas covers FONT_BASE..FONT_BASE + 128*8 = FONT_BASE + 1024
const FONT_ATLAS_END: u32 = FONT_BASE + 1024;

/// Classify a substrate address based on its value and location.
pub fn classify_address(addr: u32, value: u32) -> AddressClass {
    if value == 0 {
        return AddressClass::Empty;
    }
    if addr >= FONT_BASE && addr < FONT_ATLAS_END {
        return AddressClass::FontAtlas;
    }
    let opcode = (value & 0xFF) as u8;
    // If the low byte is a known opcode and the upper bytes look like
    // a valid instruction encoding, classify as Code.
    if is_known_opcode(opcode) && looks_like_instruction(value) {
        return AddressClass::Code;
    }
    // If the value looks like an 8-bit row bitmap (common pattern for CHAR output),
    // and it's in a reasonable address range, classify as TextOutput.
    if is_bitmap_pattern(value) {
        return AddressClass::TextOutput;
    }
    AddressClass::Data
}

fn is_known_opcode(op: u8) -> bool {
    matches!(
        op,
        0 | op::LDI
            | op::MOV
            | op::LOAD
            | op::STORE
            | op::ADD
            | op::SUB
            | op::MUL
            | op::DIV
            | op::JMP
            | op::BRANCH
            | op::CALL
            | op::RET
            | op::HALT
            | op::ENTRY
            | op::CHAR
            | op::BLIT
            | op::DRAW
            | op::SPAWN
            | op::YIELD
    )
}

/// Check if a value looks like a properly encoded instruction.
/// Instructions have the opcode in the low byte, with upper bytes
/// containing register indices (0-127) and flags.
fn looks_like_instruction(value: u32) -> bool {
    let _ = value; // The opcode check in classify_address is sufficient for now
    true
}

/// Check if a value looks like a character bitmap row (8-bit pattern).
/// Bitmap rows from CHAR output have the pattern 0x000000XX where XX is
/// the row bitmask, or can be wider values from LDI operands.
fn is_bitmap_pattern(value: u32) -> bool {
    // CHAR writes 8-byte bitmaps. The values are the font row bytes (0-255).
    // They're small values stored as u32 with upper bytes zero.
    value > 0 && value <= 0xFF && (value & 0xFF) == value
}

/// Full RGBA color for an opcode, enhanced with address classification.
pub fn address_color(addr: u32, value: u32) -> Rgb<u8> {
    let class = classify_address(addr, value);
    match class {
        AddressClass::Empty => Rgb([5, 5, 10]),
        AddressClass::FontAtlas => {
            // Purple tint for font atlas — brightness varies by row value
            let brightness = if value > 0 { 180u8 } else { 40u8 };
            Rgb([brightness / 2, 20, brightness])
        }
        AddressClass::TextOutput => {
            // Bright green for rendered text
            let brightness = if value > 0 { 220u8 } else { 20u8 };
            Rgb([20, brightness, 60])
        }
        AddressClass::Data => {
            // Warm gray for data
            Rgb([100, 80, 60])
        }
        AddressClass::Code => {
            let opcode = (value & 0xFF) as u8;
            opcode_color(opcode)
        }
    }
}

/// Full RGBA color for an opcode. Designed for visual clarity.
pub fn opcode_color(opcode: u8) -> Rgb<u8> {
    match opcode {
        0 => Rgb([10, 10, 10]),      // NOP - near-black
        op::LDI => Rgb([30, 100, 255]), // LDI - bright blue
        op::MOV => Rgb([0, 200, 200]),  // MOV - cyan
        op::LOAD => Rgb([0, 220, 80]),  // LOAD - green
        op::STORE => Rgb([220, 200, 0]), // STORE - yellow
        op::ADD => Rgb([255, 140, 0]),  // ADD - orange
        op::SUB => Rgb([220, 50, 100]), // SUB - magenta-red
        op::MUL => Rgb([180, 0, 220]),  // MUL - purple
        op::DIV => Rgb([100, 0, 200]),  // DIV - dark purple
        op::JMP => Rgb([255, 50, 50]),  // JMP - red
        op::BRANCH => Rgb([255, 80, 80]), // BRANCH - light red
        op::CALL => Rgb([255, 200, 50]), // CALL - gold
        op::RET => Rgb([200, 180, 50]), // RET - dark gold
        op::HALT => Rgb([255, 255, 255]), // HALT - white
        op::ENTRY => Rgb([100, 255, 100]), // ENTRY - bright green
        op::CHAR => Rgb([0, 255, 128]),    // CHAR - spring green
        op::BLIT => Rgb([128, 255, 0]),    // BLIT - lime
        op::DRAW => Rgb([0, 255, 200]),  // DRAW - teal
        op::SPAWN => Rgb([255, 0, 200]), // SPAWN - hot pink
        op::YIELD => Rgb([150, 150, 150]), // YIELD - gray
        _ => Rgb([60, 60, 60]),         // unknown - dark gray
    }
}

/// Render the full substrate as a Hilbert-curve PNG.
///
/// Each pixel in the output image represents one address in the substrate.
/// The Hilbert curve maps linear addresses to 2D coordinates so that
/// nearby addresses cluster visually. You can SEE programs as colored regions.
///
/// For a 4096x4096 texture, this produces a 4096x4096 PNG (64MB raw).
/// Use `scale` to downsample: scale=4 gives 1024x1024, scale=16 gives 256x256.
pub fn render_hilbert_png(
    substrate: &Substrate,
    scale: u32,
    path: &str,
) {
    let out_size = TEXTURE_SIZE / scale;
    let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> = ImageBuffer::new(out_size, out_size);

    for y in 0..out_size {
        for x in 0..out_size {
            // Map output pixel back to texture coordinates
            let tex_x = x * scale;
            let tex_y = y * scale;

            // Sample the center pixel of the scaled block
            let addr = crate::hilbert::xy2d(tex_x + scale / 2, tex_y + scale / 2);
            let value = substrate.peek(addr);

            // Use address-aware coloring: font atlas gets purple tint,
            // text output gets green, code gets opcode colors.
            let color = address_color(addr, value);

            img.put_pixel(x, y, color);
        }
    }

    if let Err(e) = img.save(path) {
        eprintln!("Failed to save Hilbert PNG: {e}");
    }
}

/// Render a zoomed region of the substrate centered on a Hilbert address range.
///
/// Shows `width x height` pixels starting at `start_addr`, colored by opcode.
/// This is the detailed view -- each address gets its own pixel.
pub fn render_region_png(
    substrate: &Substrate,
    start_addr: u32,
    width: u32,
    height: u32,
    path: &str,
) {
    let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> = ImageBuffer::new(width, height);

    for row in 0..height {
        for col in 0..width {
            let addr = start_addr + row * width + col;
            let value = substrate.peek(addr);
            let opcode = (value & 0xFF) as u8;
            img.put_pixel(col, row, opcode_color(opcode));
        }
    }

    if let Err(e) = img.save(path) {
        eprintln!("Failed to save region PNG: {e}");
    }
}

/// Render a side-by-side comparison of two address ranges.
/// Useful for verifying self-replication: source vs copy.
pub fn render_comparison_png(
    substrate: &Substrate,
    src_addr: u32,
    dst_addr: u32,
    length: u32,
    path: &str,
) {
    let width = length;
    let height = 2; // row 0 = source, row 1 = copy
    let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> = ImageBuffer::new(width, height);

    for i in 0..length {
        // Source row
        let src_val = substrate.peek(src_addr + i);
        let src_op = (src_val & 0xFF) as u8;
        img.put_pixel(i, 0, opcode_color(src_op));

        // Copy row
        let dst_val = substrate.peek(dst_addr + i);
        let dst_op = (dst_val & 0xFF) as u8;
        img.put_pixel(i, 1, opcode_color(dst_op));
    }

    if let Err(e) = img.save(path) {
        eprintln!("Failed to save comparison PNG: {e}");
    }
}

/// Render text that was written by CHAR instructions.
///
/// After a program uses CHAR to blit characters to a region, this function
/// reads the bitmap data and renders it as visible glyphs in a PNG.
/// Each character is 8 pixels wide, 8 pixels tall. Characters are laid out
/// horizontally starting at `start_addr`, with each char taking 8 consecutive
/// addresses (one per row).
///
/// `num_chars` = how many characters to render.
/// `scale` = pixels per bitmap pixel (1 = tiny, 4 = readable).
pub fn render_text_png(
    substrate: &Substrate,
    start_addr: u32,
    num_chars: u32,
    scale: u32,
    path: &str,
) {
    let char_w = 8 * scale;
    let char_h = 8 * scale;
    let img_w = num_chars * char_w;
    let img_h = char_h;
    let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> = ImageBuffer::new(img_w, img_h);

    let bg = Rgb([10, 10, 20]);
    let fg = Rgb([220, 255, 220]);

    for ch in 0..num_chars {
        let char_base = start_addr + ch * 8;
        for row in 0..8u32 {
            let row_val = substrate.peek(char_base + row);
            for bit in 0..8u32 {
                let pixel_on = (row_val >> (7 - bit)) & 1 == 1;
                let color = if pixel_on { fg } else { bg };
                // Scale each bitmap pixel into a scale x scale block
                for dy in 0..scale {
                    for dx in 0..scale {
                        let x = ch * char_w + bit * scale + dx;
                        let y = row * scale + dy;
                        img.put_pixel(x, y, color);
                    }
                }
            }
        }
    }

    if let Err(e) = img.save(path) {
        eprintln!("Failed to save text PNG: {e}");
    }
}

/// Comprehensive substrate overview rendering.
///
/// Produces a set of PNGs that show the complete state of a substrate:
///   - `{prefix}_overview.png`: Full Hilbert curve view with address classification
///   - `{prefix}_programs.png`: Zoomed view of program regions
///   - `{prefix}_text.png`: Rendered text output from CHAR instructions
///   - `{prefix}_legend.txt`: Color legend explaining the visualization
///
/// This is the main entry point for GEO-14 visualization.
pub fn render_substrate_overview(
    substrate: &Substrate,
    prefix: &str,
    program_regions: &[(u32, u32)],   // (start_addr, length) for each program
    text_regions: &[(u32, u32, u32)], // (start_addr, num_chars, scale) for text output
) {
    // 1. Full Hilbert overview with address classification
    let scale = 64u32; // 4096/64 = 64x64 overview
    let out_size = TEXTURE_SIZE / scale;
    let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> = ImageBuffer::new(out_size, out_size);

    for y in 0..out_size {
        for x in 0..out_size {
            let tex_x = x * scale;
            let tex_y = y * scale;
            let addr = crate::hilbert::xy2d(tex_x + scale / 2, tex_y + scale / 2);
            let value = substrate.peek(addr);
            let color = address_color(addr, value);
            img.put_pixel(x, y, color);
        }
    }

    let overview_path = format!("{prefix}_overview.png");
    if let Err(e) = img.save(&overview_path) {
        eprintln!("Failed to save {overview_path}: {e}");
    } else {
        eprintln!("[viz] Wrote {overview_path} ({out_size}x{out_size} Hilbert overview)");
    }

    // 2. Zoomed program regions
    for (idx, &(start, len)) in program_regions.iter().enumerate() {
        let width = 32u32.max(len);
        let height = ((len + 31) / 32).max(1);
        let mut region_img: ImageBuffer<Rgb<u8>, Vec<u8>> =
            ImageBuffer::new(width, height);

        for row in 0..height {
            for col in 0..width {
                let addr = start + row * width + col;
                let value = substrate.peek(addr);
                let color = address_color(addr, value);
                if col < width && row < height {
                    region_img.put_pixel(col, row, color);
                }
            }
        }

        let path = format!("{prefix}_program{idx}.png");
        if let Err(e) = region_img.save(&path) {
            eprintln!("Failed to save {path}: {e}");
        } else {
            eprintln!(
                "[viz] Wrote {path} ({width}x{height}, addr {start}..{})",
                start + len
            );
        }
    }

    // 3. Text output rendering
    for &(start_addr, num_chars, scale) in text_regions {
        if num_chars == 0 {
            continue;
        }
        render_text_png(substrate, start_addr, num_chars, scale, &format!("{prefix}_text.png"));
        eprintln!(
            "[viz] Wrote {}_text.png (addr {start_addr}, {num_chars} chars, {scale}x scale)",
            prefix
        );
    }

    // 4. Font atlas visualization — show the font atlas region as a grid of characters
    render_font_atlas_png(substrate, &format!("{prefix}_font_atlas.png"));

    eprintln!("[viz] Overview complete. Prefix: {prefix}");
}

/// Render the font atlas as a readable PNG — shows all printable characters.
/// Each character is rendered at the given scale in a grid layout.
pub fn render_font_atlas_png(substrate: &Substrate, path: &str) {
    let char_scale = 2u32;
    let cols = 16u32; // 16 characters per row
    let rows = 8u32; // 8 rows for printable ASCII 32-127 (96 chars / 16 = 6, + padding)
    let char_px = 8 * char_scale;
    let img_w = cols * char_px;
    let img_h = rows * char_px;
    let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> = ImageBuffer::new(img_w, img_h);

    let bg = Rgb([10, 10, 20]);
    let fg = Rgb([180, 120, 255]); // Purple to match FontAtlas color

    for ch_idx in 0..128u32 {
        let ascii = ch_idx as u8;
        if ascii < 32 || ascii > 126 {
            continue; // Skip control chars and DEL
        }
        let grid_col = (ch_idx - 32) % cols;
        let grid_row = (ch_idx - 32) / cols;

        for row in 0..8u32 {
            let row_addr = FONT_BASE + ch_idx * 8 + row;
            let row_val = substrate.peek(row_addr);
            for bit in 0..8u32 {
                let pixel_on = (row_val >> (7 - bit)) & 1 == 1;
                let color = if pixel_on { fg } else { bg };
                for dy in 0..char_scale {
                    for dx in 0..char_scale {
                        let x = grid_col * char_px + bit * char_scale + dx;
                        let y = grid_row * char_px + row * char_scale + dy;
                        if x < img_w && y < img_h {
                            img.put_pixel(x, y, color);
                        }
                    }
                }
            }
        }
    }

    if let Err(e) = img.save(path) {
        eprintln!("Failed to save font atlas PNG: {e}");
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::assembler;
    use crate::software_vm::SoftwareVm;
    use crate::substrate::Substrate;
    use image::GenericImageView;

    #[test]
    fn render_text_from_hello_world() {
        // Run hello_world, then render the text output as a readable PNG.
        let program = assembler::hello_world();
        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        // hello_world writes 'HELLO' starting at address 5000
        // Each char is 8 rows, 5 chars = addresses 5000..5039
        let mem = Substrate::new();
        for i in 0..40u32 {
            mem.poke(5000 + i, svm.peek(5000 + i));
        }

        // Render at 4x scale so characters are readable
        render_text_png(&mem, 5000, 5, 4, "/tmp/geo_hello_text.png");

        assert!(
            std::path::Path::new("/tmp/geo_hello_text.png").exists(),
            "Text PNG should exist"
        );

        // Verify the PNG has the expected dimensions: 5 chars * 8px * 4 scale = 160px wide, 32px tall
        let img = image::open("/tmp/geo_hello_text.png").expect("should load PNG");
        assert_eq!(img.width(), 160, "5 chars * 8px * 4x scale = 160");
        assert_eq!(img.height(), 32, "8px * 4x scale = 32");

        // Spot-check: 'H' row 0 = 0xC6 = 11000110
        // Bit 7 (leftmost) = 1 -> foreground at (0,0)
        let pixel = img.get_pixel(0, 0);
        assert!(pixel.0[1] > 200, "top-left of H should be foreground (bright)");

        // 'H' row 0 bit 5 = 0 -> background at x=8..11 (4x scale)
        let pixel_off = img.get_pixel(10, 2);
        assert!(pixel_off.0[0] < 30, "H row 0 bit 5 should be background (dark)");
    }

    #[test]
    fn render_hilbert_after_replication() {
        // Run the self-replicator on the software VM
        let program = assembler::self_replicator();
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        // Create a substrate from the software VM's RAM for visualization
        let mem = Substrate::new();
        // Copy program pixels from software VM into substrate for rendering
        for i in 0..program.pixels.len() as u32 {
            mem.poke(i, svm.peek(i));
            mem.poke(100 + i, svm.peek(100 + i));
        }

        // Render full Hilbert visualization (downscaled)
        render_hilbert_png(&mem, 64, "/tmp/geo_hilbert_full.png");

        // Render detailed view of the program region
        render_region_png(&mem, 0, 32, 4, "/tmp/geo_source_region.png");
        render_region_png(&mem, 100, 32, 4, "/tmp/geo_copy_region.png");

        // Render side-by-side comparison
        render_comparison_png(&mem, 0, 100, 18, "/tmp/geo_comparison.png");

        // Verify files exist
        assert!(
            std::path::Path::new("/tmp/geo_hilbert_full.png").exists(),
            "Hilbert PNG should exist"
        );
        assert!(
            std::path::Path::new("/tmp/geo_comparison.png").exists(),
            "Comparison PNG should exist"
        );
    }

    #[test]
    fn render_overview_with_text_and_font_atlas() {
        // Run hello_world to generate text output at addresses 5000-5047
        let program = assembler::hello_world();
        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        // Also run self-replicator at address 200 to have multiple program regions
        let repl = assembler::self_replicator();
        svm.load_program(200, &repl.pixels);
        svm.spawn_vm(1, 200);
        svm.execute_frame();

        // Copy everything into a substrate for rendering
        let mem = Substrate::new();
        // Copy font atlas
        for i in 0..1024u32 {
            mem.poke(FONT_BASE + i, svm.peek(FONT_BASE + i));
        }
        // Copy hello_world program + text output
        for i in 0..5048u32 {
            let val = svm.peek(i);
            if val != 0 {
                mem.poke(i, val);
            }
        }
        // Copy self-replicator program at addr 200 + copy at 300
        for i in 0..18u32 {
            mem.poke(200 + i, svm.peek(200 + i));
            mem.poke(300 + i, svm.peek(300 + i));
        }

        // Render comprehensive overview
        render_substrate_overview(
            &mem,
            "/tmp/geo_full",
            &[(0, 26), (200, 18), (300, 18)], // program regions
            &[(5000, 5, 4)],                   // text: 5 chars at 4x scale
        );

        // Verify all output files exist
        assert!(
            std::path::Path::new("/tmp/geo_full_overview.png").exists(),
            "Overview PNG should exist"
        );
        assert!(
            std::path::Path::new("/tmp/geo_full_program0.png").exists(),
            "Program 0 PNG should exist"
        );
        assert!(
            std::path::Path::new("/tmp/geo_full_text.png").exists(),
            "Text PNG should exist"
        );
        assert!(
            std::path::Path::new("/tmp/geo_full_font_atlas.png").exists(),
            "Font atlas PNG should exist"
        );

        // Verify text PNG has correct dimensions (5 chars * 8px * 4x = 160 wide, 32 tall)
        let text_img = image::open("/tmp/geo_full_text.png").expect("text PNG should load");
        assert_eq!(text_img.width(), 160, "text width: 5*8*4=160");
        assert_eq!(text_img.height(), 32, "text height: 8*4=32");

        // Verify font atlas PNG has content (16 cols * 16px = 256 wide)
        let font_img = image::open("/tmp/geo_full_font_atlas.png").expect("font atlas PNG should load");
        assert_eq!(font_img.width(), 256, "font atlas: 16 cols * 16px = 256");
        assert!(font_img.height() > 0, "font atlas should have rows");

        // Verify address classification works correctly
        let empty_class = classify_address(99999, 0);
        assert_eq!(empty_class, AddressClass::Empty);

        let font_class = classify_address(FONT_BASE + 100, 0x66);
        assert_eq!(font_class, AddressClass::FontAtlas);

        // A value with LDI opcode (1) in low byte should be classified as Code
        // LDI r0, 42 encodes as: opcode=1, then value 42 in data word
        // Use HALT (13) which is clearly an opcode
        let halt_class = classify_address(10, 0x0000000D);
        assert_eq!(halt_class, AddressClass::Code);

        // A small value like a bitmap byte should be TextOutput
        let text_class = classify_address(5005, 0x66); // bitmap row
        assert_eq!(text_class, AddressClass::TextOutput);

        eprintln!("[test] All GEO-14 visualization checks passed");
    }
}
