# Hybrid Proxy Analytics Dashboard - Design Document

**Date:** 2026-02-23
**Author:** Winston (Architect Agent)
**Status:** Approved
**Related:** Hybrid LLM Proxy (`src/hybrid_proxy/`), WordPress Plugin (`geometry-os-llm-router/`)

---

## Overview

Extend the Hybrid LLM Proxy and WordPress plugin to provide comprehensive analytics on routing decisions, costs, and performance. This enables data-driven optimization of the local/cloud routing strategy.

---

## Goals

1. **Cost Tracking** - Monitor API spending by hour/day, calculate savings from local offload
2. **Performance Monitoring** - Track latency and throughput by backend
3. **Routing Optimization** - Analyze decision patterns to improve classification accuracy

---

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    WORDPRESS ADMIN DASHBOARD                     │
│  Geometry OS > LLM Router > Analytics                           │
│                                                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐      │
│  │ COST TRACKER │  │ PERFORMANCE  │  │ ROUTING DECISIONS│      │
│  │ • $/hour     │  │ • Latency    │  │ • Local vs Cloud │      │
│  │ • $/day      │  │ • Throughput │  │ • By task type   │      │
│  │ • Savings %  │  │ • Error rate │  │ • Accuracy score │      │
│  └──────────────┘  └──────────────┘  └──────────────────┘      │
└───────────────────────────────┬─────────────────────────────────┘
                                │ REST API (30s-1min polling)
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                     HYBRID PROXY (port 4000)                     │
│                                                                  │
│  /v1/analytics endpoint (NEW)                                    │
│  • In-memory ring buffer (last 24h, ~10K entries)               │
│  • Aggregates on-demand for dashboard queries                    │
│  • Optional SQLite persistence for long-term trends             │
└─────────────────────────────────────────────────────────────────┘
```

---

## Data Model

### Request Log Entry

```python
@dataclass
class RequestLog:
    timestamp: datetime
    task_type: str           # "background" | "default" | "think"
    backend: str             # "z.ai_cloud" | "lm_studio_local"
    model: str               # "glm-5", "qwen2.5-coder-7b", etc.
    tokens_prompt: int
    tokens_completion: int
    latency_ms: int
    routing_reason: str      # "complexity_score: 4" | "privacy_guard" | etc.
    fallback_triggered: bool
    source_worktree: str     # "main" | "feat/xxx"
```

### Aggregated Metrics

```python
@dataclass
class HourlyMetrics:
    hour: datetime
    total_requests: int
    local_requests: int
    cloud_requests: int
    total_tokens_prompt: int
    total_tokens_completion: int
    avg_latency_ms: float
    fallback_count: int
    estimated_cost_usd: float
```

---

## API Endpoints

### GET /v1/analytics/summary

Returns aggregated metrics for dashboard widgets.

```json
{
  "current_hour": {
    "requests": 45,
    "local_percent": 62,
    "cloud_percent": 38,
    "tokens_prompt": 12500,
    "tokens_completion": 8200,
    "avg_latency_ms": 850,
    "estimated_cost_usd": 0.12
  },
  "today": {
    "requests": 340,
    "local_percent": 58,
    "tokens_total": 156000,
    "estimated_cost_usd": 0.89,
    "savings_vs_all_cloud_usd": 1.45
  },
  "by_backend": {
    "z.ai_cloud": {"requests": 142, "avg_latency_ms": 1200},
    "lm_studio_local": {"requests": 198, "avg_latency_ms": 450}
  },
  "routing_reasons": {
    "complexity_score": 89,
    "privacy_guard": 23,
    "token_estimation": 15,
    "background_task": 67
  },
  "fallback_events": 3
}
```

### GET /v1/analytics/history?hours=24

Returns hourly breakdown for charts.

---

## WordPress Plugin Extensions

### New Files

```
geometry-os-llm-router/
├── includes/
│   └── class-analytics-client.php   # API client for /v1/analytics
├── admin/
│   └── page-analytics.php           # Dashboard page (already exists, extend)
└── assets/
    └── js/analytics.js              # Chart.js visualizations (already exists)
```

### Dashboard Widgets

| Widget | Description | Refresh |
|--------|-------------|---------|
| Cost This Hour | `$X.XX` with trend arrow | 30s |
| Cost Today | Running total | 1min |
| Savings Badge | `$X.XX saved by local routing` | 1min |
| Local/Cloud Pie | Visual split | 30s |
| Latency by Backend | Bar chart | 1min |
| Routing Reasons Table | Top 5 reasons with counts | 1min |
| Fallback Events | Alert-style counter (red if > 0) | 30s |

---

## Cost Estimation Formula

```python
# Z.ai Cloud pricing (estimate, adjust to actual)
ZAI_COST_PER_1K_PROMPT = 0.0005    # $0.0005 per 1K prompt tokens
ZAI_COST_PER_1K_COMPLETION = 0.0015  # $0.0015 per 1K completion tokens

# LM Studio Local = $0 (free)

def calculate_cost(tokens_prompt, tokens_completion, backend):
    if backend == "lm_studio_local":
        return 0.0
    return (tokens_prompt / 1000 * ZAI_COST_PER_1K_PROMPT +
            tokens_completion / 1000 * ZAI_COST_PER_1K_COMPLETION)
```

---

## Implementation Phases

### Phase 1: Proxy Analytics Endpoint (~45 min)
- Add `MetricsCollector` class to `src/hybrid_proxy/`
- Implement in-memory ring buffer (collections.deque with maxlen)
- Add `/v1/analytics/summary` and `/v1/analytics/history` endpoints
- Hook into router to log each request

### Phase 2: Request Logging (~30 min)
- Modify `RequestRouter.route()` to capture metrics
- Add latency timing wrapper
- Store routing reason in log entry

### Phase 3: WordPress Plugin Extension (~1.5 hrs)
- Create `class-analytics-client.php` for API calls
- Extend `page-analytics.php` with new widgets
- Add AJAX handlers for dashboard refresh

### Phase 4: Chart.js Visualizations (~1 hr)
- Cost gauge chart
- Local/Cloud pie chart
- Latency bar chart
- Hourly trend line chart

---

## Success Criteria

- [ ] Dashboard shows real-time cost estimates
- [ ] Local vs Cloud split visible at a glance
- [ ] Fallback events prominently displayed
- [ ] Page loads in < 2 seconds
- [ ] Data refreshes automatically every 30-60 seconds

---

## Future Enhancements (Out of Scope)

- SQLite persistence for >24h history
- Export to CSV/JSON
- Alert thresholds (e.g., cost > $X/hour)
- Per-worktree breakdown
- Custom date range selection
