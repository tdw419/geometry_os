# Proactive Health Center Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Transform the Mission Control Health Dashboard into a proactive monitoring system with persistent reporting, real-time HUD, and emergency controls.

**Architecture:** Extend the existing MetricsCollector → WordPress bridge with 60-second heartbeat reporting, WordPress admin HUD widget, emergency reset capability, and hourly system health log posts via Evolution Daemon integration.

**Tech Stack:** JavaScript (browser), PHP (WordPress), MetricsCollector, SystemHealthDashboard, Evolution Daemon

---

## Prerequisites

- Existing `MetricsCollector.js` (latency tracking)
- Existing `SystemHealthDashboard.js` (real-time widget)
- Existing `wp_health_bridge.js` (WordPress initialization)
- Existing `geometry_os_bridge.php` (WordPress plugin)

---

## Task 1: WordPress Health API Endpoint

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
- Test: `wordpress_zone/wordpress/wp-content/mu-plugins/tests/test_health_api.php` (create)

**Step 1: Add REST API endpoint for health metrics**

In `geometry_os_bridge.php`, add to `__construct()`:

```php
// Health metrics REST API
add_action('rest_api_init', array($this, 'register_health_api'));
```

Then add the registration method:

```php
/**
 * Register REST API endpoints for health metrics
 */
public function register_health_api() {
    register_rest_route('geometry-os/v1', '/health', array(
        'methods' => 'POST',
        'callback' => array($this, 'handle_health_update'),
        'permission_callback' => array($this, 'verify_local_request'),
        'args' => array(
            'latency_ms' => array(
                'type' => 'number',
                'required' => false,
                'default' => 0
            ),
            'swarm_count' => array(
                'type' => 'integer',
                'required' => false,
                'default' => 0
            ),
            'health_score' => array(
                'type' => 'number',
                'required' => false,
                'default' => 100
            ),
            'buffer_drops' => array(
                'type' => 'integer',
                'required' => false,
                'default' => 0
            ),
            'reconnects' => array(
                'type' => 'integer',
                'required' => false,
                'default' => 0
            )
        )
    ));

    register_rest_route('geometry-os/v1', '/health', array(
        'methods' => 'GET',
        'callback' => array($this, 'get_health_status'),
        'permission_callback' => '__return_true'
    ));
}
```

**Step 2: Add request verification and handlers**

```php
/**
 * Verify request is from localhost (security)
 */
public function verify_local_request($request) {
    $ip = $_SERVER['REMOTE_ADDR'] ?? '';
    $allowed = ['127.0.0.1', '::1', 'localhost'];

    if (!in_array($ip, $allowed)) {
        return new WP_Error('forbidden', 'Health API only accepts localhost requests', array('status' => 403));
    }

    return true;
}

/**
 * Handle health metrics update from browser
 */
public function handle_health_update($request) {
    $metrics = array(
        'timestamp' => current_time('mysql'),
        'latency_ms' => floatval($request->get_param('latency_ms')),
        'swarm_count' => intval($request->get_param('swarm_count')),
        'health_score' => floatval($request->get_param('health_score')),
        'buffer_drops' => intval($request->get_param('buffer_drops')),
        'reconnects' => intval($request->get_param('reconnects'))
    );

    // Store in WordPress options
    update_option('geometry_os_health_metrics', $metrics);

    // Also log to telemetry for persistence
    $this->log_to_os('health_pulse', $metrics);

    return array(
        'success' => true,
        'timestamp' => $metrics['timestamp']
    );
}

/**
 * Get current health status
 */
public function get_health_status($request) {
    $metrics = get_option('geometry_os_health_metrics', array(
        'timestamp' => null,
        'latency_ms' => 0,
        'swarm_count' => 0,
        'health_score' => 100,
        'buffer_drops' => 0,
        'reconnects' => 0
    ));

    return $metrics;
}
```

**Step 3: Verify syntax**

Run: `php -l wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
Expected: No syntax errors

**Step 4: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php
git commit -m "feat(wp): add REST API endpoints for health metrics"
```

---

## Task 2: Heartbeat Mechanism in wp_health_bridge.js

**Files:**
- Modify: `systems/visual_shell/web/wp_health_bridge.js`

**Step 1: Add heartbeat function**

Add after the `initHealthDashboard()` function:

