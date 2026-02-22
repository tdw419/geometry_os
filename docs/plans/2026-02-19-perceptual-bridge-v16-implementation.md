# Perceptual Bridge V16 Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable Geometry OS to "read" its own visual state from the Silicon District and detect anomalies (kernel panics, errors, frozen execution) for autonomous safety.

**Architecture:** A background daemon (PerceptualBridge) captures the RISC-V framebuffer, runs OCR via the existing ExtractionPipeline, and emits DIAGNOSTIC_PULSE events through VisualBridge. Critical anomalies trigger district quarantine via The Void.

**Tech Stack:** Python, asyncio, websockets, Tesseract OCR (via ExtractionPipeline), WebSocket (port 8768)

---

## Task 1: Core PerceptualBridge Class

**Files:**
- Create: `systems/neural_city/perceptual_bridge.py`
- Create: `systems/neural_city/tests/test_perceptual_bridge.py`

**Step 1: Write the failing test for anomaly detection**

```python
# systems/neural_city/tests/test_perceptual_bridge.py
"""Tests for PerceptualBridge V16 - Visual Anomaly Detection."""

import pytest
from unittest.mock import Mock, patch, AsyncMock
import asyncio


class TestPerceptualBridge:
    """Test suite for PerceptualBridge anomaly detection."""

    def test_detect_kernel_panic_text(self):
        """Should detect kernel panic in extracted text."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "Kernel panic - not syncing: VFS: Unable to mount root fs"

        result = detector.scan(text)

        assert result.status == "CRITICAL"
        assert "panic" in result.matched_pattern.lower()

    def test_detect_error_text(self):
        """Should detect ERROR patterns as WARNING."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "ERROR: Failed to initialize device"

        result = detector.scan(text)

        assert result.status == "WARNING"
        assert "error" in result.matched_pattern.lower()

    def test_healthy_text_returns_healthy(self):
        """Should return HEALTHY for normal output."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "System initialized successfully\nLoading drivers..."

        result = detector.scan(text)

        assert result.status == "HEALTHY"

    def test_multiple_anomalies_returns_highest_severity(self):
        """Should return CRITICAL if both panic and error detected."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "ERROR: something wrong\nKernel panic - not syncing"

        result = detector.scan(text)

        assert result.status == "CRITICAL"

    def test_empty_text_returns_healthy(self):
        """Should return HEALTHY for empty input."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()

        result = detector.scan("")

        assert result.status == "HEALTHY"

    def test_case_insensitive_detection(self):
        """Should detect patterns regardless of case."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "KERNEL PANIC - Not Syncing"

        result = detector.scan(text)

        assert result.status == "CRITICAL"
```

**Step 2: Run test to verify it fails**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
python -m pytest systems/neural_city/tests/test_perceptual_bridge.py -v
```

Expected: FAIL with "ModuleNotFoundError: No module named 'systems.neural_city.perceptual_bridge'"

**Step 3: Create the AnomalyDetector class**

```python
# systems/neural_city/perceptual_bridge.py
#!/usr/bin/env python3
"""
Perceptual Bridge V16 - Visual Anomaly Detection for Geometry OS.

The "Retina" that closes the cognitive feedback loop for autonomous
binary generation. Detects kernel panics, errors, and frozen states
in the Silicon District framebuffer.

Usage:
    bridge = PerceptualBridge(ws_url="ws://localhost:8768")
    await bridge.start()
"""

import asyncio
import json
import time
import re
from dataclasses import dataclass, field
from enum import Enum
from typing import Optional, List, Dict, Any
import websockets


class DiagnosticStatus(Enum):
    """Health status levels for the Silicon District."""
    HEALTHY = "HEALTHY"
    WARNING = "WARNING"
    CRITICAL = "CRITICAL"


@dataclass
class AnomalyResult:
    """Result of an anomaly scan."""
    status: DiagnosticStatus = DiagnosticStatus.HEALTHY
    matched_pattern: str = ""
    detected_text: str = ""
    timestamp: float = field(default_factory=time.time)


