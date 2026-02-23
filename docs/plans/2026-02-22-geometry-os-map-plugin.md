# Geometry OS Map Plugin - Unified Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a unified WordPress plugin with Gutenberg block, shortcode, page template, and admin settings for embedding the PixiJS Infinite Map.

**Architecture:** Single plugin with modular includes directory. Core functionality shared between shortcode and block via a common renderer. Settings stored in WordPress options with filter overrides. Block uses server-side render callback for SSR compatibility.

**Tech Stack:** PHP 7.4+, WordPress 5.8+, PixiJS 8.1.0, @wordpress/scripts for block build

---

## Task 1: Refactor Plugin Structure

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/includes/class-core.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/includes/class-shortcode.php`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/geometry-os-map.php`

**Step 1: Create the Core class**

```php
<?php
// includes/class-core.php
if (!defined('ABSPATH')) exit;

class GeometryOS_Map_Core {
    private static $instance = null;
    private $asset_base;
    private $default_settings = [
        'asset_base' => 'http://localhost:8000',
        'default_width' => '100%',
        'default_height' => '600px',
        'default_theme' => 'dark',
        'show_tutorial' => true,
    ];

    public static function get_instance() {
        if (null === self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private function __construct() {
        $this->asset_base = apply_filters(
            'geometry_os_asset_base_url',
            get_option('geometry_os_map_asset_base', $this->default_settings['asset_base'])
        );
    }

    public function get_asset_base() {
        return $this->asset_base;
    }

    public function get_default($key) {
        return $this->default_settings[$key] ?? null;
    }

    public function get_setting($key) {
        return get_option("geometry_os_map_{$key}", $this->default_settings[$key] ?? null);
    }

    public function enqueue_modules() {
        // PixiJS from CDN
        wp_enqueue_script(
            'pixi-v8',
            'https://pixijs.download/v8.1.0/pixi.min.js',
            [],
            '8.1.0',
            false
        );

        // Core modules in dependency order
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

        $index = 0;
        foreach ($modules as $path => $deps) {
            $handle = "geometry-os-module-{$index}";
            wp_enqueue_script(
                $handle,
                "{$this->asset_base}/{$path}",
                $deps,
                '1.0.0',
                false
            );
            $index++;
        }
    }

    public function render_container($atts = []) {
        $container_id = 'geometry-os-map-' . uniqid();

        $width = $atts['width'] ?? $this->get_setting('default_width');
        $height = $atts['height'] ?? $this->get_setting('default_height');
        $fullscreen = !empty($atts['fullscreen']) && filter_var($atts['fullscreen'], FILTER_VALIDATE_BOOLEAN);
        $mode = $atts['mode'] ?? '';
        $theme = $atts['theme'] ?? $this->get_setting('default_theme');

        $styles = $fullscreen
            ? "position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; z-index: 9999; background: #111;"
            : "width: {$width}; height: {$height}; background: #111; border-radius: 8px; overflow: hidden;";

        ob_start();
        ?>
        <div id="<?= esc_attr($container_id) ?>" class="geometry-os-map-container" data-theme="<?= esc_attr($theme) ?>" style="<?= $styles ?>">
            <div class="geo-map-loading" style="
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100%;
                color: #00FFFF;
                font-family: 'Courier New', monospace;
                font-size: 18px;
            ">
                <span>BOOTING GEOMETRY KERNEL...</span>
            </div>
        </div>

        <script>
        (function() {
            const containerId = '<?= esc_js($container_id) ?>';
            const theme = '<?= esc_js($theme) ?>';
            const mode = '<?= esc_js($mode) ?>';

            function initMap() {
                if (typeof GeometryOSApplication === 'undefined') {
                    setTimeout(initMap, 100);
                    return;
                }

                const container = document.getElementById(containerId);
                if (container) container.innerHTML = '';

                const app = new GeometryOSApplication();
                window.geometryOSApp = app;

                app.initialize(containerId).then(() => {
                    console.log('Geometry OS Map initialized');
                    window.dispatchEvent(new CustomEvent('geometryOSMapReady', {
                        detail: { app: app, containerId: containerId, theme: theme, mode: mode }
                    }));
                }).catch(err => {
                    console.error('Failed to initialize Geometry OS Map:', err);
                    if (container) {
                        container.innerHTML = '<div style="color: #ff4444; padding: 20px;">Failed to load map: ' + err.message + '</div>';
                    }
                });
            }

            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', initMap);
            } else {
                initMap();
            }
        })();
        </script>

        <style>
        .geometry-os-map-container canvas { display: block; }
        </style>
        <?php
        return ob_get_clean();
    }
}
```

