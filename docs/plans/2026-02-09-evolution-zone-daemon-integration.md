# Evolution Zone Daemon Integration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Connect the WriteEvolvedGenome protocol handler to EvolutionDaemonV8 for actual genome breeding, execution, and boot-to-map functionality.

**Architecture:**
1. Python Backend (`evolution_protocol_server.py`) receives WriteEvolvedGenome message from Rust frontend
2. Handler validates genome, passes to EvolutionDaemonV8 for processing
3. EvolutionDaemonV8 breeds/evolves genome, compiles to .rts.png cartridge
4. Compiled cartridge is placed on the infinite map at user's cursor position
5. Visual shell renders the new autonomous execution zone

**Tech Stack:**
- Rust: `systems/infinite_map_rs/src/app.rs`, `src/evolution_protocol.rs`
- Python: `systems/neural_cortex/evolution_protocol_server.py`, `evolution_daemon_v8.py`
- Protocol: Unix socket (UDS) with JSON payloads

---

## Task 1: Add Genome Queue to EvolutionDaemonV8

**Files:**
- Modify: `evolution_daemon_v8.py:416-500` (EvolutionDaemonV8.__init__)

**Step 1: Write the failing test**

Create test file: `tests/test_evolution_genome_queue.py`

```python
"""
Test genome queue functionality for EvolutionDaemonV8
"""
import pytest
import time
import threading

def test_genome_queue_exists():
    """EvolutionDaemonV8 should have a genome queue"""
    from evolution_daemon_v8 import EvolutionDaemonV8
    daemon = EvolutionDaemonV8()
    assert hasattr(daemon, 'genome_queue'), "Daemon should have genome_queue attribute"

def test_genome_can_be_queued():
    """Genomes should be queuable from external sources"""
    from evolution_daemon_v8 import EvolutionDaemonV8
    daemon = EvolutionDaemonV8()

    test_genome = {
        'id': 'test-genome-1',
        'data': bytes([0xCA, 0xFE, 0xBA, 0xBE]),
        'generation': 1,
        'fitness': 0.95,
        'metadata': {'action': 'BOOT_DAEMON'}
    }

    daemon.queue_genome(test_genome)
    assert daemon.get_queue_size() > 0, "Queue should have items after enqueue"
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_evolution_genome_queue.py::test_genome_queue_exists -v`
Expected: `AttributeError: 'EvolutionDaemonV8' object has no attribute 'genome_queue'`

**Step 3: Write minimal implementation**

Edit: `evolution_daemon_v8.py` around line 515 (after `self.advanced_optimizer` initialization)

```python
# 5.2. GENOME QUEUE (Phase 35: Autonomous Execution Zone)
import queue
self.genome_queue = queue.Queue()
self.genome_processing_thread = None
self._start_genome_processing_thread()
logger.info("🧬 Genome Queue Initialized - Ready for autonomous execution")
```

Add methods at the end of EvolutionDaemonV8 class (around line 1200, before `run` method):

```python
def queue_genome(self, genome_data: dict):
    """
    Queue a genome for processing from external source (e.g., Evolution Zone click)

    Args:
        genome_data: Dict with keys:
            - id: str - Unique genome identifier
            - data: bytes - Binary genome payload
            - generation: int - Generation number
            - fitness: float - Fitness score (0.0 - 1.0)
            - metadata: dict - Additional configuration
    """
    self.genome_queue.put(genome_data)
    logger.info(f"📥 Genome queued: {genome_data.get('id', 'unknown')}")

def get_queue_size(self) -> int:
    """Get current genome queue size"""
    return self.genome_queue.qsize()

def _start_genome_processing_thread(self):
    """Start background thread for processing queued genomes"""
    def process_genomes():
        while self.running:
            try:
                genome = self.genome_queue.get(timeout=1.0)
                logger.info(f"🧬 Processing genome: {genome.get('id')}")
                self._process_evolved_genome(genome)
            except queue.Empty:
                continue
            except Exception as e:
                logger.error(f"❌ Error processing genome: {e}")

    self.genome_processing_thread = threading.Thread(
        target=process_genomes,
        daemon=True,
        name="GenomeProcessor"
    )
    self.genome_processing_thread.start()
    logger.info("🔄 Genome processing thread started")

def _process_evolved_genome(self, genome: dict):
    """
    Process an evolved genome from the queue

    This is where the actual breeding/evolution happens.
    For now, log and prepare for compilation.
    """
    genome_id = genome.get('id', 'unknown')
    generation = genome.get('generation', 0)
    fitness = genome.get('fitness', 0.0)

    logger.info(f"🧬 Processing Evolved Genome:")
    logger.info(f"   ID: {genome_id}")
    logger.info(f"   Generation: {generation}")
    logger.info(f"   Fitness: {fitness}")
    logger.info(f"   Data size: {len(genome.get('data', b''))} bytes")

    # TODO: Phase 35.6 - Connect to actual breeding/compilation
    # For now, just acknowledge receipt
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest tests/test_evolution_genome_queue.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add evolution_daemon_v8.py tests/test_evolution_genome_queue.py
git commit -m "feat(evolution): add genome queue to EvolutionDaemonV8"
```

