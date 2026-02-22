# Evolution Daemon V13 Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add predictive RTS healing and adaptive resource allocation to Evolution Daemon.

**Architecture:** Extend RTSDoctor with a PrognosticsEngine that uses historical data to predict RTS file degradation. Add a MetabolismMonitor that watches system resources and throttles daemon activity.

**Tech Stack:** Python 3.12, scikit-learn, psutil, SQLite, pytest

---

## Prerequisites

Add new dependencies to `requirements.txt`:

```
scikit-learn>=1.3.0     # Predictive modeling
psutil>=5.9.0           # System resource monitoring
```

---

## Task 1: Add Data Structures

**Files:**
- Modify: `systems/evolution_daemon/safety/data_structures.py`

**Step 1: Write the failing test**

Create `systems/evolution_daemon/tests/test_v13_data_structures.py`:

```python
import pytest
from dataclasses import fields
from systems.evolution_daemon.safety.data_structures import (
    HealthPrediction,
    MetabolismState,
    ThrottleLevel
)


class TestHealthPrediction:
    def test_health_prediction_has_required_fields(self):
        prediction = HealthPrediction(
            rts_path="/path/to/file.rts.png",
            predicted_health_score=0.85,
            confidence=0.92,
            predicted_at="2026-02-16T12:00:00",
            horizon_hours=24,
            recommended_action="defragment"
        )
        assert prediction.rts_path == "/path/to/file.rts.png"
        assert prediction.predicted_health_score == 0.85
        assert prediction.confidence == 0.92

    def test_health_prediction_action_is_optional(self):
        prediction = HealthPrediction(
            rts_path="/path/to/file.rts.png",
            predicted_health_score=0.95,
            confidence=0.98,
            predicted_at="2026-02-16T12:00:00",
            horizon_hours=24
        )
        assert prediction.recommended_action is None


class TestMetabolismState:
    def test_metabolism_state_has_resource_fields(self):
        state = MetabolismState(
            cpu_percent=45.0,
            memory_available_mb=2048,
            gpu_percent=30.0,
            throttle_level=ThrottleLevel.NONE
        )
        assert state.cpu_percent == 45.0
        assert state.memory_available_mb == 2048
        assert state.throttle_level == ThrottleLevel.NONE

    def test_throttle_level_values(self):
        assert ThrottleLevel.NONE.value == "none"
        assert ThrottleLevel.MODERATE.value == "moderate"
        assert ThrottleLevel.AGGRESSIVE.value == "aggressive"
```

**Step 2: Run test to verify it fails**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_v13_data_structures.py -v`
Expected: FAIL with "cannot import name 'HealthPrediction'"

**Step 3: Write minimal implementation**

Add to `systems/evolution_daemon/safety/data_structures.py`:

```python
from dataclasses import dataclass
from datetime import datetime
from enum import Enum
from typing import Optional


class ThrottleLevel(str, Enum):
    """Resource throttle levels for daemon adaptation."""
    NONE = "none"
    MODERATE = "moderate"
    AGGRESSIVE = "aggressive"


@dataclass
class HealthPrediction:
    """Predicted health state of an RTS file."""
    rts_path: str
    predicted_health_score: float  # 0.0 to 1.0
    confidence: float  # 0.0 to 1.0
    predicted_at: str  # ISO timestamp
    horizon_hours: int  # Prediction horizon
    recommended_action: Optional[str] = None  # "defragment", "re_generate", etc.


@dataclass
class MetabolismState:
    """Current system resource state for adaptive behavior."""
    cpu_percent: float
    memory_available_mb: float
    gpu_percent: float
    throttle_level: ThrottleLevel
    checked_at: str = ""  # ISO timestamp

    def __post_init__(self):
        if not self.checked_at:
            self.checked_at = datetime.now().isoformat()
```

**Step 4: Run test to verify it passes**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_v13_data_structures.py -v`
Expected: 4 passed

**Step 5: Commit**