**Step 2: Create the Shortcode class**

```php
<?php
// includes/class-shortcode.php
if (!defined('ABSPATH')) exit;

class GeometryOS_Map_Shortcode {
    public function __construct() {
        add_action('wp_enqueue_scripts', [$this, 'maybe_enqueue_assets']);
        add_shortcode('geometry_os_map', [$this, 'render']);
    }

    public function maybe_enqueue_assets() {
        global $post;
        if (!is_a($post, 'WP_Post') || !has_shortcode($post->post_content, 'geometry_os_map')) {
            return;
        }
        GeometryOS_Map_Core::get_instance()->enqueue_modules();
    }

    public function render($atts) {
        $atts = shortcode_atts([
            'width' => GeometryOS_Map_Core::get_instance()->get_setting('default_width'),
            'height' => GeometryOS_Map_Core::get_instance()->get_setting('default_height'),
            'fullscreen' => 'false',
            'mode' => '',
            'theme' => GeometryOS_Map_Core::get_instance()->get_setting('default_theme'),
        ], $atts, 'geometry_os_map');

        return GeometryOS_Map_Core::get_instance()->render_container($atts);
    }
}
```

**Step 3: Update main plugin file**

```php
<?php
/**
 * Plugin Name: Geometry OS Map
 * Description: Embed the PixiJS Infinite Map in WordPress via shortcode, Gutenberg block, or page template
 * Version: 1.1.0
 * Author: Geometry OS
 */

if (!defined('ABSPATH')) exit;

define('GEOMETRY_OS_MAP_PATH', plugin_dir_path(__FILE__));
define('GEOMETRY_OS_MAP_URL', plugin_dir_url(__FILE__));

// Load classes
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-core.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-shortcode.php';

// Initialize
add_action('plugins_loaded', function() {
    new GeometryOS_Map_Shortcode();
});

// Helper function
function geometry_os_render_map($args = []) {
    return do_shortcode('[geometry_os_map ' . http_build_query($args, '', ' ') . ']');
}
```

**Step 4: Verify plugin still works**

1. Deactivate and reactivate plugin in WordPress Admin
2. Create/edit a page with `[geometry_os_map height="400px"]`
3. View page - map should render as before

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/includes/ wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/geometry-os-map.php
git commit -m "refactor(plugin): modularize Geometry OS Map with Core and Shortcode classes"
```

---

## Task 2: Add Admin Settings Page

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/includes/class-settings.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/views/settings-page.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/assets/css/admin.css`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/geometry-os-map.php`

**Step 1: Create the Settings class**

```php
<?php
// includes/class-settings.php
if (!defined('ABSPATH')) exit;

class GeometryOS_Map_Settings {
    private $option_group = 'geometry_os_map_settings';
    private $option_name = 'geometry_os_map';

    public function __construct() {
        add_action('admin_menu', [$this, 'add_menu']);
        add_action('admin_init', [$this, 'register_settings']);
        add_action('admin_enqueue_scripts', [$this, 'enqueue_assets']);
    }

    public function add_menu() {
        add_options_page(
            'Geometry OS Map Settings',
            'Geometry OS Map',
            'manage_options',
            'geometry-os-map',
            [$this, 'render_settings_page']
        );
    }

