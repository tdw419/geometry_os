# Neural Pipeline Optimization & Scaling Roadmap (Phase 2+)

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build upon Phase 1 successes to optimize performance, enhance scalability, and implement production-ready monitoring for the Geometry OS neural/LLM bridge system.

**Architecture:** Enhanced neural pipeline with:
1. **LM Studio Bridge** (`geometry_os/systems/neural_substrate/lm_studio_bridge.py`) - SSE streaming with exponential backoff
2. **SSE Parser** (`geometry_os/systems/neural_substrate/sse_parser.py`) - Robust parsing with auto-reconnection
3. **Compositor** (`geometry_os/systems/infinite_map_rs/src/app.rs`) - Rust rendering engine
4. **Broadcast Module** (`geometry_os/systems/infinite_map_rs/src/broadcast.rs`) - Backpressure-aware WebSocket broadcasting
5. **Software SHM** (`geometry_os/systems/health/software_shm.py`) - Health monitoring (WARNING status: 0.8475)

**Tech Stack:** Python (asyncio, aiohttp, SSE), Rust (wgpu, WebSocket, tokio), Unix sockets, LM Studio API, Prometheus metrics

**Current Status (Post-Phase 1):**
- ✅ PAS score improved: 0.8225 → 0.8475 (+2.5%)
- ✅ Zero compilation errors
- ✅ SSE parser: 20/20 tests passing
- ✅ Broadcast module: 8/8 tests passing
- ✅ Integration test suite created
- ✅ CI/CD health checks operational
- ⚠️ SHM still at WARNING level (symmetry: 0.80)
- ⚠️ Integration tests not yet run
- ⚠️ No performance benchmarks
- ⚠️ Limited monitoring

---

# Phase 2: Performance Optimization & Production Readiness (3-7 days)

## Task 1: Run & Fix Integration Tests

**Files:**
- Run: `geometry_os/scripts/test_e2e_pipeline.sh`
- Modify: `geometry_os/tests/integration/test_neural_pipeline.py` (fix issues)
- Modify: `geometry_os/systems/neural_substrate/lm_studio_bridge.py` (if needed)

**Step 1: Execute E2E test suite**

Run: `cd /home/jericho/zion/projects/geometry_os && bash geometry_os/scripts/test_e2e_pipeline.sh`

Expected output: Test results showing pass/fail for each component

**Step 2: Document test results**

Create file: `geometry_os/docs/testing/integration-test-results.md`

```markdown
# Integration Test Results

**Date:** 2026-02-08
**Test Suite:** E2E Pipeline Test

## Test Results

| Test | Status | Notes |
|------|--------|-------|
| LM Studio Connectivity | ⏳ TBD | |
| SSE Token Streaming | ⏳ TBD | |
| Compositor Socket | ⏳ TBD | |
| Token Forwarding | ⏳ TBD | |
| WebSocket Broadcast | ⏳ TBD | |

## Issues Found

(To be filled after running tests)

## Fixes Applied

(To be documented as fixes are implemented)
```

**Step 3: Fix any test failures**

For each failing test:
1. Identify root cause
2. Implement fix
3. Verify fix
4. Add regression test

**Step 4: Verify all tests pass**

Run: `bash geometry_os/scripts/test_e2e_pipeline.sh`

Expected: All tests passing

**Verification:** Test suite completes with 100% pass rate

---

## Task 2: Performance Benchmarking

**Files:**
- Create: `geometry_os/scripts/benchmark_pipeline.sh`
- Create: `geometry_os/docs/performance/benchmarks.md`

**Step 1: Create benchmarking script**

Create file: `geometry_os/scripts/benchmark_pipeline.sh`

```bash
#!/bin/bash
# Neural Pipeline Performance Benchmark

set -e

cd "$(dirname "$0")/../.."
PROJECT_ROOT="$(pwd)"

echo "🔬 Neural Pipeline Performance Benchmark"
echo "========================================"
echo ""

# 1. SSE Parser Performance
echo "📊 SSE Parser Performance:"
python3 -c "
import asyncio
import time
from systems.neural_substrate.sse_parser import SSEParser

async def benchmark_sse():
    parser = SSEParser('http://localhost:1234/v1/chat/completions')

    # Simulate token processing
    tokens = ['token'] * 1000
    start = time.time()

    for token in tokens:
        await parser.process_line(f'data: {token}\n\n')

    elapsed = time.time() - start
    print(f'  Processed {len(tokens)} tokens in {elapsed:.3f}s')
    print(f'  Throughput: {len(tokens)/elapsed:.0f} tokens/sec')

asyncio.run(benchmark_sse())
"
echo ""

# 2. Broadcast Module Latency
echo "📊 Broadcast Latency:"
cd geometry_os/systems/infinite_map_rs
cargo test --release broadcast_latency -- --nocapture 2>/dev/null || echo "  (Add latency tests to broadcast.rs)"
echo ""

# 3. Memory Usage
echo "📊 Memory Usage:"
echo "  Rust compositor:"
cargo build --release 2>&1 | grep "Finished" || true
du -sh target/release/infinite_map_rs 2>/dev/null || echo "  (Build first)"
echo ""

# 4. SHM Health Check Time
echo "📊 SHM Health Check Performance:"
time python3 geometry_os/systems/health/software_shm.py --check >/dev/null 2>&1 || true
echo ""

echo "✅ Benchmark complete"
```

**Step 2: Run benchmarks**

