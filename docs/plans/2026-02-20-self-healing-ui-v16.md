# Self-Healing UI (V16 Reaction Loop) Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a HealerAgent that consumes DIAGNOSTIC_PULSE events from the Perceptual Bridge V16 and autonomously responds to CRITICAL anomalies (kernel panics, segfaults) within 1 second.

**Architecture:** HealerAgent subscribes to Visual Bridge (port 8768), filters for DIAGNOSTIC_PULSE events with CRITICAL status, captures system state, analyzes the anomaly, and either proposes a fix or triggers a substrate reboot. All healing actions are logged to WordPress for audit trail.

**Tech Stack:** Python, asyncio, websockets, regex, WordPress API

---

## Prerequisites

- Perceptual Bridge V16 exists at `systems/neural_city/perceptual_bridge.py`
- Visual Bridge runs on port 8768 at `systems/visual_shell/api/visual_bridge.py`
- DIAGNOSTIC_PULSE events are already being broadcast

---

### Task 1: Create HealerAgent Test File

**Files:**
- Create: `tests/system/test_healer_agent.py`

**Step 1: Write the failing test for HealerAgent initialization**

```python
"""
Tests for HealerAgent - V16 Reaction Loop Consumer.
"""

import pytest
import asyncio
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestHealerAgentInit:
    """Test HealerAgent initialization."""

    def test_healer_agent_imports(self):
        """Test that HealerAgent can be imported."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        assert HealerAgent is not None

    def test_healer_agent_has_ws_url(self):
        """Test that HealerAgent has WebSocket URL configured."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent

        agent = HealerAgent()
        assert hasattr(agent, 'ws_url')
        assert agent.ws_url == "ws://localhost:8768"

    def test_healer_agent_has_reaction_threshold(self):
        """Test that HealerAgent has reaction time threshold."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent

        agent = HealerAgent()
        assert hasattr(agent, 'reaction_threshold')
        assert agent.reaction_threshold <= 1.0  # Must react within 1s
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_healer_agent.py -v`
Expected: FAIL with "No module named 'systems.visual_shell.swarm.healer_agent'"

**Step 3: Commit the test file**

```bash
git add tests/system/test_healer_agent.py
git commit -m "test(healer): add failing tests for HealerAgent initialization"
```

---

### Task 2: Implement HealerAgent Core

**Files:**
- Create: `systems/visual_shell/swarm/healer_agent.py`
- Modify: `tests/system/test_healer_agent.py` (add more tests)

**Step 1: Write the failing test for event handling**

Add to `tests/system/test_healer_agent.py`:

```python


class TestHealerAgentEventHandling:
    """Test HealerAgent DIAGNOSTIC_PULSE handling."""

    @pytest.fixture
    def agent(self):
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        return HealerAgent()

    def test_handles_diagnostic_pulse_type(self, agent):
        """Test that DIAGNOSTIC_PULSE is a recognized event type."""
        assert hasattr(agent, '_handle_diagnostic_pulse')

    @pytest.mark.asyncio
    async def test_ignores_healthy_pulses(self, agent):
        """Test that HEALTHY pulses are ignored."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "HEALTHY",
            "district_id": "silicon",
            "matched_pattern": "",
            "detected_text": ""
        }

        result = await agent._handle_diagnostic_pulse(pulse)
        assert result is None  # No action taken

    @pytest.mark.asyncio
    async def test_reacts_to_critical_pulses(self, agent):
        """Test that CRITICAL pulses trigger healing."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "CRITICAL",
            "district_id": "silicon",
            "matched_pattern": "kernel panic",
            "detected_text": "Kernel panic - not syncing: VFS",
            "timestamp": 1708400000.0
        }

        result = await agent._handle_diagnostic_pulse(pulse)
        assert result is not None
        assert result["action"] in ["reboot", "quarantine", "analyze"]
        assert result["district_id"] == "silicon"

    @pytest.mark.asyncio
    async def test_reaction_time_under_threshold(self, agent):
        """Test that reaction time is under threshold."""
        import time

        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "CRITICAL",
            "district_id": "silicon",
            "matched_pattern": "segfault",
            "detected_text": "Segmentation fault",
            "timestamp": time.time()
        }

        start = time.time()
        result = await agent._handle_diagnostic_pulse(pulse)
        elapsed = time.time() - start

        assert elapsed < agent.reaction_threshold
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_healer_agent.py::TestHealerAgentEventHandling -v`
Expected: FAIL with "AttributeError: 'HealerAgent' object has no attribute '_handle_diagnostic_pulse'"

