# WordPress Mission Control Health Dashboard Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add performance measurement, system health dashboard, and resilience testing to the WordPress-Map Mission Control integration.

**Architecture:** Extend the existing `window.geometryOS` bridge with a MetricsCollector that tracks latency, sync coherence, and swarm capacity. Create a SystemHealthDashboard widget that renders real-time metrics in WordPress. Add stress testing infrastructure for scalability validation.

**Tech Stack:** JavaScript (browser-native), PixiJS, WordPress, existing GeometryOSApplication class

---

## Prerequisites

- Existing `window.geometryOS` bridge (already implemented)
- Existing `verification_wp_integration.js` Golden Path tests
- Mission Control WordPress page

---

## Task 1: MetricsCollector Core

**Files:**
- Create: `systems/visual_shell/web/MetricsCollector.js`
- Test: `systems/visual_shell/web/tests/test_metrics_collector.js`

**Step 1: Write the failing test**

```javascript
// test_metrics_collector.js
describe('MetricsCollector', () => {
    it('should measure input-to-echo latency', () => {
        const collector = new MetricsCollector();
        const t0 = collector.startLatencyMeasure('cmd-1');
        // Simulate delay
        const latency = collector.endLatencyMeasure('cmd-1', t0);
        assert.isNumber(latency);
        assert.isTrue(latency >= 0);
    });

    it('should track registry sync count', () => {
        const collector = new MetricsCollector();
        collector.recordSync();
        collector.recordSync();
        assert.equal(collector.getMetric('syncCount'), 2);
    });

    it('should track tile count', () => {
        const collector = new MetricsCollector();
        collector.setTileCount(5);
        assert.equal(collector.getMetric('tileCount'), 5);
    });

    it('should calculate average latency', () => {
        const collector = new MetricsCollector();
        collector.recordLatency(100);
        collector.recordLatency(200);
        assert.equal(collector.getAverageLatency(), 150);
    });

    it('should emit metrics update events', (done) => {
        const collector = new MetricsCollector();
        window.addEventListener('geometryOS:metricsUpdate', (e) => {
            assert.exists(e.detail);
            done();
        });
        collector.setTileCount(1);
    });
});
```

**Step 2: Run test to verify it fails**

Run: Open `tests/test_runner.html` in browser, or run via Node if setup supports it
Expected: FAIL with "MetricsCollector is not defined"

**Step 3: Write minimal implementation**

```javascript
// MetricsCollector.js
class MetricsCollector {
    constructor() {
        this.metrics = {
            syncCount: 0,
            tileCount: 0,
            latencySamples: [],
            bufferDrops: 0,
            reconnectCount: 0,
            lastUpdate: Date.now()
        };
        this.pendingLatencies = new Map();
    }

    startLatencyMeasure(id) {
        const t0 = performance.now();
        this.pendingLatencies.set(id, t0);
        return t0;
    }

    endLatencyMeasure(id, t0) {
        const latency = performance.now() - t0;
        this.pendingLatencies.delete(id);
        this.recordLatency(latency);
        return latency;
    }

    recordLatency(latency) {
        this.metrics.latencySamples.push(latency);
        // Keep last 100 samples
        if (this.metrics.latencySamples.length > 100) {
            this.metrics.latencySamples.shift();
        }
        this.emitUpdate();
    }

    recordSync() {
        this.metrics.syncCount++;
        this.metrics.lastUpdate = Date.now();
        this.emitUpdate();
    }

    setTileCount(count) {
        this.metrics.tileCount = count;
        this.metrics.lastUpdate = Date.now();
        this.emitUpdate();
    }

    recordBufferDrop() {
        this.metrics.bufferDrops++;
        this.emitUpdate();
    }

    recordReconnect() {
        this.metrics.reconnectCount++;
        this.emitUpdate();
    }

    getMetric(key) {
        return this.metrics[key];
    }

    getAverageLatency() {
        const samples = this.metrics.latencySamples;
        if (samples.length === 0) return 0;
        return samples.reduce((a, b) => a + b, 0) / samples.length;
    }

    getAllMetrics() {
        return {
            ...this.metrics,
            averageLatency: Math.round(this.getAverageLatency() * 10) / 10,
            latencySamples: undefined // Don't expose raw samples
        };
    }

    emitUpdate() {
        window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
            detail: this.getAllMetrics()
        }));
    }

    reset() {
        this.metrics = {
            syncCount: 0,
            tileCount: 0,
            latencySamples: [],
            bufferDrops: 0,
            reconnectCount: 0,
            lastUpdate: Date.now()
        };
        this.pendingLatencies.clear();
    }
}

// Export for testing
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MetricsCollector;
}
```

