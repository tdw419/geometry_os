//! Bare Metal Window Renderer Demo
//!
//! Demonstrates the Phase 4 bare metal rendering pipeline:
//! - Creates a framebuffer
//! - Renders multiple VM windows as colored rectangles
//! - Outputs a simple ASCII visualization
//!
//! Run: cargo run --package infinite_map_rs --example bare_metal_demo --release

use infinite_map_rs::bare_metal::{
    GpuFramebuffer, ScreenDimensionsConfig, WindowInstance, WindowRenderer, WindowState,
};

fn main() {
    println!("=== Bare Metal Window Renderer Demo ===\n");

    // Create screen configuration
    let config = ScreenDimensionsConfig::new(80, 40);
    println!("Screen: {}x{}", config.width, config.height);

    // Create framebuffer
    let mut framebuffer = GpuFramebuffer::new(&config);
    framebuffer.clear(0x000000); // Black background
    println!("Framebuffer initialized\n");

    // Create window renderer
    let mut renderer = WindowRenderer::new(8);

    // Add VM windows with different states
    let windows = vec![
        WindowInstance {
            id: 0,
            vm_id: 100,
            x: 5,
            y: 5,
            width: 20,
            height: 12,
            border_color: WindowRenderer::get_state_color(WindowState::Running),
            state: WindowState::Running,
        },
        WindowInstance {
            id: 1,
            vm_id: 101,
            x: 30,
            y: 5,
            width: 20,
            height: 12,
            border_color: WindowRenderer::get_state_color(WindowState::Waiting),
            state: WindowState::Waiting,
        },
        WindowInstance {
            id: 2,
            vm_id: 102,
            x: 55,
            y: 5,
            width: 20,
            height: 12,
            border_color: WindowRenderer::get_state_color(WindowState::Halted),
            state: WindowState::Halted,
        },
        WindowInstance {
            id: 3,
            vm_id: 103,
            x: 17,
            y: 22,
            width: 45,
            height: 14,
            border_color: WindowRenderer::get_state_color(WindowState::Running),
            state: WindowState::Running,
        },
    ];

    for window in windows {
        println!(
            "Window {}: VM {} at ({},{}) {}x{} - {:?}",
            window.id,
            window.vm_id,
            window.x,
            window.y,
            window.width,
            window.height,
            window.state
        );
        renderer.add_window(window).unwrap();
    }

    println!("\nRendering {} windows...\n", renderer.window_count());

    // Render windows to framebuffer
    renderer.render(&mut framebuffer);

    // ASCII visualization (downsample 4x)
    println!("ASCII Visualization (4x downsample):");
    println!("{}", "=".repeat(21));

    let chars = [' ', '.', ':', '+', '*', '#', '@'];
    let step = 4;

    for y in (0..config.height).step_by(step) {
        let mut line = String::new();
        for x in (0..config.width).step_by(step) {
            let pixel = framebuffer.get_pixel(x, y);
            // Extract brightness from pixel
            let r = ((pixel >> 16) & 0xFF) as f32;
            let g = ((pixel >> 8) & 0xFF) as f32;
            let b = (pixel & 0xFF) as f32;
            let brightness = (r * 0.299 + g * 0.587 + b * 0.114) / 255.0;
            let char_idx = (brightness * (chars.len() - 1) as f32) as usize;
            line.push(chars[char_idx.min(chars.len() - 1)]);
        }
        println!("|{}|", line);
    }
    println!("{}", "=".repeat(21));

    println!("\n=== Demo Complete ===");
    println!("State colors:");
    println!("  Running: Green  (0x{:06X})", WindowRenderer::get_state_color(WindowState::Running));
    println!("  Waiting: Yellow (0x{:06X})", WindowRenderer::get_state_color(WindowState::Waiting));
    println!("  Halted:  Red    (0x{:06X})", WindowRenderer::get_state_color(WindowState::Halted));
    println!("  Inactive: Gray   (0x{:06X})", WindowRenderer::get_state_color(WindowState::Inactive));
}
