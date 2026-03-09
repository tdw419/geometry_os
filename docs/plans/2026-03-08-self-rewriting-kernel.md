# Self-Rewriting Kernel Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable the Sisyphus Daemon to rewrite native Rust kernels in real-time based on performance hot-spot detection and token-stream analysis.

**Architecture:** Performance Monitor detects hot paths in GeoASM kernels → Daemon receives optimization proposals → LLM generates optimized Rust code → Hot-swap system applies changes → Glass Box visualizes the transformation.

**Tech Stack:** Python (daemon/monitor), Rust (kernels), FFI bridge, WGSL (visualization), LM Studio (code generation)

---

## Phase 1: Performance Hot-Spot Detection

### Task 1: Create Performance Monitor Module

**Files:**
- Create: `systems/sisyphus/performance_monitor.py`
- Test: `tests/test_performance_monitor.py`

**Step 1: Write the failing test**

```python
# tests/test_performance_monitor.py
import pytest
import time
from systems.sisyphus.performance_monitor import PerformanceMonitor, HotSpot

class TestPerformanceMonitor:
    def setup_method(self):
        self.monitor = PerformanceMonitor()

    def test_record_call(self):
        """Test recording a function call."""
        self.monitor.record_call("hilbert_d2xy", duration_ms=0.5)
        assert self.monitor.call_counts["hilbert_d2xy"] == 1

    def test_hot_spot_detection(self):
        """Test detecting a hot spot based on call frequency."""
        # Record 1000 fast calls
        for _ in range(1000):
            self.monitor.record_call("hot_function", duration_ms=0.1)

        # Record 10 slow calls
        for _ in range(10):
            self.monitor.record_call("slow_function", duration_ms=50.0)

        hot_spots = self.monitor.detect_hot_spots(threshold_calls=100, threshold_time_ms=10.0)

        assert len(hot_spots) >= 1
        assert any(s.function_name == "slow_function" for s in hot_spots)

    def test_hot_spot_has_location(self):
        """Test that hot spots include source location."""
        self.monitor.register_function("test_func", file="test.rs", line=42)
        self.monitor.record_call("test_func", duration_ms=100.0)

        hot_spots = self.monitor.detect_hot_spots(threshold_calls=1, threshold_time_ms=50.0)

        assert len(hot_spots) == 1
        assert hot_spots[0].source_file == "test.rs"
        assert hot_spots[0].source_line == 42

if __name__ == "__main__":
    pytest.main([__file__])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_performance_monitor.py -v`
Expected: FAIL with "No module named 'systems.sisyphus.performance_monitor'"

**Step 3: Write minimal implementation**