---

## Task 2: Connect Protocol Server to Daemon Genome Queue

**Files:**
- Modify: `systems/neural_cortex/evolution_protocol_server.py:432-450` (_handle_write_evolved_genome)
- Create: `systems/neural_cortex/evolution_daemon_bridge.py`

**Step 1: Write the failing test**

Create test file: `systems/neural_cortex/tests/test_evolution_daemon_bridge.py`

```python
"""
Test EvolutionDaemonBridge for connecting protocol server to daemon
"""
import pytest
import json

def test_bridge_forward_genome_to_daemon():
    """Bridge should forward genomes to EvolutionDaemonV8"""
    from evolution_daemon_bridge import EvolutionDaemonBridge
    from evolution_daemon_v8 import EvolutionDaemonV8

    daemon = EvolutionDaemonV8()
    bridge = EvolutionDaemonBridge(daemon)

    test_genome = {
        'id': 'bridge-test-1',
        'data': bytes([0xCA, 0xFE]),
        'generation': 1,
        'fitness': 0.99
    }

    bridge.forward_genome(test_genome)
    assert daemon.get_queue_size() == 1, "Daemon should have 1 genome in queue"
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/neural_cortex/tests/test_evolution_daemon_bridge.py -v`
Expected: `ModuleNotFoundError: No module named 'evolution_daemon_bridge'`

**Step 3: Write minimal implementation**

Create: `systems/neural_cortex/evolution_daemon_bridge.py`

```python
"""
EvolutionDaemonBridge: Connects EvolutionProtocolServer to EvolutionDaemonV8

This module provides the bridge between the socket protocol handler and the
actual evolution daemon instance. It handles:
- Genome forwarding from protocol to daemon
- Daemon instance reference management
- Thread-safe queue operations
"""

import logging
from typing import Optional, TYPE_CHECKING

if TYPE_CHECKING:
    from evolution_daemon_v8 import EvolutionDaemonV8

logger = logging.getLogger(__name__)


class EvolutionDaemonBridge:
    """
    Bridge between EvolutionProtocolServer and EvolutionDaemonV8

    This class exists to avoid circular imports and provide a clean interface
    for the protocol server to interact with the daemon.
    """

    def __init__(self, daemon: 'EvolutionDaemonV8'):
        """
        Initialize the bridge with a daemon instance

        Args:
            daemon: EvolutionDaemonV8 instance to forward genomes to
        """
        self.daemon = daemon
        logger.info("🔗 EvolutionDaemonBridge initialized")

    def forward_genome(self, genome_data: dict) -> bool:
        """
        Forward genome data to the daemon's queue

        Args:
            genome_data: Dict with genome information:
                - id: str - Genome identifier
                - data: bytes - Binary payload
                - generation: int - Generation number
                - fitness: float - Fitness score
                - metadata: dict - Additional metadata

        Returns:
            bool: True if successfully queued, False otherwise
        """
        try:
            # Convert bytes data if it's in list format (from JSON)
            if isinstance(genome_data.get('data'), list):
                genome_data['data'] = bytes(genome_data['data'])

            self.daemon.queue_genome(genome_data)
            logger.info(f"✅ Genome forwarded to daemon: {genome_data.get('id')}")
            return True
        except Exception as e:
            logger.error(f"❌ Failed to forward genome: {e}")
            return False

    def get_daemon_status(self) -> dict:
        """
        Get current status of the daemon

        Returns:
            dict with keys:
                - queue_size: int
                - running: bool
        """
        return {
            'queue_size': self.daemon.get_queue_size(),
            'running': getattr(self.daemon, 'running', False)
        }
```

Now modify: `systems/neural_cortex/evolution_protocol_server.py`

Edit around line 160 (in `__init__` method), add bridge parameter:

```python
def __init__(
    self,
    socket_path: str = "/tmp/evolution_protocol.sock",
    sync_packet_provider: Optional[Callable] = None,
    daemon_bridge: Optional['EvolutionDaemonBridge'] = None
):
```

Edit around line 165, add bridge storage:

```python
self.socket_path = socket_path
self.sync_packet_provider = sync_packet_provider
self.daemon_bridge = daemon_bridge
self.server_socket: Optional[socket.socket] = None
```

Edit `_handle_write_evolved_genome` around line 432:

```python
def _handle_write_evolved_genome(self, message: ProtocolMessage) -> ProtocolMessage:
    """Handle WriteEvolvedGenome message - forward to daemon"""
    with self.lock:
        self.sequence_counter += 1

    payload = message.payload
    genome_id = payload.get('id', 'unknown')

    logger.info(f"🧬 Evolved Genome Received: {genome_id}")
    logger.info(f"   Generation: {payload.get('generation', 0)}")
    logger.info(f"   Fitness: {payload.get('fitness', 0.0)}")

    # Forward to daemon if bridge is available
    success = False
    if self.daemon_bridge:
        success = self.daemon_bridge.forward_genome(payload)
        if success:
            logger.info(f"✅ Genome {genome_id} forwarded to daemon")
        else:
            logger.warning(f"⚠️ Failed to forward genome {genome_id}")
    else:
        logger.warning("⚠️ No daemon bridge available - genome not forwarded")

    return ProtocolMessage(
        msg_type=MessageType.ACK,
        sequence=self.sequence_counter,
        payload={
            "status": "received" if success else "no_bridge",
            "genome_id": genome_id
        }
    )
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/neural_cortex/tests/test_evolution_daemon_bridge.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/neural_cortex/evolution_daemon_bridge.py
git add systems/neural_cortex/evolution_protocol_server.py
git add systems/neural_cortex/tests/test_evolution_daemon_bridge.py
git commit -m "feat(evolution): add daemon bridge for genome forwarding"
```

---

## Task 3: Wire Bridge in EvolutionDaemonV8 Startup

**Files:**
- Modify: `evolution_daemon_v8.py:650-700` (protocol server initialization)

**Step 1: Write the failing test**

```python
# Add to tests/test_evolution_genome_queue.py

def test_daemon_has_protocol_server_with_bridge():
    """EvolutionDaemonV8 should initialize protocol server with bridge"""
    from evolution_daemon_v8 import EvolutionDaemonV8
    daemon = EvolutionDaemonV8()

    assert hasattr(daemon, 'protocol_server'), "Should have protocol_server"
    assert hasattr(daemon.protocol_server, 'daemon_bridge'), "Protocol server should have bridge"
    assert daemon.protocol_server.daemon_bridge.daemon is daemon, "Bridge should reference daemon"
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_evolution_genome_queue.py::test_daemon_has_protocol_server_with_bridge -v`
Expected: `AttributeError: 'EvolutionProtocolServer' object has no attribute 'daemon_bridge'`

**Step 3: Write minimal implementation**

Find where EvolutionProtocolServer is initialized in `evolution_daemon_v8.py` (around line 650):

Edit the initialization to include the bridge:

```python
# Phase 3: HARMONIC DAEMON INTEGRATION
# Create protocol server WITH bridge to self
from systems.neural_cortex.evolution_daemon_bridge import EvolutionDaemonBridge

self.daemon_bridge = EvolutionDaemonBridge(self)
self.protocol_server = EvolutionProtocolServer(
    socket_path="/tmp/evolution_protocol.sock",
    sync_packet_provider=self.harmonic_hub.get_sync_packet,
    daemon_bridge=self.daemon_bridge
)
logger.info("🔌 Evolution Protocol Server initialized with daemon bridge")
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest tests/test_evolution_genome_queue.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add evolution_daemon_v8.py
git commit -m "feat(evolution): wire daemon bridge in protocol server initialization"
```

---

## Task 4: End-to-End Integration Test

**Files:**
- Create: `tests/integration/test_evolution_zone_e2e.py`

**Step 1: Write the failing test**

```python
"""
End-to-end test: Evolution Zone click → Daemon genome queue
"""
import pytest
import json
import time
import socket

def test_evolution_zone_click_queues_genome():
    """
    Full integration test:
    1. Start EvolutionDaemonV8 with protocol server
    2. Send WriteEvolvedGenome message via socket
    3. Verify genome appears in daemon's queue
    """
    from evolution_daemon_v8 import EvolutionDaemonV8
    import threading

    # Start daemon in background thread
    daemon = EvolutionDaemonV8()
    daemon.running = True

    def run_daemon_briefly():
        daemon.protocol_server.start()
        time.sleep(0.5)  # Brief run for test
        daemon.protocol_server.stop()

    daemon_thread = threading.Thread(target=run_daemon_briefly, daemon=True)
    daemon_thread.start()
    time.sleep(0.2)  # Wait for server to start

    # Send WriteEvolvedGenome message via socket
    message = {
        'msg_type': 'WriteEvolvedGenome',
        'sequence': 1,
        'payload': {
            'id': 'e2e-test-genome',
            'data': [0xCA, 0xFE, 0xBA, 0xBE],
            'generation': 1,
            'fitness': 0.99,
            'metadata': {'action': 'BOOT_DAEMON'}
        }
    }

    # Connect and send
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    try:
        sock.connect("/tmp/evolution_protocol.sock")
        message_bytes = json.dumps(message).encode()
        sock.sendall(len(message_bytes).to_bytes(4, 'little'))
        sock.sendall(message_bytes)

        # Wait for processing
        time.sleep(0.3)

        # Verify genome in queue
        assert daemon.get_queue_size() > 0, "Genome should be in daemon queue"

    finally:
        sock.close()
        daemon.running = False
        daemon_thread.join(timeout=2)
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/integration/test_evolution_zone_e2e.py -v`
Expected: Test may fail due to timing or initialization issues