Run: `chmod +x geometry_os/scripts/benchmark_pipeline.sh && bash geometry_os/scripts/benchmark_pipeline.sh`

**Step 3: Document baseline performance**

Create file: `geometry_os/docs/performance/benchmarks.md`

```markdown
# Neural Pipeline Performance Benchmarks

**Date:** 2026-02-08
**Environment:** (Fill in after running)

## Baseline Metrics

### SSE Parser
- Throughput: (TBD) tokens/sec
- Latency: (TBD) ms p50
- Memory: (TBD) MB

### Broadcast Module
- Latency p50: (TBD) ms
- Latency p99: (TBD) ms
- Throughput: (TBD) msg/sec
- Concurrent clients: 100

### SHM Health Check
- Execution time: (TBD) seconds
- PAS score: 0.8475

### Rust Compositor
- Binary size: (TBD) MB
- Startup time: (TBD) seconds

## Performance Targets

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| SSE throughput | TBD | >100 tokens/sec | |
| Broadcast latency | TBD | <10ms p99 | |
| SHM check time | TBD | <5s | |
| PAS score | 0.8475 | >0.90 | |

## Optimization Priorities

1. (To be determined based on benchmark results)
```

**Verification:** Baseline metrics documented

---

## Task 3: SHM Health Improvement

**Files:**
- Modify: `geometry_os/systems/health/software_shm.py`
- Read: `geometry_os/systems/health/shm_debug.py`
- Modify: `geometry_os/docs/health/symmetry-analysis.md`

**Step 1: Analyze current SHM state**

Run: `cd /home/jericho/zion/projects/geometry_os && python3 geometry_os/systems/health/shm_debug.py --json > /tmp/shm_analysis.json`

Analyze output for improvement opportunities

**Step 2: Implement targeted improvements**

Based on debug output, implement fixes:

Option A: If directory imbalance is issue:
```python
# In software_shm.py, update calculate_symmetry_score()
def calculate_symmetry_score(self) -> float:
    systems_dir = self.project_root / 'systems'
    if not systems_dir.exists():
        return 1.0

    subdirs = [d for d in systems_dir.iterdir() if d.is_dir()]
    if not subdirs:
        return 1.0

    # Count files per subsystem
    sizes = [sum(1 for _ in d.rglob('*') if _.is_file()) for d in subdirs]
    total = sum(sizes)

    if total == 0:
        return 1.0

    # Calculate balance using normalized entropy
    import numpy as np
    normalized = np.array(sizes) / total

    # Use Shannon entropy for balance (higher = more balanced)
    entropy = -np.sum(normalized * np.log(normalized + 1e-10))
    max_entropy = np.log(len(normalized))
    balance = entropy / max_entropy if max_entropy > 0 else 1.0

    # Apply circular dependency penalty
    circular_penalty = self._calculate_circular_penalty()

    # Final symmetry score (weighted)
    symmetry = (balance * 0.7) + (1.0 - circular_penalty) * 0.3

    return symmetry
```

Option B: If circular dependencies are issue:
```python
# Add circular dependency detection
def _detect_circular_dependencies(self) -> int:
    """Detect Rust circular dependencies (mod + use super::)"""
    count = 0
    for rust_file in self.project_root.rglob('*.rs'):
        try:
            content = rust_file.read_text()
            if 'mod ' in content and 'use super::' in content:
                count += 1
        except:
            pass
    return count
```

**Step 3: Verify improvement**

Run: `python3 geometry_os/systems/health/software_shm.py --check`

Expected: PAS score > 0.85 (target: 0.90)

**Step 4: Update documentation**

Update: `geometry_os/docs/health/symmetry-analysis.md`

Add section on Phase 2 improvements and results

**Verification:** PAS score improved to >0.85

---

## Task 4: Enhanced Error Handling & Logging

**Files:**
- Modify: `geometry_os/systems/neural_substrate/lm_studio_bridge.py`
- Modify: `geometry_os/systems/neural_substrate/sse_parser.py`
- Create: `geometry_os/systems/neural_substrate/logging_config.py`

**Step 1: Create centralized logging config**

Create file: `geometry_os/systems/neural_substrate/logging_config.py`

```python
#!/usr/bin/env python3
"""
Centralized logging configuration for neural substrate
"""
import logging
import sys
from pathlib import Path
from logging.handlers import RotatingFileHandler

def setup_logging(
    name: str = "neural_substrate",
    level: int = logging.INFO,
    log_file: Path = None,
    max_bytes: int = 10 * 1024 * 1024,  # 10MB
    backup_count: int = 5
) -> logging.Logger:
    """Setup logger with console and file handlers"""

    logger = logging.getLogger(name)
    logger.setLevel(level)

    # Avoid duplicate handlers
    if logger.handlers:
        return logger

    # Format
    fmt = '%(asctime)s | %(levelname)-8s | %(name)s | %(message)s'
    datefmt = '%Y-%m-%d %H:%M:%S'
    formatter = logging.Formatter(fmt, datefmt)

    # Console handler
    console = logging.StreamHandler(sys.stdout)
    console.setLevel(level)
    console.setFormatter(formatter)
    logger.addHandler(console)

    # File handler (optional)
    if log_file:
        log_file.parent.mkdir(parents=True, exist_ok=True)
        file_handler = RotatingFileHandler(
            log_file,
            maxBytes=max_bytes,
            backupCount=backup_count
        )
        file_handler.setLevel(level)
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)

    return logger

# Default logger
default_logger = setup_logging(
    log_file=Path('/var/log/geometry_os/neural_substrate.log')
)
```