```python
# systems/sisyphus/performance_monitor.py
"""
Performance Monitor: Detects hot spots in native kernels for self-rewriting.
"""

import time
import threading
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple
from collections import defaultdict

@dataclass
class HotSpot:
    """Represents a performance hot spot in native code."""
    function_name: str
    call_count: int
    total_time_ms: float
    avg_time_ms: float
    source_file: Optional[str] = None
    source_line: Optional[int] = None

    @property
    def hotspot_score(self) -> float:
        """Higher score = more urgent to optimize."""
        return self.call_count * self.avg_time_ms

class PerformanceMonitor:
    """
    Monitors native kernel performance and detects hot spots.

    Used by the daemon to identify functions that would benefit from
    real-time rewriting based on usage patterns.
    """

    def __init__(self):
        self._lock = threading.Lock()
        self.call_counts: Dict[str, int] = defaultdict(int)
        self.call_times: Dict[str, List[float]] = defaultdict(list)
        self.function_locations: Dict[str, Tuple[str, int]] = {}

    def register_function(self, name: str, file: str, line: int):
        """Register source location for a function."""
        with self._lock:
            self.function_locations[name] = (file, line)

    def record_call(self, function_name: str, duration_ms: float):
        """Record a function call and its duration."""
        with self._lock:
            self.call_counts[function_name] += 1
            self.call_times[function_name].append(duration_ms)

            # Keep only last 1000 samples per function
            if len(self.call_times[function_name]) > 1000:
                self.call_times[function_name] = self.call_times[function_name][-1000:]

    def detect_hot_spots(
        self,
        threshold_calls: int = 100,
        threshold_time_ms: float = 10.0,
        max_results: int = 10
    ) -> List[HotSpot]:
        """
        Detect hot spots based on call frequency and duration.

        Args:
            threshold_calls: Minimum calls to consider
            threshold_time_ms: Minimum average time to consider
            max_results: Maximum number of hot spots to return

        Returns:
            List of HotSpot objects sorted by urgency
        """
        hot_spots = []

        with self._lock:
            for func_name, count in self.call_counts.items():
                if count < threshold_calls:
                    continue

                times = self.call_times[func_name]
                if not times:
                    continue

                avg_time = sum(times) / len(times)
                if avg_time < threshold_time_ms:
                    continue

                location = self.function_locations.get(func_name, (None, None))

                hot_spots.append(HotSpot(
                    function_name=func_name,
                    call_count=count,
                    total_time_ms=sum(times),
                    avg_time_ms=avg_time,
                    source_file=location[0],
                    source_line=location[1]
                ))

        # Sort by hotspot score (urgency)
        hot_spots.sort(key=lambda h: h.hotspot_score, reverse=True)
        return hot_spots[:max_results]

    def clear_stats(self):
        """Clear all collected statistics."""
        with self._lock:
            self.call_counts.clear()
            self.call_times.clear()
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_performance_monitor.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/sisyphus/performance_monitor.py tests/test_performance_monitor.py
git commit -m "feat(monitor): add performance hot-spot detection for self-rewriting kernels"
```

---

### Task 2: Add FFI Performance Instrumentation

**Files:**
- Modify: `systems/sisyphus/native_hilbert.py`
- Test: `tests/test_native_hilbert_instrumented.py`

**Step 1: Write the failing test**

```python
# tests/test_native_hilbert_instrumented.py
import pytest
from systems.sisyphus.native_hilbert import NativeHilbertLUT
from systems.sisyphus.performance_monitor import PerformanceMonitor

class TestInstrumentedHilbert:
    def test_performance_monitoring_enabled(self):
        """Test that hilbert calls are recorded in performance monitor."""
        monitor = PerformanceMonitor()
        hilbert = NativeHilbertLUT(performance_monitor=monitor)

        # Make some calls
        for i in range(100):
            hilbert.d2xy(256, i)

        # Verify calls were recorded
        assert monitor.call_counts.get("d2xy", 0) == 100

    def test_hot_spot_detection_after_usage(self):
        """Test that heavy usage creates detectable hot spots."""
        monitor = PerformanceMonitor()
        hilbert = NativeHilbertLUT(performance_monitor=monitor)

        # Heavy usage
        for i in range(10000):
            hilbert.d2xy(256, i % 65536)
            hilbert.xy2d(256, i % 256, (i // 256) % 256)

        hot_spots = monitor.detect_hot_spots(threshold_calls=100, threshold_time_ms=0.0)

        assert len(hot_spots) >= 1
        assert "d2xy" in [h.function_name for h in hot_spots]

if __name__ == "__main__":
    pytest.main([__file__])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_native_hilbert_instrumented.py -v`
Expected: FAIL with "unexpected keyword argument 'performance_monitor'"

**Step 3: Modify native_hilbert.py**

```python
# systems/sisyphus/native_hilbert.py (add at top and modify __init__)
import time
import ctypes
from pathlib import Path
from typing import Optional, TYPE_CHECKING

if TYPE_CHECKING:
    from .performance_monitor import PerformanceMonitor

class NativeHilbertLUT:
    """Native Hilbert curve operations with performance instrumentation."""

    def __init__(self, performance_monitor: Optional["PerformanceMonitor"] = None):
        self._lib = None
        self._monitor = performance_monitor
        self._load_native_library()

    def _load_native_library(self):
        """Load the native Hilbert library."""
        # ... existing loading code ...

    def _record_call(self, func_name: str, duration_ms: float):
        """Record a call to the performance monitor if available."""
        if self._monitor:
            self._monitor.record_call(func_name, duration_ms)

    def d2xy(self, n: int, d: int) -> tuple:
        """Convert Hilbert distance to (x, y) coordinates."""
        start = time.perf_counter()
        try:
            # ... existing implementation ...
            x = self._lib.hilbert_d2xy(n, d)
            y = self._lib.hilbert_d2xy_y(n, d)  # Assuming separate y call
            return (x, y)
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("d2xy", duration_ms)

    def xy2d(self, n: int, x: int, y: int) -> int:
        """Convert (x, y) coordinates to Hilbert distance."""
        start = time.perf_counter()
        try:
            result = self._lib.hilbert_xy2d(n, x, y)
            return result
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("xy2d", duration_ms)
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_native_hilbert_instrumented.py -v`
Expected: 2 passed

