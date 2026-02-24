# Hybrid Proxy Analytics Dashboard Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add analytics, cost tracking, and visualization to the hybrid LLM proxy system.

**Architecture:** Extend the FastAPI proxy with a metrics module using ring buffer storage, add REST endpoints for analytics, extend WordPress plugin with Chart.js visualizations, and implement per-request logging with cost calculation.

**Tech Stack:** FastAPI, aiohttp, Python dataclasses, WordPress PHP, Chart.js, SQLite (via WordPress)

---

## Phase 1: Metrics Module and Analytics Endpoints

### Task 1: Create Metrics Data Structures

**Files:**
- Create: `src/hybrid_proxy/metrics.py`

**Step 1: Write the failing test**

```python
# tests/test_metrics.py
import pytest
from hybrid_proxy.metrics import RequestMetric, MetricsBuffer

def test_metrics_buffer_add_and_get():
    """Test adding metrics to ring buffer and retrieving them."""
    buffer = MetricsBuffer(max_size=100)

    metric = RequestMetric(
        request_id="test-001",
        timestamp="2026-02-23T12:00:00Z",
        backend="claude",
        task_type="default",
        model="claude-3-5-sonnet",
        input_tokens=100,
        output_tokens=50,
        latency_ms=1500,
        success=True,
        cost_usd=0.003
    )

    buffer.add(metric)
    metrics = buffer.get_all()

    assert len(metrics) == 1
    assert metrics[0].request_id == "test-001"
    assert metrics[0].backend == "claude"

def test_metrics_buffer_ring_behavior():
    """Test that buffer overwrites old entries when full."""
    buffer = MetricsBuffer(max_size=10)

    for i in range(15):
        buffer.add(RequestMetric(
            request_id=f"req-{i}",
            timestamp=f"2026-02-23T12:00:{i:02d}Z",
            backend="lm_studio",
            task_type="background",
            model="local-model",
            input_tokens=10,
            output_tokens=5,
            latency_ms=100,
            success=True,
            cost_usd=0.0
        ))

    metrics = buffer.get_all()
    assert len(metrics) == 10
    assert metrics[0].request_id == "req-5"  # Oldest kept
    assert metrics[-1].request_id == "req-14"  # Newest
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'hybrid_proxy.metrics'"

**Step 3: Write minimal implementation**

```python
# src/hybrid_proxy/metrics.py
"""Metrics collection and storage for hybrid proxy analytics."""
from dataclasses import dataclass, field
from typing import List, Optional
from datetime import datetime
from collections import deque
import threading


@dataclass
class RequestMetric:
    """Single request metric data."""
    request_id: str
    timestamp: str
    backend: str  # "claude", "lm_studio"
    task_type: str  # "background", "default", "think"
    model: str
    input_tokens: int
    output_tokens: int
    latency_ms: float
    success: bool
    cost_usd: float
    error_message: Optional[str] = None
    routed_from: Optional[str] = None  # Original backend if fallback


@dataclass
class MetricsBuffer:
    """Thread-safe ring buffer for metrics storage."""
    max_size: int = 10000
    _buffer: deque = field(default_factory=lambda: deque(maxlen=10000))
    _lock: threading.Lock = field(default_factory=threading.Lock)

    def __post_init__(self):
        self._buffer = deque(maxlen=self.max_size)

    def add(self, metric: RequestMetric):
        """Add a metric to the buffer."""
        with self._lock:
            self._buffer.append(metric)

    def get_all(self) -> List[RequestMetric]:
        """Get all metrics from buffer."""
        with self._lock:
            return list(self._buffer)

    def get_recent(self, count: int = 100) -> List[RequestMetric]:
        """Get most recent N metrics."""
        with self._lock:
            return list(self._buffer)[-count:]

    def clear(self):
        """Clear all metrics."""
        with self._lock:
            self._buffer.clear()

    def count(self) -> int:
        """Get current count of metrics."""
        with self._lock:
            return len(self._buffer)
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py -v`
Expected: PASS (2 tests)

**Step 5: Commit**

```bash
git add src/hybrid_proxy/metrics.py tests/test_metrics.py
git commit -m "feat(hybrid-proxy): add metrics data structures with ring buffer"
```

---

### Task 2: Cost Calculator

**Files:**
- Modify: `src/hybrid_proxy/metrics.py:1-80`

**Step 1: Write the failing test**

```python
# tests/test_metrics.py (add to existing file)
from hybrid_proxy.metrics import CostCalculator