**Step 3: Implement HealerAgent**

Create `systems/visual_shell/swarm/healer_agent.py`:

```python
"""
HealerAgent - V16 Reaction Loop Consumer.

Consumes DIAGNOSTIC_PULSE events from the Perceptual Bridge and
autonomously responds to CRITICAL anomalies within 1 second.

Reaction Actions:
  - analyze: Capture state, log to WordPress, no immediate action
  - quarantine: Isolate the district, prevent cascade failure
  - reboot: Trigger substrate restart (last resort)
"""

import asyncio
import json
import time
import logging
from typing import Dict, Any, Optional, List
from dataclasses import dataclass, field
from enum import Enum

logger = logging.getLogger(__name__)


class HealingAction(Enum):
    """Actions the HealerAgent can take."""
    ANALYZE = "analyze"
    QUARANTINE = "quarantine"
    REBOOT = "reboot"


@dataclass
class HealingResult:
    """Result of a healing action."""
    action: HealingAction
    district_id: str
    reason: str
    timestamp: float = field(default_factory=time.time)
    success: bool = True
    details: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "action": self.action.value,
            "district_id": self.district_id,
            "reason": self.reason,
            "timestamp": self.timestamp,
            "success": self.success,
            "details": self.details
        }


class HealerAgent:
    """
    Autonomous agent that consumes DIAGNOSTIC_PULSE events and
    reacts to CRITICAL anomalies.

    Target: React within 1 second of CRITICAL pulse detection.

    Flow:
        1. Subscribe to Visual Bridge (port 8768)
        2. Filter for DIAGNOSTIC_PULSE events
        3. On CRITICAL: capture state, decide action, execute
        4. Log healing action to WordPress for audit
    """

    def __init__(
        self,
        ws_url: str = "ws://localhost:8768",
        reaction_threshold: float = 1.0,
        auto_reboot: bool = False  # Safety: require manual approval for reboot
    ):
        """
        Initialize HealerAgent.

        Args:
            ws_url: WebSocket URL for Visual Bridge
            reaction_threshold: Max seconds to react (default 1.0)
            auto_reboot: Allow automatic reboots (default False for safety)
        """
        self.ws_url = ws_url
        self.reaction_threshold = reaction_threshold
        self.auto_reboot = auto_reboot

        self._running = False
        self._healing_history: List[HealingResult] = []

        logger.info(f"HealerAgent initialized: threshold={reaction_threshold}s, auto_reboot={auto_reboot}")

    async def _handle_diagnostic_pulse(self, pulse: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """
        Handle a DIAGNOSTIC_PULSE event.

        Args:
            pulse: The diagnostic pulse event

        Returns:
            Healing result dict if action taken, None otherwise
        """
        status = pulse.get("status", "HEALTHY")

        # Only react to non-healthy pulses
        if status == "HEALTHY":
            return None

        district_id = pulse.get("district_id", "unknown")
        matched_pattern = pulse.get("matched_pattern", "")
        detected_text = pulse.get("detected_text", "")

        logger.info(f"HealerAgent received: {status} from {district_id}")
        logger.info(f"  Pattern: {matched_pattern}")

        # Decide action based on severity and pattern
        if status == "CRITICAL":
            result = await self._handle_critical(district_id, matched_pattern, detected_text)
        elif status == "WARNING":
            result = await self._handle_warning(district_id, matched_pattern, detected_text)
        else:
            result = None

        # Log to history
        if result:
            self._healing_history.append(result)

        return result.to_dict() if result else None

    async def _handle_critical(
        self,
        district_id: str,
        pattern: str,
        detected_text: str
    ) -> HealingResult:
        """
        Handle CRITICAL anomaly.

        Decision logic:
          - kernel_panic -> quarantine (prevents cascade)
          - segfault -> analyze (may be recoverable)
          - freeze -> reboot (if auto_reboot enabled)
        """
        start_time = time.time()

        # Decide action based on pattern
        if "panic" in pattern.lower() or "not syncing" in pattern.lower():
            action = HealingAction.QUARANTINE
            reason = f"Kernel panic detected: {pattern}"

        elif "segfault" in pattern.lower() or "segmentation" in pattern.lower():
            action = HealingAction.ANALYZE
            reason = f"Segmentation fault: {pattern}"

        elif "frozen" in pattern.lower() or "freeze" in detected_text.lower():
            if self.auto_reboot:
                action = HealingAction.REBOOT
                reason = f"System frozen: {pattern}"
            else:
                action = HealingAction.QUARANTINE
                reason = f"System frozen (auto_reboot disabled): {pattern}"

        else:
            action = HealingAction.QUARANTINE
            reason = f"Unknown critical: {pattern}"

        # Execute action
        success = await self._execute_action(action, district_id, reason)

        elapsed = time.time() - start_time
        logger.info(f"Healing action completed in {elapsed:.3f}s")

        return HealingResult(
            action=action,
            district_id=district_id,
            reason=reason,
            success=success,
            details={"elapsed_seconds": elapsed, "detected_text": detected_text[:200]}
        )

    async def _handle_warning(
        self,
        district_id: str,
        pattern: str,
        detected_text: str
    ) -> Optional[HealingResult]:
        """
        Handle WARNING anomaly.

        Warnings are logged but don't trigger immediate action.
        """
        logger.warning(f"WARNING in {district_id}: {pattern}")

        # Just log, no action
        result = HealingResult(
            action=HealingAction.ANALYZE,
            district_id=district_id,
            reason=f"Warning logged: {pattern}",
            success=True,
            details={"detected_text": detected_text[:200]}
        )

        return result

    async def _execute_action(
        self,
        action: HealingAction,
        district_id: str,
        reason: str
    ) -> bool:
        """
        Execute a healing action.

        Args:
            action: The action to execute
            district_id: Target district
            reason: Why this action was chosen

        Returns:
            True if action succeeded, False otherwise
        """
        logger.info(f"Executing {action.value} on {district_id}: {reason}")

        if action == HealingAction.ANALYZE:
            # Capture state for analysis
            return await self._analyze_district(district_id)

        elif action == HealingAction.QUARANTINE:
            # Isolate the district
            return await self._quarantine_district(district_id, reason)

        elif action == HealingAction.REBOOT:
            # Trigger substrate restart
            return await self._reboot_district(district_id)

        return False

    async def _analyze_district(self, district_id: str) -> bool:
        """Capture and log district state for analysis."""
        logger.info(f"Analyzing district: {district_id}")

        # TODO: Capture screenshot, register state, logs
        # For now, just log
        await self._publish_to_wordpress(
            title=f"Anomaly Analysis: {district_id}",
            content=f"<p>District {district_id} analyzed for anomalies.</p>"
        )

        return True

    async def _quarantine_district(self, district_id: str, reason: str) -> bool:
        """Quarantine a district to prevent cascade failure."""
        logger.warning(f"QUARANTINE: {district_id} - {reason}")

        # Broadcast quarantine event
        # (Visual Bridge already sends QUARANTINE_DISTRICT on CRITICAL)

        await self._publish_to_wordpress(
            title=f"District Quarantined: {district_id}",
            content=f"<p><b>Reason:</b> {reason}</p><p>District isolated to prevent cascade failure.</p>"
        )

        return True

    async def _reboot_district(self, district_id: str) -> bool:
        """Trigger substrate reboot (destructive action)."""
        logger.critical(f"REBOOT: {district_id}")

        if not self.auto_reboot:
            logger.warning("REBOOT blocked: auto_reboot=False")
            return False

        # TODO: Integrate with substrate launcher for actual reboot
        await self._publish_to_wordpress(
            title=f"District Rebooted: {district_id}",
            content=f"<p>Substrate restart triggered by HealerAgent.</p>"
        )

        return True

    async def _publish_to_wordpress(self, title: str, content: str) -> bool:
        """Publish healing action to WordPress for audit trail."""
        try:
            from wordpress_zone.publish_to_wp import publish_to_wordpress
            result = publish_to_wordpress(title, content, post_type="post")
            return result is not None
        except ImportError:
            logger.debug("WordPress district not available")
            return False
        except Exception as e:
            logger.warning(f"WordPress publish failed: {e}")
            return False

    def get_healing_history(self, limit: int = 10) -> List[Dict[str, Any]]:
        """Get recent healing history."""
        return [r.to_dict() for r in self._healing_history[-limit:]]
```