**Step 3: Verify and fix any issues**

Ensure daemon.running is set to True early in `__init__` if not already, and that protocol_server.start() works correctly.

**Step 4: Run test to verify it passes**

Run: `python -m pytest tests/integration/test_evolution_zone_e2e.py -v`
Expected: Test PASS

**Step 5: Commit**

```bash
git add tests/integration/test_evolution_zone_e2e.py
git commit -m "test(evolution): add e2e integration test for evolution zone"
```

---

## Task 5: Update Documentation

**Files:**
- Create: `docs/EVOLUTION_ZONE_GUIDE.md`

**Step 1: Write the documentation**

```markdown
# Evolution Zone Integration Guide

## Overview

The Evolution Zone enables autonomous code execution through visual interaction:

1. **User clicks Evolution Zone window** (gold border in visual shell)
2. **Rust frontend sends WriteEvolvedGenome message** via Unix socket
3. **Python backend receives and queues genome** in EvolutionDaemonV8
4. **Daemon processes genome** (breeding, compilation, execution)
5. **Results rendered back to map**

## Architecture

```
┌─────────────────────────────────────────────────────┐
│ Visual Shell (Rust)                                 │
│  systems/infinite_map_rs/src/app.rs                 │
│   ↓ click                                           │
│  evolution_manager.write_evolved_genome()           │
│   ↓                                                 │
│  Unix Socket: /tmp/evolution_protocol.sock          │
└─────────────────────────────────────────────────────┘
   ↓ WriteEvolvedGenome message
┌─────────────────────────────────────────────────────┐
│ Evolution Protocol Server (Python)                 │
│  systems/neural_cortex/evolution_protocol_server.py │
│   ↓ _handle_write_evolved_genome()                  │
│  daemon_bridge.forward_genome()                     │
└─────────────────────────────────────────────────────┘
   ↓
┌─────────────────────────────────────────────────────┐
│ EvolutionDaemonV8                                   │
│  evolution_daemon_v8.py                             │
│   ↓ genome_queue.put()                              │
│  _process_evolved_genome()                          │
│   ↓ (future: compile to .rts.png)                    │
│  Place on infinite map                              │
└─────────────────────────────────────────────────────┘
```

## Protocol Message Format

**WriteEvolvedGenome** (Rust → Python):

```json
{
  "msg_type": "WriteEvolvedGenome",
  "sequence": 1,
  "payload": {
    "id": "genome-boot-123",
    "data": [0xCA, 0xFE, 0xBA, 0xBE],
    "generation": 1,
    "fitness": 0.99,
    "metadata": {"action": "BOOT_DAEMON"}
  }
}
```

## Testing

Run integration tests:

```bash
# Unit tests
python -m pytest tests/test_evolution_genome_queue.py -v
python -m pytest systems/neural_cortex/tests/test_evolution_daemon_bridge.py -v

# End-to-end
python -m pytest tests/integration/test_evolution_zone_e2e.py -v
```

## Next Steps

- [ ] Phase 35.6: Implement actual genome breeding in `_process_evolved_genome()`
- [ ] Phase 35.7: Compile genomes to .rts.png cartridges
- [ ] Phase 35.8: Place cartridges on infinite map at cursor position
- [ ] Phase 35.9: Add visual feedback for evolution progress
```

**Step 2: Commit documentation**

```bash
git add docs/EVOLUTION_ZONE_GUIDE.md
git commit -m "docs(evolution): add Evolution Zone integration guide"
```

---

## Summary

This plan completes the **daemon-side integration** for the Evolution Zone. After implementation:

- ✅ Clicking Evolution Zone queues genomes in daemon
- ✅ Protocol server forwards to daemon via bridge
- ✅ Daemon processes genomes in background thread
- ⏳ Next: Actual breeding/compilation (future tasks)

**Total files to modify/create:**
- Modify: 3 (`evolution_daemon_v8.py`, `evolution_protocol_server.py`, app.rs if needed)
- Create: 4 (`evolution_daemon_bridge.py`, 3 test files)
- Docs: 1 (`EVOLUTION_ZONE_GUIDE.md`)
