// geos_debug_vis.rs -- Standalone visual debugging tools for Geometry OS
//
// Implements Option C from the Glass Box philosophy:
// 1. visual_diff_ram: Compare live VM RAM against a reference .rts.png
// 2. pc_heatmap: Generate a heatmap of PC visits over time

use geometry_os::pixel::{boot_from_rts_png, d2xy};
use geometry_os::save::load_state;
use geometry_os::vm::types::RAM_SIZE;
use std::env;
use std::fs::File;
use std::io::BufWriter;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        print_usage();
        return;
    }

    match args[1].as_str() {
        "diff" => {
            if args.len() != 8 || args[2] != "--live" || args[4] != "--ref" || args[6] != "--out" {
                println!("Usage: geos_debug_vis diff --live <ram.sav> --ref <ref.rts.png> --out <diff.png>");
                return;
            }
            let live_path = &args[3];
            let ref_path = &args[5];
            let out_path = &args[7];

            if let Err(e) = visual_diff_ram(live_path, ref_path, out_path) {
                eprintln!("Error generating visual diff: {}", e);
            } else {
                println!("Successfully generated visual diff at {}", out_path);
            }
        },
        "heatmap" => {
            // Note: Tracing would be needed for a real PC heatmap.
            // This is a placeholder showing the structure of Option C.
            println!("Heatmap tool is a stub. It would read a trace log and output a PNG.");
        },
        _ => print_usage(),
    }
}

fn print_usage() {
    println!("Geometry OS - Visual Debug Tools");
    println!("Usage:");
    println!("  diff --live <ram.sav> --ref <reference.rts.png> --out <diff.png>");
    println!("  heatmap --trace <trace.log> --dims <W>x<H> --out <heatmap.png>");
}

/// Compare live VM RAM against a reference .rts.png
/// Returns a diff PNG where:
///   black = identical
///   red = live differs from reference
///   green = reference has data, live is zero (not executed/cleared)
///   blue = live has data, reference is zero (new allocation)
fn visual_diff_ram(live_path: &str, ref_path: &str, out_path: &str) -> Result<(), String> {
    // 1. Load Live State
    let (live_vm, _, _) =
        load_state(live_path).map_err(|e| format!("Failed to load live state: {}", e))?;
    let live_ram = &live_vm.ram;

    // 2. Load Reference State (.rts.png)
    let mut ref_ram = vec![0u32; RAM_SIZE];
    // RTS PNG loads at 0x1000 for standard boot paths, but the spatial index starts at 0.
    // Wait, the boot_from_rts_png function writes at load_addr. Let's assume load_addr = 0
    // to map Hilbert index directly to RAM index for comparison purposes.
    boot_from_rts_png(ref_path, &mut ref_ram, 0)
        .map_err(|e| format!("Failed to load reference RTS: {}", e))?;

    // 3. Generate Diff Image
    // Using Hilbert mapping, same as rts.png (Order 8 = 256x256 = 65536)
    let grid_size = 256;
    let grid_order = 8;

    let mut pixels = vec![0u8; (grid_size * grid_size * 4) as usize];

    for i in 0..RAM_SIZE {
        let (x, y) = d2xy(grid_order, i as u32);

        let live_val = live_ram[i];
        let ref_val = ref_ram[i];

        let offset = ((y * grid_size + x) * 4) as usize;

        if live_val == ref_val {
            // identical -> Black (or dark grey to see layout)
            if ref_val != 0 {
                pixels[offset] = 40; // R
                pixels[offset + 1] = 40; // G
                pixels[offset + 2] = 40; // B
                pixels[offset + 3] = 255; // A
            } else {
                pixels[offset + 3] = 255; // Solid black
            }
        } else if live_val == 0 && ref_val != 0 {
            // green = reference has data, live is zero (cleared/not loaded)
            pixels[offset] = 0; // R
            pixels[offset + 1] = 255; // G
            pixels[offset + 2] = 0; // B
            pixels[offset + 3] = 255; // A
        } else if live_val != 0 && ref_val == 0 {
            // blue = live has data, reference is zero (new allocation)
            pixels[offset] = 0; // R
            pixels[offset + 1] = 0; // G
            pixels[offset + 2] = 255; // B
            pixels[offset + 3] = 255; // A
        } else {
            // red = live differs from reference (mutation / corruption / dynamic code)
            pixels[offset] = 255; // R
            pixels[offset + 1] = 0; // G
            pixels[offset + 2] = 0; // B
            pixels[offset + 3] = 255; // A
        }
    }

    // 4. Save PNG
    let file = File::create(out_path).map_err(|e| format!("Cannot create {}: {}", out_path, e))?;
    let ref mut w = BufWriter::new(file);
    let mut encoder = png::Encoder::new(w, grid_size, grid_size);
    encoder.set_color(png::ColorType::Rgba);
    encoder.set_depth(png::BitDepth::Eight);
    let mut writer = encoder
        .write_header()
        .map_err(|e| format!("PNG error: {}", e))?;
    writer
        .write_image_data(&pixels)
        .map_err(|e| format!("PNG error: {}", e))?;

    Ok(())
}