**Step 2: Add structured error handling to LM Studio Bridge**

Modify: `geometry_os/systems/neural_substrate/lm_studio_bridge.py`

Add error handling wrapper:
```python
from .logging_config import default_logger
from enum import Enum
from dataclasses import dataclass

class BridgeErrorType(Enum):
    CONNECTION_ERROR = "connection_error"
    SSE_PARSE_ERROR = "sse_parse_error"
    TOKEN_SEND_ERROR = "token_send_error"
    TIMEOUT_ERROR = "timeout_error"
    UNKNOWN_ERROR = "unknown_error"

@dataclass
class BridgeError:
    type: BridgeErrorType
    message: str
    retryable: bool = True
    cause: Exception = None

async def with_error_handling(operation, error_type: BridgeErrorType, **kwargs):
    """Wrapper for error handling with logging"""
    try:
        return await operation(**kwargs)
    except aiohttp.ClientError as e:
        error = BridgeError(BridgeErrorType.CONNECTION_ERROR, str(e), True, e)
        default_logger.error(f"Connection error: {e}")
        raise error
    except asyncio.TimeoutError as e:
        error = BridgeError(BridgeErrorType.TIMEOUT_ERROR, "Operation timed out", True, e)
        default_logger.warning(f"Timeout: {e}")
        raise error
    except Exception as e:
        error = BridgeError(BridgeErrorType.UNKNOWN_ERROR, str(e), False, e)
        default_logger.error(f"Unexpected error: {e}", exc_info=True)
        raise error
```

**Step 3: Add metrics collection**

Create file: `geometry_os/systems/neural_substrate/metrics.py`

```python
#!/usr/bin/env python3
"""
Performance metrics collection
"""
from dataclasses import dataclass, field
from typing import Dict, List
from time import time
from collections import deque

@dataclass
class Metric:
    name: str
    value: float
    timestamp: float = field(default_factory=time)
    tags: Dict[str, str] = field(default_factory=dict)

class MetricsCollector:
    def __init__(self, max_samples: int = 1000):
        self.metrics: Dict[str, deque] = {}
        self.max_samples = max_samples

    def record(self, name: str, value: float, tags: Dict[str, str] = None):
        """Record a metric value"""
        if name not in self.metrics:
            self.metrics[name] = deque(maxlen=self.max_samples)

        self.metrics[name].append(Metric(
            name=name,
            value=value,
            tags=tags or {}
        ))

    def get_stats(self, name: str) -> Dict[str, float]:
        """Get statistics for a metric"""
        if name not in self.metrics or not self.metrics[name]:
            return {}

        values = [m.value for m in self.metrics[name]]
        return {
            'count': len(values),
            'min': min(values),
            'max': max(values),
            'avg': sum(values) / len(values),
            'p50': sorted(values)[len(values) // 2],
            'p99': sorted(values)[int(len(values) * 0.99)] if len(values) > 1 else values[0]
        }

    def export_prometheus(self) -> str:
        """Export metrics in Prometheus format"""
        lines = []
        for name, metric_deque in self.metrics.items():
            stats = self.get_stats(name)
            lines.append(f'# HELP {name} {name} metric')
            lines.append(f'# TYPE {name} gauge')
            lines.append(f'{name}_count {stats["count"]}')
            lines.append(f'{name}_avg {stats["avg"]:.2f}')
            lines.append(f'{name}_p50 {stats["p50"]:.2f}')
            lines.append(f'{name}_p99 {stats["p99"]:.2f}')
        return '\n'.join(lines)

# Global collector
metrics = MetricsCollector()
```

**Step 4: Integrate metrics into SSE parser**

Modify: `geometry_os/systems/neural_substrate/sse_parser.py`

Add metrics tracking:
```python
from .metrics import metrics
import time

class SSEParser:
    async def process_line(self, line: str):
        start = time.time()
        try:
            result = await self._process_line_impl(line)
            elapsed = time.time() - start
            metrics.record('sse_parse_duration', elapsed * 1000)  # ms
            return result
        except Exception as e:
            metrics.record('sse_parse_error', 1)
            raise
```

**Verification:** Error handling tested, metrics being collected

---

## Task 5: CI/CD Enhancement

**Files:**
- Modify: `geometry_os/.github/workflows/health-check.yml`
- Create: `geometry_os/.github/workflows/integration-tests.yml`
- Create: `geometry_os/.github/workflows/performance-benchmarks.yml`

**Step 1: Create integration test workflow**

Create file: `geometry_os/.github/workflows/integration-tests.yml`

```yaml
name: Integration Tests

on:
  push:
    branches: [main, master, develop]
  pull_request:
    branches: [main, master, develop]
  workflow_dispatch:

jobs:
  integration-tests:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Setup Rust
        uses: actions-rs/toolchain@v1
        with:
          toolchain: stable
          override: true

      - name: Install Python dependencies
        run: |
          pip install --upgrade pip
          pip install aiohttp pytest pytest-asyncio

      - name: Run unit tests
        run: |
          python3 -m pytest geometry_os/tests/unit/ -v

      - name: Run integration tests
        run: |
          bash geometry_os/scripts/test_e2e_pipeline.sh
        env:
          LM_STUDIO_URL: http://localhost:1234
          CI: true

      - name: Upload test results
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: test-results
          path: |
            geometry_os/tests/
            /tmp/test_results.log
          retention-days: 30
```

