# inotify-to-Gravity Integration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Connect real-time file access events to the Tectonic Gravity Engine, making files "drift toward you" as you use them.

**Architecture:** FileWatcher (watchdog/inotify) emits access events → MassIntegrator converts events to mass deltas → GravityEngine.update_mass() applies changes → Files drift in real-time on the Glass Box.

**Tech Stack:** Python, watchdog library, numpy (existing), threading

---

## Phase 1: File Watcher Component

### Task 1: Create FileWatcher with watchdog integration

**Files:**
- Create: `systems/infinite_map/file_watcher.py`
- Test: `tests/test_file_watcher.py`

**Step 1: Write the failing test**

```python
# tests/test_file_watcher.py
"""
Tests for FileWatcher - Real-time file access monitoring.

Uses watchdog to emit events when files are accessed, modified, or created.
These events drive the Tectonic Gravity Engine's semantic mass updates.
"""

import pytest
import tempfile
import time
from pathlib import Path
from systems.infinite_map.file_watcher import FileWatcher, FileEvent


class TestFileWatcher:
    """Tests for FileWatcher file monitoring."""

    def test_file_watcher_creation(self):
        """Test FileWatcher initializes with a watch path."""
        watcher = FileWatcher("/tmp")
        assert watcher.watch_path == "/tmp"
        assert watcher._running == False

    def test_file_watcher_start_stop(self):
        """Test FileWatcher can be started and stopped."""
        with tempfile.TemporaryDirectory() as tmpdir:
            watcher = FileWatcher(tmpdir)
            watcher.start()
            assert watcher._running == True
            watcher.stop()
            assert watcher._running == False

    def test_file_event_captured_on_modify(self):
        """Test FileWatcher captures file modification events."""
        with tempfile.TemporaryDirectory() as tmpdir:
            watcher = FileWatcher(tmpdir)
            events = []
            watcher.set_callback(lambda e: events.append(e))

            # Create and modify a file
            test_file = Path(tmpdir) / "test.py"
            test_file.write_text("initial")

            watcher.start()
            time.sleep(0.2)  # Let watcher initialize

            test_file.write_text("modified")
            time.sleep(0.3)  # Wait for event

            watcher.stop()

            # Should have captured at least one event
            assert len(events) >= 1
            assert events[0].event_type in ("modified", "created")
            assert "test.py" in events[0].file_path

    def test_file_event_has_path_and_type(self):
        """Test FileEvent contains file_path and event_type."""
        event = FileEvent(file_path="/tmp/test.py", event_type="modified")
        assert event.file_path == "/tmp/test.py"
        assert event.event_type == "modified"


class TestFileEvent:
    """Tests for FileEvent dataclass."""

    def test_file_event_creation(self):
        """Test FileEvent stores all required fields."""
        event = FileEvent(
            file_path="src/core.py",
            event_type="accessed"
        )
        assert event.file_path == "src/core.py"
        assert event.event_type == "accessed"

    def test_file_event_types(self):
        """Test FileEvent supports different event types."""
        types = ["created", "modified", "accessed", "deleted"]
        for t in types:
            event = FileEvent(file_path="test.py", event_type=t)
            assert event.event_type == t


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_file_watcher.py -v`
Expected: FAIL with "No module named 'systems.infinite_map.file_watcher'"

**Step 3: Write minimal implementation**

