# Tasks: Geometry OS Map WordPress Plugin

## Overview

5 tasks to build the unified plugin. Each task produces a working increment.

---

## Task 1: Refactor Plugin Structure

**Goal**: Extract shared functionality into Core class, create modular architecture.

**Files:**
- Create: `includes/class-core.php`
- Create: `includes/class-shortcode.php`
- Modify: `geometry-os-map.php`

**Steps:**

1. **Create `includes/class-core.php`**
   - Singleton pattern with `get_instance()`
   - Properties: `$asset_base`, `$default_settings`
   - Methods: `get_asset_base()`, `get_setting()`, `enqueue_modules()`, `render_container()`

2. **Create `includes/class-shortcode.php`**
   - Constructor registers shortcode and enqueues hook
   - `maybe_enqueue_assets()` checks for shortcode in content
   - `render()` calls `Core::render_container()`

3. **Update `geometry-os-map.php`**
   - Define constants: `GEOMETRY_OS_MAP_PATH`, `GEOMETRY_OS_MAP_URL`
   - Require class files
   - Initialize on `plugins_loaded`

**Verification:**
- Deactivate/reactivate plugin
- Add `[geometry_os_map height="400px"]` to page
- View page - map should render as before

**Commit:** `refactor(plugin): modularize Geometry OS Map with Core and Shortcode classes`

---

## Task 2: Add Admin Settings Page

**Goal**: Create settings UI under Settings menu.

**Files:**
- Create: `includes/class-settings.php`
- Create: `assets/css/admin.css`
- Modify: `geometry-os-map.php`

**Steps:**

1. **Create `includes/class-settings.php`**
   - `add_menu()` - adds to Settings menu
   - `register_settings()` - registers 5 options with sanitization
   - Field renderers: `render_field()`, `render_theme_field()`, `render_checkbox_field()`
   - `render_settings_page()` - outputs form with usage examples

2. **Create `assets/css/admin.css`**
   - Style code blocks, pre elements, widefat table
   - Dark theme colors for branding

3. **Update `geometry-os-map.php`**
   - Require `class-settings.php`
   - Initialize in `plugins_loaded` if `is_admin()`

**Verification:**
- Go to Settings → Geometry OS Map
- Change "Default Height" to `800px`
- Save - value persists
- View shortcode page - uses new default

**Commit:** `feat(plugin): add admin settings page with asset URL and defaults`

---

## Task 3: Create Gutenberg Block

**Goal**: Add visual block for the block editor.

**Files:**
- Create: `includes/class-block.php`
- Create: `assets/js/block-editor.js`
- Modify: `geometry-os-map.php`

**Steps:**

1. **Create `includes/class-block.php`**
   - `register_block()` on `init`
   - Define 6 attributes with defaults from settings
   - `render_block()` calls `Core::enqueue_modules()` + `Core::render_container()`
   - Register editor script

2. **Create `assets/js/block-editor.js`**
   - Register block `geometry-os/map`
   - Icon: `admin-site`, Category: `embed`
   - `edit()`: InspectorControls + placeholder preview
   - `save()`: return null (SSR)

3. **Update `geometry-os-map.php`**
   - Require `class-block.php`
   - Initialize in `plugins_loaded`

**Verification:**
- Create new page in block editor
- Add "Geometry OS Map" block
- Adjust height in sidebar
- Publish - map renders with correct height

**Commit:** `feat(plugin): add Gutenberg block with visual editor controls`

---

## Task 4: Add Full-Page Template

**Goal**: Create full-screen immersive template.

**Files:**
- Create: `includes/class-template.php`
- Create: `templates/full-map-template.php`
- Modify: `geometry-os-map.php`

**Steps:**

1. **Create `includes/class-template.php`**
   - Filter `theme_page_templates` to add template
   - Filter `template_include` to intercept and load custom file
   - Enqueue modules when template is loaded

2. **Create `templates/full-map-template.php`**
   - Minimal HTML: head, body, map container
   - Hide admin bar via CSS
   - Full viewport styling
   - Call `Core::render_container()` with fullscreen=true

3. **Update `geometry-os-map.php`**
   - Require `class-template.php`
   - Initialize in `plugins_loaded`

**Verification:**
- Create new Page
- Select "Geometry OS Map (Full Screen)" template
- Publish - view shows fullscreen map with no header/footer

**Commit:** `feat(plugin): add full-screen page template for immersive map view`

---

## Task 5: Update Documentation

**Goal**: Complete README with all usage patterns.

**Files:**
- Modify: `README.md`

**Steps:**

1. **Update README.md**
   - Add installation section
   - Document all 3 usage methods
   - Add configuration section (admin + filter)
   - Add attribute reference table
   - Add requirements section
   - Add development section
   - Add changelog

**Verification:**
- README renders correctly on GitHub
- All code examples are accurate

**Commit:** `docs(plugin): update README with full usage documentation`

---

## Verification Checklist

After all tasks complete:

- [ ] Settings page saves and applies defaults
- [ ] Shortcode renders map with settings defaults
- [ ] Block editor shows placeholder, sidebar controls work
- [ ] Block frontend renders map
- [ ] Full-screen template displays immersive map
- [ ] Per-instance settings override global defaults
- [ ] Error message shown if visual shell unavailable
- [ ] Multiple maps per page work (unique container IDs)