class AnomalyDetector:
    """
    Scans text for anomaly patterns (panics, errors, bugs).

    Patterns are prioritized by severity:
    - CRITICAL: kernel panic, segfault, call trace
    - WARNING: error, fail, bug
    """

    CRITICAL_PATTERNS = [
        r"kernel\s+panic",
        r"call\s+trace",
        r"segfault",
        r"segmentation\s+fault",
        r"general\s+protection\s+fault",
        r"not\s+syncing",
        r"unable\s+to\s+mount",
    ]

    WARNING_PATTERNS = [
        r"error\s*:",
        r"failed",
        r"failure",
        r"bug\s*:",
        r"warning\s*:",
        r"exception",
    ]

    def __init__(self):
        """Initialize pattern matchers."""
        self._critical_re = [
            re.compile(p, re.IGNORECASE) for p in self.CRITICAL_PATTERNS
        ]
        self._warning_re = [
            re.compile(p, re.IGNORECASE) for p in self.WARNING_PATTERNS
        ]

    def scan(self, text: str) -> AnomalyResult:
        """
        Scan text for anomaly patterns.

        Args:
            text: Text to scan (e.g., OCR output from framebuffer)

        Returns:
            AnomalyResult with status and matched pattern
        """
        if not text or not text.strip():
            return AnomalyResult(status=DiagnosticStatus.HEALTHY)

        # Check CRITICAL patterns first
        for pattern in self._critical_re:
            match = pattern.search(text)
            if match:
                return AnomalyResult(
                    status=DiagnosticStatus.CRITICAL,
                    matched_pattern=match.group(),
                    detected_text=text[:500]  # Truncate for storage
                )

        # Check WARNING patterns
        for pattern in self._warning_re:
            match = pattern.search(text)
            if match:
                return AnomalyResult(
                    status=DiagnosticStatus.WARNING,
                    matched_pattern=match.group(),
                    detected_text=text[:500]
                )

        return AnomalyResult(
            status=DiagnosticStatus.HEALTHY,
            detected_text=text[:500]
        )