**Step 5: Commit**

```bash
git add systems/sisyphus/native_hilbert.py tests/test_native_hilbert_instrumented.py
git commit -m "feat(hilbert): add performance instrumentation to native FFI calls"
```

---

## Phase 2: Code Generation Pipeline

### Task 3: Create Kernel Rewriter Module

**Files:**
- Create: `systems/sisyphus/kernel_rewriter.py`
- Test: `tests/test_kernel_rewriter.py`

**Step 1: Write the failing test**

```python
# tests/test_kernel_rewriter.py
import pytest
from systems.sisyphus.kernel_rewriter import KernelRewriter, RewriteProposal
from systems.sisyphus.performance_monitor import HotSpot

class TestKernelRewriter:
    def setup_method(self):
        self.rewriter = KernelRewriter()

    def test_generate_optimization_prompt(self):
        """Test generating an LLM prompt for optimization."""
        hot_spot = HotSpot(
            function_name="hilbert_d2xy",
            call_count=10000,
            total_time_ms=5000.0,
            avg_time_ms=0.5,
            source_file="hilbert_native.rs",
            source_line=42
        )

        prompt = self.rewriter.generate_optimization_prompt(hot_spot)

        assert "hilbert_d2xy" in prompt
        assert "10000 calls" in prompt
        assert "0.5 ms" in prompt
        assert "Rust" in prompt or "rust" in prompt

    def test_parse_generated_code(self):
        """Test parsing LLM-generated Rust code."""
        llm_response = """
Here's an optimized version:

```rust
fn hilbert_d2xy_optimized(n: u32, d: u32) -> (u32, u32) {
    // Optimized using lookup table
    let x = d % n;
    let y = d / n;
    (x, y)
}
```
"""

        code = self.rewriter.extract_code_block(llm_response, language="rust")

        assert "fn hilbert_d2xy_optimized" in code
        assert "```" not in code  # Should strip markdown

    def test_validate_rust_syntax(self):
        """Test basic Rust syntax validation."""
        valid_code = "fn test() -> i32 { 42 }"
        invalid_code = "fn test( -> i32 { missing paren"

        assert self.rewriter.validate_syntax(valid_code, language="rust") == True
        assert self.rewriter.validate_syntax(invalid_code, language="rust") == False

if __name__ == "__main__":
    pytest.main([__file__])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_kernel_rewriter.py -v`
Expected: FAIL with "No module named 'systems.sisyphus.kernel_rewriter'"

**Step 3: Write minimal implementation**

```python
# systems/sisyphus/kernel_rewriter.py
"""
Kernel Rewriter: Generates optimized native code using LLM.

Part of the Self-Rewriting Kernel architecture where the daemon
detects hot spots and generates optimized replacements.
"""

import re
import subprocess
import tempfile
from dataclasses import dataclass
from typing import Optional, List
from pathlib import Path

from .performance_monitor import HotSpot

@dataclass
class RewriteProposal:
    """A proposed kernel rewrite."""
    original_function: str
    optimized_code: str
    source_file: str
    source_line: int
    expected_speedup: float
    confidence: float  # 0.0 - 1.0