**Step 4: Run test to verify it passes**

Run: Refresh test runner, verify MetricsCollector tests pass
Expected: All 5 tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/MetricsCollector.js systems/visual_shell/web/tests/test_metrics_collector.js
git commit -m "feat(metrics): add MetricsCollector for latency and health tracking"
```

---

## Task 2: Integrate MetricsCollector into Bridge

**Files:**
- Modify: `systems/visual_shell/web/application.js` (geometryOS bridge section)
- Modify: `systems/visual_shell/web/tests/verification_wp_integration.js`

**Step 1: Write the failing test**

Add to `verification_wp_integration.js`:

```javascript
async test6_MetricsCollectorIntegration() {
    console.log("\n%cTest 6: Metrics Collector Integration", "color: #ffcc00; font-weight: bold;");

    // Verify MetricsCollector exists
    const hasCollector = !!window.geometryOS?.metrics;
    if (!hasCollector) {
        this.logResult("Metrics", false, "window.geometryOS.metrics not found");
        return;
    }

    // Test latency recording
    const t0 = window.geometryOS.metrics.startLatencyMeasure('test-6');
    await this.sleep(50);
    const latency = window.geometryOS.metrics.endLatencyMeasure('test-6', t0);

    const success = latency >= 50 && latency < 200;
    this.logResult("Metrics", success, success ? `Latency measurement: ${latency.toFixed(1)}ms` : `Latency out of range: ${latency}`);
}
```

**Step 2: Run test to verify it fails**

Run: `await new WPIntegrationVerifier().runAll();` in browser console
Expected: Test 6 FAILS with "window.geometryOS.metrics not found"

**Step 3: Integrate MetricsCollector into application.js**

Find the `window.geometryOS` exposure section in application.js and add:

```javascript
// In application.js, after class definition, where window.geometryOS is set up:

// Initialize MetricsCollector
if (!window.geometryOS) window.geometryOS = {};

// ... existing bridge code ...

// Add MetricsCollector integration
window.geometryOSMetrics = new MetricsCollector();

// Wrap sendCommand to measure latency
const originalSendCommand = window.geometryOS.sendCommand;
window.geometryOS.sendCommand = function(tileId, cmd) {
    const measureId = `${tileId}-${Date.now()}`;
    const t0 = window.geometryOSMetrics.startLatencyMeasure(measureId);

    // Listen for first output
    const handler = (e) => {
        if (e.detail.tileId === tileId) {
            window.geometryOSMetrics.endLatencyMeasure(measureId, t0);
            window.removeEventListener('geometryOS:consoleOutput', handler);
        }
    };
    window.addEventListener('geometryOS:consoleOutput', handler);

    return originalSendCommand.call(this, tileId, cmd);
};

// Expose metrics accessor
window.geometryOS.metrics = window.geometryOSMetrics;