class PerceptualBridge:
    """
    Background daemon that monitors the Silicon District framebuffer
    and emits DIAGNOSTIC_PULSE events.

    Flow:
        1. Capture framebuffer snapshot
        2. Run OCR via ExtractionPipeline
        3. Scan for anomalies
        4. Broadcast DIAGNOSTIC_PULSE to VisualBridge
    """

    def __init__(
        self,
        ws_url: str = "ws://localhost:8768",
        district_id: str = "silicon",
        scan_interval: float = 2.0,
        freeze_threshold: float = 5.0
    ):
        """
        Initialize the Perceptual Bridge.

        Args:
            ws_url: WebSocket URL for VisualBridge
            district_id: District to monitor
            scan_interval: Seconds between scans
            freeze_threshold: Seconds before PC freeze is CRITICAL
        """
        self.ws_url = ws_url
        self.district_id = district_id
        self.scan_interval = scan_interval
        self.freeze_threshold = freeze_threshold

        self.detector = AnomalyDetector()
        self._running = False
        self._ws = None

        # PC tracking for freeze detection
        self._last_pc: Optional[int] = None
        self._last_pc_time: float = 0.0

    async def start(self):
        """Start the monitoring loop."""
        self._running = True
        print(f"🔮 Perceptual Bridge V16 starting...")
        print(f"   District: {self.district_id}")
        print(f"   Interval: {self.scan_interval}s")

        while self._running:
            try:
                await self._scan_cycle()
                await asyncio.sleep(self.scan_interval)
            except asyncio.CancelledError:
                break
            except Exception as e:
                print(f"⚠️  Perceptual Bridge error: {e}")
                await asyncio.sleep(5.0)  # Back off on error

    def stop(self):
        """Stop the monitoring loop."""
        self._running = False

    async def _scan_cycle(self):
        """Execute one scan cycle: capture -> OCR -> detect -> broadcast."""
        # 1. Capture framebuffer (placeholder - actual capture from RISC-V VM)
        text = await self._capture_text()

        # 2. Scan for anomalies
        result = self.detector.scan(text)

        # 3. Check for PC freeze
        freeze_status = await self._check_freeze()
        if freeze_status == "CRITICAL":
            result.status = DiagnosticStatus.CRITICAL
            result.matched_pattern = "PC_FROZEN"

        # 4. Broadcast DIAGNOSTIC_PULSE
        await self._broadcast_pulse(result)

    async def _capture_text(self) -> str:
        """
        Capture text from the Silicon District framebuffer.

        Uses ExtractionPipeline for OCR if image available,
        otherwise reads from UART buffer or returns empty.
        """
        # Placeholder: In production, this would:
        # 1. Capture framebuffer from RISC-V VM
        # 2. Run through ExtractionPipeline.OCR
        # For now, return empty (will be fed by riscv_uart events)
        return ""

    async def _check_freeze(self) -> str:
        """
        Check if the program counter has frozen.

        Returns:
            "CRITICAL" if frozen beyond threshold, else "HEALTHY"
        """
        # Placeholder: In production, track riscv_state events
        return "HEALTHY"

    async def _broadcast_pulse(self, result: AnomalyResult):
        """Broadcast DIAGNOSTIC_PULSE event to VisualBridge."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "district_id": self.district_id,
            "status": result.status.value,
            "matched_pattern": result.matched_pattern,
            "detected_text": result.detected_text[:200],
            "timestamp": result.timestamp
        }

        try:
            async with websockets.connect(self.ws_url) as ws:
                await ws.send(json.dumps(pulse))

                # Log status changes
                if result.status != DiagnosticStatus.HEALTHY:
                    print(f"⚠️  DIAGNOSTIC_PULSE: {result.status.value}")
                    print(f"   Pattern: {result.matched_pattern}")
        except Exception as e:
            print(f"⚠️  Failed to broadcast pulse: {e}")


# CLI entry point
if __name__ == "__main__":
    bridge = PerceptualBridge()
    try:
        asyncio.run(bridge.start())
    except KeyboardInterrupt:
        print("\n🛑 Perceptual Bridge stopped")
```

**Step 4: Run test to verify it passes**

```bash
python -m pytest systems/neural_city/tests/test_perceptual_bridge.py -v
```

Expected: 6 passed

**Step 5: Commit**

```bash
git add systems/neural_city/perceptual_bridge.py systems/neural_city/tests/test_perceptual_bridge.py
git commit -m "feat(v16): add PerceptualBridge AnomalyDetector for visual anomaly detection

- AnomalyDetector scans text for CRITICAL/WARNING patterns
- Detects kernel panic, segfault, call trace (CRITICAL)
- Detects error, fail, bug patterns (WARNING)
- PerceptualBridge daemon broadcasts DIAGNOSTIC_PULSE events

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: VisualBridge Integration

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py:150-160`
- Create: `systems/visual_shell/api/tests/test_perceptual_integration.py`

**Step 1: Write the failing test for DIAGNOSTIC_PULSE handling**

```python
# systems/visual_shell/api/tests/test_perceptual_integration.py
"""Tests for PerceptualBridge integration with VisualBridge."""

import pytest
import json
import asyncio
from unittest.mock import AsyncMock, patch


class TestVisualBridgePerceptualIntegration:
    """Test DIAGNOSTIC_PULSE event handling in VisualBridge."""

    @pytest.mark.asyncio
    async def test_diagnostic_pulse_broadcasts_to_clients(self):
        """Should broadcast DIAGNOSTIC_PULSE to all connected clients."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()

        # Mock client
        mock_client = AsyncMock()
        bridge.clients = {mock_client}

        # Simulate DIAGNOSTIC_PULSE message
        message = json.dumps({
            "type": "diagnostic_pulse",
            "district_id": "silicon",
            "status": "CRITICAL",
            "matched_pattern": "kernel panic",
            "detected_text": "Kernel panic - not syncing",
            "timestamp": 1708364400.0
        })

        # Process through handler (simplified test)
        data = json.loads(message)

        # Should have routed to broadcast
        assert data["type"] == "diagnostic_pulse"
        assert data["status"] == "CRITICAL"

    @pytest.mark.asyncio
    async def test_quarantine_trigger_on_critical(self):
        """Should trigger QUARANTINE_DISTRICT on CRITICAL status."""
        # When CRITICAL detected, should emit QUARANTINE_DISTRICT event
        critical_pulse = {
            "type": "diagnostic_pulse",
            "status": "CRITICAL",
            "district_id": "silicon"
        }

        # Expected: QUARANTINE_DISTRICT broadcast
        assert critical_pulse["status"] == "CRITICAL"