**Step 2: Create performance benchmark workflow**

Create file: `geometry_os/.github/workflows/performance-benchmarks.yml`

```yaml
name: Performance Benchmarks

on:
  push:
    branches: [main, master, develop]
  pull_request:
    branches: [main, master, develop]
  schedule:
    - cron: '0 6 * * *'  # Daily at 6 AM UTC
  workflow_dispatch:

jobs:
  benchmark:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Setup Rust
        uses: actions-rs/toolchain@v1
        with:
          toolchain: stable
          override: true

      - name: Install dependencies
        run: |
          pip install --upgrade pip
          pip install aiohttp numpy

      - name: Run benchmarks
        run: |
          bash geometry_os/scripts/benchmark_pipeline.sh | tee /tmp/benchmark_results.txt

      - name: Upload benchmark results
        uses: actions/upload-artifact@v4
        with:
          name: benchmark-results
          path: /tmp/benchmark_results.txt
          retention-days: 90

      - name: Comment PR with results
        if: github.event_name == 'pull_request'
        uses: actions/github-script@v7
        with:
          script: |
            const fs = require('fs');
            const results = fs.readFileSync('/tmp/benchmark_results.txt', 'utf8');
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: `## 📊 Benchmark Results\n\`\`\`\n${results}\n\`\`\``
            });
```

**Step 3: Update health check workflow**

Modify: `geometry_os/.github/workflows/health-check.yml`

Add notification on failure:
```yaml
      - name: Notify on failure
        if: failure()
        run: |
          echo "Health check failed! Check logs for details."
          # Add webhook notification here if needed
```

**Verification:** CI/CD workflows run successfully

---

## Task 6: Documentation Updates

**Files:**
- Modify: `geometry_os/docs/architecture/neural-pipeline.md`
- Create: `geometry_os/docs/operations/runbook.md`
- Create: `geometry_os/docs/api/neural-pipeline-api.md`

**Step 1: Create operations runbook**

Create file: `geometry_os/docs/operations/runbook.md`

```markdown
# Neural Pipeline Operations Runbook

## Overview
This runbook covers operational procedures for the Geometry OS neural pipeline.

## Startup Procedure

### 1. Start LM Studio
```bash
# Ensure LM Studio is running
# Check API is accessible
curl http://localhost:1234/v1/models
```

### 2. Start Compositor
```bash
cd geometry_os/systems/infinite_map_rs
cargo run --release
```

### 3. Start Neural Bridge (if separate)
```bash
python3 -m geometry_os.systems.neural_substrate.lm_studio_bridge
```

## Health Checks

### Check Pipeline Status
```bash
# Full health check
bash geometry_os/scripts/health_check.sh

# Individual components
python3 geometry_os/systems/health/software_shm.py --check
cargo check --manifest-path=geometry_os/systems/infinite_map_rs/Cargo.toml
```

### Check Logs
```bash
# Compositor logs
journalctl -u geometry-os-compositor -f

# Neural bridge logs
tail -f /var/log/geometry_os/neural_substrate.log
```

## Troubleshooting

### Issue: SSE Connection Fails
**Symptoms:** Tokens not streaming, connection errors
**Diagnosis:**
```bash
curl -v http://localhost:1234/v1/chat/completions
```
**Resolution:**
1. Verify LM Studio is running
2. Check API port (default: 1234)
3. Review SSE parser logs

### Issue: High PAS Score (>0.9)
**Symptoms:** Health check reports WARNING or CRITICAL
**Diagnosis:**
```bash
python3 geometry_os/systems/health/shm_debug.py
```
**Resolution:**
1. Review symmetry-analysis.md
2. Address circular dependencies
3. Balance directory structure

### Issue: WebSocket Broadcast Lag
**Symptoms:** Delayed visualizations
**Diagnosis:** Check broadcast metrics
**Resolution:**
1. Reduce concurrent connections
2. Adjust backpressure threshold
3. Check network latency

## Performance Tuning

### SSE Parser
- Increase buffer size for high-throughput scenarios
- Adjust reconnection backoff for unstable networks

### Broadcast Module
- Tune `MAX_QUEUED` per client (default: 1000)
- Adjust `BACKPRESSURE_THRESHOLD` (default: 100)
- Modify cleanup interval (default: 30s)

## Monitoring

### Key Metrics
- PAS score: Target >0.90
- SSE throughput: Target >100 tokens/sec
- Broadcast latency: Target <10ms p99
- SHM check time: Target <5s

### Alerts
Set up alerts for:
- PAS score drops below 0.85
- SSE connection failures >3 in 5min
- Broadcast latency >50ms p99
```

**Step 2: Create API reference**

Create file: `geometry_os/docs/api/neural-pipeline-api.md`

```markdown
# Neural Pipeline API Reference

## Components

### LM Studio Bridge (`lm_studio_bridge.py`)

#### Class: LMStudioBridge

```python
class LMStudioBridge:
    """Bridge to LM Studio API with SSE streaming"""

    def __init__(
        self,
        base_url: str = "http://localhost:1234/v1",
        timeout: float = 30.0,
        max_retries: int = 5
    ):
        """Initialize bridge

        Args:
            base_url: LM Studio API base URL
            timeout: Request timeout in seconds
            max_retries: Maximum connection retries
        """

    async def stream_completion(
        self,
        messages: List[Dict],
        callback: Callable,
        model: str = None
    ) -> None:
        """Stream completion with SSE

        Args:
            messages: Chat messages
            callback: Async callback for each token
            model: Model name (default: auto-detect)

        Yields:
            Tokens via callback as they arrive
        """
```