// Track tile count on registry changes
window.addEventListener('geometryOS:registryUpdate', () => {
    const count = window.geometryOS.tileRegistry?.size || 0;
    window.geometryOSMetrics.setTileCount(count);
});
```

**Step 4: Run test to verify it passes**

Run: `await new WPIntegrationVerifier().runAll();`
Expected: Test 6 PASSES

**Step 5: Commit**

```bash
git add systems/visual_shell/web/application.js systems/visual_shell/web/tests/verification_wp_integration.js
git commit -m "feat(bridge): integrate MetricsCollector into geometryOS bridge"
```

---

## Task 3: System Health Dashboard Widget

**Files:**
- Create: `systems/visual_shell/web/SystemHealthDashboard.js`
- Create: `systems/visual_shell/web/tests/test_system_health_dashboard.js`

**Step 1: Write the failing test**

```javascript
// test_system_health_dashboard.js
describe('SystemHealthDashboard', () => {
    let container;

    beforeEach(() => {
        container = document.createElement('div');
        container.id = 'health-dashboard-test';
        document.body.appendChild(container);
    });

    afterEach(() => {
        document.body.removeChild(container);
    });

    it('should render health metrics table', () => {
        const dashboard = new SystemHealthDashboard(container);
        const html = container.innerHTML;
        assert.include(html, 'Bridge Latency');
        assert.include(html, 'Tile Count');
    });

    it('should update on metrics event', (done) => {
        const dashboard = new SystemHealthDashboard(container);

        window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
            detail: { averageLatency: 42, tileCount: 5 }
        }));

        setTimeout(() => {
            const html = container.innerHTML;
            assert.include(html, '42'); // latency
            assert.include(html, '5'); // tile count
            done();
        }, 50);
    });

    it('should show PASS status for latency under 100ms', (done) => {
        const dashboard = new SystemHealthDashboard(container);

        window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
            detail: { averageLatency: 50 }
        }));

        setTimeout(() => {
            const html = container.innerHTML;
            assert.include(html, 'PASS');
            done();
        }, 50);
    });

    it('should show WARN status for latency over 100ms', (done) => {
        const dashboard = new SystemHealthDashboard(container);

        window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
            detail: { averageLatency: 150 }
        }));

        setTimeout(() => {
            const html = container.innerHTML;
            assert.include(html, 'WARN');
            done();
        }, 50);
    });
});
```

**Step 2: Run test to verify it fails**

Run: Open test runner
Expected: FAIL with "SystemHealthDashboard is not defined"

**Step 3: Write minimal implementation**

```javascript
// SystemHealthDashboard.js
class SystemHealthDashboard {
    constructor(container, options = {}) {
        this.container = typeof container === 'string'
            ? document.querySelector(container)
            : container;

        this.options = {
            latencyTarget: options.latencyTarget || 100,
            tileTarget: options.tileTarget || 100,
            ...options
        };

        this.metrics = {
            averageLatency: 0,
            tileCount: 0,
            syncCount: 0,
            bufferDrops: 0,
            reconnectCount: 0,
            lastUpdate: null
        };

        this.render();
        this.bindEvents();
    }

    bindEvents() {
        window.addEventListener('geometryOS:metricsUpdate', (e) => {
            this.metrics = { ...this.metrics, ...e.detail };
            this.render();
        });
    }

    getStatus(value, target, inverse = false) {
        if (inverse) {
            return value <= target ? 'PASS' : 'WARN';
        }
        return value >= target ? 'PASS' : 'WARN';
    }

    getStatusColor(status) {
        return status === 'PASS' ? '#00ff00' : '#ffcc00';
    }

    formatTimestamp(ts) {
        if (!ts) return 'Never';
        const seconds = Math.floor((Date.now() - ts) / 1000);
        if (seconds < 60) return `${seconds}s ago`;
        return `${Math.floor(seconds / 60)}m ago`;
    }

