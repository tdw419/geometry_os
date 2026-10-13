// pub mod introspection_window;  // TODO: Fix missing imports (window, vm_texture_manager, terminal_emulator)
pub mod zone_overlay;

pub use zone_overlay::{
    generate_zone_overlay_text, generate_zone_overlay_text_with_position, render_zone_border,
    BorderColor, BorderRenderConfig,
};