### SSE Parser (`sse_parser.py`)

#### Class: SSEParser

```python
class SSEParser:
    """Server-Sent Events parser with auto-reconnection"""

    async def connect(self, url: str) -> None:
        """Connect to SSE endpoint

        Args:
            url: SSE endpoint URL
        """

    async def process_line(self, line: str) -> Dict:
        """Process SSE line

        Args:
            line: Raw SSE line

        Returns:
            Parsed event data
        """
```

### Broadcast Module (`broadcast.rs`)

#### Struct: NeuralBroadcast

```rust
pub struct NeuralBroadcast {
    /// Broadcasts neural state updates to WebSocket clients
}

impl NeuralBroadcast {
    pub fn new() -> Self;

    pub async fn add_client(
        &mut self,
        id: String,
        tx: UnboundedSender<Message>
    ) -> Result<(), BroadcastError>;

    pub async fn broadcast(
        &mut self,
        message: NeuralState
    ) -> Result<(), BroadcastError>;

    pub async fn remove_client(&mut self, id: String);
}
```

## Message Formats

### Token Activation Message
```json
{
  "type": "token_activation",
  "token_id": "abc123",
  "token_text": "hello",
  "timestamp": 1707345600.0,
  "position": [100.0, 200.0],
  "confidence": 0.95
}
```

### Neural State Message
```json
{
  "type": "neural_state",
  "state": "processing",
  "tokens_processed": 150,
  "total_tokens": 264,
  "elapsed_ms": 1234
}
```

### Token Visualization Message
```json
{
  "type": "token_visualization",
  "tokens": [
    {"id": "abc123", "text": "hello", "x": 100, "y": 200}
  ]
}
```
```

**Step 3: Update architecture documentation**

Update: `geometry_os/docs/architecture/neural-pipeline.md`

Add Phase 2 improvements section

**Verification:** Documentation complete and accurate

---

# Phase 3: Scalability & Advanced Features (1-2 weeks)

## Task 7: Connection Pooling & Multi-Instance Support

**Files:**
- Create: `geometry_os/systems/neural_substrate/connection_pool.py`
- Modify: `geometry_os/systems/neural_substrate/lm_studio_bridge.py`
- Create: `geometry_os/tests/integration/test_connection_pool.py`

**Step 1: Implement connection pool**

Create file: `geometry_os/systems/neural_substrate/connection_pool.py`

```python
#!/usr/bin/env python3
"""
Connection pool for multiple LM Studio instances
"""
import asyncio
from dataclasses import dataclass
from typing import Optional, List
from collections import deque

@dataclass
class InstanceConfig:
    url: str
    max_connections: int = 10
    priority: int = 0  # Lower = higher priority

class ConnectionPool:
    def __init__(self):
        self.instances: List[InstanceConfig] = []
        self.available = deque()
        self.in_use = set()
        self.lock = asyncio.Lock()

    def add_instance(self, config: InstanceConfig):
        """Add an LM Studio instance to the pool"""
        self.instances.append(config)
        self.instances.sort(key=lambda x: x.priority)
        for _ in range(config.max_connections):
            self.available.append(config.url)

    async def acquire(self) -> Optional[str]:
        """Acquire a connection from the pool"""
        async with self.lock:
            if not self.available:
                return None
            url = self.available.popleft()
            self.in_use.add(url)
            return url

    async def release(self, url: str):
        """Release a connection back to the pool"""
        async with self.lock:
            if url in self.in_use:
                self.in_use.remove(url)
                self.available.append(url)

    @property
    def available_count(self) -> int:
        return len(self.available)

    @property
    def in_use_count(self) -> int:
        return len(self.in_use)
```

**Step 2: Integrate pool with LM Studio Bridge**

Modify: `geometry_os/systems/neural_substrate/lm_studio_bridge.py`

Add pool support:
```python
class LMStudioBridge:
    def __init__(
        self,
        base_url: str = None,
        connection_pool: ConnectionPool = None,
        **kwargs
    ):
        if connection_pool:
            self.pool = connection_pool
            self.base_url = None
        else:
            self.pool = None
            self.base_url = base_url or "http://localhost:1234/v1"

    async def _get_url(self) -> str:
        """Get URL from pool or use configured URL"""
        if self.pool:
            url = await self.pool.acquire()
            if not url:
                raise RuntimeError("No available connections")
            return url
        return self.base_url

    async def _release_url(self, url: str):
        """Release URL back to pool"""
        if self.pool:
            await self.pool.release(url)
```

**Step 3: Add tests**

Create file: `geometry_os/tests/integration/test_connection_pool.py`

```python
#!/usr/bin/env python3
"""Test connection pool functionality"""

import pytest
from systems.neural_substrate.connection_pool import ConnectionPool, InstanceConfig

@pytest.mark.asyncio
async def test_connection_pool_basic():
    pool = ConnectionPool()

    config = InstanceConfig(
        url="http://localhost:1234/v1",
        max_connections=5
    )
    pool.add_instance(config)

    assert pool.available_count == 5
    assert pool.in_use_count == 0

    # Acquire connection
    url = await pool.acquire()
    assert url is not None
    assert pool.available_count == 4
    assert pool.in_use_count == 1

    # Release connection
    await pool.release(url)
    assert pool.available_count == 5
    assert pool.in_use_count == 0