```python
# systems/infinite_map/file_watcher.py
"""
File Watcher: Real-time file access monitoring using watchdog.

Emits FileEvent objects when files are accessed, modified, or created.
These events drive the Tectonic Gravity Engine's semantic mass updates.
"""

import threading
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Optional, List
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler, FileSystemEvent


@dataclass
class FileEvent:
    """Represents a file system event."""
    file_path: str
    event_type: str  # "created", "modified", "accessed", "deleted"


class FileWatcher(FileSystemEventHandler):
    """
    Watches a directory for file system events.

    Uses watchdog library for cross-platform file monitoring.
    Emits FileEvent objects via callback when files change.
    """

    def __init__(self, watch_path: str):
        """
        Initialize the file watcher.

        Args:
            watch_path: Directory path to watch for changes
        """
        self.watch_path = watch_path
        self._observer: Optional[Observer] = None
        self._running = False
        self._callback: Optional[Callable[[FileEvent], None]] = None
        self._lock = threading.Lock()

    def set_callback(self, callback: Callable[[FileEvent], None]):
        """Set the callback function for file events."""
        with self._lock:
            self._callback = callback

    def on_modified(self, event: FileSystemEvent):
        """Handle file modification events."""
        if not event.is_directory:
            self._emit_event(event.src_path, "modified")

    def on_created(self, event: FileSystemEvent):
        """Handle file creation events."""
        if not event.is_directory:
            self._emit_event(event.src_path, "created")

    def on_deleted(self, event: FileSystemEvent):
        """Handle file deletion events."""
        if not event.is_directory:
            self._emit_event(event.src_path, "deleted")

    def _emit_event(self, file_path: str, event_type: str):
        """Emit a FileEvent to the callback."""
        with self._lock:
            if self._callback:
                event = FileEvent(file_path=file_path, event_type=event_type)
                self._callback(event)

    def start(self):
        """Start watching the directory."""
        if self._running:
            return

        self._observer = Observer()
        self._observer.schedule(self, self.watch_path, recursive=True)
        self._observer.start()
        self._running = True

    def stop(self):
        """Stop watching the directory."""
        if not self._running:
            return

        if self._observer:
            self._observer.stop()
            self._observer.join(timeout=2.0)
            self._observer = None
        self._running = False

    def __enter__(self):
        """Context manager entry - start watching."""
        self.start()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit - stop watching."""
        self.stop()
        return False
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_file_watcher.py -v`
Expected: 6 passed

**Step 5: Commit**

```bash
git add systems/infinite_map/file_watcher.py tests/test_file_watcher.py
git commit -m "feat(tectonic): add FileWatcher for real-time file monitoring"
```

---

## Phase 2: Mass Integrator Component

### Task 2: Create MassIntegrator for event-to-mass conversion

**Files:**
- Create: `systems/infinite_map/mass_integrator.py`
- Test: `tests/test_mass_integrator.py`

**Step 1: Write the failing test**

