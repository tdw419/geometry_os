// Hilbert Visualization - SEE the RAM texture
//
// Renders the 4096x4096 texture data as a PNG using Hilbert curve mapping
// so nearby addresses appear as nearby pixels. Color-coded by opcode.
// After running the self-replicator, you can SEE the program as a colored
// region and its copy at address 100.

use crate::assembler::op;
use crate::substrate::{Substrate, TEXTURE_SIZE};
use image::{ImageBuffer, Rgb};

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
            let opcode = (value & 0xFF) as u8;

            // Brighten non-zero pixels so they stand out against black
            let base = opcode_color(opcode);
            let brightness = if opcode == 0 && value == 0 { 0u8 } else { 255u8 };

            let color = Rgb([
                (base.0[0] as u16 * brightness as u16 / 255) as u8,
                (base.0[1] as u16 * brightness as u16 / 255) as u8,
                (base.0[2] as u16 * brightness as u16 / 255) as u8,
            ]);

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

#[cfg(test)]
mod tests {
    use super::*;
    use crate::assembler;
    use crate::software_vm::SoftwareVm;
    use crate::substrate::Substrate;

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
}