class KernelRewriter:
    """
    Generates optimized native code using LLM assistance.

    Workflow:
    1. Receive hot spot from PerformanceMonitor
    2. Generate optimization prompt
    3. Send to LM Studio for code generation
    4. Parse and validate generated code
    5. Create RewriteProposal for hot-swap system
    """

    def __init__(self, lm_studio_url: str = "http://localhost:1234"):
        self.lm_studio_url = lm_studio_url
        self.template_dir = Path("systems/sisyphus/rewrite_templates")

    def generate_optimization_prompt(self, hot_spot: HotSpot) -> str:
        """Generate an LLM prompt for optimizing a hot spot."""
        return f"""You are a Rust optimization expert. Optimize this function that is a performance hot spot.

Function: {hot_spot.function_name}
Location: {hot_spot.source_file}:{hot_spot.source_line}
Call Count: {hot_spot.call_count:,}
Average Duration: {hot_spot.avg_time_ms:.3f} ms
Total Time: {hot_spot.total_time_ms:.1f} ms

Requirements:
1. Maintain exact same function signature
2. Optimize for the specific usage pattern
3. Use idiomatic Rust
4. Add inline comments explaining optimizations

Respond with ONLY the optimized Rust function in a code block.
"""

    def extract_code_block(self, text: str, language: str = "rust") -> str:
        """Extract code block from LLM response."""
        # Match ```language ... ``` or ``` ... ```
        pattern = rf"```{language}?\s*\n(.*?)\n```"
        match = re.search(pattern, text, re.DOTALL)
        if match:
            return match.group(1).strip()

        # Fallback: try to find any code block
        pattern = r"```\s*\n(.*?)\n```"
        match = re.search(pattern, text, re.DOTALL)
        if match:
            return match.group(1).strip()

        return ""

    def validate_syntax(self, code: str, language: str = "rust") -> bool:
        """Basic syntax validation for generated code."""
        if language == "rust":
            # Check for basic Rust syntax patterns
            if not re.search(r"fn\s+\w+", code):
                return False
            if code.count("{") != code.count("}"):
                return False
            if code.count("(") != code.count(")"):
                return False
            return True

        # Unknown language - assume valid
        return True

    def create_proposal(
        self,
        hot_spot: HotSpot,
        optimized_code: str,
        confidence: float = 0.8
    ) -> RewriteProposal:
        """Create a rewrite proposal from generated code."""
        # Estimate speedup based on call patterns
        expected_speedup = 2.0  # Conservative default

        return RewriteProposal(
            original_function=hot_spot.function_name,
            optimized_code=optimized_code,
            source_file=hot_spot.source_file or "unknown.rs",
            source_line=hot_spot.source_line or 0,
            expected_speedup=expected_speedup,
            confidence=confidence
        )
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_kernel_rewriter.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/sisyphus/kernel_rewriter.py tests/test_kernel_rewriter.py
git commit -m "feat(rewriter): add kernel rewriter with LLM code generation"
```

---

### Task 4: Integrate LM Studio for Code Generation

**Files:**
- Modify: `systems/sisyphus/kernel_rewriter.py`
- Test: `tests/test_kernel_rewriter.py` (add tests)

**Step 1: Add failing test**

```python
# Add to tests/test_kernel_rewriter.py

class TestKernelRewriterLLM:
    def test_generate_with_lm_studio(self):
        """Test generating code via LM Studio API."""
        import responses  # Mock HTTP responses

        rewriter = KernelRewriter()

        # Mock LM Studio response
        mock_response = {
            "choices": [{
                "text": "```rust\nfn optimized() -> i32 { 42 }\n```"
            }]
        }

        with responses.RequestsMock() as rsps:
            rsps.add(
                responses.POST,
                "http://localhost:1234/v1/completions",
                json=mock_response,
                status=200
            )

            hot_spot = HotSpot(
                function_name="test_func",
                call_count=1000,
                total_time_ms=100.0,
                avg_time_ms=0.1
            )

            code = rewriter.generate_optimized_code(hot_spot)

            assert "fn optimized" in code
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_kernel_rewriter.py::TestKernelRewriterLLM -v`
Expected: FAIL (responses not mocked or method not implemented)

**Step 3: Add LLM integration method**

```python
# Add to systems/sisyphus/kernel_rewriter.py

import requests
import json