**Step 4: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_healer_agent.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/swarm/healer_agent.py tests/system/test_healer_agent.py
git commit -m "feat(healer): add HealerAgent with V16 reaction loop"
```

---

### Task 3: Add WebSocket Subscription

**Files:**
- Modify: `systems/visual_shell/swarm/healer_agent.py`
- Modify: `tests/system/test_healer_agent.py`

**Step 1: Write the failing test for WebSocket subscription**

Add to `tests/system/test_healer_agent.py`:

```python


class TestHealerAgentWebSocket:
    """Test HealerAgent WebSocket integration."""

    @pytest.fixture
    def agent(self):
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        return HealerAgent()

    def test_has_subscribe_method(self, agent):
        """Test that agent has WebSocket subscription method."""
        assert hasattr(agent, 'start')
        assert asyncio.iscoroutinefunction(agent.start)

    def test_has_stop_method(self, agent):
        """Test that agent can be stopped."""
        assert hasattr(agent, 'stop')
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_healer_agent.py::TestHealerAgentWebSocket -v`
Expected: PASS (methods exist but may not work correctly)

**Step 3: Add WebSocket subscription methods**

Add to `HealerAgent` class in `systems/visual_shell/swarm/healer_agent.py`:

```python
import websockets

# Add these methods to HealerAgent class:

    async def start(self):
        """
        Start the HealerAgent WebSocket client.

        Subscribes to Visual Bridge and processes DIAGNOSTIC_PULSE events.
        """
        self._running = True
        logger.info(f"HealerAgent connecting to {self.ws_url}")

        while self._running:
            try:
                async with websockets.connect(self.ws_url) as ws:
                    logger.info("HealerAgent connected to Visual Bridge")

                    # Send subscription message
                    await ws.send(json.dumps({
                        "type": "subscribe",
                        "events": ["DIAGNOSTIC_PULSE", "QUARANTINE_DISTRICT"]
                    }))

                    async for message in ws:
                        if not self._running:
                            break

                        try:
                            data = json.loads(message)
                            msg_type = data.get("type")

                            if msg_type == "DIAGNOSTIC_PULSE":
                                await self._handle_diagnostic_pulse(data)

                        except json.JSONDecodeError:
                            logger.warning(f"Invalid JSON received: {message[:100]}")
                        except Exception as e:
                            logger.error(f"Error processing message: {e}")

            except websockets.exceptions.ConnectionClosed:
                logger.warning("WebSocket connection closed, reconnecting...")
                await asyncio.sleep(1.0)
            except Exception as e:
                logger.error(f"WebSocket error: {e}")
                await asyncio.sleep(5.0)

    def stop(self):
        """Stop the HealerAgent."""
        self._running = False
        logger.info("HealerAgent stopped")