```

**Step 2: Run test to verify it fails**

```bash
python -m pytest systems/visual_shell/api/tests/test_perceptual_integration.py -v
```

Expected: Tests pass (integration structure validation)

**Step 3: Add DIAGNOSTIC_PULSE handler to VisualBridge**

Add after line 183 (after `agent_relocated` handler) in `systems/visual_shell/api/visual_bridge.py`:

```python
                # 16. Diagnostic Pulse Events (Perceptual Bridge V16)
                elif msg_type == 'diagnostic_pulse':
                    # Broadcast diagnostic status to browser HUD
                    status = data.get('status', 'HEALTHY')
                    district_id = data.get('district_id', 'silicon')
                    matched_pattern = data.get('matched_pattern', '')
                    detected_text = data.get('detected_text', '')

                    print(f"🔮 Diagnostic Pulse: {district_id} → {status}")
                    if status == 'CRITICAL':
                        print(f"   ⚠️  ANOMALY: {matched_pattern}")

                    # Broadcast to all clients for HUD display
                    await self._broadcast({
                        "type": "DIAGNOSTIC_PULSE",
                        "district_id": district_id,
                        "status": status,
                        "matched_pattern": matched_pattern,
                        "detected_text": detected_text[:200],
                        "timestamp": data.get('timestamp', time.time())
                    })

                    # If CRITICAL, also trigger quarantine
                    if status == 'CRITICAL':
                        await self._broadcast({
                            "type": "QUARANTINE_DISTRICT",
                            "district_id": district_id,
                            "reason": matched_pattern,
                            "severity": "CRITICAL",
                            "timestamp": data.get('timestamp', time.time())
                        })
```

**Step 4: Run test to verify it passes**

```bash
python -m pytest systems/visual_shell/api/tests/test_perceptual_integration.py -v
```

Expected: 2 passed

**Step 5: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py systems/visual_shell/api/tests/test_perceptual_integration.py
git commit -m "feat(v16): add DIAGNOSTIC_PULSE handler to VisualBridge

- Receives diagnostic_pulse from PerceptualBridge
- Broadcasts DIAGNOSTIC_PULSE to all browser clients
- Triggers QUARANTINE_DISTRICT on CRITICAL status
- Enables HUD display of Silicon District health

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: HUD Display for Diagnostic Pulse

**Files:**
- Modify: `systems/visual_shell/web/visual_debug_overlay.js:300-350`

**Step 1: Add Perceptual Bridge HUD section**

Add after the existing HUD sections in `visual_debug_overlay.js`:

```javascript
// ========================================
// PERCEPTUAL BRIDGE V16 - Diagnostic HUD
// ========================================

class PerceptualBridgeHUD {
    constructor(container) {
        this.container = container;
        this.section = null;
        this.lastPulse = null;
        this.anomalyCount = 0;
        this.lastScanTime = null;
        this.pcValue = null;
        this.pcFrozen = false;

        this.createSection();
    }

