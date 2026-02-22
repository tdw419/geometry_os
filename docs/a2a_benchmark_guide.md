# A2A Scale Testing Guide

**Geometry OS - Agent-to-Agent Load Testing Framework**

## Overview

The A2A Load Testing framework validates the agent-to-agent protocol under load. It simulates multiple virtual agents communicating via WebSocket to measure throughput, latency, and identify bottlenecks before deploying complex multi-agent applications.

Key capabilities:

- **Virtual Agent Spawning** - Create N concurrent agents with configurable types
- **Topology Support** - Test different communication patterns (star, mesh, ring, line)
- **Metrics Collection** - Throughput, latency percentiles, error rates
- **Comprehensive Reports** - JSON output with grouped statistics

## Quick Start

```bash
# Start the A2A router (in one terminal)
python -m systems.pixel_compiler.a2a_router

# In another terminal, run a quick benchmark
python -m systems.pixel_compiler.a2a_load_test --quick

# Full benchmark suite
python -m systems.pixel_compiler.a2a_load_test \
    --agents 10,50,100 \
    --messages 100,500,1000 \
    --topologies star,mesh,ring \
    --output benchmark_results.json
```

### Quick Test Options

| Flag | Description |
|------|-------------|
| `--quick` | Run fast test with smaller agent counts (5, 10) and fewer messages (50, 100) |
| `--router URL` | Custom router URL (default: ws://localhost:8766) |
| `--output FILE` | Output JSON file (default: benchmark_results.json) |

## Topology Types

The framework supports multiple communication topologies to test different agent coordination patterns:

| Topology | Description | Use Case | Edge Count |
|----------|-------------|----------|------------|
| **Star** | Hub-spoke pattern with coordinator at center | Task delegation, centralized control | N-1 edges |
| **Mesh** | Full peer-to-peer connectivity | Distributed consensus, gossip protocols | N*(N-1)/2 edges |
| **Ring** | Circular pipeline, each node connects to next | Sequential processing, token passing | N edges |
| **Line** | Linear chain without wrap-around | Pipeline stages, staged processing | N-1 edges |
| **Hierarchical** | Tree structure with configurable fanout | Multi-level coordination, delegation trees | Variable |

### Topology Diagrams

```
Star (Hub-Spoke):          Mesh (Full P2P):          Ring:
       [1]                  [1]──────[2]             [0]──────[1]
        │                   │╲      ╱│               │         │
   [0]──●──[2]              │  ╲    ╱ │               │         │
        │                   │   ╲  ╱  │              [3]──────[2]
       [3]                 [4]───●───[3]

Line (Pipeline):           Hierarchical:
[0]────[1]────[2]────[3]           [0]
                                  ╱  ╲
                               [1]    [2]
                              ╱  ╲   ╱  ╲
                           [3]  [4] [5]  [6]
```

### When to Use Each Topology

- **Star**: Best for coordinator-led workflows where one agent assigns tasks
- **Mesh**: Best for distributed systems requiring all-to-all communication
- **Ring**: Best for sequential pipelines where work flows through stages
- **Line**: Best for batch processing with clear start/end points
- **Hierarchical**: Best for large-scale systems with delegation hierarchies

## Metrics Explained

### Throughput

**Definition**: Messages successfully delivered per second

```
Throughput = Total Messages Sent / Duration (seconds)
```

Higher throughput indicates the router can handle more load. Compare throughput across:
- Different agent counts (scalability)
- Different topologies (communication pattern efficiency)
- Different message intervals (burst handling)

### Latency Percentiles

Latency measures round-trip time from message send to response received.

| Percentile | Meaning | Importance |
|------------|---------|------------|
| **p50** (median) | Half of requests faster than this | Typical user experience |
| **p95** | 95% of requests faster than this | Most users' experience |
| **p99** | 99% of requests faster than this | Worst-case outliers |

```
Example: p50=10ms, p95=50ms, p99=200ms
- 50% of messages complete in under 10ms
- 95% of messages complete in under 50ms
- 99% of messages complete in under 200ms
```

### Error Rate

Percentage of messages that failed to deliver. Track errors to identify:
- Router overload
- Connection failures
- Timeout issues

## Results Format

Benchmark results are saved to JSON with the following structure:

```json
{
  "summary": {
    "total_runs": 27,
    "successful": 27,
    "failed": 0,
    "avg_throughput": 125.5,
    "max_throughput": 250.0,
    "min_throughput": 50.0,
    "avg_latency_ms": 15.2,
    "max_latency_ms": 100.5,
    "by_topology": {
      "star": {
        "avg_throughput": 150.0,
        "max_throughput": 200.0,
        "min_throughput": 100.0
      },
      "mesh": {
        "avg_throughput": 100.0,
        "max_throughput": 150.0,
        "min_throughput": 50.0
      }
    },
    "by_agent_count": {
      "10": {
        "avg_throughput": 200.0,
        "max_throughput": 250.0,
        "min_throughput": 150.0
      },
      "50": {
        "avg_throughput": 100.0,
        "max_throughput": 150.0,
        "min_throughput": 50.0
      }
    }
  },
  "results": [
    {
      "agent_count": 10,
      "message_count": 100,
      "topology": "star",
      "message_interval_ms": 10,
      "repeat": 0,
      "success": true,
      "throughput_msg_per_sec": 125.5,
      "avg_latency_ms": 15.2,
      "p50_latency_ms": 12.0,
      "p95_latency_ms": 45.0,
      "p99_latency_ms": 80.0,
      "duration_sec": 0.8
    }
  ],
  "config": {
    "agent_counts": [10, 50, 100],
    "message_counts": [100, 500, 1000],
    "topologies": ["star", "mesh", "ring"],
    "message_intervals_ms": [10, 100],
    "repeat_count": 3
  }
}
```

### Interpreting Results

1. **Check `summary.failed`** - Should be 0; investigate errors if not
2. **Compare `by_topology`** - Identify which patterns perform best
3. **Check `by_agent_count`** - See how system scales with more agents
4. **Review `p99_latency`** - Watch for outliers indicating bottlenecks

## Advanced Usage

### Custom Configuration

```bash
# Test specific scenarios
python -m systems.pixel_compiler.a2a_load_test \
    --agents 5,10,20,50,100 \
    --messages 1000 \
    --topologies star,mesh \
    --intervals 1,10,100 \
    --repeat 5 \
    --output detailed_benchmark.json
```

### Programmatic Usage

```python
import asyncio
from systems.pixel_compiler.a2a_load_test import (
    BenchmarkSuite,
    BenchmarkConfig,
    LoadTestHarness,
    LoadTestScenario
)

async def run_custom_benchmark():
    # Custom configuration
    config = BenchmarkConfig(
        agent_counts=[10, 25, 50],
        message_counts=[500, 1000],
        topologies=["star", "mesh"],
        message_intervals_ms=[50],
        repeat_count=2
    )

    suite = BenchmarkSuite(
        router_url="ws://localhost:8766",
        config=config
    )

    results = await suite.run()

    # Print summary
    suite.print_summary()

    # Save to file
    suite.save_report("custom_results.json")

asyncio.run(run_custom_benchmark())
```

### Running Single Scenarios

```python
import asyncio
from systems.pixel_compiler.a2a_load_test import LoadTestHarness, LoadTestScenario

async def test_star_topology():
    harness = LoadTestHarness(
        router_url="ws://localhost:8766",
        agent_count=10
    )

    scenario = LoadTestScenario(
        name="star_test",
        message_count=100,
        message_interval_ms=50,
        topology="star"
    )

    await harness.setup()
    result = await harness.run_scenario(scenario)
    await harness.teardown()

    print(f"Throughput: {result['throughput_msg_per_sec']:.2f} msg/s")
    print(f"Avg Latency: {result['avg_latency_ms']:.2f} ms")
    print(f"p99 Latency: {result['p99_latency_ms']:.2f} ms")

asyncio.run(test_star_topology())
```

## Troubleshooting

### Router Connection Errors

```
Error: Cannot connect to ws://localhost:8766
```

**Solution**: Start the A2A router first:

```bash
python -m systems.pixel_compiler.a2a_router
```

### High Latency / Low Throughput

| Symptom | Possible Cause | Solution |
|---------|---------------|----------|
| Latency increases with agent count | Router CPU bottleneck | Increase message interval |
| p99 much higher than p50 | Queue buildup | Reduce message rate |
| Timeouts | Network issues | Check router health |

### Memory Issues with Large Agent Counts

```bash
# Use smaller batches
python -m systems.pixel_compiler.a2a_load_test \
    --agents 100 \
    --messages 100 \
    --intervals 100
```

## Related Documentation

- [A2A Coordination Guide](./a2a_coordination_guide.md) - Locks and barriers API
- [A2A Protocol Design](./plans/2026-02-12-webmcp-phase-d-design.md) - Protocol specification
- [Multi-Agent Demo](./plans/2026-02-14-multi-agent-collaboration-demo.md) - Example workflows

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Benchmark Suite                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │ Benchmark    │  │ Load Test    │  │ Topology     │     │
│  │ Config       │──│ Harness      │──│ Builder      │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
└─────────────────────────────────────────────────────────────┘
                            │
                     spawns agents
                            │
┌─────────────────────────────────────────────────────────────┐
│                    Agent Spawner                            │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │ Virtual      │  │ Virtual      │  │ Virtual      │     │
│  │ Agent 0      │  │ Agent 1      │  │ Agent N      │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
└─────────────────────────────────────────────────────────────┘
                            │
                      WebSocket
                            │
┌─────────────────────────────────────────────────────────────┐
│                    A2A Router                               │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │ Lock Manager │  │ Barrier Mgr  │  │ Agent        │     │
│  │              │  │              │  │ Registry     │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
└─────────────────────────────────────────────────────────────┘
```
