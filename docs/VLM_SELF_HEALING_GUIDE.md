# VLM Self-Healing OS Guide

> **Vision-Language Model Powered Self-Healing Operating System**

The VLM Self-Healing OS enables PixelRTS boot images to automatically detect corruption using Vision-Language Models and trigger self-healing actions without mounting or executing the OS.

## Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Installation](#installation)
4. [CLI Usage](#cli-usage)
5. [Python API](#python-api)
6. [REST API](#rest-api)
7. [Configuration](#configuration)
8. [Troubleshooting](#troubleshooting)

---

## Overview

### The VLM Advantage

Traditional binary analysis requires disassembly (`objdump`) or execution (`strace`). PixelRTS images encode binary data as RGBA pixels with Hilbert curve mapping, enabling VLMs to "see" patterns:

- **High Entropy** (Red/White noise): Compressed code, encrypted data
- **Low Entropy** (Dark/Blue): Zeroes, padding, sparse structures
- **Medium Entropy** (Green/Patterns): Text, data tables, headers
- **Anomalies**: Corruption, malware, or unexpected changes

The OS becomes **self-describing to AI** - the visual representation IS the diagnostic interface.

### Key Features

- **Visual Health Monitoring**: Periodic scans using vision models
- **Anomaly Detection**: Pattern recognition for corruption identification
- **Autonomous Healing**: Automatic recovery via SelfHealingDaemon
- **Evolution Integration**: Seamless integration with evolution protocol
- **Multi-Model Support**: LM Studio, OpenAI, Anthropic, local models

---

## Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         VLM Self-Healing OS                              │
└─────────────────────────────────────────────────────────────────────────┘
                               │
                ┌──────────────┼──────────────┐
                │              │              │
         ┌──────▼──────┐ ┌────▼─────┐ ┌─────▼──────┐
         │ VLM Health  │ │  Vision  │ │  Pattern   │
         │  Checker    │ │ Analyzer │ │  Detector  │
         └──────┬──────┘ └────┬─────┘ └─────┬──────┘
                │              │              │
                └──────────────┼──────────────┘
                               │
                ┌──────────────▼──────────────┐
                │    Self-Healing Daemon      │
                │  (Immune System)            │
                │  - Substrate Warping         │
                │  - State Reconstruction     │
                └──────────────┬──────────────┘
                               │
                ┌──────────────▼──────────────┐
                │    Evolution Daemon         │
                │  - Mutation Generation      │
                │  - Fitness Evaluation       │
                └─────────────────────────────┘
```

### Components

| Component | File | Description |
|-----------|------|-------------|
| VLMHealthChecker | `vlm_health_checker.py` | Core health checking logic |
| VLMSelfHealingDaemon | `vlm_self_healing_daemon.py` | Autonomous healing daemon |
| VisionAnalyzer | `pixelrts_vision_analyzer.py` | Visual analysis of PixelRTS |
| PatternDetector | `pattern_detector.py` | Edge/Fourier/Cluster analysis |
| REST API | `api/main.py` | HTTP API for health monitoring |

---

## Installation

### Prerequisites

```bash
# Python 3.10+
python3 --version

# Install dependencies
pip install fastapi uvicorn pillow numpy opencv-python scikit-learn scipy
```

### Optional: Vision Models

For local vision model support:

```bash
# LM Studio (recommended for local models)
# Download from https://lmstudio.ai/
# Load a vision model (e.g., llava-phi-3, llava-v1.6)

# Or use OpenAI/Anthropic APIs
# Set API keys in environment or config
export OPENAI_API_KEY="sk-..."
export ANTHROPIC_API_KEY="sk-ant-..."
```

---

## CLI Usage

The VLM Self-Healing CLI provides commands for health checking, monitoring, and analysis.

### Health Check Command

Perform a one-time health check on a PixelRTS image:

```bash
# Basic health check
python -m systems.pixel_compiler.vlm_health_cli check kernel.rts.png

# With verbose output
python -m systems.pixel_compiler.vlm_health_cli check kernel.rts.png --verbose

# Save results to JSON
python -m systems.pixel_compiler.vlm_health_cli check kernel.rts.png --output health_report.json

# Use specific vision model
python -m systems.pixel_compiler.vlm_health_cli check kernel.rts.png --model lmstudio --endpoint http://localhost:1234/v1
```

### Monitoring Command

Continuously monitor PixelRTS images for health changes:

```bash
# Monitor with 5-minute intervals
python -m systems.pixel_compiler.vlm_health_cli monitor /path/to/rts/images --interval 300

# Monitor with auto-healing enabled
python -m systems.pixel_compiler.vlm_health_cli monitor /path/to/rts/images --auto-heal --interval 60

# Monitor specific files
python -m systems.pixel_compiler.vlm_health_cli monitor kernel.rts.png system.rts.png --interval 120
```

### Analysis Command

Run detailed pattern analysis:

```bash
# Edge detection
python -m systems.pixel_compiler.vlm_health_cli analyze kernel.rts.png --method edges --edge-method sobel

# Fourier analysis
python -m systems.pixel_compiler.vlm_health_cli analyze kernel.rts.png --method fourier

# All analysis methods
python -m systems.pixel_compiler.vlm_health_cli analyze kernel.rts.png --method all --output analysis.json
```

### Daemon Command

Run the self-healing daemon as a background service:

```bash
# Start daemon
python -m systems.pixel_compiler.vlm_health_cli daemon start --config /path/to/config.yaml

# Check status
python -m systems.pixel_compiler.vlm_health_cli daemon status

# Stop daemon
python -m systems.pixel_compiler.vlm_health_cli daemon stop
```

### Vision Command

Visualize PixelRTS images with entropy overlays:

```bash
# Generate entropy overlay
python -m systems.pixel_compiler.vlm_health_cli vision kernel.rts.png --action entropy --output-dir ./output

# Generate visual summary
python -m systems.pixel_compiler.vlm_health_cli vision kernel.rts.png --action summary

# Pattern analysis with visualization
python -m systems.pixel_compiler.vlm_health_cli vision kernel.rts.png --action patterns --colormap viridis
```

---

## Python API

### VLMHealthChecker

Core class for performing health checks on PixelRTS images.

```python
from systems.pixel_compiler.vlm_health_checker import VLMHealthChecker
from systems.pixel_compiler.vlm_health_checker import HealthCheckResult, HealthStatus

# Initialize with default configuration
checker = VLMHealthChecker()

# Perform a health check
result: HealthCheckResult = checker.check_health("kernel.rts.png")

# Check status
if result.status == HealthStatus.HEALTHY:
    print(f"System is healthy: {result.confidence:.2%}")
elif result.status == HealthStatus.WARNING:
    print(f"Warning: {result.summary}")
    for finding in result.findings:
        print(f"  - {finding['category']}: {finding['description']}")
elif result.status == HealthStatus.CRITICAL:
    print(f"Critical issues detected!")
    print(f"Recommendation: {result.recommendation}")

# Access detailed metrics
print(f"Entropy: {result.metrics['mean_entropy']:.2f}")
print(f"Anomaly score: {result.metrics['anomaly_score']:.2f}")
print(f"Confidence: {result.confidence:.2%}")
```

### VLMSelfHealingDaemon

Autonomous daemon for continuous monitoring and healing.

```python
from systems.pixel_compiler.vlm_self_healing_daemon import VLMSelfHealingDaemon
import asyncio

# Create daemon instance
daemon = VLMSelfHealingDaemon(
    check_interval=300,  # 5 minutes
    auto_heal=True,
    vision_model_endpoint="http://localhost:1234/v1"
)

# Register images to monitor
daemon.register_image("kernel.rts.png", critical=True)
daemon.register_image("system.rts.png", critical=True)

# Define custom healing action
async def custom_healing_action(health_result):
    print(f"Triggered healing for: {health_result.image_path}")
    # Custom healing logic here
    return True

daemon.set_healing_action(custom_healing_action)

# Start monitoring
async def main():
    await daemon.start()
    # Daemon runs in background, performing periodic checks

asyncio.run(main())
```

### VisionAnalyzer

Direct visual analysis of PixelRTS images.

```python
from systems.pixel_compiler.pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

# Load PixelRTS image
analyzer = PixelRTSVisionAnalyzer("kernel.rts.png")

# Get visual summary
summary = analyzer.get_visual_summary()
print(f"Dimensions: {summary['width']}x{summary['height']}")
print(f"Total pixels: {summary['total_pixels']:,}")
print(f"Channels: {summary['channels']}")

# Generate entropy overlay
overlay_path = analyzer.generate_entropy_overlay(
    output_dir="./output",
    colormap="viridis"
)
print(f"Entropy overlay: {overlay_path}")

# Edge detection
edge_result = analyzer.detect_edges(method="sobel")
print(f"Edges: {edge_result['edge_count']}")
print(f"Density: {edge_result['edge_density']:.2%}")

# Fourier analysis
fourier_result = analyzer.analyze_fourier()
print(f"Periodic patterns: {fourier_result['has_periodic_patterns']}")
print(f"Dominant frequency: {fourier_result['dominant_frequency']}")

# Clustering
cluster_result = analyzer.detect_clusters(
    eps=5.0,
    min_samples=10,
    feature_type="position"
)
print(f"Clusters: {cluster_result['num_clusters']}")
print(f"Regions of interest: {len(cluster_result['regions_of_interest'])}")

# Prepare for vision model
img, b64 = analyzer.prepare_for_vision_model(max_size=512)

# Analyze with vision model (if available)
try:
    vision_response = analyzer.analyze_with_vision_model()
    print(vision_response)

    # Parse findings
    findings = analyzer.parse_vision_findings(vision_response)
    for category, items in findings.items():
        print(f"{category}: {items}")
except Exception as e:
    print(f"Vision model not available: {e}")
```

### PatternDetector

Low-level pattern detection algorithms.

```python
from systems.pixel_compiler.pattern_detector import PatternDetector

# Initialize detector
detector = PatternDetector("kernel.rts.png")

# Sobel edge detection
sobel_result = detector.detect_edges_sobel(threshold=None)
print(f"Edges: {sobel_result.edge_count}")
print(f"Density: {sobel_result.edge_density:.2%}")

# Canny edge detection
canny_result = detector.detect_edges_canny(
    low_threshold=50,
    high_threshold=150
)
print(f"Edges: {canny_result.edge_count}")
print(f"Strong edges: {len(canny_result.strong_edges)}")

# Fourier analysis
fourier_result = detector.analyze_fourier(max_frequencies=10)
print(f"Dominant frequency: {fourier_result.dominant_frequency}")
print(f"Periodic patterns: {fourier_result.has_periodic_patterns}")

# DBSCAN clustering
cluster_result = detector.detect_clusters(
    eps=5.0,
    min_samples=10,
    feature_type="position"
)
print(f"Clusters: {cluster_result.num_clusters}")
print(f"Noise points: {cluster_result.noise_points}")
for roi in cluster_result.regions_of_interest:
    print(f"  ROI: {roi['description']} (confidence: {roi['confidence']:.2%})")
```

---

## REST API

The VLM Self-Healing OS provides a REST API for remote health monitoring.

### Starting the Server

```bash
# Using uvicorn
uvicorn systems.pixel_compiler.api.main:app --reload --host 0.0.0.0 --port 8000

# Or using Python
python -m systems.pixel_compiler.api.main
```

### API Endpoints

#### Health Check

```bash
# Basic health check
curl http://localhost:8000/health

# Response
{
  "status": "healthy",
  "version": "1.0.0",
  "dependencies": {
    "pixelrts": "installed",
    "vision_model": "lmstudio"
  }
}
```

#### List Available Models

```bash
curl http://localhost:8000/api/v1/models

# Response
{
  "success": true,
  "models": {
    "edge_detection": {
      "methods": ["sobel", "canny"],
      "parameters": {
        "sobel": ["threshold"],
        "canny": ["low_threshold", "high_threshold"]
      }
    },
    "fourier_analysis": {
      "parameters": ["max_frequencies"]
    },
    "clustering": {
      "parameters": ["eps", "min_samples", "feature_type"]
    }
  }
}
```

#### Analyze Single Image

```bash
# Analyze with edge detection
curl -X POST "http://localhost:8000/api/v1/analyze" \
  -F "file=@kernel.rts.png" \
  -F 'methods=["edges"]' \
  -F "edge_method=sobel" \
  -F "return_overlay=true"

# Response
{
  "success": true,
  "analysis": {
    "edges": {
      "method": "sobel",
      "edge_count": 15234,
      "edge_density": 0.2345,
      "strong_edges_count": 892,
      "overlay": "data:image/png;base64,..."
    }
  }
}
```

#### Batch Analysis

```bash
# Analyze multiple images
curl -X POST "http://localhost:8000/api/v1/batch" \
  -F "files=@kernel.rts.png" \
  -F "files=@system.rts.png" \
  -F 'methods=["edges", "fourier"]' \
  -F "edge_method=canny"

# Response
{
  "success": true,
  "results": [
    {
      "file": "kernel.rts.png",
      "status": "success",
      "analysis": { ... }
    },
    {
      "file": "system.rts.png",
      "status": "success",
      "analysis": { ... }
    }
  ]
}
```

#### VLM Health Check (Custom Endpoint)

```bash
# Check health with vision model
curl -X POST "http://localhost:8000/api/v1/health-check" \
  -F "file=@kernel.rts.png" \
  -F "model=lmstudio" \
  -F "endpoint=http://localhost:1234/v1"

# Response
{
  "success": true,
  "status": "healthy",
  "confidence": 0.94,
  "metrics": {
    "mean_entropy": 127.5,
    "anomaly_score": 0.12
  },
  "findings": [],
  "recommendation": "No action required"
}
```

---

## Configuration

### Configuration File

Create `vlm_config.yaml`:

```yaml
# VLM Self-Healing Configuration
vision_model:
  provider: lmstudio  # lmstudio, openai, anthropic
  endpoint: http://localhost:1234/v1
  model: llava-phi-3
  timeout: 30
  max_retries: 3

health_check:
  interval: 300  # seconds
  threshold:
    warning: 0.7
    critical: 0.9
  auto_heal: true

monitoring:
  images:
    - path: kernel.rts.png
      critical: true
      check_interval: 60
    - path: system.rts.png
      critical: true
      check_interval: 120

healing:
  backup_before_heal: true
  max_heal_attempts: 3
  quarantine_corrupted: true
  notification:
    enabled: true
    webhook: http://localhost:9000/notify

logging:
  level: INFO
  file: vlm_self_healing.log
  format: "%(asctime)s [%(levelname)s] %(message)s"
```

### Environment Variables

```bash
# Vision Model Configuration
export VLM_MODEL_PROVIDER="lmstudio"
export VLM_MODEL_ENDPOINT="http://localhost:1234/v1"
export VLM_MODEL_NAME="llava-phi-3"

# API Keys (for cloud providers)
export OPENAI_API_KEY="sk-..."
export ANTHROPIC_API_KEY="sk-ant-..."

# Healing Configuration
export VLM_AUTO_HEAL="true"
export VLM_BACKUP_BEFORE_HEAL="true"
export VLM_MAX_HEAL_ATTEMPTS="3"

# Monitoring Configuration
export VLM_CHECK_INTERVAL="300"
export VLM_WARNING_THRESHOLD="0.7"
export VLM_CRITICAL_THRESHOLD="0.9"
```

---

## Troubleshooting

### Common Issues

#### Issue: Vision model not available

```
Error: Vision model not available at http://localhost:1234/v1
```

**Solution:**
1. Start LM Studio: `lm-studio`
2. Load a vision model (e.g., llava-phi-3)
3. Start the API server in LM Studio
4. Verify connectivity: `curl http://localhost:1234/v1/models`

#### Issue: High false positive rate

```
Warning: High anomaly score detected (0.85) but image appears healthy
```

**Solution:**
Adjust thresholds in configuration:

```yaml
health_check:
  threshold:
    warning: 0.8  # Increase from 0.7
    critical: 0.95  # Increase from 0.9
```

#### Issue: Slow health checks

```
Health check took 45 seconds (expected < 10 seconds)
```

**Solution:**
1. Reduce image size for analysis:
   ```python
   analyzer = PixelRTSVisionAnalyzer("kernel.rts.png")
   img, b64 = analyzer.prepare_for_vision_model(max_size=256)  # Reduce from 512
   ```

2. Use local model instead of API:
   ```yaml
   vision_model:
     provider: lmstudio  # Local instead of openai/anthropic
   ```

3. Enable caching:
   ```yaml
   health_check:
     cache_results: true
     cache_ttl: 600  # 10 minutes
   ```

#### Issue: Memory exhaustion during batch processing

```
MemoryError: Unable to allocate array
```

**Solution:**
Process images in smaller batches:

```python
from systems.pixel_compiler.vlm_health_checker import VLMHealthChecker

checker = VLMHealthChecker()
images = ["kernel.rts.png", "system.rts.png", ...]

# Process in batches of 5
batch_size = 5
for i in range(0, len(images), batch_size):
    batch = images[i:i+batch_size]
    results = [checker.check_health(img) for img in batch]
```

### Debug Mode

Enable debug logging:

```python
import logging
logging.basicConfig(level=logging.DEBUG)

checker = VLMHealthChecker(debug=True)
result = checker.check_health("kernel.rts.png", verbose=True)
```

### Validation

Validate PixelRTS image integrity:

```bash
# Verify checksum
python -m systems.pixel_compiler.vlm_health_cli validate kernel.rts.png

# Check format version
python -m systems.pixel_compiler.vlm_health_cli info kernel.rts.png
```

---

## Advanced Usage

### Custom Healing Actions

Define custom healing logic:

```python
from systems.pixel_compiler.vlm_self_healing_daemon import VLMSelfHealingDaemon
from systems.pixel_compiler.vlm_health_checker import HealthStatus

daemon = VLMSelfHealingDaemon()

@daemon.healing_action
async def custom_heal(health_result):
    """Custom healing action for critical issues."""
    if health_result.status == HealthStatus.CRITICAL:
        # Create backup
        backup_path = f"{health_result.image_path}.backup"
        import shutil
        shutil.copy2(health_result.image_path, backup_path)

        # Trigger evolution daemon mutation
        from systems.neural_cortex.evolution_protocol_server import EvolutionProtocolServer
        evolution = EvolutionProtocolServer()
        await evolution.trigger_mutation(
            target=health_result.image_path,
            mutation_type="repair"
        )

        return True
    return False

daemon.set_healing_action(custom_heal)
```

### Integration with Evolution Daemon

```python
from systems.neural_cortex.evolution_protocol_server import EvolutionProtocolServer
from systems.pixel_compiler.vlm_health_checker import VLMHealthChecker

checker = VLMHealthChecker()
evolution = EvolutionProtocolServer()

# Check health and trigger evolution if needed
result = checker.check_health("kernel.rts.png")
if result.status == HealthStatus.CRITICAL:
    # Trigger mutation
    await evolution.trigger_mutation(
        target="kernel.rts.png",
        mutation_type="repair",
        priority="high"
    )

    # Monitor evolution progress
    async for update in evolution.stream_updates():
        print(f"Evolution: {update['stage']} - {update['progress']}%")
        if update['stage'] == 'complete':
            break
```

### Multi-Model Ensemble

Combine multiple vision models for robust detection:

```python
from systems.pixel_compiler.vlm_health_checker import VLMHealthChecker

# Create checker with multiple models
checker = VLMHealthChecker()
checker.add_model("lmstudio", endpoint="http://localhost:1234/v1")
checker.add_model("openai", api_key=os.getenv("OPENAI_API_KEY"))
checker.add_model("anthropic", api_key=os.getenv("ANTHROPIC_API_KEY"))

# Run ensemble check
result = checker.check_health_ensemble(
    "kernel.rts.png",
    models=["lmstudio", "openai", "anthropic"],
    aggregation="voting"  # or "averaging", "weighted"
)

print(f"Ensemble confidence: {result.confidence:.2%}")
print(f"Agreement: {result.agreement:.2%}")
```

---

## Reference

### HealthStatus Enum

```python
class HealthStatus(Enum):
    HEALTHY = "healthy"       # No issues detected
    WARNING = "warning"       # Minor anomalies detected
    CRITICAL = "critical"     # Severe issues requiring attention
    UNKNOWN = "unknown"       # Unable to determine status
```

### HealthCheckResult

```python
@dataclass
class HealthCheckResult:
    image_path: str                      # Path to analyzed image
    status: HealthStatus                 # Health status
    confidence: float                    # Confidence score (0-1)
    metrics: Dict[str, Any]              # Analysis metrics
    findings: List[Dict[str, str]]       # Detected issues
    recommendation: str                  # Recommended action
    timestamp: str                       # ISO timestamp
```

### Finding Categories

| Category | Description | Examples |
|----------|-------------|----------|
| `corruption` | Data corruption | Bit flips, truncated data |
| `anomaly` | Unexpected patterns | High entropy regions |
| `structural` | Structural issues | Invalid headers, malformed data |
| `security` | Security concerns | Ransomware patterns, modifications |
| `performance` | Performance issues | Large file sizes, slow encoding |

---

## License

MIT License - See LICENSE file for details

## Contributing

Contributions welcome! Please see CONTRIBUTING.md for guidelines.

## Support

- GitHub Issues: https://github.com/geometry-os/vlm-self-healing/issues
- Documentation: https://docs.geometry-os.org/vlm
- Discord: https://discord.gg/geometry-os
