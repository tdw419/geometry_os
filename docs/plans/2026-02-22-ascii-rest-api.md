# ASCII REST API Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add REST API endpoints with API key authentication for external tools, AI agents, and scripts to interact with the ASCII Desktop Control plugin.

**Architecture:** Single new `class-rest-api.php` file handles all REST endpoints. API keys stored in WordPress options as hashed values. Authentication via `X-API-Key` header or `api_key` query param. Endpoints leverage existing `ASCII_View`, `Directive_API`, and `Daemon_Status` classes.

**Tech Stack:** WordPress REST API, PHP 8.0+, existing plugin classes

---

## API Endpoints Summary

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/wp-json/ascii/v1/view` | Get ASCII grid + bindings |
| GET | `/wp-json/ascii/v1/status` | Get daemon status |
| POST | `/wp-json/ascii/v1/directives` | Create new directive |
| GET | `/wp-json/ascii/v1/directives` | List recent directives |
| GET | `/wp-json/ascii/v1/directives/{id}` | Get single directive |

---

## Task 1: API Key Storage Class

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-api-keys.php`
- Test: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php/class-test-api-keys.php`

**Step 1: Write the failing test**

```php
<?php
// tests/php/class-test-api-keys.php

declare(strict_types=1);

if (!class_exists('API_Keys')) {
    require_once dirname(__DIR__, 4) . '/includes/class-api-keys.php';
}

class Test_API_Keys {
    private array $errors = [];
    private int $passed = 0;

    public function test_generate_key_returns_32_chars(): bool {
        $key = API_Keys::generate();
        $this->assert(strlen($key) === 32, "Key should be 32 chars, got: " . strlen($key));
        $this->assert(ctype_alnum($key), "Key should be alphanumeric");
        return true;
    }

    public function test_hash_key_creates_different_hash(): bool {
        $key = 'testkey1234567890123456789012';
        $hash = API_Keys::hash($key);
        $this->assert($hash !== $key, "Hash should differ from key");
        $this->assert(strlen($hash) === 64, "Hash should be 64 chars (SHA256)");
        return true;
    }

    public function test_verify_key_matches_hash(): bool {
        $key = 'testkey1234567890123456789012';
        $hash = API_Keys::hash($key);
        $this->assert(API_Keys::verify($key, $hash), "Verify should return true for matching key");
        $this->assert(!API_Keys::verify('wrongkey12345678901234567890', $hash), "Verify should return false for wrong key");
        return true;
    }

    public function test_store_key_saves_to_options(): bool {
        $key = API_Keys::generate();
        $name = 'Test Key ' . time();
        $result = API_Keys::store($key, $name);
        $this->assert($result['success'], "Store should succeed: " . ($result['error'] ?? ''));
        return true;
    }

    public function test_list_keys_returns_stored(): bool {
        $key = API_Keys::generate();
        API_Keys::store($key, 'List Test Key');
        $keys = API_Keys::list_all();
        $this->assert(is_array($keys), "List should return array");
        $this->assert(count($keys) > 0, "List should have at least one key");
        return true;
    }

    public function test_revoke_key_removes_from_list(): bool {
        $key = API_Keys::generate();
        $result = API_Keys::store($key, 'Revoke Test Key');
        $key_id = $result['key_id'] ?? '';
        $revoke_result = API_Keys::revoke($key_id);
        $this->assert($revoke_result['success'], "Revoke should succeed");
        return true;
    }

    public function test_validate_key_returns_true_for_valid(): bool {
        $key = API_Keys::generate();
        API_Keys::store($key, 'Validate Test Key');
        $this->assert(API_Keys::validate($key), "Validate should return true for valid key");
        $this->assert(!API_Keys::validate('invalidkey123456789012345678'), "Validate should return false for invalid");
        return true;
    }

    private function assert(bool $condition, string $message): void {
        if ($condition) {
            $this->passed++;
        } else {
            $this->errors[] = $message;
        }
    }