    public function register_settings() {
        register_setting($this->option_group, 'geometry_os_map_asset_base', [
            'type' => 'string',
            'sanitize_callback' => 'esc_url_raw',
            'default' => 'http://localhost:8000',
        ]);

        register_setting($this->option_group, 'geometry_os_map_default_width', [
            'type' => 'string',
            'default' => '100%',
        ]);

        register_setting($this->option_group, 'geometry_os_map_default_height', [
            'type' => 'string',
            'default' => '600px',
        ]);

        register_setting($this->option_group, 'geometry_os_map_default_theme', [
            'type' => 'string',
            'default' => 'dark',
        ]);

        register_setting($this->option_group, 'geometry_os_map_show_tutorial', [
            'type' => 'boolean',
            'default' => true,
        ]);

        // Settings sections
        add_settings_section(
            'geometry_os_map_general',
            'General Settings',
            null,
            'geometry-os-map'
        );

        // Asset Base
        add_settings_field(
            'geometry_os_map_asset_base',
            'Asset Base URL',
            [$this, 'render_field'],
            'geometry-os-map',
            'geometry_os_map_general',
            ['name' => 'geometry_os_map_asset_base', 'type' => 'url', 'description' => 'URL where visual shell assets are served (e.g., http://localhost:8000)']
        );

        // Default Width
        add_settings_field(
            'geometry_os_map_default_width',
            'Default Width',
            [$this, 'render_field'],
            'geometry-os-map',
            'geometry_os_map_general',
            ['name' => 'geometry_os_map_default_width', 'type' => 'text', 'description' => 'CSS width value (e.g., 100%, 800px)']
        );

        // Default Height
        add_settings_field(
            'geometry_os_map_default_height',
            'Default Height',
            [$this, 'render_field'],
            'geometry-os-map',
            'geometry_os_map_general',
            ['name' => 'geometry_os_map_default_height', 'type' => 'text', 'description' => 'CSS height value (e.g., 600px, 80vh)']
        );

        // Default Theme
        add_settings_field(
            'geometry_os_map_default_theme',
            'Default Theme',
            [$this, 'render_theme_field'],
            'geometry-os-map',
            'geometry_os_map_general',
            ['name' => 'geometry_os_map_default_theme', 'description' => 'Visual theme for the map']
        );

        // Show Tutorial
        add_settings_field(
            'geometry_os_map_show_tutorial',
            'Show Tutorial',
            [$this, 'render_checkbox_field'],
            'geometry-os-map',
            'geometry_os_map_general',
            ['name' => 'geometry_os_map_show_tutorial', 'label' => 'Display tutorial button on map']
        );
    }

    public function render_field($args) {
        $value = get_option($args['name'], '');
        $type = $args['type'] ?? 'text';
        ?>
        <input type="<?= esc_attr($type) ?>" name="<?= esc_attr($args['name']) ?>" value="<?= esc_attr($value) ?>" class="regular-text">
        <?php if (!empty($args['description'])): ?>
        <p class="description"><?= esc_html($args['description']) ?></p>
        <?php endif;
    }

    public function render_theme_field($args) {
        $value = get_option($args['name'], 'dark');
        ?>
        <select name="<?= esc_attr($args['name']) ?>">
            <option value="dark" <?= selected($value, 'dark', false) ?>>Dark</option>
            <option value="light" <?= selected($value, 'light', false) ?>>Light</option>
            <option value="highContrast" <?= selected($value, 'highContrast', false) ?>>High Contrast</option>
        </select>
        <?php if (!empty($args['description'])): ?>
        <p class="description"><?= esc_html($args['description']) ?></p>
        <?php endif;
    }

    public function render_checkbox_field($args) {
        $value = get_option($args['name'], false);
        ?>
        <label>
            <input type="checkbox" name="<?= esc_attr($args['name']) ?>" value="1" <?= checked($value, true, false) ?>>
            <?= esc_html($args['label']) ?>
        </label>
        <?php
    }

    public function render_settings_page() {
        ?>
        <div class="wrap geometry-os-map-settings">
            <h1>Geometry OS Map Settings</h1>
            <form method="post" action="options.php">
                <?php
                settings_fields($this->option_group);
                do_settings_sections('geometry-os-map');
                submit_button();
                ?>
            </form>

            <hr>

            <h2>Shortcode Usage</h2>
            <code>[geometry_os_map height="600px"]</code>

            <h3>Available Attributes</h3>
            <table class="widefat">
                <tr><th>width</th><td>CSS width (default: 100%)</td></tr>
                <tr><th>height</th><td>CSS height (default: 600px)</td></tr>
                <tr><th>fullscreen</th><td>true/false - fullscreen mode</td></tr>
                <tr><th>mode</th><td>Application mode (e.g., "desktop")</td></tr>
                <tr><th>theme</th><td>dark/light/highContrast</td></tr>
            </table>

            <h3>Examples</h3>
            <pre>[geometry_os_map height="800px" theme="dark"]
[geometry_os_map fullscreen="true" mode="desktop"]</pre>
        </div>
        <?php
    }