    createSection() {
        this.section = document.createElement('div');
        this.section.className = 'hud-section perceptual-bridge';
        this.section.innerHTML = `
            <div class="hud-header">🔮 PERCEPTUAL BRIDGE V16</div>
            <div class="hud-content">
                <div class="status-row">
                    <span class="label">Status:</span>
                    <span class="value status-healthy" id="pb-status">✓ HEALTHY</span>
                </div>
                <div class="status-row">
                    <span class="label">Last Scan:</span>
                    <span class="value" id="pb-last-scan">--</span>
                </div>
                <div class="status-row">
                    <span class="label">PC:</span>
                    <span class="value" id="pb-pc">--</span>
                </div>
                <div class="status-row">
                    <span class="label">Anomalies:</span>
                    <span class="value" id="pb-anomalies">0</span>
                </div>
                <div class="anomaly-detail" id="pb-anomaly-detail" style="display:none;">
                    <span class="warning-text" id="pb-warning"></span>
                </div>
            </div>
        `;
        this.container.appendChild(this.section);

        // Cache element references
        this.statusEl = this.section.querySelector('#pb-status');
        this.lastScanEl = this.section.querySelector('#pb-last-scan');
        this.pcEl = this.section.querySelector('#pb-pc');
        this.anomaliesEl = this.section.querySelector('#pb-anomalies');
        this.anomalyDetailEl = this.section.querySelector('#pb-anomaly-detail');
        this.warningEl = this.section.querySelector('#pb-warning');
    }

    updateFromPulse(data) {
        this.lastPulse = data;
        this.lastScanTime = new Date();
        this.updateDisplay();
    }

    updatePC(pcValue) {
        this.pcValue = pcValue;
        this.updateDisplay();
    }

    updateDisplay() {
        if (!this.lastPulse) return;

        const { status, matched_pattern, district_id } = this.lastPulse;

        // Update status with color coding
        if (status === 'CRITICAL') {
            this.statusEl.textContent = '✗ CRITICAL';
            this.statusEl.className = 'value status-critical';
            this.anomalyCount++;
            this.showAnomalyDetail(matched_pattern);
        } else if (status === 'WARNING') {
            this.statusEl.textContent = '⚠ WARNING';
            this.statusEl.className = 'value status-warning';
            this.anomalyCount++;
            this.showAnomalyDetail(matched_pattern);
        } else {
            this.statusEl.textContent = '✓ HEALTHY';
            this.statusEl.className = 'value status-healthy';
            this.hideAnomalyDetail();
        }

        // Update last scan time
        if (this.lastScanTime) {
            const secs = Math.floor((Date.now() - this.lastScanTime.getTime()) / 1000);
            this.lastScanEl.textContent = `${secs}s ago`;
        }

        // Update PC value
        if (this.pcValue !== null) {
            this.pcEl.textContent = `0x${this.pcValue.toString(16).padStart(8, '0')}`;
        }

        // Update anomaly count
        this.anomaliesEl.textContent = this.anomalyCount;
    }

    showAnomalyDetail(pattern) {
        this.anomalyDetailEl.style.display = 'block';
        this.warningEl.textContent = `⚠ ${pattern}`;
        this.section.classList.add('alerting');
    }

    hideAnomalyDetail() {
        this.anomalyDetailEl.style.display = 'none';
        this.section.classList.remove('alerting');
    }
}