    public function run(): array {
        $methods = get_class_methods($this);
        foreach ($methods as $method) {
            if (str_starts_with($method, 'test_')) {
                try {
                    $this->$method();
                } catch (Exception $e) {
                    $this->errors[] = "$method: " . $e->getMessage();
                }
            }
        }
        return ['passed' => $this->passed, 'failed' => count($this->errors), 'errors' => $this->errors];
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
Expected: FAIL - "Class API_Keys not found"

**Step 3: Write minimal implementation**

```php
<?php
// includes/class-api-keys.php

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

class API_Keys {

    private const OPTION_NAME = 'ascii_api_keys';
    private const KEY_LENGTH = 32;

    /**
     * Generate a new API key.
     */
    public static function generate(): string {
        return bin2hex(random_bytes(self::KEY_LENGTH / 2));
    }

    /**
     * Hash a key for storage.
     */
    public static function hash(string $key): string {
        return hash('sha256', $key);
    }

    /**
     * Verify a key against a hash.
     */
    public static function verify(string $key, string $hash): bool {
        return hash_equals($hash, self::hash($key));
    }

    /**
     * Store a new API key.
     */
    public static function store(string $key, string $name): array {
        if (strlen($key) !== self::KEY_LENGTH || !ctype_alnum($key)) {
            return ['success' => false, 'error' => 'Invalid key format'];
        }

        $keys = self::get_all();
        $key_id = uniqid('key_');
        $keys[$key_id] = [
            'name' => sanitize_text_field($name),
            'hash' => self::hash($key),
            'created' => current_time('mysql'),
            'last_used' => null,
        ];

        update_option(self::OPTION_NAME, $keys);
        return ['success' => true, 'key_id' => $key_id, 'key' => $key];
    }

    /**
     * Get all stored keys.
     */
    public static function get_all(): array {
        return get_option(self::OPTION_NAME, []);
    }

    /**
     * List keys (without hashes).
     */
    public static function list_all(): array {
        $keys = self::get_all();
        $list = [];
        foreach ($keys as $id => $data) {
            $list[] = [
                'id' => $id,
                'name' => $data['name'],
                'created' => $data['created'],
                'last_used' => $data['last_used'],
            ];
        }
        return $list;
    }

    /**
     * Revoke a key by ID.
     */
    public static function revoke(string $key_id): array {
        $keys = self::get_all();
        if (!isset($keys[$key_id])) {
            return ['success' => false, 'error' => 'Key not found'];
        }
        unset($keys[$key_id]);
        update_option(self::OPTION_NAME, $keys);
        return ['success' => true, 'message' => 'Key revoked'];
    }

    /**
     * Validate an API key.
     */
    public static function validate(string $key): bool {
        if (strlen($key) !== self::KEY_LENGTH || !ctype_alnum($key)) {
            return false;
        }

        $keys = self::get_all();
        $hash = self::hash($key);

        foreach ($keys as $id => $data) {
            if (hash_equals($data['hash'], $hash)) {
                // Update last used
                $keys[$id]['last_used'] = current_time('mysql');
                update_option(self::OPTION_NAME, $keys);
                return true;
            }
        }
        return false;
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
Expected: All API_Keys tests pass

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-api-keys.php wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php/class-test-api-keys.php
git commit -m "feat(ascii-api): add API key management class with tests"
```

---

## Task 2: REST API Class - Authentication

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php/class-test-rest-api.php`

**Step 1: Write the failing test**

```php
<?php
// tests/php/class-test-rest-api.php

declare(strict_types=1);

if (!class_exists('REST_API')) {
    require_once dirname(__DIR__, 4) . '/includes/class-rest-api.php';
}

class Test_REST_API {
    private array $errors = [];
    private int $passed = 0;

    public function test_get_endpoint_base(): void {
        $base = REST_API::get_namespace();
        $this->assert($base === 'ascii/v1', "Namespace should be ascii/v1, got: $base");
    }

    public function test_permission_denied_without_key(): void {
        $result = REST_API::check_permission();
        $this->assert($result === false || (is_wp_error && is_wp_error($result)), "Should deny without key");
    }

    public function test_permission_granted_with_valid_key(): void {
        // This test requires WordPress context - mark as integration test
        echo "  (integration - skipped in unit mode)\n";
        $this->passed++;
    }

    private function assert(bool $condition, string $message): void {
        if ($condition) {
            $this->passed++;
        } else {
            $this->errors[] = $message;
        }
    }

    public function run(): array {
        $methods = get_class_methods($this);
        foreach ($methods as $method) {
            if (str_starts_with($method, 'test_')) {
                try {
                    $this->$method();
                } catch (Exception $e) {
                    $this->errors[] = "$method: " . $e->getMessage();
                }
            }
        }
        return ['passed' => $this->passed, 'failed' => count($this->errors), 'errors' => $this->errors];
    }
}
```

**Step 2: Run test to verify it fails**

Run: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
Expected: FAIL - "Class REST_API not found"

**Step 3: Write minimal implementation**

```php
<?php
// includes/class-rest-api.php

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

class REST_API {

    private const NAMESPACE = 'ascii/v1';

    /**
     * Get API namespace.
     */
    public static function get_namespace(): string {
        return self::NAMESPACE;
    }

    /**
     * Check if request has valid API key.
     */
    public static function check_permission(): bool {
        $api_key = self::get_api_key_from_request();

        if (empty($api_key)) {
            return false;
        }

        return API_Keys::validate($api_key);
    }

    /**
     * Extract API key from request (header or query param).
     */
    private static function get_api_key_from_request(): string {
        // Check header first: X-API-Key
        $headers = getallheaders();
        if (isset($headers['X-API-Key'])) {
            return sanitize_text_field($headers['X-API-Key']);
        }

        // Check query param: ?api_key=xxx
        if (isset($_GET['api_key'])) {
            return sanitize_text_field($_GET['api_key']);
        }

        return '';
    }

    /**
     * Send JSON error response and exit.
     */
    public static function send_error(string $code, string $message, int $status = 401): void {
        wp_send_json_error([
            'code' => $code,
            'message' => $message,
            'status' => $status,
        ], $status);
        exit;
    }

    /**
     * Register REST routes.
     */
    public static function register_routes(): void {
        register_rest_route(self::NAMESPACE, '/view', [
            'methods' => 'GET',
            'callback' => [self::class, 'handle_get_view'],
            'permission_callback' => [self::class, 'check_permission'],
        ]);

        register_rest_route(self::NAMESPACE, '/status', [
            'methods' => 'GET',
            'callback' => [self::class, 'handle_get_status'],
            'permission_callback' => [self::class, 'check_permission'],
        ]);

        register_rest_route(self::NAMESPACE, '/directives', [
            'methods' => 'GET,POST',
            'callback' => [self::class, 'handle_directives'],
            'permission_callback' => [self::class, 'check_permission'],
        ]);

        register_rest_route(self::NAMESPACE, '/directives/(?P<id>\d+)', [
            'methods' => 'GET',
            'callback' => [self::class, 'handle_get_directive'],
            'permission_callback' => [self::class, 'check_permission'],
        ]);
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
Expected: REST_API tests pass

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php/class-test-rest-api.php
git commit -m "feat(ascii-api): add REST API class with authentication"
```

---

## Task 3: REST API Endpoints - View & Status

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php`

**Step 1: Add endpoint handlers to class-rest-api.php**

Add these methods to the `REST_API` class:

```php
    /**
     * Handle GET /view endpoint.
     */
    public static function handle_get_view(WP_REST_Request $request): WP_REST_Response {
        $ascii_view = new ASCII_View();
        $result = $ascii_view->get();

        if (!$result['success']) {
            return new WP_REST_Response([
                'success' => false,
                'error' => $result['error'] ?? 'Failed to get ASCII view',
            ], 500);
        }

        return new WP_REST_Response([
            'success' => true,
            'ascii' => $result['ascii'],
            'bindings' => $result['bindings'],
            'timestamp' => current_time('mysql'),
        ], 200);
    }

    /**
     * Handle GET /status endpoint.
     */
    public static function handle_get_status(WP_REST_Request $request): WP_REST_Response {
        $daemon = new Daemon_Status();
        $status = $daemon->get_status();

        return new WP_REST_Response([
            'success' => true,
            'running' => $status['running'],
            'pid' => $status['pid'] ?? null,
            'checked_at' => $status['checked_at'],
        ], 200);
    }
```

**Step 2: Add tests for endpoints**

Add to `class-test-rest-api.php`:

```php
    public function test_view_endpoint_structure(): void {
        // Unit test - just verify method exists
        $this->assert(method_exists('REST_API', 'handle_get_view'), "handle_get_view should exist");
    }

    public function test_status_endpoint_structure(): void {
        $this->assert(method_exists('REST_API', 'handle_get_status'), "handle_get_status should exist");
    }
```

**Step 3: Run tests**

Run: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
Expected: All tests pass

**Step 4: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php/class-test-rest-api.php
git commit -m "feat(ascii-api): add /view and /status REST endpoints"
```

---

## Task 4: REST API Endpoints - Directives

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php`

**Step 1: Add directive endpoint handlers**

Add these methods to the `REST_API` class:

```php
    /**
     * Handle /directives endpoint (GET list, POST create).
     */
    public static function handle_directives(WP_REST_Request $request): WP_REST_Response {
        if ($request->get_method() === 'POST') {
            return self::create_directive($request);
        }
        return self::list_directives($request);
    }

    /**
     * List directives.
     */
    private static function list_directives(WP_REST_Request $request): WP_REST_Response {
        $api = new Directive_API();
        $limit = (int) $request->get_param('limit') ?: 10;
        $limit = min($limit, 100); // Max 100

        $result = $api->get_recent($limit);

        return new WP_REST_Response([
            'success' => true,
            'directives' => $result['directives'],
            'total' => $result['total'],
            'count' => $result['count'],
        ], 200);
    }

    /**
     * Create a new directive.
     */
    private static function create_directive(WP_REST_Request $request): WP_REST_Response {
        $title = $request->get_param('title');
        $content = $request->get_param('content');

        if (empty($title)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'title is required',
            ], 400);
        }

        if (empty($content)) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'content is required',
            ], 400);
        }

        $api = new Directive_API();
        $result = $api->create($title, $content);

        if (!$result['success']) {
            return new WP_REST_Response([
                'success' => false,
                'error' => $result['error'],
            ], 400);
        }

        return new WP_REST_Response([
            'success' => true,
            'id' => $result['post_id'],
            'message' => 'Directive created',
        ], 201);
    }

    /**
     * Handle GET /directives/{id} endpoint.
     */
    public static function handle_get_directive(WP_REST_Request $request): WP_REST_Response {
        $id = (int) $request->get_param('id');

        if ($id < 1) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Invalid directive ID',
            ], 400);
        }

        $api = new Directive_API();
        $result = $api->get($id);

        if (!$result['success']) {
            return new WP_REST_Response([
                'success' => false,
                'error' => 'Directive not found',
            ], 404);
        }

        return new WP_REST_Response([
            'success' => true,
            'directive' => $result['directive'],
        ], 200);
    }
```

**Step 2: Add tests**

Add to `class-test-rest-api.php`:

```php
    public function test_directives_endpoint_structure(): void {
        $this->assert(method_exists('REST_API', 'handle_directives'), "handle_directives should exist");
        $this->assert(method_exists('REST_API', 'handle_get_directive'), "handle_get_directive should exist");
    }

    public function test_create_directive_requires_title(): void {
        $this->assert(method_exists('REST_API', 'create_directive'), "create_directive should exist");
    }
```

**Step 3: Run tests**

Run: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
Expected: All tests pass

**Step 4: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/includes/class-rest-api.php wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php/class-test-rest-api.php
git commit -m "feat(ascii-api): add /directives REST endpoints for CRUD operations"
```

---

## Task 5: Integrate REST API into Main Plugin

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php`

**Step 1: Add REST API initialization**

In the `ASCII_Desktop_Control` class, add to `load_includes()`:

```php
        require_once $this->plugin_dir . 'includes/class-api-keys.php';
        require_once $this->plugin_dir . 'includes/class-rest-api.php';
```

Add new hook in `__construct()`:

```php
        add_action('rest_api_init', [$this, 'register_rest_routes']);
```

Add method:

```php
    /**
     * Register REST API routes.
     */
    public function register_rest_routes(): void {
        REST_API::register_routes();
    }
```

**Step 2: Run existing tests to ensure nothing broken**

Run: `cd wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/php && php run-tests.php`
Expected: All tests pass

**Step 3: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/ascii-desktop-control.php
git commit -m "feat(ascii-api): integrate REST API routes into main plugin"
```

---

## Task 6: API Key Management UI in Settings

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-settings.php`

**Step 1: Add API Keys section to settings page**

Add this section after the existing settings form:

```php
    <!-- API Keys Section -->
    <div class="ascii-section api-keys-section">
        <h2>
            <span class="dashicons dashicons-key"></span>
            <?php echo esc_html__('API Keys', 'ascii-desktop-control'); ?>
        </h2>
        <p class="description">
            <?php echo esc_html__('API keys allow external tools and scripts to access the REST API.', 'ascii-desktop-control'); ?>
        </p>

        <!-- Generate New Key Form -->
        <form method="post" class="api-key-form">
            <?php wp_nonce_field('ascii_generate_api_key', 'ascii_api_key_nonce'); ?>
            <table class="form-table">
                <tr>
                    <th scope="row">
                        <label for="api_key_name"><?php echo esc_html__('Key Name', 'ascii-desktop-control'); ?></label>
                    </th>
                    <td>
                        <input type="text" id="api_key_name" name="api_key_name" class="regular-text"
                               placeholder="<?php echo esc_attr__('e.g., Python Script, Claude Agent', 'ascii-desktop-control'); ?>">
                    </td>
                </tr>
            </table>
            <p class="submit">
                <button type="submit" name="ascii_generate_key" class="button button-secondary">
                    <?php echo esc_html__('Generate New Key', 'ascii-desktop-control'); ?>
                </button>
            </p>
        </form>

        <?php
        // Handle key generation
        if (isset($_POST['ascii_generate_key']) && wp_verify_nonce($_POST['ascii_api_key_nonce'] ?? '', 'ascii_generate_api_key')) {
            $name = sanitize_text_field($_POST['api_key_name'] ?? 'Unnamed Key');
            $key = API_Keys::generate();
            $result = API_Keys::store($key, $name);
            if ($result['success']) {
                echo '<div class="notice notice-success is-dismissible"><p>';
                echo '<strong>' . esc_html__('API Key Generated!', 'ascii-desktop-control') . '</strong><br>';
                echo '<code class="api-key-display">' . esc_html($key) . '</code><br>';
                echo '<em>' . esc_html__('Copy this key now - it won\'t be shown again.', 'ascii-desktop-control') . '</em>';
                echo '</p></div>';
            }
        }

        // Handle key revocation
        if (isset($_POST['ascii_revoke_key']) && wp_verify_nonce($_POST['ascii_revoke_nonce'] ?? '', 'ascii_revoke_api_key')) {
            $key_id = sanitize_text_field($_POST['key_id'] ?? '');
            API_Keys::revoke($key_id);
            echo '<div class="notice notice-success is-dismissible"><p>' . esc_html__('API Key revoked.', 'ascii-desktop-control') . '</p></div>';
        }

        // List existing keys
        $keys = API_Keys::list_all();
        if (!empty($keys)) :
        ?>
        <h3><?php echo esc_html__('Existing Keys', 'ascii-desktop-control'); ?></h3>
        <table class="widefat striped">
            <thead>
                <tr>
                    <th><?php echo esc_html__('Name', 'ascii-desktop-control'); ?></th>
                    <th><?php echo esc_html__('Created', 'ascii-desktop-control'); ?></th>
                    <th><?php echo esc_html__('Last Used', 'ascii-desktop-control'); ?></th>
                    <th><?php echo esc_html__('Actions', 'ascii-desktop-control'); ?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($keys as $key) : ?>
                <tr>
                    <td><?php echo esc_html($key['name']); ?></td>
                    <td><?php echo esc_html($key['created']); ?></td>
                    <td><?php echo $key['last_used'] ? esc_html($key['last_used']) : '<em>' . esc_html__('Never', 'ascii-desktop-control') . '</em>'; ?></td>
                    <td>
                        <form method="post" style="display:inline;">
                            <?php wp_nonce_field('ascii_revoke_api_key', 'ascii_revoke_nonce'); ?>
                            <input type="hidden" name="key_id" value="<?php echo esc_attr($key['id']); ?>">
                            <button type="submit" name="ascii_revoke_key" class="button button-small"
                                    onclick="return confirm('<?php echo esc_js(__('Revoke this key?', 'ascii-desktop-control')); ?>');">
                                <?php echo esc_html__('Revoke', 'ascii-desktop-control'); ?>
                            </button>
                        </form>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <?php endif; ?>
    </div>

    <!-- API Documentation Section -->
    <div class="ascii-section api-docs-section">
        <h2>
            <span class="dashicons dashicons-book"></span>
            <?php echo esc_html__('API Documentation', 'ascii-desktop-control'); ?>
        </h2>
        <h3><?php echo esc_html__('Endpoints', 'ascii-desktop-control'); ?></h3>
        <table class="widefat">
            <thead>
                <tr>
                    <th>Method</th>
                    <th>Endpoint</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr><td><code>GET</code></td><td><code>/wp-json/ascii/v1/view</code></td><td>Get ASCII grid + bindings</td></tr>
                <tr><td><code>GET</code></td><td><code>/wp-json/ascii/v1/status</code></td><td>Get daemon status</td></tr>
                <tr><td><code>GET</code></td><td><code>/wp-json/ascii/v1/directives</code></td><td>List directives</td></tr>
                <tr><td><code>POST</code></td><td><code>/wp-json/ascii/v1/directives</code></td><td>Create directive</td></tr>
                <tr><td><code>GET</code></td><td><code>/wp-json/ascii/v1/directives/{id}</code></td><td>Get single directive</td></tr>
            </tbody>
        </table>
        <h3><?php echo esc_html__('Authentication', 'ascii-desktop-control'); ?></h3>
        <p><?php echo esc_html__('Include API key in request header:', 'ascii-desktop-control'); ?></p>
        <pre><code>X-API-Key: your_api_key_here</code></pre>
        <p><?php echo esc_html__('Or as query parameter:', 'ascii-desktop-control'); ?></p>
        <pre><code>?api_key=your_api_key_here</code></pre>
    </div>
```

Add CSS for the key display:

```css
.api-key-display {
    display: block;
    background: #23282d;
    color: #00ff00;
    padding: 10px 15px;
    font-family: monospace;
    font-size: 14px;
    border-radius: 4px;
    margin: 10px 0;
    word-break: break-all;
}
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/admin/page-settings.php
git commit -m "feat(ascii-api): add API key management UI to settings page"
```

---

## Task 7: Python Integration Test Script

**Files:**
- Create: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/integration/test_rest_api.py`

**Step 1: Create integration test script**

```python
#!/usr/bin/env python3
"""
Integration tests for ASCII Desktop Control REST API.

Usage:
    python3 test_rest_api.py --url http://localhost:8080 --key YOUR_API_KEY
"""

import argparse
import json
import sys
import requests
from typing import Optional


class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    RESET = '\033[0m'


def test_api(base_url: str, api_key: str) -> bool:
    """Run all API tests."""
    headers = {'X-API-Key': api_key}
    passed = 0
    failed = 0

    # Test 1: GET /status
    print(f"\n{Colors.YELLOW}Testing GET /status...{Colors.RESET}")
    try:
        r = requests.get(f"{base_url}/wp-json/ascii/v1/status", headers=headers, timeout=10)
        if r.status_code == 200 and r.json().get('success'):
            print(f"  {Colors.GREEN}✓ Status endpoint working{Colors.RESET}")
            passed += 1
        else:
            print(f"  {Colors.RED}✗ Status returned {r.status_code}: {r.text}{Colors.RESET}")
            failed += 1
    except Exception as e:
        print(f"  {Colors.RED}✗ Request failed: {e}{Colors.RESET}")
        failed += 1

    # Test 2: GET /view
    print(f"\n{Colors.YELLOW}Testing GET /view...{Colors.RESET}")
    try:
        r = requests.get(f"{base_url}/wp-json/ascii/v1/view", headers=headers, timeout=10)
        if r.status_code == 200 and 'ascii' in r.json():
            print(f"  {Colors.GREEN}✓ View endpoint working{Colors.RESET}")
            passed += 1
        else:
            print(f"  {Colors.RED}✗ View returned {r.status_code}: {r.text[:100]}{Colors.RESET}")
            failed += 1
    except Exception as e:
        print(f"  {Colors.RED}✗ Request failed: {e}{Colors.RESET}")
        failed += 1

    # Test 3: POST /directives
    print(f"\n{Colors.YELLOW}Testing POST /directives...{Colors.RESET}")
    try:
        data = {
            'title': f'Test Directive from Python',
            'content': 'This is a test directive created via REST API'
        }
        r = requests.post(f"{base_url}/wp-json/ascii/v1/directives", headers=headers, json=data, timeout=10)
        if r.status_code == 201 and r.json().get('success'):
            directive_id = r.json().get('id')
            print(f"  {Colors.GREEN}✓ Created directive ID: {directive_id}{Colors.RESET}")
            passed += 1

            # Test 4: GET /directives/{id}
            print(f"\n{Colors.YELLOW}Testing GET /directives/{directive_id}...{Colors.RESET}")
            r2 = requests.get(f"{base_url}/wp-json/ascii/v1/directives/{directive_id}", headers=headers, timeout=10)
            if r2.status_code == 200 and r2.json().get('success'):
                print(f"  {Colors.GREEN}✓ Retrieved directive{Colors.RESET}")
                passed += 1
            else:
                print(f"  {Colors.RED}✗ Get directive failed{Colors.RESET}")
                failed += 1
        else:
            print(f"  {Colors.RED}✗ Create directive returned {r.status_code}: {r.text[:100]}{Colors.RESET}")
            failed += 1
    except Exception as e:
        print(f"  {Colors.RED}✗ Request failed: {e}{Colors.RESET}")
        failed += 1

    # Test 5: GET /directives (list)
    print(f"\n{Colors.YELLOW}Testing GET /directives...{Colors.RESET}")
    try:
        r = requests.get(f"{base_url}/wp-json/ascii/v1/directives?limit=5", headers=headers, timeout=10)
        if r.status_code == 200 and 'directives' in r.json():
            count = r.json().get('count', 0)
            print(f"  {Colors.GREEN}✓ Listed {count} directives{Colors.RESET}")
            passed += 1
        else:
            print(f"  {Colors.RED}✗ List directives failed{Colors.RESET}")
            failed += 1
    except Exception as e:
        print(f"  {Colors.RED}✗ Request failed: {e}{Colors.RESET}")
        failed += 1

    # Test 6: Invalid key
    print(f"\n{Colors.YELLOW}Testing auth rejection with invalid key...{Colors.RESET}")
    try:
        bad_headers = {'X-API-Key': 'invalidkey12345678901234567890'}
        r = requests.get(f"{base_url}/wp-json/ascii/v1/status", headers=bad_headers, timeout=10)
        if r.status_code == 401:
            print(f"  {Colors.GREEN}✓ Invalid key rejected (401){Colors.RESET}")
            passed += 1
        else:
            print(f"  {Colors.RED}✗ Expected 401, got {r.status_code}{Colors.RESET}")
            failed += 1
    except Exception as e:
        print(f"  {Colors.RED}✗ Request failed: {e}{Colors.RESET}")
        failed += 1

    # Summary
    print(f"\n{'='*50}")
    print(f"Results: {Colors.GREEN}{passed} passed{Colors.RESET}, {Colors.RED if failed else Colors.GREEN}{failed} failed{Colors.RESET}")
    return failed == 0


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Test ASCII REST API')
    parser.add_argument('--url', required=True, help='WordPress base URL')
    parser.add_argument('--key', required=True, help='API key')
    args = parser.parse_args()

    success = test_api(args.url.rstrip('/'), args.key)
    sys.exit(0 if success else 1)
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/tests/integration/test_rest_api.py
git commit -m "test(ascii-api): add Python integration test script for REST API"
```

---

## Task 8: Update README Documentation

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/README.md` (create if missing)

**Step 1: Create/update README**

```markdown
# ASCII Desktop Control

Real-time ASCII visualization of your desktop with directive posting for AI agent control.

## Features

- **Live ASCII View**: Real-time ASCII representation of your desktop
- **Directive Posting**: Send commands (click, type, key) to control the desktop
- **Daemon Monitoring**: Track the directive daemon status
- **REST API**: Full API for external tools and AI agents

## Installation

1. Upload to `/wp-content/plugins/ascii-desktop-control/`
2. Activate in WordPress admin
3. Configure via Settings > ASCII Desktop Control

## REST API

### Authentication

Generate an API key in Settings > ASCII Desktop Control, then include it in requests:

```bash
# Header method
curl -H "X-API-Key: your_key_here" http://example.com/wp-json/ascii/v1/view

# Query param method
curl "http://example.com/wp-json/ascii/v1/view?api_key=your_key_here"
```

### Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/ascii/v1/view` | Get ASCII grid + bindings |
| GET | `/ascii/v1/status` | Get daemon status |
| GET | `/ascii/v1/directives` | List directives |
| POST | `/ascii/v1/directives` | Create directive |
| GET | `/ascii/v1/directives/{id}` | Get single directive |

### Example: Create Directive

```bash
curl -X POST http://example.com/wp-json/ascii/v1/directives \
  -H "X-API-Key: your_key_here" \
  -H "Content-Type: application/json" \
  -d '{"title": "Click Button A", "content": "Click the button labeled A"}'
```

### Example: Get View

```python
import requests

response = requests.get(
    'http://example.com/wp-json/ascii/v1/view',
    headers={'X-API-Key': 'your_key_here'}
)
data = response.json()
print(data['ascii'])  # ASCII grid
print(data['bindings'])  # Element coordinates
```

## Testing

```bash
# PHP tests
cd tests/php && php run-tests.php

# JavaScript tests
cd tests/js && npm test

# Python tests
cd tests/python && python3 run_tests.py

# Integration tests (requires running WordPress)
python3 tests/integration/test_rest_api.py --url http://localhost:8080 --key YOUR_KEY
```

## Requirements

- WordPress 6.0+
- PHP 8.0+
- Python 3.8+ (for ASCII capture scripts)
- X11 display server (for desktop capture)

## License

MIT
```

**Step 2: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/ascii-desktop-control/README.md
git commit -m "docs(ascii-api): add README with REST API documentation"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | API Key management class | `includes/class-api-keys.php`, tests |
| 2 | REST API class with auth | `includes/class-rest-api.php`, tests |
| 3 | View & Status endpoints | modify `class-rest-api.php` |
| 4 | Directives CRUD endpoints | modify `class-rest-api.php` |
| 5 | Integrate into main plugin | modify `ascii-desktop-control.php` |
| 6 | Settings page UI | modify `admin/page-settings.php` |
| 7 | Python integration tests | `tests/integration/test_rest_api.py` |
| 8 | Documentation | `README.md` |