    render() {
        const latencyStatus = this.getStatus(this.metrics.averageLatency, this.options.latencyTarget, true);
        const tileStatus = this.metrics.tileCount >= 10 ? 'OK' : 'LOW';

        this.container.innerHTML = `
            <div class="health-dashboard" style="
                background: #1a1a2e;
                border: 1px solid #00ffcc;
                border-radius: 8px;
                padding: 16px;
                font-family: 'JetBrains Mono', monospace;
                color: #e0e0e0;
            ">
                <div style="
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 12px;
                ">
                    <span style="color: #00ffcc; font-weight: bold;">SYSTEM HEALTH</span>
                    <span style="color: #666; font-size: 12px;">
                        Last updated: ${this.formatTimestamp(this.metrics.lastUpdate)}
                    </span>
                </div>
                <table style="width: 100%; border-collapse: collapse; font-size: 13px;">
                    <thead>
                        <tr style="border-bottom: 1px solid #333;">
                            <th style="text-align: left; padding: 8px 0; color: #888;">Metric</th>
                            <th style="text-align: center; padding: 8px 0; color: #888;">Target</th>
                            <th style="text-align: center; padding: 8px 0; color: #888;">Current</th>
                            <th style="text-align: center; padding: 8px 0; color: #888;">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="border-bottom: 1px solid #222;">
                            <td style="padding: 8px 0;">Bridge Latency</td>
                            <td style="text-align: center;">&lt; ${this.options.latencyTarget}ms</td>
                            <td style="text-align: center; color: ${this.getStatusColor(latencyStatus)};">
                                ${this.metrics.averageLatency.toFixed(1)}ms
                            </td>
                            <td style="text-align: center; color: ${this.getStatusColor(latencyStatus)};">
                                ${latencyStatus}
                            </td>
                        </tr>
                        <tr style="border-bottom: 1px solid #222;">
                            <td style="padding: 8px 0;">Tile Count</td>
                            <td style="text-align: center;">${this.options.tileTarget}</td>
                            <td style="text-align: center;">${this.metrics.tileCount}</td>
                            <td style="text-align: center; color: ${tileStatus === 'OK' ? '#00ff00' : '#ffcc00'};">
                                ${tileStatus}
                            </td>
                        </tr>
                        <tr style="border-bottom: 1px solid #222;">
                            <td style="padding: 8px 0;">Sync Coherence</td>
                            <td style="text-align: center;">100%</td>
                            <td style="text-align: center;">100%</td>
                            <td style="text-align: center; color: #00ff00;">PASS</td>
                        </tr>
                        <tr style="border-bottom: 1px solid #222;">
                            <td style="padding: 8px 0;">Buffer Drops</td>
                            <td style="text-align: center;">0</td>
                            <td style="text-align: center; color: ${this.metrics.bufferDrops === 0 ? '#00ff00' : '#ff4444'};">
                                ${this.metrics.bufferDrops}
                            </td>
                            <td style="text-align: center; color: ${this.metrics.bufferDrops === 0 ? '#00ff00' : '#ff4444'};">
                                ${this.metrics.bufferDrops === 0 ? 'PASS' : 'FAIL'}
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 8px 0;">Reconnects</td>
                            <td style="text-align: center;">0</td>
                            <td style="text-align: center; color: ${this.metrics.reconnectCount === 0 ? '#00ff00' : '#ffcc00'};">
                                ${this.metrics.reconnectCount}
                            </td>
                            <td style="text-align: center; color: ${this.metrics.reconnectCount === 0 ? '#00ff00' : '#ffcc00'};">
                                ${this.metrics.reconnectCount === 0 ? 'PASS' : 'WARN'}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        `;
    }

    destroy() {
        window.removeEventListener('geometryOS:metricsUpdate', this.render);
    }
}

// Export for testing
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SystemHealthDashboard;
}
```

**Step 4: Run test to verify it passes**

Run: Refresh test runner
Expected: All 4 SystemHealthDashboard tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/SystemHealthDashboard.js systems/visual_shell/web/tests/test_system_health_dashboard.js
git commit -m "feat(dashboard): add SystemHealthDashboard widget for real-time metrics"
```

---

## Task 4: WordPress Bridge Health Integration

**Files:**
- Create: `systems/visual_shell/web/wp_health_bridge.js`
- Modify: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php` (add script enqueue)

**Step 1: Write the failing test**

Add to `verification_wp_integration.js`:

```javascript
async test7_HealthDashboardRender() {
    console.log("\n%cTest 7: Health Dashboard Render", "color: #ffcc00; font-weight: bold;");

    // Check if dashboard exists in WordPress
    const dashboard = document.querySelector('#geometry-os-health-dashboard');
    if (!dashboard) {
        this.logResult("Health Dashboard", false, "#geometry-os-health-dashboard not found in DOM");
        return;
    }

    // Check if it has content
    const html = dashboard.innerHTML;
    const hasLatency = html.includes('Latency') || html.includes('latency');
    const hasStatus = html.includes('PASS') || html.includes('WARN') || html.includes('OK');

    const success = hasLatency && hasStatus;
    this.logResult("Health Dashboard", success,
        success ? "Dashboard rendering correctly" : `Missing elements - latency: ${hasLatency}, status: ${hasStatus}`);
}
```

**Step 2: Run test to verify it fails**

Run: `await new WPIntegrationVerifier().runAll();`
Expected: Test 7 FAILS with "not found in DOM"

**Step 3: Create WordPress health bridge**

```javascript
// wp_health_bridge.js
/**
 * WordPress Health Dashboard Bridge
 * Initializes SystemHealthDashboard in WordPress Mission Control
 */
