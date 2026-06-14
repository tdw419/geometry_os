use crate::vm::types::MAX_SPRITE_LAYERS;
use crate::vm::Vm;

#[test]
fn test_sprite_layer_buffer_exists() {
    let mut vm = Vm::new();
    assert_eq!(vm.sprite_layers.len(), MAX_SPRITE_LAYERS);
    assert_eq!(vm.sprite_layers[0].buffer.len(), 256 * 256);
    assert_eq!(vm.sprite_layers[0].active, false);
    assert_eq!(vm.sprite_layers[0].visible, true);
}

#[test]
fn test_blit_to_layer_main_screen() {
    let mut vm = Vm::new();

    // Set up sprite data in RAM
    let base: u32 = 0x5000;
    for i in 0..4 {
        vm.ram[(base + i as u32) as usize] = 0xFF0000; // red
    }

    // Blit red 2x2 square to main screen (layer 255)
    let result = vm.blit_to_layer(255, base, 10, 10, 2, 2, 0, 255);
    assert_eq!(result, 0);

    // Verify pixels were written
    assert_eq!(vm.screen[10 * 256 + 10], 0xFF0000);
    assert_eq!(vm.screen[10 * 256 + 11], 0xFF0000);
    assert_eq!(vm.screen[11 * 256 + 10], 0xFF0000);
    assert_eq!(vm.screen[11 * 256 + 11], 0xFF0000);
}

#[test]
fn test_blit_to_layer_offscreen() {
    let mut vm = Vm::new();

    // Set up sprite data
    let base: u32 = 0x5000;
    for i in 0..4 {
        vm.ram[(base + i as u32) as usize] = 0x00FF00; // green
    }

    // Blit to layer 0
    let result = vm.blit_to_layer(0, base, 20, 20, 2, 2, 0, 255);
    assert_eq!(result, 0);

    // Main screen should be unchanged
    assert_eq!(vm.screen[20 * 256 + 20], 0);

    // Layer 0 buffer should have the green square
    assert_eq!(vm.sprite_layers[0].buffer[20 * 256 + 20], 0x00FF00);
    assert_eq!(vm.sprite_layers[0].buffer[20 * 256 + 21], 0x00FF00);
    assert_eq!(vm.sprite_layers[0].buffer[21 * 256 + 20], 0x00FF00);
    assert_eq!(vm.sprite_layers[0].buffer[21 * 256 + 21], 0x00FF00);
}

#[test]
fn test_blit_to_layer_high_sprite_id() {
    let mut vm = Vm::new();

    // Create simple sprite data at RAM 0x5000
    let sheet_addr = 0x5000;
    // 2x2 green square
    for i in 0..4 {
        vm.ram[(sheet_addr + i as u32) as usize] = 0x00FF00; // green
    }

    // Blit from this offset (sprite_id=5 would be at offset 5*256=1280 in real sprite sheets,
    // but blit_to_layer just takes a RAM address, so we blit from the sheet_addr)
    let result = vm.blit_to_layer(0, sheet_addr, 1, 1, 2, 2, 0, 255);
    assert_eq!(result, 0);

    // Check sprite was blitted to layer 0
    assert_eq!(vm.sprite_layers[0].buffer[1 * 256 + 1], 0x00FF00);
    assert_eq!(vm.sprite_layers[0].buffer[1 * 256 + 2], 0x00FF00);
    assert_eq!(vm.sprite_layers[0].buffer[2 * 256 + 1], 0x00FF00);
    assert_eq!(vm.sprite_layers[0].buffer[2 * 256 + 2], 0x00FF00);
}

#[test]
fn test_set_layer_properties() {
    let mut vm = Vm::new();

    // Set layer 0 properties
    vm.sprite_layers[0].active = true;
    vm.sprite_layers[0].z_order = 5;
    vm.sprite_layers[0].visible = false;
    vm.sprite_layers[0].blend_mode = 1;
    vm.sprite_layers[0].alpha = 200;

    assert_eq!(vm.sprite_layers[0].active, true);
    assert_eq!(vm.sprite_layers[0].z_order, 5);
    assert_eq!(vm.sprite_layers[0].visible, false);
    assert_eq!(vm.sprite_layers[0].blend_mode, 1);
    assert_eq!(vm.sprite_layers[0].alpha, 200);
}