```bash
git add systems/evolution_daemon/safety/data_structures.py
git add systems/evolution_daemon/tests/test_v13_data_structures.py
git commit -m "feat(evolution): add V13 data structures for predictions and metabolism"
```

---

## Task 2: Create Prognostics Store

**Files:**
- Create: `systems/evolution_daemon/safety/prognostics_store.py`
- Create: `systems/evolution_daemon/tests/test_prognostics_store.py`

**Step 1: Write the failing test**

Create `systems/evolution_daemon/tests/test_prognostics_store.py`:

```python
import pytest
import tempfile
import os
from datetime import datetime

from systems.evolution_daemon.safety.prognostics_store import PrognosticsStore


class TestPrognosticsStore:
    @pytest.fixture
    def store(self):
        with tempfile.TemporaryDirectory() as tmpdir:
            db_path = os.path.join(tmpdir, "test_prognostics.db")
            yield PrognosticsStore(db_path)

    def test_store_initializes_database(self, store):
        assert store is not None

    def test_log_integrity_check(self, store):
        store.log_integrity_check(
            rts_path="/test/file.rts.png",
            file_size=4096,
            modification_count=5,
            file_age_days=10.5,
            hilbert_locality=0.95,
            mean_entropy=7.2
        )
        history = store.get_history("/test/file.rts.png")
        assert len(history) == 1
        assert history[0]["hilbert_locality"] == 0.95

    def test_get_history_returns_empty_for_unknown_file(self, store):
        history = store.get_history("/nonexistent/file.rts.png")
        assert history == []

    def test_get_all_recent_data(self, store):
        # Log multiple checks
        for i in range(3):
            store.log_integrity_check(
                rts_path=f"/test/file{i}.rts.png",
                file_size=4096,
                modification_count=i,
                file_age_days=10.0 + i,
                hilbert_locality=0.9 - i * 0.1,
                mean_entropy=7.0
            )
        data = store.get_all_recent_data(hours=24)
        assert len(data) == 3

    def test_get_training_data(self, store):
        # Log data for training
        for i in range(10):
            store.log_integrity_check(
                rts_path="/test/file.rts.png",
                file_size=4096,
                modification_count=i,
                file_age_days=float(i),
                hilbert_locality=1.0 - i * 0.05,
                mean_entropy=7.0
            )
        features, targets = store.get_training_data()
        assert len(features) == 9  # n-1 pairs for prediction
        assert len(targets) == 9
```

**Step 2: Run test to verify it fails**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_prognostics_store.py -v`
Expected: FAIL with "No module named 'prognostics_store'"

**Step 3: Write minimal implementation**

Create `systems/evolution_daemon/safety/prognostics_store.py`:

```python
"""
Evolution Daemon V13 - Prognostics Store

SQLite-based storage for historical RTS integrity data.
Used by the PrognosticsEngine for predictive modeling.
"""

import sqlite3
import json
import logging
from datetime import datetime, timedelta
from typing import List, Dict, Any, Tuple, Optional

logger = logging.getLogger("evolution_daemon.prognostics_store")