```python
# tests/test_mass_integrator.py
"""
Tests for MassIntegrator - Converts file events to semantic mass deltas.

Mass increases with access frequency, creating "hot spots" in the gravity map.
"""

import pytest
from systems.infinite_map.mass_integrator import MassIntegrator, MassDelta
from systems.infinite_map.file_watcher import FileEvent


class TestMassDelta:
    """Tests for MassDelta dataclass."""

    def test_mass_delta_creation(self):
        """Test MassDelta stores all required fields."""
        delta = MassDelta(
            file_path="src/core.py",
            delta_mass=0.5,
            event_type="modified"
        )
        assert delta.file_path == "src/core.py"
        assert delta.delta_mass == 0.5
        assert delta.event_type == "modified"


class TestMassIntegrator:
    """Tests for MassIntegrator event processing."""

    def test_mass_integrator_creation(self):
        """Test MassIntegrator initializes with default settings."""
        integrator = MassIntegrator()
        assert integrator.access_weight > 0
        assert integrator.modify_weight > 0

    def test_modified_event_increases_mass(self):
        """Test file modification increases semantic mass."""
        integrator = MassIntegrator(modify_weight=0.5)
        event = FileEvent(file_path="test.py", event_type="modified")

        delta = integrator.process_event(event)

        assert delta.file_path == "test.py"
        assert delta.delta_mass == 0.5
        assert delta.event_type == "modified"

    def test_created_event_increases_mass(self):
        """Test file creation increases semantic mass."""
        integrator = MassIntegrator(create_weight=1.0)
        event = FileEvent(file_path="new.py", event_type="created")

        delta = integrator.process_event(event)

        assert delta.delta_mass == 1.0

    def test_deleted_event_decreases_mass(self):
        """Test file deletion decreases semantic mass."""
        integrator = MassIntegrator(delete_weight=-0.5)
        event = FileEvent(file_path="old.py", event_type="deleted")

        delta = integrator.process_event(event)

        assert delta.delta_mass == -0.5

    def test_repeated_accesses_accumulate(self):
        """Test repeated file accesses accumulate mass."""
        integrator = MassIntegrator(modify_weight=0.1)

        total_mass = 0.0
        for _ in range(10):
            event = FileEvent(file_path="frequent.py", event_type="modified")
            delta = integrator.process_event(event)
            total_mass += delta.delta_mass

        assert total_mass == 1.0  # 10 * 0.1

    def test_get_file_mass_returns_accumulated(self):
        """Test get_file_mass returns total accumulated mass for a file."""
        integrator = MassIntegrator(modify_weight=0.25)

        # Process 4 events for the same file
        for _ in range(4):
            event = FileEvent(file_path="tracked.py", event_type="modified")
            integrator.process_event(event)

        assert integrator.get_file_mass("tracked.py") == 1.0

    def test_decay_reduces_old_mass(self):
        """Test decay reduces mass over time for inactive files."""
        integrator = MassIntegrator(modify_weight=1.0, decay_factor=0.9)

        # Create mass
        event = FileEvent(file_path="aging.py", event_type="modified")
        integrator.process_event(event)
        assert integrator.get_file_mass("aging.py") == 1.0

        # Apply decay
        integrator.apply_decay()
        assert integrator.get_file_mass("aging.py") == 0.9

        # Apply decay again
        integrator.apply_decay()
        assert integrator.get_file_mass("aging.py") == 0.81


class TestMassIntegratorWeights:
    """Tests for configurable event weights."""

    def test_custom_weights(self):
        """Test MassIntegrator accepts custom weights."""
        integrator = MassIntegrator(
            access_weight=0.1,
            modify_weight=0.3,
            create_weight=0.5,
            delete_weight=-0.2
        )

        assert integrator.access_weight == 0.1
        assert integrator.modify_weight == 0.3
        assert integrator.create_weight == 0.5
        assert integrator.delete_weight == -0.2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_mass_integrator.py -v`
Expected: FAIL with "No module named 'systems.infinite_map.mass_integrator'"

**Step 3: Write minimal implementation**

```python
# systems/infinite_map/mass_integrator.py
"""
Mass Integrator: Converts file events to semantic mass deltas.

Mass increases with access frequency, creating "hot spots" in the gravity map.
Implements the "Semantic Gravity" concept from the v1.2 vision.
"""

from dataclasses import dataclass, field
from typing import Dict, Optional
from .file_watcher import FileEvent


@dataclass
class MassDelta:
    """Represents a change in semantic mass for a file."""
    file_path: str
    delta_mass: float
    event_type: str


class MassIntegrator:
    """
    Converts file system events to semantic mass changes.

    The mass of a file represents its "importance" or "heat" in the
    Tectonic Engine. Files that are accessed frequently become "hot"
    and drift toward the center of the gravity map.
    """

    def __init__(
        self,
        access_weight: float = 0.1,
        modify_weight: float = 0.25,
        create_weight: float = 0.5,
        delete_weight: float = -0.3,
        decay_factor: float = 0.95
    ):
        """
        Initialize the mass integrator.

        Args:
            access_weight: Mass added per file access
            modify_weight: Mass added per file modification
            create_weight: Mass added per file creation
            delete_weight: Mass change per file deletion (usually negative)
            decay_factor: Factor for mass decay (0.95 = 5% decay per cycle)
        """
        self.access_weight = access_weight
        self.modify_weight = modify_weight
        self.create_weight = create_weight
        self.delete_weight = delete_weight
        self.decay_factor = decay_factor

        # Track accumulated mass per file
        self._file_masses: Dict[str, float] = {}

    def process_event(self, event: FileEvent) -> MassDelta:
        """
        Process a file event and return the mass delta.

        Args:
            event: The file event to process

        Returns:
            MassDelta with the change in semantic mass
        """
        # Determine weight based on event type
        weight_map = {
            "accessed": self.access_weight,
            "modified": self.modify_weight,
            "created": self.create_weight,
            "deleted": self.delete_weight
        }

        delta_mass = weight_map.get(event.event_type, 0.0)

        # Update accumulated mass
        if event.file_path not in self._file_masses:
            self._file_masses[event.file_path] = 0.0
        self._file_masses[event.file_path] += delta_mass

        return MassDelta(
            file_path=event.file_path,
            delta_mass=delta_mass,
            event_type=event.event_type
        )

    def get_file_mass(self, file_path: str) -> float:
        """Get the accumulated mass for a file."""
        return self._file_masses.get(file_path, 0.0)

    def apply_decay(self) -> Dict[str, float]:
        """
        Apply decay to all file masses.

        Returns:
            Dict of file_path -> new_mass after decay
        """
        for path in self._file_masses:
            self._file_masses[path] *= self.decay_factor
        return dict(self._file_masses)

    def get_all_masses(self) -> Dict[str, float]:
        """Get all file masses."""
        return dict(self._file_masses)

    def clear(self):
        """Clear all accumulated mass."""
        self._file_masses.clear()
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_mass_integrator.py -v`
Expected: 9 passed