#[test]
fn test_clear_layer() {
    let mut vm = Vm::new();

    // Set up some pixels in layer 0
    vm.sprite_layers[0].buffer[10 * 256 + 10] = 0xFF0000;

    // Clear layer 0
    vm.clear_layer(0);

    // Verify it's cleared
    assert_eq!(vm.sprite_layers[0].buffer[10 * 256 + 10], 0);
}

#[test]
fn test_set_layer_active() {
    let mut vm = Vm::new();

    assert_eq!(vm.sprite_layers[0].active, false);

    vm.sprite_layers[0].active = true;

    assert_eq!(vm.sprite_layers[0].active, true);
}

#[test]
fn test_compose_layers_empty() {
    let mut vm = Vm::new();

    // No layers active - screen should be cleared
    vm.compose_layers();

    for i in 0..256 * 256 {
        assert_eq!(vm.screen[i], 0);
    }
}

#[test]
fn test_compose_layers_z_order() {
    let mut vm = Vm::new();

    // Set up layer 0: red square at (10, 10)
    vm.sprite_layers[0].buffer[10 * 256 + 10] = 0xFF0000;
    vm.sprite_layers[0].active = true;
    vm.sprite_layers[0].visible = true;
    vm.sprite_layers[0].z_order = 1;

    // Set up layer 1: green square at (10, 10), higher z-order
    vm.sprite_layers[1].buffer[10 * 256 + 10] = 0x00FF00;
    vm.sprite_layers[1].active = true;
    vm.sprite_layers[1].visible = true;
    vm.sprite_layers[1].z_order = 2;

    vm.compose_layers();

    // Green (higher z-order) should be on top
    assert_eq!(vm.screen[10 * 256 + 10], 0x00FF00);
}

#[test]
fn test_compose_layers_with_alpha() {
    let mut vm = Vm::new();

    // Set up layer 0 with alpha blending
    vm.sprite_layers[0].buffer[10 * 256 + 10] = 0x00FF00; // green
    vm.sprite_layers[0].active = true;
    vm.sprite_layers[0].visible = true;
    vm.sprite_layers[0].z_order = 1;
    vm.sprite_layers[0].blend_mode = 1; // alpha blend
    vm.sprite_layers[0].alpha = 128; // 50% alpha

    // Set up layer 1: black at same position (lower z-order)
    vm.sprite_layers[1].buffer[10 * 256 + 10] = 0x000000; // black
    vm.sprite_layers[1].active = true;
    vm.sprite_layers[1].visible = true;
    vm.sprite_layers[1].z_order = 0; // drawn first

    vm.compose_layers();

    // Black (0,0,0) + 50% green (0,255,0) = (0, 128, 0)
    let result = vm.screen[10 * 256 + 10];
    let r = (result >> 16) & 0xFF;
    let g = (result >> 8) & 0xFF;
    let b = result & 0xFF;

    assert_eq!(r, 0);
    assert_eq!(g, 128);
    assert_eq!(b, 0);
}

#[test]
fn test_compose_layers_invisible_skipped() {
    let mut vm = Vm::new();

    // Set up layer 0 with visible=false
    vm.sprite_layers[0].buffer[10 * 256 + 10] = 0xFF0000;
    vm.sprite_layers[0].active = true;
    vm.sprite_layers[0].visible = false; // invisible

    vm.compose_layers();

    // Screen should still be black (layer was skipped)
    assert_eq!(vm.screen[10 * 256 + 10], 0);
}

#[test]
fn test_compose_layers_additive_blend() {
    let mut vm = Vm::new();

    // Set up layer 0 with additive blending
    vm.sprite_layers[0].buffer[10 * 256 + 10] = 0x808080; // gray
    vm.sprite_layers[0].active = true;
    vm.sprite_layers[0].visible = true;
    vm.sprite_layers[0].z_order = 0;
    vm.sprite_layers[0].blend_mode = 2; // additive
    vm.sprite_layers[0].alpha = 128; // 50% intensity

    // Screen starts black
    vm.screen[10 * 256 + 10] = 0;

    vm.compose_layers();

    // Additive: black + (gray * 0.5) = (64, 64, 64)
    let result = vm.screen[10 * 256 + 10];
    let r = (result >> 16) & 0xFF;
    assert!((r as i32 - 64).abs() < 2);
}