class PrognosticsStore:
    """Stores and retrieves historical RTS integrity data."""

    def __init__(self, db_path: str):
        self.db_path = db_path
        self._init_database()

    def _init_database(self):
        """Initialize the SQLite database schema."""
        with sqlite3.connect(self.db_path) as conn:
            conn.execute("""
                CREATE TABLE IF NOT EXISTS integrity_history (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    timestamp TEXT NOT NULL,
                    rts_path TEXT NOT NULL,
                    file_size INTEGER,
                    modification_count INTEGER,
                    file_age_days REAL,
                    hilbert_locality REAL,
                    mean_entropy REAL
                )
            """)
            conn.execute("""
                CREATE INDEX IF NOT EXISTS idx_rts_path
                ON integrity_history(rts_path)
            """)
            conn.execute("""
                CREATE INDEX IF NOT EXISTS idx_timestamp
                ON integrity_history(timestamp)
            """)
            conn.commit()
        logger.info(f"PrognosticsStore initialized at {self.db_path}")

    def log_integrity_check(
        self,
        rts_path: str,
        file_size: int,
        modification_count: int,
        file_age_days: float,
        hilbert_locality: float,
        mean_entropy: float
    ):
        """Log an integrity check result to the database."""
        timestamp = datetime.now().isoformat()

        with sqlite3.connect(self.db_path) as conn:
            conn.execute("""
                INSERT INTO integrity_history
                (timestamp, rts_path, file_size, modification_count,
                 file_age_days, hilbert_locality, mean_entropy)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            """, (timestamp, rts_path, file_size, modification_count,
                  file_age_days, hilbert_locality, mean_entropy))
            conn.commit()

        logger.debug(f"Logged integrity check for {rts_path}")

    def get_history(self, rts_path: str, limit: int = 100) -> List[Dict[str, Any]]:
        """Get integrity history for a specific RTS file."""
        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = sqlite3.Row
            cursor = conn.execute("""
                SELECT * FROM integrity_history
                WHERE rts_path = ?
                ORDER BY timestamp DESC
                LIMIT ?
            """, (rts_path, limit))

            return [dict(row) for row in cursor.fetchall()]

    def get_all_recent_data(self, hours: int = 24) -> List[Dict[str, Any]]:
        """Get all integrity data from the last N hours."""
        cutoff = (datetime.now() - timedelta(hours=hours)).isoformat()

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = sqlite3.Row
            cursor = conn.execute("""
                SELECT * FROM integrity_history
                WHERE timestamp >= ?
                ORDER BY timestamp DESC
            """, (cutoff,))

            return [dict(row) for row in cursor.fetchall()]

    def get_training_data(self) -> Tuple[List[List[float]], List[float]]:
        """
        Get data formatted for model training.

        Returns:
            features: List of [file_size, mod_count, age, locality, entropy]
            targets: List of next locality values (what we want to predict)
        """
        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = sqlite3.Row
            cursor = conn.execute("""
                SELECT * FROM integrity_history
                ORDER BY rts_path, timestamp
            """)

            rows = [dict(row) for row in cursor.fetchall()]

        # Group by file and create sequential pairs
        features = []
        targets = []

        # Group by path
        by_path = {}
        for row in rows:
            path = row["rts_path"]
            if path not in by_path:
                by_path[path] = []
            by_path[path].append(row)

        # Create training pairs (current features -> next locality)
        for path, file_rows in by_path.items():
            for i in range(len(file_rows) - 1):
                current = file_rows[i]
                next_row = file_rows[i + 1]

                features.append([
                    current["file_size"] or 0,
                    current["modification_count"] or 0,
                    current["file_age_days"] or 0,
                    current["hilbert_locality"] or 0,
                    current["mean_entropy"] or 0
                ])
                targets.append(next_row["hilbert_locality"] or 0)

        return features, targets
```

**Step 4: Run test to verify it passes**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_prognostics_store.py -v`
Expected: 5 passed

**Step 5: Commit**

```bash
git add systems/evolution_daemon/safety/prognostics_store.py
git add systems/evolution_daemon/tests/test_prognostics_store.py
git commit -m "feat(evolution): add PrognosticsStore for historical RTS data"
```

---

## Task 3: Create Prognostics Engine

**Files:**
- Create: `systems/evolution_daemon/safety/prognostics_engine.py`
- Create: `systems/evolution_daemon/tests/test_prognostics_engine.py`

**Step 1: Write the failing test**

Create `systems/evolution_daemon/tests/test_prognostics_engine.py`:

```python
import pytest
import tempfile
import os
import numpy as np

from systems.evolution_daemon.safety.prognostics_store import PrognosticsStore
from systems.evolution_daemon.safety.prognostics_engine import PrognosticsEngine
from systems.evolution_daemon.safety.data_structures import HealthPrediction


class TestPrognosticsEngine:
    @pytest.fixture
    def engine(self):
        with tempfile.TemporaryDirectory() as tmpdir:
            db_path = os.path.join(tmpdir, "test_prognostics.db")
            store = PrognosticsStore(db_path)
            yield PrognosticsEngine(store)

    @pytest.fixture
    def engine_with_data(self, engine):
        # Add training data with a clear trend
        for i in range(20):
            engine.store.log_integrity_check(
                rts_path="/test/file.rts.png",
                file_size=4096,
                modification_count=i,
                file_age_days=10.0 + i,
                hilbert_locality=1.0 - i * 0.03,  # Declining locality
                mean_entropy=7.0
            )
        return engine

    def test_engine_initializes(self, engine):
        assert engine is not None
        assert engine.model is None  # Not trained yet

    def test_train_model(self, engine_with_data):
        engine_with_data.train()
        assert engine_with_data.model is not None

    def test_predict_returns_prediction(self, engine_with_data):
        engine_with_data.train()
        prediction = engine_with_data.predict(
            rts_path="/test/file.rts.png",
            file_size=4096,
            modification_count=25,
            file_age_days=35.0,
            current_locality=0.4,
            current_entropy=7.0
        )
        assert isinstance(prediction, HealthPrediction)
        assert prediction.rts_path == "/test/file.rts.png"
        assert 0.0 <= prediction.predicted_health_score <= 1.0

    def test_predict_without_training_returns_default(self, engine):
        prediction = engine.predict(
            rts_path="/test/file.rts.png",
            file_size=4096,
            modification_count=5,
            file_age_days=10.0,
            current_locality=0.9,
            current_entropy=7.0
        )
        # Should return current locality when no model
        assert prediction.predicted_health_score == 0.9
        assert prediction.confidence == 0.0

    def test_get_recommended_action_low_locality(self, engine_with_data):
        engine_with_data.train()
        prediction = engine_with_data.predict(
            rts_path="/test/file.rts.png",
            file_size=4096,
            modification_count=25,
            file_age_days=35.0,
            current_locality=0.3,
            current_entropy=7.0
        )
        # Low predicted locality should recommend defragmentation
        if prediction.predicted_health_score < 0.7:
            assert prediction.recommended_action == "defragment"
```

**Step 2: Run test to verify it fails**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_prognostics_engine.py -v`
Expected: FAIL with "No module named 'prognostics_engine'"

**Step 3: Write minimal implementation**

Create `systems/evolution_daemon/safety/prognostics_engine.py`:

```python
"""
Evolution Daemon V13 - Prognostics Engine

Predicts future RTS file health based on historical data.
"""

import logging
from datetime import datetime
from typing import Optional

import numpy as np
from sklearn.linear_model import LinearRegression

from .data_structures import HealthPrediction
from .prognostics_store import PrognosticsStore

logger = logging.getLogger("evolution_daemon.prognostics_engine")