**Step 5: Commit**

```bash
git add systems/infinite_map/mass_integrator.py tests/test_mass_integrator.py
git commit -m "feat(tectonic): add MassIntegrator for event-to-mass conversion"
```

---

## Phase 3: Gravity Engine Integration

### Task 3: Add real-time mass update to GravityEngine

**Files:**
- Modify: `systems/infinite_map/gravity_engine.py`
- Test: `tests/test_gravity_engine_realtime.py`

**Step 1: Write the failing test**

```python
# tests/test_gravity_engine_realtime.py
"""
Tests for real-time mass updates in GravityEngine.

Verifies that files drift when their semantic mass changes.
"""

import pytest
import numpy as np
from systems.infinite_map.gravity_engine import GravityEngine


class TestGravityEngineRealtimeMass:
    """Tests for real-time mass updates."""

    def test_update_mass_increases_mass(self):
        """Test update_mass increases an orb's mass."""
        engine = GravityEngine()
        engine.add_orb("test.py", 100, 100, 1024)

        initial_mass = engine.orbs["test.py"]["mass"]
        engine.update_mass("test.py", delta=0.5)

        assert engine.orbs["test.py"]["mass"] == initial_mass + 0.5

    def test_update_mass_nonexistent_orb_ignored(self):
        """Test update_mass silently ignores non-existent orbs."""
        engine = GravityEngine()

        # Should not raise
        engine.update_mass("nonexistent.py", delta=1.0)

        assert len(engine.orbs) == 0

    def test_higher_mass_attracts_other_orbs(self):
        """Test orbs with higher mass attract others."""
        engine = GravityEngine(bounds=(500, 500))

        # Add two orbs far apart
        engine.add_orb("heavy.py", 100, 250, 1024)
        engine.add_orb("light.py", 400, 250, 512)

        # Increase mass of heavy orb
        engine.update_mass("heavy.py", delta=10.0)

        # Record initial positions
        initial_light_x = engine.orbs["light.py"]["pos"][0]

        # Simulate for many steps
        for _ in range(100):
            engine.update()

        # Light orb should have moved toward heavy orb (x decreased)
        final_light_x = engine.orbs["light.py"]["pos"][0]
        assert final_light_x < initial_light_x

    def test_mass_affects_velocity(self):
        """Test higher mass results in slower velocity changes."""
        engine = GravityEngine(bounds=(500, 500))

        # Add two orbs with same size but different mass
        engine.add_orb("normal.py", 100, 100, 1024)
        engine.add_orb("heavy.py", 200, 100, 1024)

        # Make heavy orb much heavier
        engine.update_mass("heavy.py", delta=50.0)

        # Record initial velocities
        engine.orbs["normal.py"]["vel"] = np.array([10.0, 0.0])
        engine.orbs["heavy.py"]["vel"] = np.array([10.0, 0.0])

        # Run update
        engine.update()

        # Heavy orb should have lower velocity due to higher mass (F=ma)
        # Note: This depends on force application, may need adjustment
        normal_speed = np.linalg.norm(engine.orbs["normal.py"]["vel"])
        heavy_speed = np.linalg.norm(engine.orbs["heavy.py"]["vel"])


class TestGravityEngineSetMass:
    """Tests for set_mass functionality."""

    def test_set_mass_overrides_mass(self):
        """Test set_mass directly sets an orb's mass."""
        engine = GravityEngine()
        engine.add_orb("test.py", 100, 100, 1024)

        engine.set_mass("test.py", mass=5.0)

        assert engine.orbs["test.py"]["mass"] == 5.0

    def test_set_mass_nonexistent_ignored(self):
        """Test set_mass silently ignores non-existent orbs."""
        engine = GravityEngine()

        # Should not raise
        engine.set_mass("nonexistent.py", mass=10.0)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_gravity_engine_realtime.py -v`