    public function enqueue_assets($hook) {
        if ($hook !== 'settings_page_geometry-os-map') {
            return;
        }
        wp_enqueue_style(
            'geometry-os-map-admin',
            GEOMETRY_OS_MAP_URL . 'assets/css/admin.css',
            [],
            '1.0.0'
        );
    }
}
```

**Step 2: Create admin CSS**

```css
/* assets/css/admin.css */
.geometry-os-map-settings code {
    background: #1e1e1e;
    color: #00ffff;
    padding: 4px 8px;
    border-radius: 3px;
    font-size: 14px;
}

.geometry-os-map-settings pre {
    background: #1e1e1e;
    color: #00ffff;
    padding: 12px;
    border-radius: 4px;
    overflow-x: auto;
}

.geometry-os-map-settings .widefat th {
    width: 150px;
}
```

**Step 3: Update main plugin file to load Settings**

Add after the require statements in `geometry-os-map.php`:

```php
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-settings.php';
```

Add inside the `plugins_loaded` callback:

```php
if (is_admin()) {
    new GeometryOS_Map_Settings();
}
```

**Step 4: Verify settings page works**

1. Go to WordPress Admin → Settings → Geometry OS Map
2. Change "Default Height" to `800px`
3. Click Save
4. Refresh page - value should persist
5. View a page with shortcode - should use new default height

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/
git commit -m "feat(plugin): add admin settings page with asset URL and defaults"
```

---

## Task 3: Create Gutenberg Block

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/includes/class-block.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/assets/js/block-editor.js`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/geometry-os-map.php`

**Step 1: Create the Block class**

```php
<?php
// includes/class-block.php
if (!defined('ABSPATH')) exit;

class GeometryOS_Map_Block {
    public function __construct() {
        add_action('init', [$this, 'register_block']);
    }

    public function register_block() {
        register_block_type('geometry-os/map', [
            'attributes' => [
                'width' => [
                    'type' => 'string',
                    'default' => GeometryOS_Map_Core::get_instance()->get_setting('default_width'),
                ],
                'height' => [
                    'type' => 'string',
                    'default' => GeometryOS_Map_Core::get_instance()->get_setting('default_height'),
                ],
                'fullscreen' => [
                    'type' => 'boolean',
                    'default' => false,
                ],
                'mode' => [
                    'type' => 'string',
                    'default' => '',
                ],
                'theme' => [
                    'type' => 'string',
                    'default' => GeometryOS_Map_Core::get_instance()->get_setting('default_theme'),
                ],
                'showTutorial' => [
                    'type' => 'boolean',
                    'default' => GeometryOS_Map_Core::get_instance()->get_setting('show_tutorial'),
                ],
            ],
            'editor_script' => 'geometry-os-map-block-editor',
            'render_callback' => [$this, 'render_block'],
        ]);

        // Register editor script
        wp_register_script(
            'geometry-os-map-block-editor',
            GEOMETRY_OS_MAP_URL . 'assets/js/block-editor.js',
            ['wp-blocks', 'wp-element', 'wp-components', 'wp-editor'],
            '1.0.0'
        );
    }

    public function render_block($attributes) {
        // Enqueue frontend assets only when block is rendered
        GeometryOS_Map_Core::get_instance()->enqueue_modules();

        return GeometryOS_Map_Core::get_instance()->render_container([
            'width' => $attributes['width'] ?? '100%',
            'height' => $attributes['height'] ?? '600px',
            'fullscreen' => $attributes['fullscreen'] ?? false,
            'mode' => $attributes['mode'] ?? '',
            'theme' => $attributes['theme'] ?? 'dark',
        ]);
    }
}
```

**Step 2: Create the block editor JavaScript**