class PrognosticsEngine:
    """Predicts RTS file health using machine learning."""

    def __init__(self, store: PrognosticsStore):
        self.store = store
        self.model: Optional[LinearRegression] = None
        self._training_samples = 0

    def train(self) -> bool:
        """Train the prediction model on historical data."""
        features, targets = self.store.get_training_data()

        if len(features) < 5:
            logger.warning("Not enough data to train model")
            return False

        X = np.array(features)
        y = np.array(targets)

        self.model = LinearRegression()
        self.model.fit(X, y)
        self._training_samples = len(features)

        logger.info(f"Trained model on {self._training_samples} samples")
        return True

    def predict(
        self,
        rts_path: str,
        file_size: int,
        modification_count: int,
        file_age_days: float,
        current_locality: float,
        current_entropy: float,
        horizon_hours: int = 24
    ) -> HealthPrediction:
        """Predict future health of an RTS file."""

        if self.model is None:
            # Return current state with zero confidence if no model
            return HealthPrediction(
                rts_path=rts_path,
                predicted_health_score=current_locality,
                confidence=0.0,
                predicted_at=datetime.now().isoformat(),
                horizon_hours=horizon_hours,
                recommended_action=None
            )

        # Prepare features
        X = np.array([[
            file_size,
            modification_count,
            file_age_days + horizon_hours / 24,  # Projected age
            current_locality,
            current_entropy
        ]])

        # Predict
        predicted_score = float(self.model.predict(X)[0])

        # Clamp to valid range
        predicted_score = max(0.0, min(1.0, predicted_score))

        # Calculate confidence based on training data size
        confidence = min(0.95, self._training_samples / 100)

        # Determine recommended action
        recommended_action = None
        if predicted_score < 0.5:
            recommended_action = "re_generate"
        elif predicted_score < 0.7:
            recommended_action = "defragment"

        return HealthPrediction(
            rts_path=rts_path,
            predicted_health_score=predicted_score,
            confidence=confidence,
            predicted_at=datetime.now().isoformat(),
            horizon_hours=horizon_hours,
            recommended_action=recommended_action
        )
```

**Step 4: Run test to verify it passes**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_prognostics_engine.py -v`
Expected: 5 passed

**Step 5: Commit**

```bash
git add systems/evolution_daemon/safety/prognostics_engine.py
git add systems/evolution_daemon/tests/test_prognostics_engine.py
git commit -m "feat(evolution): add PrognosticsEngine for RTS health prediction"
```

---

## Task 4: Create Metabolism Monitor

**Files:**
- Create: `systems/evolution_daemon/safety/metabolism_monitor.py`
- Create: `systems/evolution_daemon/tests/test_metabolism_monitor.py`

**Step 1: Write the failing test**

Create `systems/evolution_daemon/tests/test_metabolism_monitor.py`:

```python
import pytest
from unittest.mock import patch, MagicMock

from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor
from systems.evolution_daemon.safety.data_structures import ThrottleLevel


class TestMetabolismMonitor:
    @pytest.fixture
    def monitor(self):
        return MetabolismMonitor()

    @patch('psutil.cpu_percent')
    @patch('psutil.virtual_memory')
    def test_check_returns_state(self, mock_memory, mock_cpu, monitor):
        mock_cpu.return_value = 45.0
        mock_memory.return_value = MagicMock(available=2048 * 1024 * 1024)

        state = monitor.check()
        assert state.cpu_percent == 45.0
        assert state.memory_available_mb == 2048

    @patch('psutil.cpu_percent')
    @patch('psutil.virtual_memory')
    def test_throttle_none_when_low_usage(self, mock_memory, mock_cpu, monitor):
        mock_cpu.return_value = 30.0
        mock_memory.return_value = MagicMock(available=4000 * 1024 * 1024)

        state = monitor.check()
        assert state.throttle_level == ThrottleLevel.NONE

    @patch('psutil.cpu_percent')
    @patch('psutil.virtual_memory')
    def test_throttle_moderate_when_medium_usage(self, mock_memory, mock_cpu, monitor):
        mock_cpu.return_value = 70.0
        mock_memory.return_value = MagicMock(available=1000 * 1024 * 1024)

        state = monitor.check()
        assert state.throttle_level == ThrottleLevel.MODERATE

    @patch('psutil.cpu_percent')
    @patch('psutil.virtual_memory')
    def test_throttle_aggressive_when_high_usage(self, mock_memory, mock_cpu, monitor):
        mock_cpu.return_value = 90.0
        mock_memory.return_value = MagicMock(available=100 * 1024 * 1024)

        state = monitor.check()
        assert state.throttle_level == ThrottleLevel.AGGRESSIVE

    def test_should_defer_task_none(self, monitor):
        from systems.evolution_daemon.safety.data_structures import MetabolismState
        state = MetabolismState(
            cpu_percent=30.0,
            memory_available_mb=4000,
            gpu_percent=20.0,
            throttle_level=ThrottleLevel.NONE
        )
        assert monitor.should_defer_task(state, "model_training") is False

    def test_should_defer_task_aggressive(self, monitor):
        from systems.evolution_daemon.safety.data_structures import MetabolismState
        state = MetabolismState(
            cpu_percent=90.0,
            memory_available_mb=100,
            gpu_percent=85.0,
            throttle_level=ThrottleLevel.AGGRESSIVE
        )
        assert monitor.should_defer_task(state, "model_training") is True
        assert monitor.should_defer_task(state, "lightweight_check") is False
```