```javascript
/**
 * Start heartbeat to push metrics to WordPress every 60 seconds
 */
function startHealthHeartbeat() {
    // Don't start if metrics not available
    if (!window.geometryOS?.metrics) {
        console.warn('%c[System Health] Metrics not available for heartbeat', 'color: #ffcc00');
        return;
    }

    const heartbeatInterval = 60000; // 60 seconds
    const apiEndpoint = '/wp-json/geometry-os/v1/health';

    async function sendHeartbeat() {
        const metrics = window.geometryOS.metrics.getAllMetrics();

        try {
            const response = await fetch(apiEndpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    latency_ms: metrics.averageLatency || 0,
                    swarm_count: metrics.tileCount || 0,
                    health_score: calculateHealthScore(metrics),
                    buffer_drops: metrics.bufferDrops || 0,
                    reconnects: metrics.reconnectCount || 0
                })
            });

            if (response.ok) {
                console.log('%c[System Health] Heartbeat sent', 'color: #00ffcc');
            }
        } catch (err) {
            console.warn('%c[System Health] Heartbeat failed:', 'color: #ffcc00', err.message);
        }
    }

    // Send initial heartbeat
    sendHeartbeat();

    // Start interval
    setInterval(sendHeartbeat, heartbeatInterval);

    console.log('%c[System Health] Heartbeat started (60s interval)', 'color: #00ffcc');
}

/**
 * Calculate health score from metrics (0-100)
 */
function calculateHealthScore(metrics) {
    let score = 100;

    // Penalize high latency
    const latency = metrics.averageLatency || 0;
    if (latency > 100) score -= Math.min(30, (latency - 100) / 10);

    // Penalize buffer drops
    score -= Math.min(20, (metrics.bufferDrops || 0) * 5);

    // Penalize reconnects
    score -= Math.min(20, (metrics.reconnectCount || 0) * 5);

    return Math.max(0, Math.min(100, score));
}
```

**Step 2: Call heartbeat from onReady**

Modify `onReady()` to start heartbeat after dashboard init:

```javascript
function onReady() {
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            if (initHealthDashboard()) {
                startHealthHeartbeat();
            }
        });
    } else {
        if (initHealthDashboard()) {
            startHealthHeartbeat();
        }
    }
}
```

**Step 3: Verify syntax**

Run: `node --check systems/visual_shell/web/wp_health_bridge.js`
Expected: No syntax errors

**Step 4: Commit**

```bash
git add systems/visual_shell/web/wp_health_bridge.js
git commit -m "feat(bridge): add 60-second health heartbeat to WordPress"
```

---

## Task 3: WordPress Admin HUD Widget

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_admin_ui.php`

**Step 1: Create admin HUD widget class**

Add to `geometry_os_admin_ui.php` or create if doesn't exist:

```php
<?php
/**
 * Plugin Name: Geometry OS Admin HUD
 * Description: Real-time health dashboard in WordPress admin
 * Version: 0.1
 */

if (!defined('ABSPATH')) exit;

class GeometryOS_AdminHUD {

    public function __construct() {
        add_action('wp_dashboard_setup', array($this, 'add_dashboard_widget'));
        add_action('admin_enqueue_scripts', array($this, 'enqueue_styles'));
    }

    /**
     * Add dashboard widget
     */
    public function add_dashboard_widget() {
        wp_add_dashboard_widget(
            'geometry_os_health_hud',
            '🔧 Geometry OS Health',
            array($this, 'render_hud')
        );
    }

    /**
     * Enqueue inline styles
     */
    public function enqueue_styles() {
        $screen = get_current_screen();
        if ($screen && $screen->base === 'dashboard') {
            wp_add_inline_style('wp-admin', $this->get_hud_styles());
        }
    }