```

**Step 4: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_healer_agent.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/swarm/healer_agent.py tests/system/test_healer_agent.py
git commit -m "feat(healer): add WebSocket subscription for DIAGNOSTIC_PULSE events"
```

---

### Task 4: Add Integration Tests

**Files:**
- Create: `tests/system/test_healer_integration.py`

**Step 1: Write integration test**

```python
"""
Integration tests for HealerAgent with mock Visual Bridge.
"""

import pytest
import asyncio
import os
import sys
import json
from unittest.mock import AsyncMock, patch, MagicMock

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestHealerAgentIntegration:
    """Integration tests for HealerAgent."""

    @pytest.fixture
    def agent(self):
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        agent = HealerAgent(auto_reboot=False)
        return agent

    @pytest.mark.asyncio
    async def test_full_critical_flow(self, agent):
        """Test full flow: CRITICAL pulse -> quarantine -> WordPress publish."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "CRITICAL",
            "district_id": "test-silicon",
            "matched_pattern": "kernel panic",
            "detected_text": "Kernel panic - not syncing",
            "timestamp": 1708400000.0
        }

        with patch.object(agent, '_publish_to_wordpress', new_callable=AsyncMock) as mock_wp:
            mock_wp.return_value = True

            result = await agent._handle_diagnostic_pulse(pulse)

            assert result is not None
            assert result["action"] == "quarantine"
            assert result["district_id"] == "test-silicon"
            mock_wp.assert_called_once()

    @pytest.mark.asyncio
    async def test_segfault_triggers_analyze(self, agent):
        """Test that segfault triggers analyze action."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "CRITICAL",
            "district_id": "test-silicon",
            "matched_pattern": "segfault",
            "detected_text": "Segmentation fault at 0x0",
            "timestamp": 1708400000.0
        }

        result = await agent._handle_diagnostic_pulse(pulse)

        assert result is not None
        assert result["action"] == "analyze"

    @pytest.mark.asyncio
    async def test_warning_does_not_quarantine(self, agent):
        """Test that WARNING triggers analyze, not quarantine."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "WARNING",
            "district_id": "test-silicon",
            "matched_pattern": "error:",
            "detected_text": "Error: file not found",
            "timestamp": 1708400000.0
        }

        result = await agent._handle_diagnostic_pulse(pulse)

        assert result is not None
        assert result["action"] == "analyze"

    @pytest.mark.asyncio
    async def test_reboot_blocked_without_flag(self, agent):
        """Test that reboot is blocked when auto_reboot=False."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "CRITICAL",
            "district_id": "test-silicon",
            "matched_pattern": "frozen",
            "detected_text": "System frozen",
            "timestamp": 1708400000.0
        }

        result = await agent._handle_diagnostic_pulse(pulse)

        # Should quarantine instead of reboot
        assert result["action"] == "quarantine"

    @pytest.mark.asyncio
    async def test_reboot_allowed_with_flag(self):
        """Test that reboot is allowed when auto_reboot=True."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent

        agent = HealerAgent(auto_reboot=True)
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "CRITICAL",
            "district_id": "test-silicon",
            "matched_pattern": "frozen",
            "detected_text": "System frozen",
            "timestamp": 1708400000.0
        }

        with patch.object(agent, '_publish_to_wordpress', new_callable=AsyncMock):
            result = await agent._handle_diagnostic_pulse(pulse)

            assert result["action"] == "reboot"

    @pytest.mark.asyncio
    async def test_healing_history_tracking(self, agent):
        """Test that healing history is tracked."""
        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "CRITICAL",
            "district_id": "test-silicon",
            "matched_pattern": "kernel panic",
            "detected_text": "Kernel panic",
            "timestamp": 1708400000.0
        }

        with patch.object(agent, '_publish_to_wordpress', new_callable=AsyncMock):
            await agent._handle_diagnostic_pulse(pulse)

        history = agent.get_healing_history()
        assert len(history) == 1
        assert history[0]["district_id"] == "test-silicon"
```