**Step 2: Run test to verify it fails**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_metabolism_monitor.py -v`
Expected: FAIL with "No module named 'metabolism_monitor'"

**Step 3: Write minimal implementation**

Create `systems/evolution_daemon/safety/metabolism_monitor.py`:

```python
"""
Evolution Daemon V13 - Metabolism Monitor

Monitors system resources and determines throttle levels
for adaptive daemon behavior.
"""

import logging
from typing import Set

import psutil

from .data_structures import MetabolismState, ThrottleLevel

logger = logging.getLogger("evolution_daemon.metabolism_monitor")


class MetabolismMonitor:
    """Monitors system resources for adaptive daemon behavior."""

    # Resource thresholds
    CPU_MODERATE_THRESHOLD = 60.0
    CPU_AGGRESSIVE_THRESHOLD = 80.0
    MEMORY_MODERATE_MB = 500
    MEMORY_AGGRESSIVE_MB = 200

    # Tasks that can be deferred under load
    DEFERRABLE_TASKS: Set[str] = {
        "model_training",
        "proactive_healing",
        "integrity_analysis",
        "large_file_processing"
    }

    def __init__(self):
        self._last_state: MetabolismState = None

    def check(self) -> MetabolismState:
        """Check current system resources and return state."""
        # Get CPU usage
        cpu_percent = psutil.cpu_percent(interval=0.1)

        # Get memory info
        memory = psutil.virtual_memory()
        memory_available_mb = memory.available / (1024 * 1024)

        # Get GPU usage (placeholder - would need nvidia-ml-py)
        gpu_percent = 0.0

        # Determine throttle level
        throttle_level = self._calculate_throttle(cpu_percent, memory_available_mb)

        state = MetabolismState(
            cpu_percent=cpu_percent,
            memory_available_mb=memory_available_mb,
            gpu_percent=gpu_percent,
            throttle_level=throttle_level
        )

        self._last_state = state
        logger.debug(f"Metabolism check: CPU={cpu_percent:.1f}%, MEM={memory_available_mb:.0f}MB, throttle={throttle_level.value}")

        return state

    def _calculate_throttle(self, cpu: float, memory_mb: float) -> ThrottleLevel:
        """Determine throttle level based on resource usage."""
        # Check for aggressive conditions
        if cpu >= self.CPU_AGGRESSIVE_THRESHOLD or memory_mb <= self.MEMORY_AGGRESSIVE_MB:
            return ThrottleLevel.AGGRESSIVE

        # Check for moderate conditions
        if cpu >= self.CPU_MODERATE_THRESHOLD or memory_mb <= self.MEMORY_MODERATE_MB:
            return ThrottleLevel.MODERATE

        return ThrottleLevel.NONE

    def should_defer_task(self, state: MetabolismState, task_type: str) -> bool:
        """Determine if a task should be deferred based on current load."""
        if state.throttle_level == ThrottleLevel.NONE:
            return False

        if state.throttle_level == ThrottleLevel.AGGRESSIVE:
            # Defer all deferrable tasks
            return task_type in self.DEFERRABLE_TASKS

        if state.throttle_level == ThrottleLevel.MODERATE:
            # Defer only heavy tasks
            return task_type in {"model_training", "large_file_processing"}

        return False

    def get_evolution_delay_ms(self, state: MetabolismState) -> int:
        """Get recommended delay between evolution cycles in milliseconds."""
        if state.throttle_level == ThrottleLevel.AGGRESSIVE:
            return 10000  # 10 seconds
        elif state.throttle_level == ThrottleLevel.MODERATE:
            return 5000   # 5 seconds
        return 1000       # 1 second (normal)