@pytest.mark.asyncio
async def test_multi_instance_pool():
    pool = ConnectionPool()

    # Add multiple instances
    pool.add_instance(InstanceConfig("http://primary:1234/v1", priority=0))
    pool.add_instance(InstanceConfig("http://secondary:1234/v1", priority=1))

    # Should get primary first
    url1 = await pool.acquire()
    assert "primary" in url1

    # Should get secondary when primary exhausted
    url2 = await pool.acquire()
    # (Implementation dependent)
```

**Verification:** Connection pool tests passing

---

## Task 8: Caching Layer

**Files:**
- Create: `geometry_os/systems/neural_substrate/cache.py`
- Modify: `geometry_os/systems/neural_substrate/lm_studio_bridge.py`

**Step 1: Implement response cache**

Create file: `geometry_os/systems/neural_substrate/cache.py`

```python
#!/usr/bin/env python3
"""
LRU cache for LM Studio responses
"""
import hashlib
import json
from typing import Any, Dict, Optional
from dataclasses import dataclass
from datetime import datetime, timedelta

@dataclass
class CacheEntry:
    key: str
    value: Any
    timestamp: datetime
    ttl: timedelta = timedelta(minutes=5)

    def is_expired(self) -> bool:
        return datetime.now() - self.timestamp > self.ttl

class ResponseCache:
    def __init__(self, max_size: int = 1000):
        self.max_size = max_size
        self.cache: Dict[str, CacheEntry] = {}
        self.access_order: List[str] = []

    def _generate_key(self, messages: List[Dict], model: str) -> str:
        """Generate cache key from request"""
        content = json.dumps({"messages": messages, "model": model}, sort_keys=True)
        return hashlib.sha256(content.encode()).hexdigest()

    def get(self, messages: List[Dict], model: str) -> Optional[str]:
        """Get cached response if available and not expired"""
        key = self._generate_key(messages, model)

        if key not in self.cache:
            return None

        entry = self.cache[key]

        if entry.is_expired():
            del self.cache[key]
            self.access_order.remove(key)
            return None

        # Update access order
        self.access_order.remove(key)
        self.access_order.append(key)

        return entry.value

    def put(self, messages: List[Dict], model: str, response: str):
        """Cache a response"""
        key = self._generate_key(messages, model)

        # Evict if at capacity
        if len(self.cache) >= self.max_size and key not in self.cache:
            oldest = self.access_order.pop(0)
            del self.cache[oldest]

        # Add entry
        self.cache[key] = CacheEntry(
            key=key,
            value=response,
            timestamp=datetime.now()
        )

        if key in self.access_order:
            self.access_order.remove(key)
        self.access_order.append(key)

    def clear(self):
        """Clear all cache entries"""
        self.cache.clear()
        self.access_order.clear()

    def stats(self) -> Dict[str, int]:
        """Get cache statistics"""
        return {
            'size': len(self.cache),
            'max_size': self.max_size,
            'hit_rate': 0.0  # Track hits/misses for this
        }
```

**Step 2: Integrate cache with bridge**

**Verification:** Cache working, hit rate >20% for repeated queries

---

## Task 9: Rate Limiting & Backpressure

**Files:**
- Create: `geometry_os/systems/neural_substrate/rate_limiter.py`
- Modify: `geometry_os/systems/infinite_map_rs/src/broadcast.rs`

**Step 1: Implement token bucket rate limiter**

Create file: `geometry_os/systems/neural_substrate/rate_limiter.py`

```python
#!/usr/bin/env python3
"""
Token bucket rate limiter
"""
import asyncio
import time
from dataclasses import dataclass

@dataclass
class RateLimit:
    requests_per_second: float
    burst_size: int

class TokenBucket:
    def __init__(self, rate: float, capacity: int):
        self.rate = rate  # tokens per second
        self.capacity = capacity
        self.tokens = capacity
        self.last_update = time.time()
        self._lock = asyncio.Lock()

    async def acquire(self, tokens: int = 1) -> bool:
        """Acquire tokens from bucket"""
        async with self._lock:
            now = time.time()
            elapsed = now - self.last_update
            self.last_update = now

            # Refill tokens
            self.tokens = min(
                self.capacity,
                self.tokens + elapsed * self.rate
            )

            if self.tokens >= tokens:
                self.tokens -= tokens
                return True

            return False

    async def acquire_wait(self, tokens: int = 1):
        """Acquire tokens, waiting if necessary"""
        while not await self.acquire(tokens):
            # Calculate wait time
            wait_time = (tokens - self.tokens) / self.rate
            await asyncio.sleep(wait_time)
```

**Step 2: Enhance broadcast backpressure**

Modify: `geometry_os/systems/infinite_map_rs/src/broadcast.rs`

Add adaptive backpressure:
```rust
// Add adaptive backpressure based on queue depth
pub async fn broadcast_with_backpressure(&mut self, message: NeuralState) -> Result<(), BroadcastError> {
    let queue_depth = self.clients.values()
        .map(|c| c.message_count())
        .max()
        .unwrap_or(0);

    // If queues are full, wait or drop
    if queue_depth > BACKPRESSURE_THRESHOLD * 2 {
        // Critical backpressure - drop oldest messages
        for client in self.clients.values_mut() {
            client.drop_oldest(queue_depth - BACKPRESSURE_THRESHOLD);
        }
    } else if queue_depth > BACKPRESSURE_THRESHOLD {
        // Mild backpressure - wait a bit
        tokio::time::sleep(Duration::from_millis(10)).await;
    }

    self.broadcast(message).await
}
```

**Verification:** Rate limiting prevents overload

---

## Task 10: Monitoring Dashboard

**Files:**
- Create: `geometry_os/systems/monitoring/metrics_exporter.py`
- Create: `geometry_os/systems/monitoring/grafana_dashboards/neural-pipeline.json`

**Step 1: Create Prometheus exporter**

Create file: `geometry_os/systems/monitoring/metrics_exporter.py`

```python
#!/usr/bin/env python3
"""
Prometheus metrics exporter for neural pipeline
"""
from prometheus_client import start_http_server, Gauge, Counter, Histogram
from prometheus_client.exposition import generate_latest
import time