class KernelRewriter:
    # ... existing code ...

    def generate_optimized_code(
        self,
        hot_spot: HotSpot,
        model: str = "local-model",
        max_tokens: int = 1000
    ) -> str:
        """
        Generate optimized code using LM Studio.

        Args:
            hot_spot: The performance hot spot to optimize
            model: Model name (ignored for LM Studio)
            max_tokens: Maximum tokens to generate

        Returns:
            Extracted code block from LLM response
        """
        prompt = self.generate_optimization_prompt(hot_spot)

        try:
            response = requests.post(
                f"{self.lm_studio_url}/v1/completions",
                json={
                    "prompt": prompt,
                    "max_tokens": max_tokens,
                    "temperature": 0.3,  # Low temperature for code
                    "stop": ["```"]  # Stop at code block end
                },
                timeout=30
            )

            if response.status_code == 200:
                data = response.json()
                text = data.get("choices", [{}])[0].get("text", "")
                return self.extract_code_block(text, language="rust")

        except requests.RequestException as e:
            print(f"LM Studio request failed: {e}")

        return ""
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pip install responses && python3 -m pytest tests/test_kernel_rewriter.py -v`
Expected: 4+ passed

**Step 5: Commit**

```bash
git add systems/sisyphus/kernel_rewriter.py tests/test_kernel_rewriter.py
git commit -m "feat(rewriter): integrate LM Studio for code generation"
```

---

## Phase 3: Hot-Swap System

### Task 5: Create Hot-Swap Manager

**Files:**
- Create: `systems/sisyphus/hot_swap_manager.py`
- Test: `tests/test_hot_swap_manager.py`

**Step 1: Write the failing test**

```python
# tests/test_hot_swap_manager.py
import pytest
import tempfile
from pathlib import Path
from systems.sisyphus.hot_swap_manager import HotSwapManager
from systems.sisyphus.kernel_rewriter import RewriteProposal

class TestHotSwapManager:
    def setup_method(self):
        self.temp_dir = tempfile.mkdtemp()
        self.manager = HotSwapManager(backup_dir=self.temp_dir)

    def test_create_backup(self):
        """Test creating a backup of original code."""
        test_file = Path(self.temp_dir) / "test.rs"
        test_file.write_text("fn original() {}")

        backup_path = self.manager.create_backup(str(test_file))

        assert Path(backup_path).exists()
        assert Path(backup_path).read_text() == "fn original() {}"

    def test_apply_rewrite(self):
        """Test applying a rewrite proposal."""
        test_file = Path(self.temp_dir) / "target.rs"
        test_file.write_text("""
fn old_function() -> i32 {
    1
}
""")

        proposal = RewriteProposal(
            original_function="old_function",
            optimized_code="fn old_function() -> i32 { 2 }",
            source_file=str(test_file),
            source_line=1,
            expected_speedup=2.0,
            confidence=0.9
        )

        success = self.manager.apply_rewrite(proposal)

        assert success == True
        content = test_file.read_text()
        assert "fn old_function() -> i32 { 2 }" in content

    def test_rollback(self):
        """Test rolling back a rewrite."""
        test_file = Path(self.temp_dir) / "rollback.rs"
        test_file.write_text("fn target() { original }")

        backup = self.manager.create_backup(str(test_file))

        # Modify file
        test_file.write_text("fn target() { modified }")

        # Rollback
        self.manager.rollback(str(test_file), backup)

        assert "original" in test_file.read_text()

if __name__ == "__main__":
    pytest.main([__file__])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_hot_swap_manager.py -v`
Expected: FAIL with "No module named 'systems.sisyphus.hot_swap_manager'"

**Step 3: Write minimal implementation**

```python
# systems/sisyphus/hot_swap_manager.py
"""
Hot-Swap Manager: Safely applies kernel rewrites with rollback capability.

Part of the Self-Rewriting Kernel architecture.
"""

import shutil
import re
from pathlib import Path
from datetime import datetime
from typing import Optional, List
from dataclasses import dataclass, field

from .kernel_rewriter import RewriteProposal