```javascript
// assets/js/block-editor.js
(function(wp) {
    const { registerBlockType } = wp.blocks;
    const { InspectorControls } = wp.editor;
    const { PanelBody, TextControl, SelectControl, ToggleControl } = wp.components;
    const { createElement: el } = wp.element;

    registerBlockType('geometry-os/map', {
        title: 'Geometry OS Map',
        description: 'Embed the PixiJS Infinite Map',
        icon: 'admin-site',
        category: 'embed',
        attributes: {
            width: { type: 'string', default: '100%' },
            height: { type: 'string', default: '600px' },
            fullscreen: { type: 'boolean', default: false },
            mode: { type: 'string', default: '' },
            theme: { type: 'string', default: 'dark' },
            showTutorial: { type: 'boolean', default: true },
        },

        edit: function(props) {
            const { attributes, setAttributes } = props;

            // Editor placeholder preview
            const preview = el('div', {
                style: {
                    background: '#0a0a1a',
                    border: '2px dashed #00ffff',
                    borderRadius: '8px',
                    padding: '40px',
                    textAlign: 'center',
                    color: '#00ffff',
                    fontFamily: 'Courier New, monospace',
                    height: attributes.height,
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                    justifyContent: 'center',
                }
            }, [
                el('div', { style: { fontSize: '24px', marginBottom: '10px' } }, '🗺️'),
                el('div', { style: { fontSize: '18px' } }, 'Geometry OS Map'),
                el('div', { style: { fontSize: '12px', opacity: 0.7, marginTop: '5px' } },
                    `${attributes.width} × ${attributes.height}`
                ),
            ]);

            // Sidebar controls
            const controls = el(InspectorControls, {},
                el(PanelBody, { title: 'Map Settings', initialOpen: true }, [
                    el(TextControl, {
                        label: 'Width',
                        value: attributes.width,
                        onChange: (val) => setAttributes({ width: val }),
                        help: 'CSS width (e.g., 100%, 800px)',
                    }),
                    el(TextControl, {
                        label: 'Height',
                        value: attributes.height,
                        onChange: (val) => setAttributes({ height: val }),
                        help: 'CSS height (e.g., 600px, 80vh)',
                    }),
                    el(SelectControl, {
                        label: 'Theme',
                        value: attributes.theme,
                        options: [
                            { label: 'Dark', value: 'dark' },
                            { label: 'Light', value: 'light' },
                            { label: 'High Contrast', value: 'highContrast' },
                        ],
                        onChange: (val) => setAttributes({ theme: val }),
                    }),
                    el(SelectControl, {
                        label: 'Mode',
                        value: attributes.mode,
                        options: [
                            { label: 'Default', value: '' },
                            { label: 'Desktop', value: 'desktop' },
                        ],
                        onChange: (val) => setAttributes({ mode: val }),
                    }),
                    el(ToggleControl, {
                        label: 'Fullscreen Mode',
                        checked: attributes.fullscreen,
                        onChange: (val) => setAttributes({ fullscreen: val }),
                    }),
                    el(ToggleControl, {
                        label: 'Show Tutorial Button',
                        checked: attributes.showTutorial,
                        onChange: (val) => setAttributes({ showTutorial: val }),
                    }),
                ])
            );

            return [controls, preview];
        },

        save: function() {
            // Server-side render, so return null
            return null;
        },
    });
})(window.wp);
```

**Step 3: Update main plugin file to load Block**

Add after the require statements:

```php
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-block.php';
```

Add inside the `plugins_loaded` callback:

```php
new GeometryOS_Map_Block();
```

**Step 4: Verify block works**

1. Create a new WordPress page/post
2. Open block inserter, search for "Geometry OS Map"
3. Add the block - should show placeholder with dimensions
4. In sidebar, change height to `800px` - preview should update
5. Publish and view - map should render with correct height

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/
git commit -m "feat(plugin): add Gutenberg block with visual editor controls"
```

---

## Task 4: Add Full-Page Template

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/includes/class-template.php`
- Create: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/templates/full-map-template.php`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/geometry-os-map.php`

**Step 1: Create the Template class**

```php
<?php
// includes/class-template.php
if (!defined('ABSPATH')) exit;

class GeometryOS_Map_Template {
    public function __construct() {
        add_filter('theme_page_templates', [$this, 'add_template']);
        add_filter('template_include', [$this, 'load_template']);
    }

    public function add_template($templates) {
        $templates['geometry-os-map-full.php'] = 'Geometry OS Map (Full Screen)';
        return $templates;
    }

    public function load_template($template) {
        global $post;

        if (!$post) {
            return $template;
        }

        $page_template = get_post_meta($post->ID, '_wp_page_template', true);

        if ($page_template === 'geometry-os-map-full.php') {
            // Enqueue assets
            GeometryOS_Map_Core::get_instance()->enqueue_modules();

            return GEOMETRY_OS_MAP_PATH . 'templates/full-map-template.php';
        }

        return $template;
    }
}
```

**Step 2: Create the full-screen template**