# Define metrics
sse_tokens_total = Counter('sse_tokens_total', 'Total SSE tokens processed')
sse_errors_total = Counter('sse_errors_total', 'Total SSE errors')
broadcast_messages_total = Counter('broadcast_messages_total', 'Total broadcast messages')
broadcast_clients_active = Gauge('broadcast_clients_active', 'Active WebSocket clients')
broadcast_queue_depth = Gauge('broadcast_queue_depth', 'Broadcast queue depth')
shm_pas_score = Gauge('shm_pas_score', 'Software SHM PAS score')
pipeline_latency_seconds = Histogram('pipeline_latency_seconds', 'End-to-end pipeline latency')

class MetricsExporter:
    def __init__(self, port: int = 9090):
        self.port = port
        start_http_server(port)

    def update_shm_score(self, score: float):
        shm_pas_score.set(score)

    def inc_tokens(self):
        sse_tokens_total.inc()

    def inc_errors():
        sse_errors_total.inc()

    def update_clients(self, count: int):
        broadcast_clients_active.set(count)

    def update_queue_depth(self, depth: int):
        broadcast_queue_depth.set(depth)
```

**Step 2: Create Grafana dashboard**

Create file: `geometry_os/systems/monitoring/grafana_dashboards/neural-pipeline.json`

```json
{
  "dashboard": {
    "title": "Neural Pipeline Monitoring",
    "panels": [
      {
        "title": "SSE Token Throughput",
        "targets": [
          {
            "expr": "rate(sse_tokens_total[1m])"
          }
        ]
      },
      {
        "title": "Broadcast Latency",
        "targets": [
          {
            "expr": "histogram_quantile(0.99, rate(pipeline_latency_seconds_bucket[5m]))"
          }
        ]
      },
      {
        "title": "Active WebSocket Clients",
        "targets": [
          {
            "expr": "broadcast_clients_active"
          }
        ]
      },
      {
        "title": "SHM PAS Score",
        "targets": [
          {
            "expr": "shm_pas_score"
          }
        ]
      }
    ]
  }
}
```

**Verification:** Metrics visible in Prometheus/Grafana

---

# Phase 4: Production Hardening & Optimization (2-4 weeks)

## Task 11: GPU Acceleration

**Files:**
- Create: `geometry_os/systems/infinite_map_rs/src/gpu_token_processor.rs`
- Modify: `geometry_os/systems/infinite_map_rs/src/broadcast.rs`

**Step 1: Profile current GPU usage**

Run: `cargo install flameshow && flameshow` (during compositor runtime)

**Step 2: Implement GPU token processing**

Create file: `geometry_os/systems/infinite_map_rs/src/gpu_token_processor.rs`

```rust
//! GPU-accelerated token processing using wgpu compute shaders

use wgpu::*;

pub struct GPUTokenProcessor {
    device: Device,
    queue: Queue,
    compute_pipeline: ComputePipeline,
}

impl GPUTokenProcessor {
    pub async fn new() -> Result<Self, GpuError> {
        let instance = Instance::new(InstanceDescriptor {
            backends: Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&RequestAdapterOptions {
                power_preference: PowerPreference::HighPerformance,
                ..Default::default()
            })
            .await
            .ok_or(GpuError::NoAdapter)?;

        let (device, queue) = adapter
            .request_device(
                &DeviceDescriptor {
                    label: Some("Token Processor"),
                    required_features: Features::TIMESTAMP_QUERY,
                    ..Default::default()
                },
                None,
            )
            .await?;

        // Load compute shader
        let shader = device.create_shader_module(ShaderModuleDescriptor {
            label: Some("Token Compute Shader"),
            source: ShaderSource::Wgsl(include_str!("token_compute.wgsl").into()),
        });

        let compute_pipeline = device.create_compute_pipeline(&ComputePipelineDescriptor {
            label: Some("Token Pipeline"),
            layout: None,
            module: &shader,
            entry_point: "main",
        });

        Ok(Self {
            device,
            queue,
            compute_pipeline,
        })
    }

    pub fn process_tokens_batch(&self, tokens: &[Token]) -> Result<Vec<ProcessedToken>, GpuError> {
        // GPU-accelerated token processing
        // TODO: Implement compute shader logic
        Ok(tokens.iter().map(|t| ProcessedToken::from(t)).collect())
    }
}
```

**Step 3: Create compute shader**

Create file: `geometry_os/systems/infinite_map_rs/src/token_compute.wgsl`

```wgsl
// Token processing compute shader

struct Token {
    id: u32,
    position: vec2<f32>,
    confidence: f32,
}

struct ProcessedToken {
    id: u32,
    screen_pos: vec2<f32>,
    color: vec4<f32>,
}

@group(0) @binding(0)
var<storage, read> input_tokens: array<Token>;

@group(0) @binding(1)
var<storage, read_write> output_tokens: array<ProcessedToken>;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let index = global_id.x;
    let token = input_tokens[index];