@dataclass
class AppliedRewrite:
    """Record of an applied rewrite."""
    proposal: RewriteProposal
    backup_path: str
    applied_at: datetime = field(default_factory=datetime.now)
    rolled_back: bool = False

class HotSwapManager:
    """
    Manages safe application of kernel rewrites.

    Features:
    - Automatic backup before changes
    - Atomic file updates
    - Rollback capability
    - History tracking
    """

    def __init__(self, backup_dir: str = ".loop/hot_swap_backups"):
        self.backup_dir = Path(backup_dir)
        self.backup_dir.mkdir(parents=True, exist_ok=True)
        self.history: List[AppliedRewrite] = []

    def create_backup(self, file_path: str) -> str:
        """
        Create a timestamped backup of a file.

        Returns:
            Path to the backup file
        """
        source = Path(file_path)
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_name = f"{source.stem}_{timestamp}{source.suffix}"
        backup_path = self.backup_dir / backup_name

        shutil.copy2(source, backup_path)
        return str(backup_path)

    def apply_rewrite(self, proposal: RewriteProposal) -> bool:
        """
        Apply a rewrite proposal to its target file.

        Args:
            proposal: The rewrite proposal to apply

        Returns:
            True if successful, False otherwise
        """
        try:
            target_file = Path(proposal.source_file)

            if not target_file.exists():
                return False

            # Create backup
            backup_path = self.create_backup(str(target_file))

            # Read original content
            content = target_file.read_text()

            # Find and replace the function
            # This is a simplified approach - production would use proper AST
            pattern = rf"fn\s+{re.escape(proposal.original_function)}\s*\([^)]*\)\s*(->\s*[^{{]+)?\s*\{{[^}}]*\}}"

            new_content = re.sub(pattern, proposal.optimized_code, content, count=1)

            if new_content == content:
                # No match found
                return False

            # Write updated content
            target_file.write_text(new_content)

            # Record in history
            self.history.append(AppliedRewrite(
                proposal=proposal,
                backup_path=backup_path
            ))

            return True

        except Exception as e:
            print(f"Hot-swap failed: {e}")
            return False

    def rollback(self, file_path: str, backup_path: str) -> bool:
        """
        Rollback a file to a previous version.

        Args:
            file_path: Path to the file to rollback
            backup_path: Path to the backup to restore

        Returns:
            True if successful
        """
        try:
            backup = Path(backup_path)
            target = Path(file_path)

            if not backup.exists():
                return False

            shutil.copy2(backup, target)

            # Mark related history entry as rolled back
            for record in self.history:
                if record.backup_path == backup_path:
                    record.rolled_back = True

            return True

        except Exception as e:
            print(f"Rollback failed: {e}")
            return False

    def get_active_rewrites(self) -> List[AppliedRewrite]:
        """Get all rewrites that haven't been rolled back."""
        return [r for r in self.history if not r.rolled_back]
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_hot_swap_manager.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/sisyphus/hot_swap_manager.py tests/test_hot_swap_manager.py
git commit -m "feat(hotswap): add kernel rewrite manager with rollback"
```

---

## Phase 4: Daemon Integration

### Task 6: Integrate Self-Rewriting into Daemon

**Files:**
- Modify: `systems/sisyphus/daemon.py`
- Test: `tests/test_daemon_self_rewriting.py`

**Step 1: Write the failing test**

```python
# tests/test_daemon_self_rewriting.py
import pytest
from unittest.mock import MagicMock, patch
from systems.sisyphus.daemon import SisyphusDaemon
from systems.sisyphus.performance_monitor import HotSpot

class TestDaemonSelfRewriting:
    def test_daemon_has_performance_monitor(self):
        """Test that daemon includes performance monitoring."""
        daemon = SisyphusDaemon(enable_self_rewriting=True)

        assert daemon.performance_monitor is not None

    def test_daemon_detects_hot_spots(self):
        """Test that daemon can detect hot spots."""
        daemon = SisyphusDaemon(enable_self_rewriting=True)

        # Simulate some calls
        for i in range(1000):
            daemon.performance_monitor.record_call("test_func", 1.0)

        hot_spots = daemon.detect_kernel_hot_spots()

        assert len(hot_spots) >= 1
        assert hot_spots[0].function_name == "test_func"

    def test_daemon_creates_rewrite_task(self):
        """Test that daemon creates a task for hot-spot rewriting."""
        daemon = SisyphusDaemon(enable_self_rewriting=True)

        # Simulate hot spot
        for i in range(1000):
            daemon.performance_monitor.record_call("slow_kernel", 50.0)

        task = daemon.propose_kernel_rewrite()

        assert task is not None
        assert "slow_kernel" in task.name.lower() or "optimize" in task.name.lower()