```php
<?php
// templates/full-map-template.php
/**
 * Template Name: Geometry OS Map (Full Screen)
 */
?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php wp_title('|', true, 'right'); ?><?php bloginfo('name'); ?></title>
    <?php wp_head(); ?>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            background: #0a0a1a;
        }
        .geometry-os-map-container {
            width: 100%;
            height: 100%;
        }
        .geometry-os-map-container canvas {
            display: block;
        }
        #wpadminbar {
            display: none !important;
        }
    </style>
</head>
<body <?php body_class('theme-dark'); ?>>
    <?php
    echo GeometryOS_Map_Core::get_instance()->render_container([
        'width' => '100vw',
        'height' => '100vh',
        'fullscreen' => true,
        'mode' => get_post_meta(get_the_ID(), 'geometry_os_mode', true) ?: '',
        'theme' => get_post_meta(get_the_ID(), 'geometry_os_theme', true) ?: 'dark',
    ]);
    ?>
    <?php wp_footer(); ?>
</body>
</html>
```

**Step 3: Update main plugin file to load Template**

Add after the require statements:

```php
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-template.php';
```

Add inside the `plugins_loaded` callback:

```php
new GeometryOS_Map_Template();
```

**Step 4: Verify template works**

1. Create a new WordPress Page
2. In "Page Attributes" → "Template", select "Geometry OS Map (Full Screen)"
3. Publish
4. View the page - should show full-screen map with no header/footer

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/
git commit -m "feat(plugin): add full-screen page template for immersive map view"
```

---

## Task 5: Update Documentation

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/README.md`

**Step 1: Update README with full documentation**

```markdown
# Geometry OS Map - WordPress Plugin

Embed the PixiJS Infinite Map in WordPress via shortcode, Gutenberg block, or page template.

## Installation

1. Copy plugin to `wp-content/plugins/geometry-os-map/`
2. Activate in WordPress Admin → Plugins

## Usage

### Method 1: Shortcode

```
[geometry_os_map height="600px"]
```

### Method 2: Gutenberg Block

1. Edit a page with the block editor
2. Add "Geometry OS Map" block
3. Configure via sidebar controls

### Method 3: Page Template

1. Create a new Page
2. Set Template to "Geometry OS Map (Full Screen)"
3. Publish

## Configuration

### Admin Settings

Go to Settings → Geometry OS Map to configure:

- **Asset Base URL** - Where visual shell assets are served (default: http://localhost:8000)
- **Default Width** - CSS width for new maps
- **Default Height** - CSS height for new maps
- **Default Theme** - dark/light/highContrast
- **Show Tutorial** - Display tutorial button

### Per-Instance Options

| Option | Values | Description |
|--------|--------|-------------|
| `width` | CSS value | Container width (e.g., `100%`, `800px`) |
| `height` | CSS value | Container height (e.g., `600px`, `80vh`) |
| `fullscreen` | true/false | Full viewport overlay |
| `mode` | desktop, (empty) | Application mode |
| `theme` | dark/light/highContrast | Visual theme |

### Filter Override

```php
// In functions.php
add_filter('geometry_os_asset_base_url', function($url) {
    return 'https://your-cdn.com';
});
```

## Requirements

- WordPress 5.8+
- PHP 7.4+
- Visual Shell server running on configured asset URL

## Development

### Start Visual Shell

```bash
cd systems/visual_shell/web
python3 -m http.server 8000
```

### File Structure

```
geometry-os-map/
├── geometry-os-map.php      # Main plugin
├── includes/
│   ├── class-core.php       # Shared functionality
│   ├── class-shortcode.php  # Shortcode handler
│   ├── class-block.php      # Gutenberg block
│   ├── class-settings.php   # Admin settings
│   └── class-template.php   # Page template
├── assets/
│   ├── js/block-editor.js   # Block editor UI
│   └── css/admin.css        # Settings styles
├── templates/
│   └── full-map-template.php
└── README.md
```

## Changelog

### 1.1.0
- Added Gutenberg block
- Added admin settings page
- Added full-screen page template
- Refactored to modular architecture

### 1.0.0
- Initial shortcode implementation
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-map/README.md
git commit -m "docs(plugin): update README with full usage documentation"
```

---

## Verification

After completing all tasks:

1. **Settings Test**: Settings → Geometry OS Map saves and applies defaults
2. **Shortcode Test**: `[geometry_os_map]` renders map with settings defaults
3. **Block Test**: Block editor shows placeholder, sidebar controls work
4. **Template Test**: Full-screen template displays immersive map
5. **Override Test**: Per-instance settings override global defaults