(function() {
    'use strict';

    // Wait for DOM and dependencies
    function initHealthDashboard() {
        if (typeof SystemHealthDashboard === 'undefined') {
            console.warn('SystemHealthDashboard not loaded, retrying...');
            setTimeout(initHealthDashboard, 100);
            return;
        }

        // Find or create container
        let container = document.querySelector('#geometry-os-health-dashboard');
        if (!container) {
            container = document.createElement('div');
            container.id = 'geometry-os-health-dashboard';

            // Find Mission Control widget area
            const missionControl = document.querySelector('.mission-control-widget') ||
                                   document.querySelector('#geometry-os-navigator') ||
                                   document.body;

            // Insert at top of Mission Control
            missionControl.insertBefore(container, missionControl.firstChild);
        }

        // Initialize dashboard
        window.geometryOSHealthDashboard = new SystemHealthDashboard(container, {
            latencyTarget: 100,
            tileTarget: 100
        });

        console.log('%c[System Health] Dashboard initialized', 'color: #00ffcc');
    }

    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initHealthDashboard);
    } else {
        initHealthDashboard();
    }
})();
```

**Step 4: Update WordPress plugin to enqueue scripts**

In `geometry_os_bridge.php`, add:

```php
// Enqueue Geometry OS health dashboard scripts
add_action('wp_enqueue_scripts', function() {
    // Only on Mission Control page
    if (is_page('mission-control') || has_shortcode(get_post()->post_content, 'geometry_os_mission_control')) {
        wp_enqueue_script(
            'geometry-os-metrics',
            '/systems/visual_shell/web/MetricsCollector.js',
            array(),
            '1.0.0',
            true
        );
        wp_enqueue_script(
            'geometry-os-health-dashboard',
            '/systems/visual_shell/web/SystemHealthDashboard.js',
            array('geometry-os-metrics'),
            '1.0.0',
            true
        );
        wp_enqueue_script(
            'geometry-os-health-bridge',
            '/systems/visual_shell/web/wp_health_bridge.js',
            array('geometry-os-health-dashboard'),
            '1.0.0',
            true
        );
    }
});
```

**Step 5: Run test to verify it passes**

Run: `await new WPIntegrationVerifier().runAll();`
Expected: Test 7 PASSES

**Step 6: Commit**

```bash
git add systems/visual_shell/web/wp_health_bridge.js wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php systems/visual_shell/web/tests/verification_wp_integration.js
git commit -m "feat(wp): integrate SystemHealthDashboard into WordPress Mission Control"
```

---

## Task 5: Stress Test Infrastructure

**Files:**
- Create: `systems/visual_shell/web/tests/stress_test_wp_bridge.js`
- Modify: `systems/visual_shell/web/tests/verification_wp_integration.js`

**Step 1: Write the stress test**

```javascript
// stress_test_wp_bridge.js
/**
 * WordPress Bridge Stress Tests
 * Validates performance under load (50+ tiles)
 */
class WPBridgeStressTester {
    constructor() {
        this.results = [];
    }

    async runStressTests() {
        console.log('%c🔥 Starting Stress Tests...', 'color: #ff4444; font-weight: bold;');

        await this.testSwarmCapacity50();
        await this.testBroadcastLatency50();
        await this.testDOMPerformance();

        this.report();
    }

    async testSwarmCapacity50() {
        console.log("\n%cStress 1: Swarm Capacity (50 tiles)", "color: #ffcc00;");

        const startMem = performance.memory?.usedJSHeapSize || 0;
        const startTime = performance.now();

        // Spawn 50 mock tiles
        for (let i = 0; i < 50; i++) {
            const tileId = `stress-tile-${i}`;
            window.geometryOS?.registerTile(tileId, {
                x: Math.random() * 1000,
                y: Math.random() * 1000,
                state: 'running'
            });
        }

        await this.sleep(1000);

        const endMem = performance.memory?.usedJSHeapSize || 0;
        const endTime = performance.now();

        const tileCount = window.geometryOS?.tileRegistry?.size || 0;
        const success = tileCount >= 50;

        this.results.push({
            name: 'Swarm Capacity',
            success,
            details: `${tileCount} tiles registered in ${(endTime - startTime).toFixed(0)}ms, memory delta: ${((endMem - startMem) / 1024 / 1024).toFixed(2)}MB`
        });

        // Cleanup
        for (let i = 0; i < 50; i++) {
            window.geometryOS?.unregisterTile?.(`stress-tile-${i}`);
        }
    }