    /**
     * Render HUD content
     */
    public function render_hud() {
        $metrics = get_option('geometry_os_health_metrics', array());

        $latency = floatval($metrics['latency_ms'] ?? 0);
        $swarm = intval($metrics['swarm_count'] ?? 0);
        $score = floatval($metrics['health_score'] ?? 100);
        $drops = intval($metrics['buffer_drops'] ?? 0);
        $reconnects = intval($metrics['reconnects'] ?? 0);
        $timestamp = $metrics['timestamp'] ?? 'Never';

        // Determine status colors
        $latencyColor = $latency < 100 ? '#00ff00' : ($latency < 200 ? '#ffcc00' : '#ff4444');
        $scoreColor = $score >= 80 ? '#00ff00' : ($score >= 50 ? '#ffcc00' : '#ff4444');

        ?>
        <div class="geo-hud-container">
            <div class="geo-hud-header">
                <span class="geo-hud-title">System Status</span>
                <span class="geo-hud-time"><?php echo esc_html($timestamp); ?></span>
            </div>

            <div class="geo-hud-grid">
                <div class="geo-hud-row">
                    <span class="geo-hud-label">Bridge Latency</span>
                    <span class="geo-hud-value" style="color: <?php echo $latencyColor; ?>">
                        <?php echo number_format($latency, 1); ?>ms
                    </span>
                    <span class="geo-hud-status">
                        <?php echo $latency < 100 ? '✓' : '⚠'; ?>
                    </span>
                </div>

                <div class="geo-hud-row">
                    <span class="geo-hud-label">Swarm Capacity</span>
                    <span class="geo-hud-value"><?php echo $swarm; ?> tiles</span>
                    <span class="geo-hud-status">
                        <?php echo $swarm >= 10 ? '✓' : '○'; ?>
                    </span>
                </div>

                <div class="geo-hud-row">
                    <span class="geo-hud-label">Health Score</span>
                    <span class="geo-hud-value" style="color: <?php echo $scoreColor; ?>">
                        <?php echo number_format($score, 0); ?>%
                    </span>
                    <span class="geo-hud-status">
                        <?php echo $score >= 80 ? '✓' : '⚠'; ?>
                    </span>
                </div>

                <div class="geo-hud-row">
                    <span class="geo-hud-label">Buffer Drops</span>
                    <span class="geo-hud-value"><?php echo $drops; ?></span>
                    <span class="geo-hud-status">
                        <?php echo $drops === 0 ? '✓' : '⚠'; ?>
                    </span>
                </div>

                <div class="geo-hud-row">
                    <span class="geo-hud-label">Reconnects</span>
                    <span class="geo-hud-value"><?php echo $reconnects; ?></span>
                    <span class="geo-hud-status">
                        <?php echo $reconnects === 0 ? '✓' : '⚠'; ?>
                    </span>
                </div>
            </div>

            <?php if ($score < 50): ?>
            <div class="geo-hud-alert">
                ⚠️ Health score critical. Consider emergency reset.
            </div>
            <?php endif; ?>

            <div class="geo-hud-actions">
                <button class="geo-hud-btn geo-hud-btn-refresh" onclick="location.reload()">
                    ↻ Refresh
                </button>
                <button class="geo-hud-btn geo-hud-btn-reset" id="geo-emergency-reset"
                        onclick="geometryOSEmergencyReset()"
                        <?php echo $score >= 50 ? 'disabled' : ''; ?>>
                    🔄 Emergency Reset
                </button>
            </div>
        </div>

        <script>
        function geometryOSEmergencyReset() {
            if (!confirm('Are you sure? This will restart all tiles on the map.')) {
                return;
            }

            fetch('/wp-json/geometry-os/v1/emergency-reset', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' }
            })
            .then(r => r.json())
            .then(data => {
                alert(data.message || 'Reset initiated');
                location.reload();
            })
            .catch(err => alert('Reset failed: ' + err.message));
        }
        </script>
        <?php
    }

    /**
     * Get HUD CSS styles
     */
    private function get_hud_styles() {
        return '
        .geo-hud-container {
            background: #1a1a2e;
            border-radius: 8px;
            padding: 16px;
            font-family: "JetBrains Mono", monospace;
            color: #e0e0e0;
        }
        .geo-hud-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            padding-bottom: 8px;
            border-bottom: 1px solid #333;
        }
        .geo-hud-title {
            color: #00ffcc;
            font-weight: bold;
        }
        .geo-hud-time {
            color: #666;
            font-size: 11px;
        }
        .geo-hud-grid {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .geo-hud-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 4px 0;
        }
        .geo-hud-label {
            color: #888;
        }
        .geo-hud-value {
            font-weight: bold;
        }
        .geo-hud-status {
            width: 20px;
            text-align: center;
        }
        .geo-hud-alert {
            background: #ff444422;
            border: 1px solid #ff4444;
            border-radius: 4px;
            padding: 8px;
            margin-top: 12px;
            color: #ff4444;
            font-size: 12px;
        }
        .geo-hud-actions {
            display: flex;
            gap: 8px;
            margin-top: 12px;
            padding-top: 12px;
            border-top: 1px solid #333;
        }
        .geo-hud-btn {
            padding: 8px 16px;
            border-radius: 4px;
            border: 1px solid;
            cursor: pointer;
            font-family: inherit;
            font-size: 12px;
        }
        .geo-hud-btn-refresh {
            background: #16213e;
            color: #00ffcc;
            border-color: #00ffcc;
        }
        .geo-hud-btn-reset {
            background: #2e1a1a;
            color: #ff4444;
            border-color: #ff4444;
        }
        .geo-hud-btn-reset:disabled {
            opacity: 0.4;
            cursor: not-allowed;
        }
        ';
    }
}