def test_cost_calculator_claude_sonnet():
    """Test Claude 3.5 Sonnet pricing."""
    calc = CostCalculator()
    cost = calc.calculate("claude-3-5-sonnet-20241022", 1000, 500)
    # $3/M input, $15/M output
    expected = (1000 / 1_000_000 * 3.0) + (500 / 1_000_000 * 15.0)
    assert abs(cost - expected) < 0.0001

def test_cost_calculator_lm_studio_free():
    """Test local LM Studio is free."""
    calc = CostCalculator()
    cost = calc.calculate("local-model", 1000, 500)
    assert cost == 0.0

def test_cost_calculator_unknown_model():
    """Test unknown model returns 0 cost with warning."""
    calc = CostCalculator()
    cost = calc.calculate("unknown-model-xyz", 1000, 500)
    assert cost == 0.0
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py::test_cost_calculator_claude_sonnet -v`
Expected: FAIL with "ImportError: cannot import name 'CostCalculator'"

**Step 3: Write minimal implementation**

```python
# Add to src/hybrid_proxy/metrics.py
import logging

logger = logging.getLogger(__name__)


class CostCalculator:
    """Calculate API costs based on model and token usage."""

    # Pricing per 1M tokens (as of 2026-02)
    PRICING = {
        # Anthropic Claude
        "claude-3-5-sonnet": {"input": 3.0, "output": 15.0},
        "claude-3-5-haiku": {"input": 0.80, "output": 4.0},
        "claude-3-opus": {"input": 15.0, "output": 75.0},
        "claude-3-sonnet": {"input": 3.0, "output": 15.0},
        "claude-3-haiku": {"input": 0.25, "output": 1.25},
        # Z.ai GLM
        "glm-4-plus": {"input": 0.5, "output": 0.5},
        "glm-4": {"input": 0.1, "output": 0.1},
        # Add more models as needed
    }

    def calculate(self, model: str, input_tokens: int, output_tokens: int) -> float:
        """Calculate cost in USD for a request."""
        # Local models are free
        if not model or "local" in model.lower() or "lm-studio" in model.lower():
            return 0.0

        # Find matching pricing (prefix match)
        model_lower = model.lower()
        pricing = None
        for prefix, prices in self.PRICING.items():
            if prefix in model_lower:
                pricing = prices
                break

        if not pricing:
            logger.warning(f"Unknown model for cost calculation: {model}")
            return 0.0

        input_cost = (input_tokens / 1_000_000) * pricing["input"]
        output_cost = (output_tokens / 1_000_000) * pricing["output"]
        return input_cost + output_cost
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py -v`
Expected: PASS (5 tests)

**Step 5: Commit**

```bash
git add src/hybrid_proxy/metrics.py tests/test_metrics.py
git commit -m "feat(hybrid-proxy): add cost calculator with model pricing"
```

---

### Task 3: Aggregation Functions

**Files:**
- Modify: `src/hybrid_proxy/metrics.py`

**Step 1: Write the failing test**

```python
# tests/test_metrics.py (add to existing file)
from hybrid_proxy.metrics import MetricsAggregator

def test_aggregator_basic_stats():
    """Test basic statistics aggregation."""
    buffer = MetricsBuffer(max_size=100)
    buffer.add(RequestMetric("r1", "2026-02-23T12:00:00Z", "claude", "default", "claude-3-5-sonnet", 100, 50, 1500, True, 0.003))
    buffer.add(RequestMetric("r2", "2026-02-23T12:01:00Z", "lm_studio", "background", "local", 200, 100, 500, True, 0.0))
    buffer.add(RequestMetric("r3", "2026-02-23T12:02:00Z", "claude", "think", "claude-3-5-sonnet", 500, 250, 3000, False, 0.015))

    agg = MetricsAggregator(buffer)
    stats = agg.get_summary()

    assert stats["total_requests"] == 3
    assert stats["success_rate"] == pytest.approx(0.667, rel=0.01)
    assert stats["avg_latency_ms"] == pytest.approx(1666.67, rel=0.01)
    assert stats["total_tokens"] == 1200
    assert stats["total_cost_usd"] == pytest.approx(0.018, rel=0.01)

