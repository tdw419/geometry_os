//! Tests for bare metal window renderer

use infinite_map_rs::bare_metal::{
    GpuFramebuffer, ScreenDimensionsConfig, WindowInstance, WindowRenderer, WindowState,
};

#[test]
fn test_window_renderer_creation() {
    let renderer = WindowRenderer::new(8);
    assert_eq!(renderer.window_count(), 0);
}

#[test]
fn test_add_window() {
    let mut renderer = WindowRenderer::new(8);
    let window = WindowInstance {
        id: 1,
        vm_id: 1,
        x: 10,
        y: 10,
        width: 100,
        height: 100,
        border_color: 0x00FF00,
        state: WindowState::Running,
    };
    renderer.add_window(window).unwrap();
    assert_eq!(renderer.window_count(), 1);
}

#[test]
fn test_max_windows() {
    let mut renderer = WindowRenderer::new(2);
    renderer.add_window(WindowInstance::default()).unwrap();
    renderer.add_window(WindowInstance::default()).unwrap();
    assert!(renderer.add_window(WindowInstance::default()).is_err());
}

#[test]
fn test_render_window() {
    let config = ScreenDimensionsConfig::new(200, 200);
    let mut fb = GpuFramebuffer::new(&config);
    let mut renderer = WindowRenderer::new(8);

    renderer.add_window(WindowInstance {
        id: 1,
        x: 10,
        y: 10,
        width: 50,
        height: 50,
        border_color: 0xFFFFFF,
        state: WindowState::Running,
        ..Default::default()
    }).unwrap();

    renderer.render(&mut fb);

    // Verify border pixels are drawn
    assert_ne!(fb.get_pixel(10, 10), 0, "Top-left corner should have border color");
    assert_ne!(fb.get_pixel(35, 10), 0, "Top edge should have border color");
}

#[test]
fn test_state_colors() {
    assert_eq!(WindowRenderer::get_state_color(WindowState::Running), 0x00FF00);
    assert_eq!(WindowRenderer::get_state_color(WindowState::Halted), 0xFF0000);
    assert_eq!(WindowRenderer::get_state_color(WindowState::Waiting), 0xFFFF00);
    assert_eq!(WindowRenderer::get_state_color(WindowState::Inactive), 0x333333);
}