**Step 2: Run integration tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_healer_integration.py -v`
Expected: All tests PASS

**Step 3: Commit**

```bash
git add tests/system/test_healer_integration.py
git commit -m "test(healer): add integration tests for HealerAgent V16 reaction loop"
```

---

### Task 5: Add Documentation

**Files:**
- Create: `docs/healer_agent.md`

**Step 1: Write documentation**

```markdown
# HealerAgent - V16 Reaction Loop

The HealerAgent is an autonomous agent that consumes DIAGNOSTIC_PULSE events from the Perceptual Bridge V16 and responds to CRITICAL anomalies within 1 second.

## Overview

Acts as the "Immune System" of Geometry OS, automatically quarantining or rebooting districts that exhibit critical failures like kernel panics and segfaults.

## Usage

### Start HealerAgent

```python
from systems.visual_shell.swarm.healer_agent import HealerAgent

agent = HealerAgent(
    ws_url="ws://localhost:8768",
    reaction_threshold=1.0,
    auto_reboot=False  # Safety: require manual approval
)

# Start listening for DIAGNOSTIC_PULSE events
await agent.start()
```

### Stop HealerAgent

```python
agent.stop()
```

## Actions

| Action | Trigger | Description |
|--------|---------|-------------|
| `analyze` | WARNING, segfault | Log anomaly, capture state, no immediate action |
| `quarantine` | kernel panic, freeze (auto_reboot=False) | Isolate district to prevent cascade |
| `reboot` | freeze (auto_reboot=True) | Trigger substrate restart |