def test_aggregator_by_backend():
    """Test grouping by backend."""
    buffer = MetricsBuffer(max_size=100)
    buffer.add(RequestMetric("r1", "2026-02-23T12:00:00Z", "claude", "default", "claude-3-5-sonnet", 100, 50, 1500, True, 0.003))
    buffer.add(RequestMetric("r2", "2026-02-23T12:01:00Z", "lm_studio", "background", "local", 200, 100, 500, True, 0.0))
    buffer.add(RequestMetric("r3", "2026-02-23T12:02:00Z", "claude", "think", "claude-3-5-sonnet", 500, 250, 3000, True, 0.015))

    agg = MetricsAggregator(buffer)
    by_backend = agg.get_by_backend()

    assert by_backend["claude"]["count"] == 2
    assert by_backend["claude"]["cost"] == pytest.approx(0.018, rel=0.01)
    assert by_backend["lm_studio"]["count"] == 1
    assert by_backend["lm_studio"]["cost"] == 0.0
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py::test_aggregator_basic_stats -v`
Expected: FAIL with "ImportError: cannot import name 'MetricsAggregator'"

**Step 3: Write minimal implementation**

```python
# Add to src/hybrid_proxy/metrics.py
from typing import Dict, Any
from datetime import datetime, timedelta


class MetricsAggregator:
    """Aggregate metrics for analytics."""

    def __init__(self, buffer: MetricsBuffer):
        self.buffer = buffer

    def get_summary(self, minutes: int = None) -> Dict[str, Any]:
        """Get summary statistics."""
        metrics = self.buffer.get_all()

        if minutes:
            cutoff = datetime.utcnow() - timedelta(minutes=minutes)
            metrics = [
                m for m in metrics
                if datetime.fromisoformat(m.timestamp.replace("Z", "+00:00")) >= cutoff
            ]

        if not metrics:
            return {"total_requests": 0, "success_rate": 0, "avg_latency_ms": 0,
                    "total_tokens": 0, "total_cost_usd": 0}

        total = len(metrics)
        successes = sum(1 for m in metrics if m.success)
        total_latency = sum(m.latency_ms for m in metrics)
        total_tokens = sum(m.input_tokens + m.output_tokens for m in metrics)
        total_cost = sum(m.cost_usd for m in metrics)

        return {
            "total_requests": total,
            "success_rate": successes / total,
            "avg_latency_ms": total_latency / total,
            "total_tokens": total_tokens,
            "total_cost_usd": total_cost,
        }

    def get_by_backend(self) -> Dict[str, Dict[str, Any]]:
        """Group statistics by backend."""
        metrics = self.buffer.get_all()
        result = {}

        for m in metrics:
            if m.backend not in result:
                result[m.backend] = {"count": 0, "tokens": 0, "cost": 0.0,
                                     "avg_latency_ms": 0.0, "latencies": []}
            result[m.backend]["count"] += 1
            result[m.backend]["tokens"] += m.input_tokens + m.output_tokens
            result[m.backend]["cost"] += m.cost_usd
            result[m.backend]["latencies"].append(m.latency_ms)

        # Calculate averages
        for backend in result.values():
            if backend["latencies"]:
                backend["avg_latency_ms"] = sum(backend["latencies"]) / len(backend["latencies"])
            del backend["latencies"]

        return result

    def get_hourly(self, hours: int = 24) -> Dict[str, Dict[str, Any]]:
        """Get hourly breakdown."""
        metrics = self.buffer.get_all()
        result = {}

        for m in metrics:
            hour = m.timestamp[:13] + ":00:00Z"  # Truncate to hour
            if hour not in result:
                result[hour] = {"count": 0, "tokens": 0, "cost": 0.0}
            result[hour]["count"] += 1
            result[hour]["tokens"] += m.input_tokens + m.output_tokens
            result[hour]["cost"] += m.cost_usd

        return result
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py -v`
Expected: PASS (7 tests)

**Step 5: Commit**

```bash
git add src/hybrid_proxy/metrics.py tests/test_metrics.py
git commit -m "feat(hybrid-proxy): add metrics aggregator for analytics"
```

---

### Task 4: Analytics REST Endpoints

**Files:**
- Modify: `src/hybrid_proxy/server.py`

**Step 1: Write the failing test**

```python
# tests/test_server_analytics.py
import pytest
from httpx import AsyncClient
from hybrid_proxy.server import app