new GeometryOS_AdminHUD();
```

**Step 2: Verify syntax**

Run: `php -l wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_admin_ui.php`
Expected: No syntax errors

**Step 3: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_admin_ui.php
git commit -m "feat(admin): add Geometry OS health HUD to WordPress dashboard"
```

---

## Task 4: Emergency Reset Endpoint

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`

**Step 1: Add emergency reset endpoint**

Add to `register_health_api()`:

```php
register_rest_route('geometry-os/v1', '/emergency-reset', array(
    'methods' => 'POST',
    'callback' => array($this, 'handle_emergency_reset'),
    'permission_callback' => array($this, 'verify_local_request')
));
```

**Step 2: Add reset handler**

```php
/**
 * Handle emergency reset request
 */
public function handle_emergency_reset($request) {
    // Log the reset event
    $this->log_to_os('emergency_reset', array(
        'timestamp' => current_time('mysql'),
        'ip' => $_SERVER['REMOTE_ADDR'] ?? 'unknown',
        'user_agent' => $_SERVER['HTTP_USER_AGENT'] ?? 'unknown'
    ));

    // Send reset command to Visual Bridge
    $response = wp_remote_post('http://127.0.0.1:8768/emergency-reset', array(
        'timeout' => 10,
        'headers' => array('Content-Type' => 'application/json'),
        'body' => json_encode(array(
            'source' => 'wordpress',
            'reason' => 'emergency_reset_triggered'
        ))
    ));

    if (is_wp_error($response)) {
        return array(
            'success' => false,
            'message' => 'Failed to contact Visual Bridge: ' . $response->get_error_message()
        );
    }

    // Reset local metrics
    delete_option('geometry_os_health_metrics');

    return array(
        'success' => true,
        'message' => 'Emergency reset initiated. Map will restart.'
    );
}
```

**Step 3: Verify syntax**

Run: `php -l wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
Expected: No syntax errors

**Step 4: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php
git commit -m "feat(wp): add emergency reset endpoint with audit logging"
```

---

## Task 5: Hourly Health Report Post

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`

**Step 1: Register hourly cron schedule**

Add to `__construct()`:

```php
// Hourly health report
add_action('geometry_os_hourly_health_report', array($this, 'generate_health_report'));
```

And update the cron schedules filter:

```php
// Add to existing cron_schedules filter
$schedules['hourly_geo'] = [
    'interval' => 3600,
    'display' => 'Every Hour (Geometry OS)'
];
```

**Step 2: Schedule the cron**

```php
// Add to init hook
add_action('init', function() {
    if (!wp_next_scheduled('geometry_os_hourly_health_report')) {
        wp_schedule_event(time(), 'hourly', 'geometry_os_hourly_health_report');
    }
});
```

**Step 3: Generate health report post**