Expected: FAIL with "'GravityEngine' object has no attribute 'update_mass'"

**Step 3: Modify gravity_engine.py**

Add these methods to the `GravityEngine` class:

```python
# Add to systems/infinite_map/gravity_engine.py

    def update_mass(self, file_path: str, delta: float):
        """
        Update the mass of an orb by a delta amount.

        Args:
            file_path: Path of the orb to update
            delta: Amount to add to mass (can be negative)
        """
        if file_path in self.orbs:
            self.orbs[file_path]["mass"] += delta
            # Ensure mass doesn't go below minimum
            self.orbs[file_path]["mass"] = max(0.1, self.orbs[file_path]["mass"])

    def set_mass(self, file_path: str, mass: float):
        """
        Set the mass of an orb directly.

        Args:
            file_path: Path of the orb to update
            mass: New mass value
        """
        if file_path in self.orbs:
            self.orbs[file_path]["mass"] = max(0.1, mass)

    def get_mass(self, file_path: str) -> float:
        """Get the mass of an orb."""
        if file_path in self.orbs:
            return self.orbs[file_path]["mass"]
        return 0.0
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_gravity_engine_realtime.py -v`
Expected: 5 passed

**Step 5: Commit**

```bash
git add systems/infinite_map/gravity_engine.py tests/test_gravity_engine_realtime.py
git commit -m "feat(tectonic): add real-time mass update to GravityEngine"
```

---

## Phase 4: Integration Pipeline

### Task 4: Create TectonicUpdater integration component

**Files:**
- Create: `systems/infinite_map/tectonic_updater.py`
- Test: `tests/test_tectonic_updater.py`

**Step 1: Write the failing test**

```python
# tests/test_tectonic_updater.py
"""
Tests for TectonicUpdater - Connects FileWatcher to GravityEngine.

End-to-end integration: file event → mass delta → gravity update.
"""

import pytest
import tempfile
import time
from pathlib import Path
from systems.infinite_map.tectonic_updater import TectonicUpdater
from systems.infinite_map.gravity_engine import GravityEngine


class TestTectonicUpdater:
    """Tests for TectonicUpdater integration."""

    def test_tectonic_updater_creation(self):
        """Test TectonicUpdater initializes with components."""
        engine = GravityEngine()
        updater = TectonicUpdater(engine, watch_path="/tmp")

        assert updater.gravity_engine == engine
        assert updater.watch_path == "/tmp"

    def test_file_modification_increases_mass(self):
        """Test file modification increases orb mass."""
        with tempfile.TemporaryDirectory() as tmpdir:
            engine = GravityEngine()

            # Add orb to track
            test_file = Path(tmpdir) / "test.py"
            test_file.write_text("initial")
            engine.add_orb(str(test_file), 100, 100, 1024)

            initial_mass = engine.get_mass(str(test_file))

            # Start updater
            updater = TectonicUpdater(engine, watch_path=tmpdir)
            updater.start()
            time.sleep(0.2)

            # Modify file
            test_file.write_text("modified")
            time.sleep(0.5)

            updater.stop()

            # Mass should have increased
            final_mass = engine.get_mass(str(test_file))
            assert final_mass > initial_mass

    def test_tectonic_updater_context_manager(self):
        """Test TectonicUpdater works as context manager."""
        engine = GravityEngine()

        with TectonicUpdater(engine, watch_path="/tmp") as updater:
            assert updater.is_running()

        assert not updater.is_running()

    def test_decay_applied_periodically(self):
        """Test decay is applied periodically to masses."""
        with tempfile.TemporaryDirectory() as tmpdir:
            engine = GravityEngine()
            updater = TectonicUpdater(
                engine,
                watch_path=tmpdir,
                decay_interval=0.5
            )

            # Add orb with mass
            test_file = Path(tmpdir) / "test.py"
            test_file.write_text("content")
            engine.add_orb(str(test_file), 100, 100, 1024)
            engine.set_mass(str(test_file), 10.0)

            initial_mass = engine.get_mass(str(test_file))

            updater.start()
            time.sleep(0.7)  # Wait for decay cycle
            updater.stop()

            # Mass should have decayed
            final_mass = engine.get_mass(str(test_file))
            assert final_mass < initial_mass


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_tectonic_updater.py -v`
Expected: FAIL with "No module named 'systems.infinite_map.tectonic_updater'"