if __name__ == "__main__":
    pytest.main([__file__])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_daemon_self_rewriting.py -v`
Expected: FAIL with "unexpected keyword argument 'enable_self_rewriting'"

**Step 3: Modify daemon.py**

```python
# Add to systems/sisyphus/daemon.py imports
from .performance_monitor import PerformanceMonitor
from .kernel_rewriter import KernelRewriter
from .hot_swap_manager import HotSwapManager

# Modify SisyphusDaemon.__init__
class SisyphusDaemon:
    def __init__(
        self,
        state_file=".loop/STATE_V4.md",
        session_dir=None,
        force_clean=False,
        auto_commit=False,
        enable_heartbeat=True,
        enable_self_rewriting=False  # NEW
    ):
        # ... existing initialization ...

        # Self-rewriting components
        self.enable_self_rewriting = enable_self_rewriting
        if enable_self_rewriting:
            self.performance_monitor = PerformanceMonitor()
            self.kernel_rewriter = KernelRewriter()
            self.hot_swap_manager = HotSwapManager()
            self._last_hot_spot_check = 0
            self._hot_spot_check_interval = 300  # 5 minutes

    def detect_kernel_hot_spots(self) -> List:
        """Detect performance hot spots in native kernels."""
        if not self.enable_self_rewriting:
            return []

        return self.performance_monitor.detect_hot_spots(
            threshold_calls=500,
            threshold_time_ms=1.0
        )

    def propose_kernel_rewrite(self) -> Optional[Task]:
        """Create a task proposal for kernel optimization."""
        if not self.enable_self_rewriting:
            return None

        hot_spots = self.detect_kernel_hot_spots()
        if not hot_spots:
            return None

        top_hot_spot = hot_spots[0]

        # Create a task for the optimization
        task = Task(
            number=0,  # Will be assigned
            name=f"Optimize {top_hot_spot.function_name}",
            description=f"Hot-spot detected: {top_hot_spot.call_count} calls, "
                       f"{top_hot_spot.avg_time_ms:.2f}ms avg. "
                       f"Location: {top_hot_spot.source_file}:{top_hot_spot.source_line}",
            verification=f"Profile {top_hot_spot.function_name} after optimization - "
                       f"should show < {top_hot_spot.avg_time_ms * 0.5:.2f}ms avg"
        )

        return task
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_daemon_self_rewriting.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/sisyphus/daemon.py tests/test_daemon_self_rewriting.py
git commit -m "feat(daemon): integrate self-rewriting kernel detection"
```

---

## Phase 5: Glass Box Visualization

### Task 7: Visualize Kernel Rewrites in Glass Box

**Files:**
- Modify: `systems/hypervisor/src/glyph_renderer.wgsl`
- Modify: `systems/visual_shell/web/glass_box_demo.html`

**Step 1: Add KERNEL_REWRITE opcode to WGSL**

```wgsl
// Add to systems/hypervisor/src/glyph_renderer.wgsl

const GLYPH_KERNEL_REWRITE: u32 = 0xCFu;  // New opcode for kernel rewrites

// In main() switch statement, add:
case 0xCFu: { // KERNEL_REWRITE
    let dim = uniforms.resolution;
    let idx = xy_to_hilbert(u32(glyph.x), u32(glyph.y), dim);

    // Pulsing orange/red for rewrites
    let pulse = 0.5 + 0.5 * sin(uniforms.time * 3.0);
    let rewrite_color = vec4<f32>(1.0, 0.3 * pulse, 0.0, 1.0);

    pixel_buffer[idx] = color_to_u32(rewrite_color);
}
```

**Step 2: Add rewrite visualization to HTML**

```javascript
// Add to glass_box_demo.html sidebar
<div class="legend-item">
    <div class="legend-color" style="background: #f50;"></div>
    <span>Kernel Rewrite</span>