```php
/**
 * Generate hourly health report as WordPress post
 */
public function generate_health_report() {
    // Get current metrics
    $metrics = get_option('geometry_os_health_metrics', array());

    // Get metrics from the past hour (from telemetry)
    $telemetry_file = '/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/telemetry/events.jsonl';
    $hour_ago = time() - 3600;
    $health_events = array();

    if (file_exists($telemetry_file)) {
        $lines = file($telemetry_file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        $lines = array_slice($lines, -1000); // Last 1000 lines

        foreach ($lines as $line) {
            $event = json_decode($line, true);
            if ($event && isset($event['type']) && $event['type'] === 'health_pulse') {
                if (isset($event['timestamp']) && $event['timestamp'] >= $hour_ago) {
                    $health_events[] = $event['data'];
                }
            }
        }
    }

    // Calculate aggregates
    $avg_latency = 0;
    $avg_score = 0;
    $max_swarm = 0;

    if (!empty($health_events)) {
        $latencies = array_column($health_events, 'latency_ms');
        $scores = array_column($health_events, 'health_score');
        $swarms = array_column($health_events, 'swarm_count');

        $avg_latency = array_sum($latencies) / count($latencies);
        $avg_score = array_sum($scores) / count($scores);
        $max_swarm = max($swarms);
    }

    // Create report content
    $content = $this->generate_report_content($health_events, $avg_latency, $avg_score, $max_swarm);

    // Insert as post
    $post_id = wp_insert_post(array(
        'post_title' => 'System Health Report - ' . date('Y-m-d H:i'),
        'post_type' => 'geo_health_report',
        'post_status' => 'publish',
        'post_content' => $content,
        'meta_input' => array(
            '_avg_latency' => $avg_latency,
            '_avg_score' => $avg_score,
            '_max_swarm' => $max_swarm,
            '_event_count' => count($health_events)
        )
    ));

    if (!is_wp_error($post_id)) {
        $this->log_to_os('health_report', array(
            'post_id' => $post_id,
            'avg_latency' => $avg_latency,
            'avg_score' => $avg_score
        ));
    }
}

/**
 * Generate report content HTML
 */
private function generate_report_content($events, $avg_latency, $avg_score, $max_swarm) {
    $status = $avg_score >= 80 ? 'HEALTHY' : ($avg_score >= 50 ? 'DEGRADED' : 'CRITICAL');
    $status_color = $avg_score >= 80 ? '#00ff00' : ($avg_score >= 50 ? '#ffcc00' : '#ff4444');

    ob_start();
    ?>
    <div style="font-family: monospace; background: #1a1a2e; padding: 20px; border-radius: 8px; color: #e0e0e0;">
        <h2 style="color: #00ffcc; margin-top: 0;">Hourly Health Summary</h2>
        <p style="color: #666;">Report generated: <?php echo current_time('mysql'); ?></p>

        <div style="background: #0f0f1a; padding: 16px; border-radius: 4px; margin: 16px 0;">
            <div style="font-size: 24px; color: <?php echo $status_color; ?>;">
                <?php echo $status; ?>
            </div>
            <div style="color: #888; font-size: 12px;">System Status</div>
        </div>

        <table style="width: 100%; border-collapse: collapse;">
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 8px 0; color: #888;">Average Latency</td>
                <td style="padding: 8px 0; text-align: right;"><?php echo number_format($avg_latency, 1); ?>ms</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 8px 0; color: #888;">Average Health Score</td>
                <td style="padding: 8px 0; text-align: right;"><?php echo number_format($avg_score, 0); ?>%</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 8px 0; color: #888;">Peak Swarm Capacity</td>
                <td style="padding: 8px 0; text-align: right;"><?php echo $max_swarm; ?> tiles</td>
            </tr>
            <tr>
                <td style="padding: 8px 0; color: #888;">Heartbeat Events</td>
                <td style="padding: 8px 0; text-align: right;"><?php echo count($events); ?></td>
            </tr>
        </table>

        <p style="margin-top: 16px; padding-top: 16px; border-top: 1px solid #333; color: #666; font-size: 11px;">
            Auto-generated by Geometry OS Evolution Daemon
        </p>
    </div>
    <?php
    return ob_get_clean();
}
```

**Step 4: Register custom post type**

Add to `__construct()`:

```php
add_action('init', array($this, 'register_health_report_post_type'));
```

And the handler:

```php
/**
 * Register health report custom post type
 */
public function register_health_report_post_type() {
    register_post_type('geo_health_report', array(
        'labels' => array(
            'name' => 'Health Reports',
            'singular_name' => 'Health Report'
        ),
        'public' => true,
        'has_archive' => true,
        'show_in_rest' => true,
        'supports' => array('title', 'editor', 'custom-fields'),
        'menu_icon' => 'dashicons-heart'
    ));
}
```

**Step 5: Verify syntax**

Run: `php -l wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
Expected: No syntax errors

**Step 6: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php
git commit -m "feat(wp): add hourly health report posts with custom post type"
```

---

## Task 6: Integration Testing

**Files:**
- Create: `systems/visual_shell/web/tests/test_proactive_health.js`

**Step 1: Create integration test**