```

**Step 4: Run test to verify it passes**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_metabolism_monitor.py -v`
Expected: 6 passed

**Step 5: Commit**

```bash
git add systems/evolution_daemon/safety/metabolism_monitor.py
git add systems/evolution_daemon/tests/test_metabolism_monitor.py
git commit -m "feat(evolution): add MetabolismMonitor for adaptive resource usage"
```

---

## Task 5: Integrate with RTSDoctor

**Files:**
- Modify: `systems/evolution_daemon/safety/rts_doctor.py`
- Modify: `systems/evolution_daemon/tests/test_rts_doctor.py`

**Step 1: Write the failing test**

Add to `systems/evolution_daemon/tests/test_rts_doctor.py`:

```python
import os
import tempfile

def test_rts_doctor_logs_to_prognostics_store():
    """Test that RTSDoctor logs integrity checks for predictions."""
    with tempfile.TemporaryDirectory() as tmpdir:
        db_path = os.path.join(tmpdir, "test.db")
        doctor = RTSDoctor(prognostics_db_path=db_path)

        # Create test files
        rts_path = os.path.join(tmpdir, "test.rts.png")
        meta_path = os.path.join(tmpdir, "test.rts.meta.json")

        Image.new('RGBA', (32, 32)).save(rts_path)
        import json
        import hashlib
        with open(rts_path, 'rb') as f:
            hash_val = hashlib.sha256(f.read()).hexdigest()
        with open(meta_path, 'w') as f:
            json.dump({"sha256": hash_val}, f)

        # Run integrity check
        import asyncio
        result = asyncio.run(doctor.check_integrity(rts_path, meta_path))

        # Verify data was logged
        assert doctor._prognostics_store is not None
        history = doctor._prognostics_store.get_history(rts_path)
        assert len(history) == 1

def test_rts_doctor_predicts_health():
    """Test that RTSDoctor can predict future health."""
    with tempfile.TemporaryDirectory() as tmpdir:
        db_path = os.path.join(tmpdir, "test.db")
        doctor = RTSDoctor(prognostics_db_path=db_path)

        # Add some historical data
        for i in range(10):
            doctor._prognostics_store.log_integrity_check(
                rts_path="/test/file.rts.png",
                file_size=4096,
                modification_count=i,
                file_age_days=10.0 + i,
                hilbert_locality=1.0 - i * 0.05,
                mean_entropy=7.0
            )

        # Train and predict
        doctor._prognostics_engine.train()
        prediction = doctor.predict_health("/test/file.rts.png")

        assert prediction is not None
        assert 0.0 <= prediction.predicted_health_score <= 1.0
```

**Step 2: Run test to verify it fails**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_rts_doctor.py::test_rts_doctor_logs_to_prognostics_store -v`
Expected: FAIL with "unexpected keyword argument 'prognostics_db_path'"

**Step 3: Write minimal implementation**

Modify `systems/evolution_daemon/safety/rts_doctor.py` - update `__init__` and add methods:

```python
# Add imports at top
from .prognostics_store import PrognosticsStore
from .prognostics_engine import PrognosticsEngine
from .data_structures import HealthPrediction

# Update __init__ method
def __init__(self, prognostics_db_path: str = None):
    logger.info("🩺 RTS Doctor initialized.")

    # Initialize prognostics if path provided
    if prognostics_db_path:
        self._prognostics_store = PrognosticsStore(prognostics_db_path)
        self._prognostics_engine = PrognosticsEngine(self._prognostics_store)
    else:
        self._prognostics_store = None
        self._prognostics_engine = None

