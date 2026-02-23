# Research: Geometry OS Map WordPress Plugin

## Context

The PixiJS Infinite Map is a WebGL-based visualization running on `localhost:8000`. We need to embed it in WordPress via multiple methods: shortcode, Gutenberg block, and page template.

## Existing Infrastructure

### Visual Shell Server
- **URL**: `http://localhost:8000`
- **Entry Point**: `systems/visual_shell/web/index.html`
- **Key Script**: `application.js` exports `GeometryOSApplication` class
- **Dependencies**: 60+ JavaScript modules loaded in specific order

### WordPress Zone
- **URL**: `http://localhost:8080`
- **Location**: `wordpress_zone/wordpress/`
- **Existing Bridge**: `mu-plugins/geometry_os_bridge.php` (telemetry only)

### Current Plugin
- **Location**: `wp-content/plugins/geometry-os-map/`
- **Features**: Basic shortcode only
- **Missing**: Gutenberg block, settings page, page template

## Technical Requirements

### JavaScript Module Loading
Modules must load in dependency order:
```
pixi.min.js → typed-signals.js → pixi-ui.min.js → spatial_core.js → ... → application.js
```

### WordPress Integration Points
1. **Shortcode**: `[geometry_os_map]` - works, needs refactor
2. **Gutenberg Block**: `register_block_type()` with `render_callback`
3. **Page Template**: Filter `theme_page_templates` + `template_include`
4. **Settings**: `register_setting()` + `add_settings_section()`

### Asset Enqueuing Strategy
- Load PixiJS from CDN (v8.1.0)
- Load Geometry OS modules from localhost:8000
- Only enqueue when shortcode/block/template present

## User Research

### Use Cases Identified
1. Admin dashboard for system visualization
2. Public-facing interactive map pages
3. Full-screen immersive experience
4. Editorial tool for content creators

### Configuration Needs
- Asset URL (different for dev/prod)
- Default dimensions
- Theme selection
- Tutorial visibility

## Constraints

- Must not break existing shortcode functionality
- Must work with WordPress 5.8+ (block editor)
- Must handle missing visual shell server gracefully
- Must support both admin and frontend contexts

## Recommendations

1. **Unified Plugin**: Single plugin with modular includes
2. **Shared Core**: Common rendering logic via `GeometryOS_Map_Core`
3. **SSR-Friendly**: Block uses `render_callback` not dynamic JS
4. **Filter Overrides**: Allow developers to override settings via filters