```javascript
/**
 * Proactive Health Center Integration Tests
 *
 * Tests the full flow: Browser metrics → WordPress API → Admin HUD → Health Reports
 */

class ProactiveHealthTester {
    constructor() {
        this.results = [];
    }

    async runAll() {
        console.log('%c════════════════════════════════════════════════════════════', 'color: #00ffcc;');
        console.log('%c  PROACTIVE HEALTH CENTER - INTEGRATION TESTS', 'color: #00ffcc; font-weight: bold;');
        console.log('%c════════════════════════════════════════════════════════════', 'color: #00ffcc;');

        await this.testMetricsCollectorExists();
        await this.testHeartbeatFunction();
        await this.testHealthScoreCalculation();
        await this.testWordPressAPIEndpoint();

        this.report();
    }

    async testMetricsCollectorExists() {
        const hasMetrics = !!window.geometryOS?.metrics;
        const hasGetAll = typeof window.geometryOS?.metrics?.getAllMetrics === 'function';

        this.logResult('MetricsCollector', hasMetrics && hasGetAll,
            hasMetrics ? 'window.geometryOS.metrics available' : 'MetricsCollector not found');
    }

    async testHeartbeatFunction() {
        const hasFunction = typeof window.sendHealthHeartbeat === 'function' ||
                           typeof startHealthHeartbeat === 'function';

        this.logResult('Heartbeat Function', hasFunction,
            hasFunction ? 'Heartbeat function available' : 'Heartbeat not initialized');
    }

    async testHealthScoreCalculation() {
        const metrics = window.geometryOS?.metrics?.getAllMetrics() || {};
        const hasScore = typeof metrics.health_score === 'number' ||
                        typeof metrics.averageLatency === 'number';

        this.logResult('Health Score', hasScore,
            hasScore ? `Latency: ${metrics.averageLatency?.toFixed(1) || 0}ms` : 'No metrics available');
    }

    async testWordPressAPIEndpoint() {
        try {
            const response = await fetch('/wp-json/geometry-os/v1/health');
            const data = await response.json();

            const success = response.ok && typeof data === 'object';
            this.logResult('WordPress API', success,
                success ? `API responding, latency: ${data.latency_ms || 0}ms` : 'API not responding');
        } catch (err) {
            this.logResult('WordPress API', false, `Error: ${err.message}`);
        }
    }

    logResult(name, success, details) {
        const symbol = success ? '✅' : '❌';
        console.log(`${symbol} ${name.padEnd(20)} | ${details}`);
        this.results.push({ name, success, details });
    }

    report() {
        const passed = this.results.filter(r => r.success).length;
        const total = this.results.length;
        const color = passed === total ? '#00ff00' : '#ff4444';

        console.log('\n' + '─'.repeat(60));
        console.log(`%cINTEGRATION: ${passed}/${total} PASSED`, `color: ${color}; font-weight: bold;`);
        console.log('─'.repeat(60));
    }
}

console.log('%cProactive Health Tester loaded.', 'color: #00ffcc;');
console.log('%cRun: await new ProactiveHealthTester().runAll()', 'color: #888;');
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/tests/test_proactive_health.js`
Expected: No syntax errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/tests/test_proactive_health.js
git commit -m "test(health): add integration tests for Proactive Health Center"
```

---

## Task 7: Final Verification

**Step 1: Verify all PHP files**

```bash
php -l wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php
php -l wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_admin_ui.php
```

Expected: No syntax errors

**Step 2: Verify all JS files**

```bash
node --check systems/visual_shell/web/wp_health_bridge.js
node --check systems/visual_shell/web/tests/test_proactive_health.js
```

Expected: No syntax errors

**Step 3: List all files created/modified**

```bash
git status --short
```

**Step 4: Commit summary**

```bash
git commit -m "feat(health): complete Proactive Health Center implementation"
```

---

## Summary

| Task | Component | Files |
|------|-----------|-------|
| 1 | Health API Endpoint | `geometry_os_bridge.php` |
| 2 | Heartbeat Mechanism | `wp_health_bridge.js` |
| 3 | Admin HUD Widget | `geometry_os_admin_ui.php` |
| 4 | Emergency Reset | `geometry_os_bridge.php` |
| 5 | Hourly Reports | `geometry_os_bridge.php` |
| 6 | Integration Tests | `test_proactive_health.js` |
| 7 | Final Verification | All files |

---

## How to Test

1. **Load WordPress dashboard** - Should see "🔧 Geometry OS Health" widget
2. **Open Mission Control page** - Heartbeat should start automatically
3. **Wait 60 seconds** - Check WordPress option `geometry_os_health_metrics`
4. **Check hourly report** - After an hour, should see new `geo_health_report` post
5. **Test emergency reset** - Lower health score to < 50%, button enables

```bash
# Check WordPress option
wp option get geometry_os_health_metrics

# Check health reports
wp post list --post_type=geo_health_report
```