# Add to check_integrity method (after all checks, before return):
if self._prognostics_store:
    self._prognostics_store.log_integrity_check(
        rts_path=rts_path,
        file_size=os.path.getsize(rts_path) if os.path.exists(rts_path) else 0,
        modification_count=0,  # Would need external tracking
        file_age_days=0,      # Would need external tracking
        hilbert_locality=locality_score_result.get("score", 1.0),
        mean_entropy=self._extract_mean_entropy(entropy_result)
    )

# Add new methods:
def _extract_mean_entropy(self, entropy_result: Dict[str, Any]) -> float:
    """Extract mean entropy from analysis result."""
    details = entropy_result.get("details", "")
    if "Mean entropy:" in details:
        try:
            return float(details.split("Mean entropy:")[1].strip())
        except (IndexError, ValueError):
            pass
    return 7.0  # Default entropy

def predict_health(self, rts_path: str, horizon_hours: int = 24) -> Optional[HealthPrediction]:
    """Predict future health of an RTS file."""
    if not self._prognostics_engine:
        return None

    # Get latest data for this file
    history = self._prognostics_store.get_history(rts_path, limit=1)
    if not history:
        return None

    latest = history[0]
    return self._prognostics_engine.predict(
        rts_path=rts_path,
        file_size=latest.get("file_size", 0),
        modification_count=latest.get("modification_count", 0),
        file_age_days=latest.get("file_age_days", 0),
        current_locality=latest.get("hilbert_locality", 1.0),
        current_entropy=latest.get("mean_entropy", 7.0),
        horizon_hours=horizon_hours
    )
```

**Step 4: Run test to verify it passes**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_rts_doctor.py -v`
Expected: All tests pass (15 total)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/safety/rts_doctor.py
git add systems/evolution_daemon/tests/test_rts_doctor.py
git commit -m "feat(evolution): integrate prognostics into RTSDoctor"
```

---

## Task 6: Update Safety Package Exports

**Files:**
- Modify: `systems/evolution_daemon/safety/__init__.py`

**Step 1: Update exports**

Add to `systems/evolution_daemon/safety/__init__.py`:

```python
from .prognostics_store import PrognosticsStore
from .prognostics_engine import PrognosticsEngine
from .metabolism_monitor import MetabolismMonitor
from .data_structures import (
    # ... existing exports ...
    HealthPrediction,
    MetabolismState,
    ThrottleLevel
)

__all__ = [
    # ... existing exports ...
    "PrognosticsStore",
    "PrognosticsEngine",
    "MetabolismMonitor",
    "HealthPrediction",
    "MetabolismState",
    "ThrottleLevel",
]
```

**Step 2: Run all V13 tests**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/test_v13_data_structures.py systems/evolution_daemon/tests/test_prognostics_store.py systems/evolution_daemon/tests/test_prognostics_engine.py systems/evolution_daemon/tests/test_metabolism_monitor.py -v`
Expected: 18 passed

**Step 3: Run full test suite**

Run: `.venv/bin/python3 -m pytest systems/evolution_daemon/tests/ systems/evolution_daemon/heartbeat_tests/ -v --tb=short`
Expected: 125 passed

**Step 4: Commit**

```bash
git add systems/evolution_daemon/safety/__init__.py
git commit -m "feat(evolution): export V13 components from safety package"
```

---

## Summary

| Task | Files | Tests |
|------|-------|-------|
| 1. Data Structures | 2 | 4 |
| 2. Prognostics Store | 2 | 5 |
| 3. Prognostics Engine | 2 | 5 |
| 4. Metabolism Monitor | 2 | 6 |
| 5. RTSDoctor Integration | 2 | 2 |
| 6. Package Exports | 1 | 0 |
| **Total** | **11** | **22** |

**Expected Final State:**
- V13 tests: 22 new
- Total tests: 129 (107 V12 + 22 V13)
- All tests passing
