# Geometry OS Monitoring Guide

> Comprehensive monitoring and observability for Geometry OS

## Table of Contents

- [Monitoring Overview](#monitoring-overview)
- [Health Checks](#health-checks)
- [Metrics](#metrics)
- [Logging](#logging)
- [Alerting](#alerting)
- [Dashboards](#dashboards)
- [Performance Monitoring](#performance-monitoring)
- [Distributed Tracing](#distributed-tracing)

---

## Monitoring Overview

Geometry OS provides comprehensive observability through:

| Component | Purpose | Technology |
|-----------|---------|------------|
| Health Checks | Service availability | HTTP endpoints |
| Metrics | Performance data | Prometheus format |
| Logging | Event recording | Structured JSON |
| Alerting | Issue notification | Prometheus AlertManager |
| Dashboards | Visualization | Grafana |
| Tracing | Request flow | OpenTelemetry |

---

## Health Checks

### HTTP Health Endpoints

All services expose health endpoints:

```bash
# Evolution Daemon
curl http://localhost:8773/health

# Tectonic Server
curl http://localhost:8772/health

# Visual Shell
curl http://localhost:8080/health

# MCP Server
curl http://localhost:3000/health
```

### Health Response Format

```json
{
    "status": "healthy",
    "timestamp": "2026-03-11T06:00:00Z",
    "version": "4.0.1",
    "uptime_seconds": 86400,
    "checks": {
        "database": "healthy",
        "gpu": "healthy",
        "lm_studio": "healthy",
        "memory": "healthy"
    },
    "metrics": {
        "memory_mb": 512,
        "cpu_percent": 25.5,
        "gpu_memory_mb": 2048
    }
}
```

### Health Check Script

```bash
#!/bin/bash
# scripts/health-check.sh

SERVICES=(
    "http://localhost:8773/health:District"
    "http://localhost:8772/health:Tectonic"
    "http://localhost:8080/health:Visual Shell"
    "http://localhost:3000/health:MCP Server"
)

for service in "${SERVICES[@]}"; do
    url="${service%%:*}"
    name="${service##*:}"
    
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    
    if [ "$response" = "200" ]; then
        echo "✅ $name: Healthy"
    else
        echo "❌ $name: Unhealthy (HTTP $response)"
    fi
done
```

---

## Metrics

### Prometheus Integration

Enable Prometheus metrics in configuration:

```yaml
# .geometry/config.yaml
monitoring:
  prometheus:
    enabled: true
    port: 9090
    path: /metrics
```

### Available Metrics

#### Evolution Daemon Metrics

| Metric | Type | Description |
|--------|------|-------------|
| `geometry_os_evolution_cycles_total` | Counter | Total evolution cycles executed |
| `geometry_os_evolution_cycle_duration_seconds` | Histogram | Duration of evolution cycles |
| `geometry_os_pas_score` | Gauge | Current Phase Alignment Stability score |
| `geometry_os_mutations_applied_total` | Counter | Total mutations applied |
| `geometry_os_mutations_rejected_total` | Counter | Mutations rejected by safety checks |
| `geometry_os_repairs_triggered_total` | Counter | Repair cycles triggered |
| `geometry_os_fitness_score` | Gauge | Current fitness score |

#### Visual Shell Metrics

| Metric | Type | Description |
|--------|------|-------------|
| `geometry_os_frames_rendered_total` | Counter | Total frames rendered |
| `geometry_os_frame_duration_seconds` | Histogram | Frame rendering duration |
| `geometry_os_fps` | Gauge | Current frames per second |
| `geometry_os_glyphs_rendered_total` | Counter | Total glyphs rendered |
| `geometry_os_foveal_hit_rate` | Gauge | Foveated rendering cache hit rate |

#### Pixel Brain Metrics

| Metric | Type | Description |
|--------|------|-------------|
| `geometry_os_inference_requests_total` | Counter | Total inference requests |
| `geometry_os_inference_latency_seconds` | Histogram | Inference latency |
| `geometry_os_inference_tokens_total` | Counter | Total tokens generated |
| `geometry_os_model_memory_bytes` | Gauge | Model memory usage |
| `geometry_os_cache_hits_total` | Counter | KV-cache hits |
| `geometry_os_cache_misses_total` | Counter | KV-cache misses |

#### Swarm Metrics

| Metric | Type | Description |
|--------|------|-------------|
| `geometry_os_swarm_nodes_total` | Gauge | Total registered nodes |
| `geometry_os_swarm_nodes_active` | Gauge | Currently active nodes |
| `geometry_os_tasks_submitted_total` | Counter | Tasks submitted |
| `geometry_os_tasks_completed_total` | Counter | Tasks completed |
| `geometry_os_tasks_failed_total` | Counter | Tasks failed |
| `geometry_os_task_duration_seconds` | Histogram | Task execution duration |

#### System Metrics

| Metric | Type | Description |
|--------|------|-------------|
| `geometry_os_memory_bytes` | Gauge | Process memory usage |
| `geometry_os_cpu_percent` | Gauge | CPU usage percentage |
| `geometry_os_gpu_memory_bytes` | Gauge | GPU memory usage |
| `geometry_os_gpu_utilization_percent` | Gauge | GPU utilization |
| `geometry_os_disk_io_bytes` | Counter | Disk I/O bytes |

### Prometheus Configuration

```yaml
# prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'geometry-os'
    static_configs:
      - targets:
          - 'localhost:9090'
          - 'node1:9090'
          - 'node2:9090'
    relabel_configs:
      - source_labels: [__address__]
        target_label: instance
```

---

## Logging

### Log Levels

| Level | Description |
|-------|-------------|
| DEBUG | Detailed debugging information |
| INFO | General operational information |
| WARNING | Potential issues detected |
| ERROR | Error conditions |
| CRITICAL | System-critical errors |

### Configuration

```yaml
# .geometry/config.yaml
logging:
  level: INFO
  format: json
  output: /var/log/geometry-os/app.log
  rotation:
    max_size: 100MB
    max_files: 10
  structured: true
```

### Log Format

Structured JSON logs:

```json
{
    "timestamp": "2026-03-11T06:00:00.123Z",
    "level": "INFO",
    "logger": "evolution_daemon",
    "message": "Evolution cycle completed",
    "context": {
        "cycle_id": "cycle_12345",
        "pas_score": 0.95,
        "mutations_applied": 2,
        "duration_ms": 150
    },
    "trace_id": "abc123",
    "span_id": "def456"
}
```

### Log Aggregation with Loki

```yaml
# loki-config.yml
auth_enabled: false

server:
  http_listen_port: 3100

schema_config:
  configs:
    - from: 2026-01-01
      store: boltdb-shipper
      object_store: filesystem
      schema: v11
      index:
        prefix: geometry_os_
        period: 24h

storage_config:
  filesystem:
    directory: /loki/chunks
  boltdb_shipper:
    active_index_directory: /loki/index
    cache_location: /loki/cache
```

### Promtail Configuration

```yaml
# promtail-config.yml
server:
  http_listen_port: 9080

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://loki:3100/loki/api/v1/push

scrape_configs:
  - job_name: geometry-os
    static_configs:
      - targets:
          - localhost
        labels:
          job: geometry-os
          __path__: /var/log/geometry-os/*.log
```

---

## Alerting

### AlertManager Configuration

```yaml
# alertmanager.yml
global:
  resolve_timeout: 5m
  smtp_smarthost: 'smtp.example.com:587'
  smtp_from: 'alerts@geometry-os.example.com'

route:
  group_by: ['alertname', 'severity']
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 4h
  receiver: 'team-email'
  routes:
    - match:
        severity: critical
      receiver: 'team-pagerduty'

receivers:
  - name: 'team-email'
    email_configs:
      - to: 'team@example.com'
        
  - name: 'team-pagerduty'
    pagerduty_configs:
      - service_key: '<pagerduty-key>'
```

### Alert Rules

```yaml
# alerts.yml
groups:
  - name: geometry-os
    rules:
      # Evolution Daemon Alerts
      - alert: EvolutionDaemonDown
        expr: up{job="geometry-os"} == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Evolution Daemon is down"
          description: "Evolution Daemon has been down for more than 1 minute"

      - alert: LowPASScore
        expr: geometry_os_pas_score < 0.5
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "Low PAS Score"
          description: "PAS score is {{ $value }} - fractures may be occurring"

      - alert: HighMutationRejectionRate
        expr: rate(geometry_os_mutations_rejected_total[5m]) > 10
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "High mutation rejection rate"
          description: "Many mutations being rejected - check safety system"

      # Performance Alerts
      - alert: LowFPS
        expr: geometry_os_fps < 30
        for: 2m
        labels:
          severity: warning
        annotations:
          summary: "Low frame rate"
          description: "FPS is {{ $value }} - below 30 FPS threshold"

      - alert: HighInferenceLatency
        expr: histogram_quantile(0.95, rate(geometry_os_inference_latency_seconds_bucket[5m])) > 2
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "High inference latency"
          description: "95th percentile latency is {{ $value }}s"

      # Resource Alerts
      - alert: HighMemoryUsage
        expr: geometry_os_memory_bytes / (1024 * 1024 * 1024) > 8
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "High memory usage"
          description: "Memory usage is {{ $value }}GB"

      - alert: SwarmNodesDown
        expr: geometry_os_swarm_nodes_total - geometry_os_swarm_nodes_active > 3
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "Multiple swarm nodes down"
          description: "{{ $value }} swarm nodes are inactive"
```

---

## Dashboards

### Grafana Dashboard

Import the provided dashboard:

```bash
# Import dashboard
curl -X POST http://admin:admin@localhost:3000/api/dashboards/import \
    -H "Content-Type: application/json" \
    -d @monitoring/grafana-dashboard.json
```

### Dashboard Panels

#### Overview Dashboard

| Panel | Description |
|-------|-------------|
| Service Status | Health status of all services |
| System Resources | CPU, Memory, GPU usage |
| Request Rate | Requests per second |
| Error Rate | Errors per second |
| Latency | 50th, 95th, 99th percentile latency |

#### Evolution Dashboard

| Panel | Description |
|-------|-------------|
| PAS Score | Current and historical PAS scores |
| Mutation Rate | Mutations applied per minute |
| Repair Events | Repair cycles triggered |
| Fitness Trend | Fitness score over time |

#### Swarm Dashboard

| Panel | Description |
|-------|-------------|
| Active Nodes | Number of active nodes |
| Task Queue | Pending, running, completed tasks |
| Node Health | Per-node health status |
| Task Distribution | Tasks by type and status |

### Creating Custom Dashboards

```json
{
    "dashboard": {
        "title": "Custom Geometry OS Dashboard",
        "panels": [
            {
                "title": "PAS Score",
                "type": "gauge",
                "targets": [
                    {
                        "expr": "geometry_os_pas_score",
                        "refId": "A"
                    }
                ],
                "fieldConfig": {
                    "defaults": {
                        "thresholds": {
                            "mode": "absolute",
                            "steps": [
                                {"color": "red", "value": 0},
                                {"color": "yellow", "value": 0.5},
                                {"color": "green", "value": 0.8}
                            ]
                        }
                    }
                }
            }
        ]
    }
}
```

---

## Performance Monitoring

### Profiling

Enable profiling:

```bash
# Enable profiling
export GEOMETRY_OS_PROFILE=1

# Run with profiling
python3 -m cProfile -o profile.stats geometry_os_cli.py start

# Analyze profile
python3 -c "
import pstats
p = pstats.Stats('profile.stats')
p.sort_stats('cumulative')
p.print_stats(20)
"
```

### Memory Profiling

```bash
# Install memory profiler
pip install memory-profiler

# Profile memory
python3 -m memory_profiler geometry_os_cli.py start
```

### GPU Profiling

```bash
# NVIDIA profiling
nsys profile -o geometry-os-profile python3 geometry_os_cli.py start

# View results
nsys-ui geometry-os-profile.qdrep
```

---

## Distributed Tracing

### OpenTelemetry Integration

```yaml
# .geometry/config.yaml
tracing:
  enabled: true
  service_name: geometry-os
  exporter:
    type: otlp
    endpoint: http://jaeger:4317
  sampling_rate: 0.1
```

### Jaeger Setup

```yaml
# docker-compose.yml for Jaeger
version: '3.8'
services:
  jaeger:
    image: jaegertracing/all-in-one:latest
    ports:
      - "16686:16686"  # UI
      - "4317:4317"    # OTLP gRPC
      - "4318:4318"    # OTLP HTTP
```

### Trace Example

```python
from opentelemetry import trace

tracer = trace.get_tracer(__name__)

async def process_evolution_cycle():
    with tracer.start_as_current_span("evolution_cycle") as span:
        span.set_attribute("cycle.id", cycle_id)
        
        with tracer.start_as_current_span("detect_fractures"):
            fractures = detect_fractures()
            
        with tracer.start_as_current_span("apply_mutations"):
            apply_mutations(fractures)
```

---

## Monitoring Best Practices

### 1. Set Up Alerts Early

Configure alerts before deploying to production.

### 2. Use Structured Logging

Always use structured JSON logs for easier parsing.

### 3. Monitor Trends

Watch for gradual degradation, not just failures.

### 4. Set Appropriate Thresholds

Base alert thresholds on actual baseline performance.

### 5. Create Runbooks

Document procedures for responding to alerts.

---

## Troubleshooting Monitoring Issues

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| Metrics not appearing | Prometheus not scraping | Check scrape config |
| High cardinality | Too many label values | Limit label cardinality |
| Missing logs | Log rotation too aggressive | Increase retention |
| Alert storms | Thresholds too sensitive | Adjust thresholds |

### Diagnostic Commands

```bash
# Check Prometheus targets
curl http://localhost:9090/api/v1/targets

# Query metrics directly
curl 'http://localhost:9090/api/v1/query?query=geometry_os_pas_score'

# Check AlertManager alerts
curl http://localhost:9093/api/v1/alerts

# View log file
tail -f /var/log/geometry-os/app.log | jq .
```

---

## See Also

- [Deployment Guide](DEPLOYMENT.md)
- [Troubleshooting Guide](../TROUBLESHOOTING.md)
- [API Reference](API_REFERENCE.md)
- [Performance Optimization](PROFILING.md)

---

*Last Updated: 2026-03-11*
*Version: 4.0.1*