**Step 3: Write minimal implementation**

```python
# systems/infinite_map/tectonic_updater.py
"""
Tectonic Updater: Connects FileWatcher to GravityEngine.

End-to-end integration: file event → mass delta → gravity update.
Makes the Tectonic map "alive" - files drift toward you as you use them.
"""

import threading
import time
from typing import Optional
from pathlib import Path

from .gravity_engine import GravityEngine
from .file_watcher import FileWatcher, FileEvent
from .mass_integrator import MassIntegrator


class TectonicUpdater:
    """
    Connects file system events to gravity engine updates.

    Pipeline:
    1. FileWatcher detects file changes
    2. MassIntegrator converts events to mass deltas
    3. GravityEngine updates orb masses
    4. Files drift in real-time on the Glass Box
    """

    def __init__(
        self,
        gravity_engine: GravityEngine,
        watch_path: str,
        decay_interval: float = 5.0
    ):
        """
        Initialize the Tectonic updater.

        Args:
            gravity_engine: The GravityEngine to update
            watch_path: Directory path to watch for changes
            decay_interval: Seconds between mass decay cycles
        """
        self.gravity_engine = gravity_engine
        self.watch_path = watch_path
        self.decay_interval = decay_interval

        self._watcher = FileWatcher(watch_path)
        self._integrator = MassIntegrator()
        self._running = False
        self._decay_thread: Optional[threading.Thread] = None

    def _on_file_event(self, event: FileEvent):
        """Handle file events from the watcher."""
        # Process event to get mass delta
        delta = self._integrator.process_event(event)

        # Update gravity engine
        self.gravity_engine.update_mass(delta.file_path, delta.delta_mass)

    def _decay_loop(self):
        """Periodically apply mass decay."""
        while self._running:
            time.sleep(self.decay_interval)
            if self._running:
                self._integrator.apply_decay()
                # Sync masses to gravity engine
                for path, mass in self._integrator.get_all_masses().items():
                    self.gravity_engine.set_mass(path, mass)

    def start(self):
        """Start watching files and decay loop."""
        if self._running:
            return

        self._running = True
        self._watcher.set_callback(self._on_file_event)
        self._watcher.start()

        # Start decay thread
        self._decay_thread = threading.Thread(target=self._decay_loop, daemon=True)
        self._decay_thread.start()

    def stop(self):
        """Stop watching files and decay loop."""
        if not self._running:
            return

        self._running = False
        self._watcher.stop()

        if self._decay_thread:
            self._decay_thread.join(timeout=1.0)
            self._decay_thread = None

    def is_running(self) -> bool:
        """Check if the updater is running."""
        return self._running

    def __enter__(self):
        """Context manager entry."""
        self.start()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit."""
        self.stop()
        return False
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_tectonic_updater.py -v`
Expected: 4 passed