    // Project to screen space
    output_tokens[index].id = token.id;
    output_tokens[index].screen_pos = token.position;
    output_tokens[index].color = vec4<f32>(1.0, 1.0, 1.0, token.confidence);
}
```

**Verification:** GPU processing shows performance improvement

---

## Task 12: High Availability Setup

**Files:**
- Create: `geometry_os/systems/infinite_map_rs/src/ha.rs`
- Create: `geometry_os/scripts/setup_ha.sh`

**Step 1: Implement leader election**

Create file: `geometry_os/systems/infinite_map_rs/src/ha.rs`

```rust
//! High availability support with leader election

use tokio::sync::RwLock;
use std::sync::Arc;

pub struct LeaderElector {
    peers: Vec<String>,
    is_leader: Arc<RwLock<bool>>,
}

impl LeaderElector {
    pub async fn new(peers: Vec<String>) -> Self {
        Self {
            peers,
            is_leader: Arc::new(RwLock::new(false)),
        }
    }

    pub async fn run_election(&self) -> Result<(), HaError> {
        // Implement Raft or similar consensus
        // For now: simple peer voting
        Ok(())
    }

    pub async fn is_leader(&self) -> bool {
        *self.is_leader.read().await
    }
}
```

**Step 2: Create failover script**

**Verification:** Failover works in <5 seconds

---

## Task 13: Security Hardening

**Files:**
- Create: `geometry_os/systems/neural_substrate/auth.py`
- Modify: `geometry_os/systems/infinite_map_rs/src/api_server.rs`

**Step 1: Add authentication**

Create file: `geometry_os/systems/neural_substrate/auth.py`

```python
#!/usr/bin/env python3
"""
Authentication and authorization for neural pipeline
"""
import jwt
import bcrypt
from datetime import datetime, timedelta
from typing import Optional

class Authenticator:
    def __init__(self, secret: str):
        self.secret = secret

    def generate_token(self, user_id: str, expires_in: int = 3600) -> str:
        """Generate JWT token"""
        payload = {
            'user_id': user_id,
            'exp': datetime.utcnow() + timedelta(seconds=expires_in),
            'iat': datetime.utcnow()
        }
        return jwt.encode(payload, self.secret, algorithm='HS256')

    def verify_token(self, token: str) -> Optional[str]:
        """Verify JWT token"""
        try:
            payload = jwt.decode(token, self.secret, algorithms=['HS256'])
            return payload['user_id']
        except jwt.InvalidTokenError:
            return None
```

**Step 2: Add rate limiting per user**

**Verification:** Authentication working, unauthorized requests blocked

---

## Task 14: Disaster Recovery

**Files:**
- Create: `geometry_os/scripts/backup_state.sh`
- Create: `geometry_os/scripts/restore_state.sh`

**Step 1: Implement state snapshotting**

Create file: `geometry_os/scripts/backup_state.sh`

```bash
#!/bin/bash
# Backup neural pipeline state

BACKUP_DIR="/var/backups/geometry_os"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
mkdir -p "$BACKUP_DIR"

# Backup SHM state
python3 -c "
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os')
from systems.health.software_shm import SoftwareSHM
import json

shm = SoftwareSHM()
state = shm.get_state()
with open('$BACKUP_DIR/shm_state_$TIMESTAMP.json', 'w') as f:
    json.dump(state, f, indent=2)
"

# Backup compositor state (if running)
# TODO: Add IPC to get compositor state

echo "Backup complete: $TIMESTAMP"
```

**Step 2: Create restore script**

Create file: `geometry_os/scripts/restore_state.sh`

```bash
#!/bin/bash
# Restore neural pipeline state

if [ -z "$1" ]; then
    echo "Usage: $0 <timestamp>"
    exit 1
fi

TIMESTAMP="$1"
BACKUP_DIR="/var/backups/geometry_os"

# Restore SHM state
python3 -c "
import sys, json
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os')
from systems.health.software_shm import SoftwareSHM

with open('$BACKUP_DIR/shm_state_$TIMESTAMP.json', 'r') as f:
    state = json.load(f)

shm = SoftwareSHM()
shm.restore_state(state)
"

echo "Restore complete: $TIMESTAMP"
```

**Verification:** State backup/restore working

---

# Task Checklist & Verification

## Phase 2 Completion Criteria

- [ ] All integration tests passing
- [ ] Baseline performance metrics documented
- [ ] PAS score >0.85 (target: 0.90)
- [ ] Error handling tested and documented
- [ ] CI/CD workflows operational
- [ ] Operations runbook complete
- [ ] API reference documented

## Phase 3 Completion Criteria

- [ ] Connection pool operational
- [ ] Cache hit rate >20%
- [ ] Rate limiting tested
- [ ] Monitoring dashboard deployed
- [ ] Load testing complete (1000+ tokens)

## Phase 4 Completion Criteria

- [ ] GPU acceleration implemented
- [ ] High availability setup
- [ ] Security hardening complete
- [ ] Disaster recovery tested
- [ ] Production deployment ready

---

# Execution

Use `superpowers:executing-plans` to implement this roadmap task-by-task with atomic commits and verification at each step.

---

**Last Updated:** 2026-02-08
**Status:** Ready for Execution
**Owner:** Neural Pipeline Team