@pytest.mark.asyncio
async def test_analytics_summary_endpoint():
    """Test GET /v1/analytics/summary returns stats."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        response = await client.get("/v1/analytics/summary")

    assert response.status_code == 200
    data = response.json()
    assert "total_requests" in data
    assert "success_rate" in data
    assert "avg_latency_ms" in data
    assert "total_cost_usd" in data

@pytest.mark.asyncio
async def test_analytics_by_backend_endpoint():
    """Test GET /v1/analytics/by-backend."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        response = await client.get("/v1/analytics/by-backend")

    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, dict)

@pytest.mark.asyncio
async def test_analytics_hourly_endpoint():
    """Test GET /v1/analytics/hourly."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        response = await client.get("/v1/analytics/hourly?hours=24")

    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, dict)
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_server_analytics.py -v`
Expected: FAIL with "404 Not Found"

**Step 3: Write minimal implementation**

```python
# Add to src/hybrid_proxy/server.py (after imports)
from .metrics import MetricsBuffer, MetricsAggregator, RequestMetric, CostCalculator

# Initialize global metrics buffer
metrics_buffer = MetricsBuffer(max_size=10000)
cost_calculator = CostCalculator()
aggregator = MetricsAggregator(metrics_buffer)

# Add endpoints (after existing routes)
@app.get("/v1/analytics/summary")
async def get_analytics_summary(minutes: int = None):
    """Get summary statistics."""
    return aggregator.get_summary(minutes)

@app.get("/v1/analytics/by-backend")
async def get_analytics_by_backend():
    """Get statistics grouped by backend."""
    return aggregator.get_by_backend()

@app.get("/v1/analytics/hourly")
async def get_analytics_hourly(hours: int = 24):
    """Get hourly breakdown."""
    return aggregator.get_hourly(hours)

@app.get("/v1/analytics/recent")
async def get_analytics_recent(count: int = 100):
    """Get recent requests."""
    metrics = metrics_buffer.get_recent(count)
    return {
        "count": len(metrics),
        "requests": [
            {
                "request_id": m.request_id,
                "timestamp": m.timestamp,
                "backend": m.backend,
                "task_type": m.task_type,
                "model": m.model,
                "tokens": m.input_tokens + m.output_tokens,
                "latency_ms": m.latency_ms,
                "success": m.success,
                "cost_usd": m.cost_usd,
            }
            for m in metrics
        ]
    }
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_server_analytics.py -v`
Expected: PASS (3 tests)

**Step 5: Commit**

```bash
git add src/hybrid_proxy/server.py tests/test_server_analytics.py
git commit -m "feat(hybrid-proxy): add analytics REST endpoints"
```

---

## Phase 2: Request Logging Integration

### Task 5: Integrate Metrics into Request Flow

**Files:**
- Modify: `src/hybrid_proxy/server.py`

**Step 1: Write the failing test**

```python
# tests/test_server_integration.py
import pytest
from httpx import AsyncClient
from hybrid_proxy.server import app, metrics_buffer

@pytest.mark.asyncio
async def test_request_gets_logged_to_metrics():
    """Test that proxied requests are logged to metrics buffer."""
    metrics_buffer.clear()

    # Make a request (will fail without backend, but should still log)
    async with AsyncClient(app=app, base_url="http://test") as client:
        try:
            await client.post("/v1/messages", json={
                "model": "claude-3-5-sonnet-20241022",
                "max_tokens": 100,
                "messages": [{"role": "user", "content": "test"}]
            })
        except:
            pass  # Request may fail, that's ok

    # Check metrics were logged
    metrics = metrics_buffer.get_all()
    assert len(metrics) >= 1  # At least one metric logged
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_server_integration.py -v`
Expected: FAIL (no metrics logged)

**Step 3: Write minimal implementation**

Modify the proxy endpoint in `server.py` to log metrics:

```python
# In the proxy_v1_messages function, wrap the request handling:
import uuid
import time

@app.post("/v1/messages")
async def proxy_v1_messages(request: Request):
    request_id = str(uuid.uuid4())[:8]
    start_time = time.time()

    # ... existing code ...

    # After response, log metric
    latency_ms = (time.time() - start_time) * 1000

    metric = RequestMetric(
        request_id=request_id,
        timestamp=datetime.utcnow().isoformat() + "Z",
        backend=backend_used,  # "claude" or "lm_studio"
        task_type=routing_decision.get("task_type", "default"),
        model=request_body.get("model", "unknown"),
        input_tokens=response_data.get("usage", {}).get("input_tokens", 0),
        output_tokens=response_data.get("usage", {}).get("output_tokens", 0),
        latency_ms=latency_ms,
        success=resp.status_code == 200,
        cost_usd=cost_calculator.calculate(
            request_body.get("model", ""),
            response_data.get("usage", {}).get("input_tokens", 0),
            response_data.get("usage", {}).get("output_tokens", 0)
        ),
        error_message=response_data.get("error", {}).get("message") if resp.status_code != 200 else None,
    )
    metrics_buffer.add(metric)
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_server_integration.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add src/hybrid_proxy/server.py tests/test_server_integration.py
git commit -m "feat(hybrid-proxy): integrate metrics logging into request flow"
```

---

## Phase 3: WordPress Plugin Extension

### Task 6: Add Analytics Widget to Plugin

**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-llm-router/includes/class-dashboard.php`
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-llm-router/assets/js/dashboard.js`

**Step 1: Write the failing test** (Manual browser test)

Access WordPress admin > LLM Router > Analytics Dashboard - expect to see charts and cost summary.

**Step 2: Implement PHP endpoint**

```php
// Add to class-dashboard.php

/**
 * Get analytics summary via AJAX
 */
public function ajax_get_analytics() {
    check_ajax_referer('llm_router_nonce', 'nonce');

    $proxy_url = get_option('llm_router_proxy_url', 'http://localhost:4000');

    $response = wp_remote_get($proxy_url . '/v1/analytics/summary');
    if (is_wp_error($response)) {
        wp_send_json_error($response->get_error_message());
    }

    $summary = json_decode(wp_remote_retrieve_body($response), true);

    // Get by-backend stats
    $backend_response = wp_remote_get($proxy_url . '/v1/analytics/by-backend');
    $by_backend = json_decode(wp_remote_retrieve_body($backend_response), true);

    wp_send_json_success([
        'summary' => $summary,
        'by_backend' => $by_backend,
    ]);
}

/**
 * Get hourly analytics for charts
 */
public function ajax_get_hourly() {
    check_ajax_referer('llm_router_nonce', 'nonce');

    $proxy_url = get_option('llm_router_proxy_url', 'http://localhost:4000');
    $hours = isset($_GET['hours']) ? intval($_GET['hours']) : 24;

    $response = wp_remote_get($proxy_url . '/v1/analytics/hourly?hours=' . $hours);
    if (is_wp_error($response)) {
        wp_send_json_error($response->get_error_message());
    }

    wp_send_json_success(json_decode(wp_remote_retrieve_body($response), true));
}
```

**Step 3: Add Chart.js visualization**

```javascript
// Add to dashboard.js

class AnalyticsDashboard {
    constructor() {
        this.charts = {};
        this.initCharts();
        this.bindEvents();
        this.refresh();
    }

    initCharts() {
        // Cost by Backend Pie Chart
        const ctxPie = document.getElementById('chart-cost-by-backend');
        if (ctxPie) {
            this.charts.pie = new Chart(ctxPie, {
                type: 'doughnut',
                data: {
                    labels: [],
                    datasets: [{
                        data: [],
                        backgroundColor: ['#4CAF50', '#2196F3', '#FF9800', '#E91E63'],
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: { position: 'bottom' },
                        title: { display: true, text: 'Cost by Backend' }
                    }
                }
            });
        }

        // Hourly Usage Line Chart
        const ctxLine = document.getElementById('chart-hourly-usage');
        if (ctxLine) {
            this.charts.line = new Chart(ctxLine, {
                type: 'line',
                data: {
                    labels: [],
                    datasets: [{
                        label: 'Requests',
                        data: [],
                        borderColor: '#2196F3',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Cost ($)',
                        data: [],
                        borderColor: '#4CAF50',
                        tension: 0.3,
                        yAxisID: 'y1'
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: { beginAtZero: true, title: { display: true, text: 'Requests' } },
                        y1: { position: 'right', beginAtZero: true, title: { display: true, text: 'Cost ($)' }, grid: { drawOnChartArea: false } }
                    }
                }
            });
        }
    }

    async refresh() {
        try {
            // Fetch summary
            const summaryResp = await fetch(ajaxurl + '?action=llm_router_get_analytics&nonce=' + llmRouterNonce);
            const summaryData = await summaryResp.json();

            if (summaryData.success) {
                this.updateSummary(summaryData.data.summary);
                this.updatePieChart(summaryData.data.by_backend);
            }

            // Fetch hourly
            const hourlyResp = await fetch(ajaxurl + '?action=llm_router_get_hourly&nonce=' + llmRouterNonce + '&hours=24');
            const hourlyData = await hourlyResp.json();

            if (hourlyData.success) {
                this.updateLineChart(hourlyData.data);
            }
        } catch (err) {
            console.error('Failed to refresh analytics:', err);
        }
    }

    updateSummary(summary) {
        document.getElementById('stat-total-requests').textContent = summary.total_requests || 0;
        document.getElementById('stat-success-rate').textContent = ((summary.success_rate || 0) * 100).toFixed(1) + '%';
        document.getElementById('stat-avg-latency').textContent = (summary.avg_latency_ms || 0).toFixed(0) + 'ms';
        document.getElementById('stat-total-cost').textContent = '$' + (summary.total_cost_usd || 0).toFixed(4);
    }

    updatePieChart(byBackend) {
        if (!this.charts.pie || !byBackend) return;

        const labels = Object.keys(byBackend);
        const costs = labels.map(k => byBackend[k].cost || 0);

        this.charts.pie.data.labels = labels;
        this.charts.pie.data.datasets[0].data = costs;
        this.charts.pie.update();
    }

    updateLineChart(hourly) {
        if (!this.charts.line || !hourly) return;

        const sortedHours = Object.keys(hourly).sort();
        const labels = sortedHours.map(h => h.substring(11, 16)); // HH:MM
        const requests = sortedHours.map(h => hourly[h].count || 0);
        const costs = sortedHours.map(h => hourly[h].cost || 0);

        this.charts.line.data.labels = labels;
        this.charts.line.data.datasets[0].data = requests;
        this.charts.line.data.datasets[1].data = costs;
        this.charts.line.update();
    }

    bindEvents() {
        // Auto-refresh every 30 seconds
        setInterval(() => this.refresh(), 30000);

        // Manual refresh button
        const refreshBtn = document.getElementById('btn-refresh-analytics');
        if (refreshBtn) {
            refreshBtn.addEventListener('click', () => this.refresh());
        }
    }
}

// Initialize on DOM ready
document.addEventListener('DOMContentLoaded', () => {
    window.analyticsDashboard = new AnalyticsDashboard();
});
```

**Step 4: Manual verification**

Start WordPress dev server, navigate to plugin page, verify charts render.

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/wp-content/plugins/geometry-os-llm-router/
git commit -m "feat(wordpress): add Chart.js analytics dashboard to LLM Router plugin"
```

---

## Phase 4: Cost Optimization Suggestions

### Task 7: Add Optimization Endpoint

**Files:**
- Modify: `src/hybrid_proxy/metrics.py`
- Modify: `src/hybrid_proxy/server.py`

**Step 1: Write the failing test**

```python
# tests/test_metrics.py (add)
def test_optimization_suggestions():
    """Test cost optimization suggestions."""
    buffer = MetricsBuffer(max_size=100)
    # Add some expensive default tasks that could be routed locally
    for i in range(10):
        buffer.add(RequestMetric(
            f"r{i}", f"2026-02-23T12:{i:02d}:00Z", "claude", "default",
            "claude-3-5-sonnet", 500, 200, 1500, True, 0.0045
        ))

    agg = MetricsAggregator(buffer)
    suggestions = agg.get_optimization_suggestions()

    assert len(suggestions) >= 1
    assert any("background" in s["suggestion"].lower() or "local" in s["suggestion"].lower()
               for s in suggestions)
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py::test_optimization_suggestions -v`
Expected: FAIL with "AttributeError: 'MetricsAggregator' has no attribute 'get_optimization_suggestions'"

**Step 3: Write minimal implementation**

```python
# Add to MetricsAggregator class in metrics.py

def get_optimization_suggestions(self) -> List[Dict[str, Any]]:
    """Generate cost optimization suggestions based on metrics."""
    metrics = self.buffer.get_all()
    suggestions = []

    if not metrics:
        return suggestions

    # Analyze task type distribution
    by_task = {}
    for m in metrics:
        if m.task_type not in by_task:
            by_task[m.task_type] = {"count": 0, "cost": 0.0, "cloud_count": 0}
        by_task[m.task_type]["count"] += 1
        by_task[m.task_type]["cost"] += m.cost_usd
        if m.backend != "lm_studio":
            by_task[m.task_type]["cloud_count"] += 1

    # Suggest moving background tasks to local
    if "background" in by_task:
        bg = by_task["background"]
        if bg["cloud_count"] > 0 and bg["cost"] > 0.10:
            suggestions.append({
                "type": "routing",
                "priority": "high",
                "suggestion": f"Route {bg['cloud_count']} background tasks to LM Studio to save ~${bg['cost']:.2f}",
                "potential_savings_usd": bg["cost"],
            })

    # Check for expensive think tasks
    if "think" in by_task and by_task["think"]["cost"] > 1.0:
        suggestions.append({
            "type": "model_selection",
            "priority": "medium",
            "suggestion": "Consider using Claude Haiku for simpler think tasks",
            "potential_savings_usd": by_task["think"]["cost"] * 0.5,
        })

    # Check fallback rate
    fallbacks = sum(1 for m in metrics if m.routed_from)
    if fallbacks > len(metrics) * 0.1:  # >10% fallback rate
        suggestions.append({
            "type": "reliability",
            "priority": "high",
            "suggestion": f"High fallback rate ({fallbacks}/{len(metrics)}). Consider upgrading cloud plan.",
            "potential_savings_usd": 0,
        })

    return sorted(suggestions, key=lambda x: {"high": 0, "medium": 1, "low": 2}.get(x["priority"], 3))
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py -v`
Expected: PASS

**Step 5: Add endpoint**

```python
# Add to server.py

@app.get("/v1/analytics/optimization")
async def get_optimization_suggestions():
    """Get cost optimization suggestions."""
    return {
        "suggestions": aggregator.get_optimization_suggestions(),
        "generated_at": datetime.utcnow().isoformat() + "Z",
    }
```

**Step 6: Commit**

```bash
git add src/hybrid_proxy/metrics.py src/hybrid_proxy/server.py tests/test_metrics.py
git commit -m "feat(hybrid-proxy): add cost optimization suggestions endpoint"
```

---

## Final Integration Test

### Task 8: End-to-End Analytics Test

**Files:**
- Create: `tests/test_e2e_analytics.py`

**Step 1: Write the test**

```python
# tests/test_e2e_analytics.py
import pytest
import time
from httpx import AsyncClient
from hybrid_proxy.server import app, metrics_buffer

@pytest.mark.asyncio
async def test_full_analytics_flow():
    """Test complete analytics flow from request to dashboard."""
    metrics_buffer.clear()

    async with AsyncClient(app=app, base_url="http://test") as client:
        # Make several requests (will fail without backend but log metrics)
        for i in range(3):
            try:
                await client.post("/v1/messages", json={
                    "model": "claude-3-5-sonnet",
                    "max_tokens": 100,
                    "messages": [{"role": "user", "content": f"test {i}"}]
                })
            except:
                pass

        time.sleep(0.1)  # Allow async logging

        # Check analytics endpoints
        summary_resp = await client.get("/v1/analytics/summary")
        assert summary_resp.status_code == 200

        by_backend_resp = await client.get("/v1/analytics/by-backend")
        assert by_backend_resp.status_code == 200

        recent_resp = await client.get("/v1/analytics/recent?count=10")
        assert recent_resp.status_code == 200
        recent_data = recent_resp.json()
        assert recent_data["count"] >= 3

        opt_resp = await client.get("/v1/analytics/optimization")
        assert opt_resp.status_code == 200
```

**Step 2: Run all tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && .venv/bin/python -m pytest tests/test_metrics.py tests/test_server_analytics.py tests/test_server_integration.py tests/test_e2e_analytics.py -v`
Expected: All PASS

**Step 3: Commit**

```bash
git add tests/test_e2e_analytics.py
git commit -m "test(hybrid-proxy): add end-to-end analytics integration test"
```

---

## Summary

| Phase | Tasks | Estimated Time |
|-------|-------|----------------|
| Phase 1: Metrics & Endpoints | 4 | ~45 min |
| Phase 2: Request Logging | 1 | ~30 min |
| Phase 3: WordPress Plugin | 1 | ~1.5 hrs |
| Phase 4: Optimization | 1 | ~30 min |
| E2E Testing | 1 | ~15 min |
| **Total** | **8** | **~3.5 hrs** |

---

## Execution Options

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