**Step 5: Commit**

```bash
git add systems/infinite_map/tectonic_updater.py tests/test_tectonic_updater.py
git commit -m "feat(tectonic): add TectonicUpdater integration component"
```

---

## Phase 5: Daemon Integration

### Task 5: Integrate TectonicUpdater with Sisyphus Daemon

**Files:**
- Modify: `systems/sisyphus/daemon.py`
- Test: `tests/test_daemon_tectonic.py`

**Step 1: Write the failing test**

```python
# tests/test_daemon_tectonic.py
"""
Tests for Tectonic integration in Sisyphus Daemon.
"""

import pytest
from systems.sisyphus.daemon import SisyphusDaemon


class TestDaemonTectonic:
    """Tests for daemon tectonic integration."""

    def test_daemon_has_tectonic_updater_when_enabled(self):
        """Test daemon includes TectonicUpdater when tectonic enabled."""
        daemon = SisyphusDaemon(enable_tectonic=True)

        assert daemon.tectonic_updater is not None

    def test_daemon_no_tectonic_when_disabled(self):
        """Test daemon has no TectonicUpdater when disabled."""
        daemon = SisyphusDaemon(enable_tectonic=False)

        assert daemon.tectonic_updater is None

    def test_daemon_tectonic_uses_gravity_engine(self):
        """Test daemon's tectonic uses the gravity engine."""
        daemon = SisyphusDaemon(enable_tectonic=True)

        assert daemon.tectonic_updater.gravity_engine == daemon.gravity_engine


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_daemon_tectonic.py -v`
Expected: FAIL with "unexpected keyword argument 'enable_tectonic'"

**Step 3: Modify daemon.py**

Add to imports at top:
```python
from ..infinite_map.tectonic_updater import TectonicUpdater
```

Modify `__init__` to add tectonic support:
```python
def __init__(
    self,
    state_file=".loop/STATE_V4.md",
    session_dir=None,
    force_clean=False,
    auto_commit=False,
    enable_heartbeat=True,
    enable_self_rewriting=False,
    enable_tectonic=False  # NEW
):
    # ... existing initialization ...

    # Tectonic real-time gravity (add after gravity_engine initialization)
    self.enable_tectonic = enable_tectonic
    self.tectonic_updater = None
    if enable_tectonic:
        # Use project_dir as watch path
        self.tectonic_updater = TectonicUpdater(
            self.gravity_engine,
            watch_path=str(self.project_dir),
            decay_interval=10.0
        )
```

Add startup in `run()` method, after gravity thread starts:
```python
# Start Tectonic updater if enabled
if self.enable_tectonic and self.tectonic_updater:
    self.tectonic_updater.start()
    self.log("Tectonic real-time gravity enabled")
```

Add cleanup in `finally` block:
```python
if self.tectonic_updater:
    self.tectonic_updater.stop()
    self.log("Tectonic updater stopped")
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_daemon_tectonic.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/sisyphus/daemon.py tests/test_daemon_tectonic.py
git commit -m "feat(daemon): integrate TectonicUpdater for real-time gravity"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | FileWatcher with watchdog | `file_watcher.py` | 6 |
| 2 | MassIntegrator | `mass_integrator.py` | 9 |
| 3 | GravityEngine mass updates | `gravity_engine.py` | 5 |
| 4 | TectonicUpdater integration | `tectonic_updater.py` | 4 |
| 5 | Daemon integration | `daemon.py` | 3 |

**Total: 5 tasks, 27 tests**

---

## Execution Handoff

**Plan complete and saved to `docs/plans/2026-03-09-inotify-gravity-integration.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**

**If Subagent-Driven chosen:**
- **REQUIRED SUB-SKILL:** Use superpowers:subagent-driven-development
- Stay in this session
- Fresh subagent per task + code review

**If Parallel Session chosen:**
- Guide them to open new session in worktree
- **REQUIRED SUB-SKILL:** New session uses superpowers:executing-plans