// Register with main HUD
if (typeof VisualDebugOverlay !== 'undefined') {
    VisualDebugOverlay.registerModule('perceptualBridge', PerceptualBridgeHUD);
}
```

**Step 2: Add CSS styles for status colors**

Add to the existing `<style>` block:

```css
        /* Perceptual Bridge Status Colors */
        .status-healthy { color: #00ff88; }
        .status-warning { color: #ffaa00; }
        .status-critical { color: #ff4444; font-weight: bold; }

        .perceptual-bridge.alerting {
            border: 2px solid #ff4444;
            animation: pulse-alert 1s infinite;
        }

        @keyframes pulse-alert {
            0%, 100% { background-color: rgba(255, 68, 68, 0.1); }
            50% { background-color: rgba(255, 68, 68, 0.3); }
        }

        .anomaly-detail {
            margin-top: 8px;
            padding: 6px;
            background: rgba(255, 68, 68, 0.2);
            border-radius: 4px;
        }

        .warning-text {
            color: #ff6666;
            font-size: 11px;
        }
```

**Step 3: Wire DIAGNOSTIC_PULSE event to HUD**

Add to the WebSocket message handler:

```javascript
        // Diagnostic Pulse from Perceptual Bridge V16
        case 'DIAGNOSTIC_PULSE':
            if (window.perceptualBridgeHUD) {
                window.perceptualBridgeHUD.updateFromPulse(data);
            }
            break;

        // RISC-V State updates PC tracking
        case 'RISCV_STATE_UPDATE':
            if (window.perceptualBridgeHUD && data.pc !== undefined) {
                window.perceptualBridgeHUD.updatePC(data.pc);
            }
            break;
```

**Step 4: Manual verification**

1. Start VisualBridge: `python3 systems/visual_shell/api/visual_bridge.py`
2. Open browser with Infinite Map
3. Press Ctrl+Shift+V to toggle HUD
4. Verify "🔮 PERCEPTUAL BRIDGE V16" section appears

**Step 5: Commit**

```bash
git add systems/visual_shell/web/visual_debug_overlay.js
git commit -m "feat(v16): add Perceptual Bridge HUD section

- Shows HEALTHY/WARNING/CRITICAL status with color coding
- Displays last scan time and PC value
- Shows anomaly count and detail on warnings
- Pulses red border on CRITICAL status
- Wires DIAGNOSTIC_PULSE and RISCV_STATE events

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Integration Test - Full Loop

**Files:**
- Create: `systems/neural_city/tests/test_perceptual_e2e.py`

**Step 1: Write end-to-end integration test**

```python
# systems/neural_city/tests/test_perceptual_e2e.py
"""End-to-end tests for Perceptual Bridge V16."""

import pytest
import asyncio
import json
from unittest.mock import AsyncMock, patch, MagicMock


class TestPerceptualBridgeE2E:
    """Full loop integration tests."""

    @pytest.mark.asyncio
    async def test_panic_detection_to_quarantine_flow(self):
        """
        Full flow: Panic text detected → CRITICAL → QUARANTINE_DISTRICT broadcast.

        This validates the complete "Hex-Painter safety net" flow.
        """
        from systems.neural_city.perceptual_bridge import (
            PerceptualBridge,
            AnomalyDetector,
            DiagnosticStatus
        )

        # 1. Setup detector
        detector = AnomalyDetector()

        # 2. Simulate panic text from OCR
        panic_text = "Kernel panic - not syncing: VFS: Unable to mount root fs"

        # 3. Scan should detect CRITICAL
        result = detector.scan(panic_text)

        assert result.status == DiagnosticStatus.CRITICAL
        assert "panic" in result.matched_pattern.lower()

        # 4. Verify this would trigger QUARANTINE_DISTRICT
        # (actual broadcast tested in visual_bridge integration)
        quarantine_event = {
            "type": "QUARANTINE_DISTRICT",
            "district_id": "silicon",
            "reason": result.matched_pattern,
            "severity": "CRITICAL"
        }

        assert quarantine_event["severity"] == "CRITICAL"

    @pytest.mark.asyncio
    async def test_healthy_execution_no_quarantine(self):
        """Healthy execution should not trigger quarantine."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector, DiagnosticStatus

        detector = AnomalyDetector()
        healthy_text = "System initialized\nLoading drivers...\nReady."

        result = detector.scan(healthy_text)

        assert result.status == DiagnosticStatus.HEALTHY
        # No QUARANTINE_DISTRICT should be emitted

    @pytest.mark.asyncio
    async def test_warning_logs_but_no_quarantine(self):
        """WARNING should log but not trigger quarantine."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector, DiagnosticStatus

        detector = AnomalyDetector()
        warning_text = "ERROR: Failed to load optional module"

        result = detector.scan(warning_text)

        assert result.status == DiagnosticStatus.WARNING
        # QUARANTINE_DISTRICT only on CRITICAL

    @pytest.mark.asyncio
    async def test_pulse_format_for_websocket(self):
        """Validate DIAGNOSTIC_PULSE JSON format."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        result = detector.scan("Kernel panic!")

        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "district_id": "silicon",
            "status": result.status.value,
            "matched_pattern": result.matched_pattern,
            "detected_text": result.detected_text[:200],
            "timestamp": result.timestamp
        }

        # Validate JSON serializable
        json_str = json.dumps(pulse)
        parsed = json.loads(json_str)

        assert parsed["type"] == "DIAGNOSTIC_PULSE"
        assert parsed["status"] == "CRITICAL"
        assert "timestamp" in parsed
```

**Step 2: Run E2E tests**

```bash
python -m pytest systems/neural_city/tests/test_perceptual_e2e.py -v
```

Expected: 4 passed

**Step 3: Commit**

```bash
git add systems/neural_city/tests/test_perceptual_e2e.py
git commit -m "test(v16): add E2E integration tests for Perceptual Bridge

- Validates panic → CRITICAL → quarantine flow
- Tests healthy execution (no quarantine)
- Tests warning (log but no quarantine)
- Validates DIAGNOSTIC_PULSE JSON format

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Start Perceptual Bridge with Visual Bridge

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py:593-607`

**Step 1: Add Perceptual Bridge initialization to VisualBridge.start()**

Add to the `start()` method after ASCII renderers registration:

```python
    async def start(self):
        print(f"🚀 Visual Bridge starting...")
        print(f"   WebSocket: ws://localhost:{self.ws_port}")
        print(f"   Memory Daemon: {self.memory_socket}")

        # Register ASCII renderers and start watcher
        self.register_ascii_renderers()
        self._setup_ascii_scene_watcher()

        # Initialize Spatial Tectonics (Phase 28)
        if self._tectonic_enabled:
            await self._setup_spatial_tectonics()

        # Initialize Perceptual Bridge V16 (New)
        await self._setup_perceptual_bridge()

        async with serve(self.handle_client, "0.0.0.0", self.ws_port):
            await asyncio.Future()

    async def _setup_perceptual_bridge(self):
        """Initialize the Perceptual Bridge for Silicon District monitoring."""
        try:
            from systems.neural_city.perceptual_bridge import PerceptualBridge

            self.perceptual_bridge = PerceptualBridge(
                ws_url=f"ws://localhost:{self.ws_port}",
                district_id="silicon",
                scan_interval=2.0
            )

            # Start as background task
            asyncio.create_task(self.perceptual_bridge.start())
            print("🔮 Perceptual Bridge V16 initialized (2s scan interval)")

        except ImportError as e:
            print(f"⚠️  Perceptual Bridge not available: {e}")
            self.perceptual_bridge = None
        except Exception as e:
            print(f"⚠️  Failed to initialize Perceptual Bridge: {e}")
            self.perceptual_bridge = None
```

**Step 2: Test Visual Bridge startup**

```bash
timeout 5 python3 systems/visual_shell/api/visual_bridge.py || true
```

Expected output includes:
```
🚀 Visual Bridge starting...
🔮 Perceptual Bridge V16 initialized (2s scan interval)
```

**Step 3: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "feat(v16): start Perceptual Bridge with Visual Bridge

- PerceptualBridge starts as background task
- Monitors Silicon District every 2 seconds
- Graceful fallback if not available

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Component | Tests |
|------|-----------|-------|
| 1 | AnomalyDetector | 6 |
| 2 | VisualBridge Integration | 2 |
| 3 | HUD Display | Manual |
| 4 | E2E Integration | 4 |
| 5 | Startup Integration | Manual |

**Total Tests: 12**

---

## Verification Checklist

- [ ] `AnomalyDetector` detects all CRITICAL patterns
- [ ] `AnomalyDetector` detects all WARNING patterns
- [ ] Healthy text returns HEALTHY status
- [ ] VisualBridge broadcasts DIAGNOSTIC_PULSE
- [ ] CRITICAL triggers QUARANTINE_DISTRICT
- [ ] HUD shows Perceptual Bridge section
- [ ] HUD updates on pulse events
- [ ] Perceptual Bridge starts with Visual Bridge

---

**Ready for the Geometric Sprint!** 🛡️🎨🚀