</div>
```

**Step 3: Commit**

```bash
git add systems/hypervisor/src/glyph_renderer.wgsl systems/visual_shell/web/glass_box_demo.html
git commit -m "feat(glassbox): add kernel rewrite visualization (opcode 0xCF)"
```

---

## Phase 6: End-to-End Test

### Task 8: Create E2E Self-Rewriting Test

**Files:**
- Create: `tests/test_self_rewriting_e2e.py`

**Step 1: Write E2E test**

```python
# tests/test_self_rewriting_e2e.py
"""
End-to-End Test: Self-Rewriting Kernel Pipeline

Verifies the complete pipeline:
1. Performance monitor detects hot spot
2. Kernel rewriter generates optimization
3. Hot-swap manager applies change
4. Glass Box broadcasts the event
"""

import pytest
import tempfile
from pathlib import Path
from systems.sisyphus.performance_monitor import PerformanceMonitor, HotSpot
from systems.sisyphus.kernel_rewriter import KernelRewriter, RewriteProposal
from systems.sisyphus.hot_swap_manager import HotSwapManager

class TestSelfRewritingE2E:
    def test_full_pipeline(self):
        """Test the complete self-rewriting pipeline."""
        # Setup
        temp_dir = tempfile.mkdtemp()
        test_file = Path(temp_dir) / "kernel.rs"
        test_file.write_text("""
fn slow_function(n: u32) -> u32 {
    let mut result = 0;
    for i in 0..n {
        result += i;
    }
    result
}
""")

        monitor = PerformanceMonitor()
        rewriter = KernelRewriter()
        swap_manager = HotSwapManager(backup_dir=temp_dir)

        # 1. Simulate hot spot detection
        monitor.register_function("slow_function", str(test_file), 1)
        for _ in range(1000):
            monitor.record_call("slow_function", 5.0)

        hot_spots = monitor.detect_hot_spots(threshold_calls=100, threshold_time_ms=1.0)
        assert len(hot_spots) == 1

        # 2. Generate optimization (mocked)
        optimized_code = "fn slow_function(n: u32) -> u32 { n * (n - 1) / 2 }"

        # 3. Create and apply proposal
        proposal = RewriteProposal(
            original_function="slow_function",
            optimized_code=optimized_code,
            source_file=str(test_file),
            source_line=1,
            expected_speedup=10.0,
            confidence=0.95
        )

        success = swap_manager.apply_rewrite(proposal)
        assert success == True

        # 4. Verify change was applied
        new_content = test_file.read_text()
        assert "n * (n - 1) / 2" in new_content

        # 5. Verify backup exists
        assert len(swap_manager.get_active_rewrites()) == 1

if __name__ == "__main__":
    pytest.main([__file__])
```

**Step 2: Run test**

Run: `python3 -m pytest tests/test_self_rewriting_e2e.py -v`
Expected: 1 passed

**Step 3: Commit**

```bash
git add tests/test_self_rewriting_e2e.py
git commit -m "test(e2e): add self-rewriting kernel pipeline test"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | Performance Monitor | `performance_monitor.py` | 3 |
| 2 | FFI Instrumentation | `native_hilbert.py` | 2 |
| 3 | Kernel Rewriter | `kernel_rewriter.py` | 3 |
| 4 | LM Studio Integration | `kernel_rewriter.py` | 1+ |
| 5 | Hot-Swap Manager | `hot_swap_manager.py` | 3 |
| 6 | Daemon Integration | `daemon.py` | 3 |
| 7 | Glass Box Viz | `glyph_renderer.wgsl` | - |
| 8 | E2E Test | `test_self_rewriting_e2e.py` | 1 |

**Total: 8 tasks, 16+ tests**

---

## Execution Handoff

**Plan complete and saved to `docs/plans/2026-03-08-self-rewriting-kernel.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