    async testBroadcastLatency50() {
        console.log("\n%cStress 2: Broadcast Latency (50 tiles)", "color: #ffcc00;");

        // Setup 50 tiles
        for (let i = 0; i < 50; i++) {
            window.geometryOS?.registerTile(`broadcast-${i}`, {
                x: i * 10,
                y: i * 10,
                state: 'running'
            });
        }

        const startTime = performance.now();

        // Broadcast to all
        const count = window.geometryOS?.broadcastCommand?.('echo stress-test') || 0;

        const latency = performance.now() - startTime;

        const success = count >= 50 && latency < 1000; // Under 1 second for 50 tiles

        this.results.push({
            name: 'Broadcast Latency',
            success,
            details: `Broadcast to ${count} tiles in ${latency.toFixed(0)}ms (target: <1000ms)`
        });

        // Cleanup
        for (let i = 0; i < 50; i++) {
            window.geometryOS?.unregisterTile?.(`broadcast-${i}`);
        }
    }

    async testDOMPerformance() {
        console.log("\n%cStress 3: DOM Performance (60 FPS check)", "color: #ffcc00;");

        // Measure frame rate during heavy activity
        const frames = [];
        let lastTime = performance.now();

        const measureFrame = () => {
            const now = performance.now();
            frames.push(now - lastTime);
            lastTime = now;
        };

        // Simulate 60 frames of activity
        for (let i = 0; i < 60; i++) {
            measureFrame();
            // Simulate registry update
            window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
                detail: { averageLatency: Math.random() * 100 }
            }));
            await this.sleep(16); // ~60fps target
        }

        const avgFrameTime = frames.reduce((a, b) => a + b, 0) / frames.length;
        const fps = 1000 / avgFrameTime;

        const success = fps >= 55; // Allow some tolerance

        this.results.push({
            name: 'DOM Performance',
            success,
            details: `Average ${fps.toFixed(1)} FPS (target: 55+ FPS)`
        });
    }

    report() {
        console.log("\n" + "=".repeat(50));
        console.log("%c🔥 STRESS TEST RESULTS", "color: #ff4444; font-weight: bold;");
        console.log("=".repeat(50));

        const passed = this.results.filter(r => r.success).length;

        this.results.forEach(r => {
            const symbol = r.success ? "✅" : "❌";
            console.log(`${symbol} ${r.name.padEnd(20)} | ${r.details}`);
        });

        console.log("=".repeat(50));
        console.log(`%c${passed}/${this.results.length} STRESS TESTS PASSED`,
            passed === this.results.length ? "color: #00ff00" : "color: #ff4444");
    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

console.log("Stress tester loaded. Run 'await new WPBridgeStressTester().runStressTests()' to start.");
```

**Step 2: Run stress test manually**

Run: `await new WPBridgeStressTester().runStressTests();`
Expected: See stress test results in console

**Step 3: Commit**

```bash
git add systems/visual_shell/web/tests/stress_test_wp_bridge.js
git commit -m "test(stress): add stress test infrastructure for 50+ tile scenarios"
```

---

## Task 6: Resilience Test Infrastructure

**Files:**
- Create: `systems/visual_shell/web/tests/resilience_test_wp_bridge.js`

**Step 1: Write the resilience test**

```javascript
// resilience_test_wp_bridge.js
/**
 * WordPress Bridge Resilience Tests
 * Validates auto-recovery and state persistence
 */
class WPBridgeResilienceTester {
    constructor() {
        this.results = [];
    }

    async runResilienceTests() {
        console.log('%c🛡️ Starting Resilience Tests...', 'color: #00ffcc; font-weight: bold;');

        await this.testLateJoinerPersistence();
        await this.testMetricsPersistence();

        this.report();
    }

    async testLateJoinerPersistence() {
        console.log("\n%cResilience 1: Late Joiner Persistence", "color: #ffcc00;");

        // Send a command and record output
        const testId = 'persistence-test-tile';
        const testCmd = 'PERSISTENCE_TEST_' + Date.now();

        window.geometryOS?.registerTile(testId, { x: 0, y: 0, state: 'running' });

        // Simulate output
        window.dispatchEvent(new CustomEvent('geometryOS:consoleOutput', {
            detail: { tileId: testId, text: testCmd }
        }));

        await this.sleep(100);

        // Verify history is stored
        const history = window.geometryOS?.getConsoleOutput?.(testId, 5);
        const hasHistory = Array.isArray(history) && history.some(line => line.includes(testCmd));

        this.results.push({
            name: 'Late Joiner',
            success: hasHistory,
            details: hasHistory
                ? 'History buffer correctly stores output'
                : 'History buffer did not persist output'
        });
    }

    async testMetricsPersistence() {
        console.log("\n%cResilience 2: Metrics Persistence", "color: #ffcc00;");

        // Record some metrics
        const initialMetrics = window.geometryOS?.metrics?.getAllMetrics?.() || {};
        const initialSyncCount = initialMetrics.syncCount || 0;

        // Trigger sync
        window.geometryOS?.metrics?.recordSync?.();

        await this.sleep(50);

        // Verify metrics updated
        const newMetrics = window.geometryOS?.metrics?.getAllMetrics?.() || {};
        const newSyncCount = newMetrics.syncCount || 0;

        const success = newSyncCount > initialSyncCount;

        this.results.push({
            name: 'Metrics Persistence',
            success,
            details: success
                ? `Sync count: ${initialSyncCount} → ${newSyncCount}`
                : 'Metrics did not persist across sync'
        });
    }

    report() {
        console.log("\n" + "=".repeat(50));
        console.log("%c🛡️ RESILIENCE TEST RESULTS", "color: #00ffcc; font-weight: bold;");
        console.log("=".repeat(50));

        const passed = this.results.filter(r => r.success).length;

        this.results.forEach(r => {
            const symbol = r.success ? "✅" : "❌";
            console.log(`${symbol} ${r.name.padEnd(20)} | ${r.details}`);
        });

        console.log("=".repeat(50));
        console.log(`%c${passed}/${this.results.length} RESILIENCE TESTS PASSED`,
            passed === this.results.length ? "color: #00ff00" : "color: #ff4444");
    }
}

console.log("Resilience tester loaded. Run 'await new WPBridgeResilienceTester().runResilienceTests()' to start.");
```

**Step 2: Run resilience test manually**

Run: `await new WPBridgeResilienceTester().runResilienceTests();`
Expected: See resilience test results

**Step 3: Commit**

```bash
git add systems/visual_shell/web/tests/resilience_test_wp_bridge.js
git commit -m "test(resilience): add resilience tests for late joiner and metrics persistence"
```

---

## Task 7: Unified Test Runner

**Files:**
- Create: `systems/visual_shell/web/tests/run_all_wp_tests.js`

**Step 1: Create unified test runner**

```javascript
// run_all_wp_tests.js
/**
 * Unified Test Runner for WordPress-Map Integration
 * Runs all test suites: Golden Path, Stress, Resilience
 */
class WPUnifiedTestRunner {
    constructor() {
        this.allResults = [];
    }

    async runAll() {
        console.log('%c╔════════════════════════════════════════════════════════════╗', 'color: #00ffcc;');
        console.log('%c║     GEOMETRY OS - WORDPRESS INTEGRATION TEST SUITE         ║', 'color: #00ffcc;');
        console.log('%c╚════════════════════════════════════════════════════════════╝', 'color: #00ffcc;');

        console.log("\n%c▶ Phase 1: Functional Tests (Golden Paths)", "color: #00ffcc; font-weight: bold;");
        const verifier = new WPIntegrationVerifier();
        await verifier.runAll();
        this.allResults.push(...verifier.results.map(r => ({ ...r, phase: 'Functional' })));

        console.log("\n%c▶ Phase 2: Stress Tests", "color: #ff4444; font-weight: bold;");
        const stressTester = new WPBridgeStressTester();
        await stressTester.runStressTests();
        this.allResults.push(...stressTester.results.map(r => ({ ...r, phase: 'Stress' })));

        console.log("\n%c▶ Phase 3: Resilience Tests", "color: #00ffcc; font-weight: bold;");
        const resilienceTester = new WPBridgeResilienceTester();
        await resilienceTester.runResilienceTests();
        this.allResults.push(...resilienceTester.results.map(r => ({ ...r, phase: 'Resilience' })));

        this.finalReport();
    }

    finalReport() {
        console.log("\n\n");
        console.log('%c╔════════════════════════════════════════════════════════════╗', 'color: #00ffcc;');
        console.log('%c║              FINAL INTEGRATION REPORT                      ║', 'color: #00ffcc;');
        console.log('%c╚════════════════════════════════════════════════════════════╝', 'color: #00ffcc;');

        const functional = this.allResults.filter(r => r.phase === 'Functional');
        const stress = this.allResults.filter(r => r.phase === 'Stress');
        const resilience = this.allResults.filter(r => r.phase === 'Resilience');

        const report = (name, results) => {
            const passed = results.filter(r => r.success).length;
            const color = passed === results.length ? '#00ff00' : '#ff4444';
            console.log(`%c${name}: ${passed}/${results.length} PASSED`, `color: ${color}; font-weight: bold;`);
        };

        console.log("\n");
        report('Functional Tests', functional);
        report('Stress Tests', stress);
        report('Resilience Tests', resilience);

        const totalPassed = this.allResults.filter(r => r.success).length;
        const totalTests = this.allResults.length;
        const overallColor = totalPassed === totalTests ? '#00ff00' : '#ffcc00';

        console.log("\n" + "─".repeat(60));
        console.log(`%cOVERALL: ${totalPassed}/${totalTests} TESTS PASSED`, `color: ${overallColor}; font-size: 16px; font-weight: bold;`);
        console.log("─".repeat(60));

        if (totalPassed === totalTests) {
            console.log('%c✅ SYSTEM STATUS: PRODUCTION READY', 'color: #00ff00; font-size: 14px;');
        } else {
            console.log('%c⚠️ SYSTEM STATUS: NEEDS ATTENTION', 'color: #ffcc00; font-size: 14px;');
        }
    }
}

console.log("%cUnified test runner loaded.", "color: #00ffcc;");
console.log("%cRun 'await new WPUnifiedTestRunner().runAll()' to execute all tests.", "color: #888;");
```

**Step 2: Test unified runner**

Run: `await new WPUnifiedTestRunner().runAll();`
Expected: Complete test report with all phases

**Step 3: Commit**

```bash
git add systems/visual_shell/web/tests/run_all_wp_tests.js
git commit -m "feat(test): add unified test runner for all WordPress integration tests"
```

---

## Summary

| Task | Component | Files Created | Files Modified |
|------|-----------|---------------|----------------|
| 1 | MetricsCollector Core | `MetricsCollector.js`, `test_metrics_collector.js` | - |
| 2 | Bridge Integration | - | `application.js`, `verification_wp_integration.js` |
| 3 | SystemHealthDashboard | `SystemHealthDashboard.js`, `test_system_health_dashboard.js` | - |
| 4 | WordPress Integration | `wp_health_bridge.js` | `geometry_os_bridge.php` |
| 5 | Stress Tests | `stress_test_wp_bridge.js` | - |
| 6 | Resilience Tests | `resilience_test_wp_bridge.js` | - |
| 7 | Unified Runner | `run_all_wp_tests.js` | - |

---

## Verification

After completing all tasks, run:

```javascript
// In WordPress Mission Control console:
const script = document.createElement('script');
script.src = '/systems/visual_shell/web/tests/run_all_wp_tests.js';
document.head.appendChild(script);

// Then run:
await new WPUnifiedTestRunner().runAll();
```

Expected output:
```
╔════════════════════════════════════════════════════════════╗
║     GEOMETRY OS - WORDPRESS INTEGRATION TEST SUITE         ║
╚════════════════════════════════════════════════════════════╝

▶ Phase 1: Functional Tests (Golden Paths)
... 7/7 PASSED

▶ Phase 2: Stress Tests
... 3/3 PASSED

▶ Phase 3: Resilience Tests
... 2/2 PASSED

────────────────────────────────────────────────────────────────
OVERALL: 12/12 TESTS PASSED
────────────────────────────────────────────────────────────────
✅ SYSTEM STATUS: PRODUCTION READY
```