## Decision Logic

```python
if "panic" in pattern or "not syncing" in pattern:
    action = QUARANTINE
elif "segfault" in pattern:
    action = ANALYZE
elif "frozen" in pattern:
    action = REBOOT if auto_reboot else QUARANTINE
else:
    action = QUARANTINE  # Safe default
```

## Safety

- `auto_reboot=False` by default to prevent accidental data loss
- All healing actions logged to WordPress for audit trail
- Reaction time tracked to ensure <1s threshold

## Integration with Perceptual Bridge V16

```
PerceptualBridge ──► VisualBridge (8768) ──► HealerAgent
                           │
                           └──► DIAGNOSTIC_PULSE
                                      │
                                      ▼
                              CRITICAL? → Execute Action
                              WARNING?  → Log & Analyze
                              HEALTHY?  → Ignore
```

## Files

| File | Purpose |
|------|---------|
| `systems/visual_shell/swarm/healer_agent.py` | HealerAgent implementation |
| `tests/system/test_healer_agent.py` | Unit tests |
| `tests/system/test_healer_integration.py` | Integration tests |
```

**Step 2: Commit**

```bash
git add docs/healer_agent.md
git commit -m "docs(healer): add HealerAgent V16 reaction loop documentation"
```

---

## Verification

After all tasks complete, verify:

```bash
# Run all healer tests
cd /home/jericho/zion/projects/geometry_os/geometry_os
python3 -m pytest tests/system/test_healer_agent.py tests/system/test_healer_integration.py -v

# Test HealerAgent CLI
python3 -c "from systems.visual_shell.swarm.healer_agent import HealerAgent; a = HealerAgent(); print(f'Ready: threshold={a.reaction_threshold}s')"

# Verify reaction time
python3 -c "
import asyncio
from systems.visual_shell.swarm.healer_agent import HealerAgent

async def test():
    agent = HealerAgent()
    pulse = {'type': 'DIAGNOSTIC_PULSE', 'status': 'CRITICAL', 'district_id': 'test', 'matched_pattern': 'panic', 'detected_text': 'Kernel panic'}
    result = await agent._handle_diagnostic_pulse(pulse)
    print(f'Action: {result[\"action\"]}, Time: {result[\"details\"][\"elapsed_seconds\"]:.3f}s')

asyncio.run(test())
"
```

---

## Summary

| Task | Files | Commits |
|------|-------|---------|
| 1. HealerAgent tests | `tests/system/test_healer_agent.py` | 1 |
| 2. HealerAgent core | `systems/visual_shell/swarm/healer_agent.py` | 1 |
| 3. WebSocket subscription | `healer_agent.py` (modify) | 1 |
| 4. Integration tests | `tests/system/test_healer_integration.py` | 1 |
| 5. Documentation | `docs/healer_agent.md` | 1 |

**Total: 5 tasks, 5 commits, 4 files created/modified**
