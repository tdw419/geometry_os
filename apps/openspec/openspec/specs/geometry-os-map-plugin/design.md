# Design: Geometry OS Map WordPress Plugin

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    geometry-os-map.php                       │
│                    (Bootstrap / Loader)                       │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        ▼                     ▼                     ▼
┌───────────────┐   ┌───────────────┐   ┌───────────────┐
│  class-core   │   │ class-shortcode│   │  class-block  │
│               │◄──│               │   │               │
│ - asset_base  │   │ - render()    │   │ - register()  │
│ - enqueue()   │   │ - maybe_load  │   │ - render()    │
│ - render()    │   └───────────────┘   └───────────────┘
└───────┬───────┘
        │
        ├─────────────────────┬─────────────────────┐
        ▼                     ▼                     ▼
┌───────────────┐   ┌───────────────┐   ┌───────────────┐
│ class-settings│   │ class-template│   │   assets/     │
│               │   │               │   │               │
│ - add_menu()  │   │ - add()       │   │ - block.js    │
│ - register()  │   │ - load()      │   │ - admin.css   │
└───────────────┘   └───────────────┘   └───────────────┘
```

## Component Design

### 1. Core Class (`includes/class-core.php`)

**Purpose**: Shared functionality for all embedding methods.

**Methods:**
- `get_instance()` - Singleton accessor
- `get_asset_base()` - Get asset URL (filter > option > default)
- `get_setting($key)` - Get plugin option with fallback
- `enqueue_modules()` - Enqueue PixiJS + all Geometry OS modules
- `render_container($atts)` - Generate HTML container + init script

**Module Load Order:**
```php
$modules = [
    'lib/typed-signals.js'        => ['pixi-v8'],
    'lib/pixi-ui.min.js'          => ['lib/typed-signals.js'],
    'spatial_core.js'             => ['lib/pixi-ui.min.js'],
    'sprite_pool.js'              => ['spatial_core.js'],
    'chunk_manager.js'            => ['sprite_pool.js'],
    'viewport_manager.js'         => ['chunk_manager.js'],
    'lod_system.js'               => ['viewport_manager.js'],
    'infinite_map_v2.js'          => ['lod_system.js'],
    'infinite_map.js'             => ['infinite_map_v2.js'],
    'brick_loader.js'             => ['infinite_map.js'],
    'pixi_adapter.js'             => ['brick_loader.js'],
    'visual_boot_loader.js'       => ['pixi_adapter.js'],
    'application.js'              => ['visual_boot_loader.js'],
];
```

### 2. Shortcode Class (`includes/class-shortcode.php`)

**Purpose**: Handle `[geometry_os_map]` shortcode.

**Flow:**
1. On `wp_enqueue_scripts`, check if post has shortcode
2. If yes, call `Core::enqueue_modules()`
3. On shortcode render, call `Core::render_container($atts)`

### 3. Block Class (`includes/class-block.php`)

**Purpose**: Register and render Gutenberg block.

**Attributes:**
```php
'width'       => ['type' => 'string', 'default' => '100%'],
'height'      => ['type' => 'string', 'default' => '600px'],
'fullscreen'  => ['type' => 'boolean', 'default' => false],
'mode'        => ['type' => 'string', 'default' => ''],
'theme'       => ['type' => 'string', 'default' => 'dark'],
'showTutorial'=> ['type' => 'boolean', 'default' => true],
```

**Render Strategy:**
- Use `render_callback` for server-side rendering
- Enqueue modules only when block is actually rendered
- Return same HTML as shortcode

### 4. Settings Class (`includes/class-settings.php`)

**Purpose**: Admin settings page.

**Options Registered:**
- `geometry_os_map_asset_base` (URL)
- `geometry_os_map_default_width` (string)
- `geometry_os_map_default_height` (string)
- `geometry_os_map_default_theme` (string: dark/light/highContrast)
- `geometry_os_map_show_tutorial` (boolean)

**UI Fields:**
- Text input for URL
- Text input for width/height
- Select dropdown for theme
- Checkbox for tutorial

### 5. Template Class (`includes/class-template.php`)

**Purpose**: Full-screen page template.

**Hooks:**
- `theme_page_templates` filter - add template to dropdown
- `template_include` filter - intercept and load custom template

**Template File:** `templates/full-map-template.php`
- No header, no footer, no admin bar
- Full viewport map
- Body class based on theme

## Data Flow

### Map Rendering Flow
```
User visits page with shortcode/block
        ↓
WordPress calls render callback
        ↓
Core::enqueue_modules() registers scripts
        ↓
Core::render_container() outputs HTML
        ↓
Browser loads: PixiJS → modules → application.js
        ↓
JavaScript waits for GeometryOSApplication
        ↓
Initializes app in container
        ↓
Dispatches geometryOSMapReady event
```

### Settings Override Flow
```
get_asset_base()
        ↓
Check filter: apply_filters('geometry_os_asset_base_url')
        ↓ (no filter)
Check option: get_option('geometry_os_map_asset_base')
        ↓ (no option)
Return default: 'http://localhost:8000'
```

## File Structure

```
geometry-os-map/
├── geometry-os-map.php          # Bootstrap
├── includes/
│   ├── class-core.php           # Shared functionality
│   ├── class-shortcode.php      # Shortcode handler
│   ├── class-block.php          # Gutenberg block
│   ├── class-settings.php       # Admin settings
│   └── class-template.php       # Page template
├── assets/
│   ├── js/
│   │   └── block-editor.js      # Block editor UI
│   └── css/
│       └── admin.css            # Settings styles
├── templates/
│   └── full-map-template.php    # Full-screen template
└── README.md
```

## Error Handling

### Missing Visual Shell
```javascript
app.initialize(containerId).catch(err => {
    container.innerHTML = '<div style="color: #ff4444; padding: 20px;">' +
        'Failed to load map: ' + err.message + '</div>';
});
```

### Script Load Timeout
```javascript
function initMap() {
    if (typeof GeometryOSApplication === 'undefined') {
        setTimeout(initMap, 100);
        return;
    }
    // ... initialize
}
```

## Security Considerations

1. **Nonce verification** on settings save (handled by WordPress)
2. **Capability check** for settings page (`manage_options`)
3. **Output escaping** on all dynamic content (`esc_attr`, `esc_html`, `esc_url`)
4. **Script enqueuing** via WordPress APIs (not inline scripts where possible)
