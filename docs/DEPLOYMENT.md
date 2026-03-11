# Geometry OS Deployment Guide

> Production deployment guide for Geometry OS

## Table of Contents

- [Deployment Overview](#deployment-overview)
- [System Requirements](#system-requirements)
- [Deployment Methods](#deployment-methods)
- [Configuration](#configuration)
- [Service Management](#service-management)
- [Monitoring](#monitoring)
- [Scaling](#scaling)
- [Security Considerations](#security-considerations)
- [Troubleshooting](#troubleshooting)

---

## Deployment Overview

Geometry OS supports multiple deployment scenarios:

| Scenario | Use Case | Components |
|----------|----------|------------|
| **Single Node** | Development, Testing | All services on one machine |
| **Multi-Node Cluster** | Production | Distributed services |
| **Containerized** | Cloud, CI/CD | Docker containers |
| **Bare Metal** | High Performance | Direct hardware access |

---

## System Requirements

### Minimum Requirements

| Resource | Requirement |
|----------|-------------|
| CPU | 4 cores (x86_64 or ARM64) |
| RAM | 8 GB |
| Storage | 50 GB SSD |
| Network | 100 Mbps |

### Recommended Production Requirements

| Resource | Requirement |
|----------|-------------|
| CPU | 16+ cores |
| RAM | 32+ GB |
| Storage | 500 GB NVMe SSD |
| Network | 1 Gbps |
| GPU | NVIDIA/AMD with 8+ GB VRAM |

### Software Dependencies

- **Operating System**: Ubuntu 22.04+, Debian 12+, Fedora 38+, Arch Linux
- **Python**: 3.10+ (3.11+ recommended)
- **Rust**: 1.70+ (for Rust components)
- **System Libraries**: libseat, libudev, libinput, libdrm (Linux)

---

## Deployment Methods

### Method 1: Native Installation

Best for development and single-node deployments.

```bash
# 1. Clone repository
git clone https://github.com/tdw419/geometry_os.git
cd geometry_os

# 2. Create virtual environment
python3 -m venv .venv
source .venv/bin/activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Configure environment
cp .env.example .env
nano .env

# 5. Build components
make build

# 6. Run services
make run
```

### Method 2: Docker Deployment

Best for containerized and cloud deployments.

```dockerfile
# Dockerfile
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libseat-dev libudev-dev libinput-dev libdrm-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .

# Build
RUN make build

# Expose ports
EXPOSE 8080 8772 8773 3000

# Run
CMD ["python3", "geometry_os_cli.py", "start"]
```

Build and run:

```bash
# Build image
docker build -t geometry-os:latest .

# Run container
docker run -d \
    --name geometry-os \
    -p 8080:8080 \
    -p 8772:8772 \
    -p 8773:8773 \
    -p 3000:3000 \
    --gpus all \
    -e LM_STUDIO_URL=http://host.docker.internal:1234/v1 \
    geometry-os:latest
```

### Method 3: Docker Compose

For multi-service deployments:

```yaml
# docker-compose.yml
version: '3.8'

services:
  geometry-os:
    build: .
    ports:
      - "8080:8080"
      - "8772:8772"
      - "8773:8773"
    environment:
      - LM_STUDIO_URL=http://lm-studio:1234/v1
      - GEOMETRY_OS_DEBUG=0
    volumes:
      - ./data:/app/data
      - ./logs:/app/logs
    depends_on:
      - lm-studio
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]

  lm-studio:
    image: lmstudio/local-server:latest
    ports:
      - "1234:1234"
    volumes:
      - ./models:/models
```

Deploy:

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f geometry-os

# Stop services
docker-compose down
```

### Method 4: Systemd Service

For production Linux deployments:

```ini
# /etc/systemd/system/geometry-os.service
[Unit]
Description=Geometry OS Daemon
After=network.target

[Service]
Type=simple
User=geometry-os
Group=geometry-os
WorkingDirectory=/opt/geometry_os
Environment="PATH=/opt/geometry_os/.venv/bin"
EnvironmentFile=/opt/geometry_os/.env
ExecStart=/opt/geometry_os/.venv/bin/python3 geometry_os_cli.py start
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Deploy:

```bash
# Copy service file
sudo cp systemd/geometry-os.service /etc/systemd/system/

# Reload systemd
sudo systemctl daemon-reload

# Enable and start
sudo systemctl enable geometry-os
sudo systemctl start geometry-os

# Check status
sudo systemctl status geometry-os
```

---

## Configuration

### Environment Variables

Create a `.env` file with production settings:

```bash
# Core Configuration
GEOMETRY_OS_DEBUG=0
GEOMETRY_OS_LOG_LEVEL=INFO
GEOMETRY_OS_ENV=production

# LM Studio Configuration
LM_STUDIO_URL=http://localhost:1234/v1
LM_STUDIO_API_KEY=${LM_STUDIO_API_KEY}

# Service Ports
DISTRICT_PORT=8773
TECTONIC_PORT=8772
VISUAL_SHELL_PORT=8080
MCP_SERVER_PORT=3000

# Performance
GEOMETRY_OS_GPU_ENABLED=1
GEOMETRY_OS_FOVEATED_RENDERING=1
GEOMETRY_OS_MAX_WORKERS=4

# Security
GEOMETRY_OS_AUTH_ENABLED=1
GEOMETRY_OS_SECRET_KEY=${SECRET_KEY}
```

### Configuration File

Advanced settings in `.geometry/config.yaml`:

```yaml
# .geometry/config.yaml
evolution:
  pas_threshold: 0.5
  gravity_strength: 0.1
  repair_enabled: true
  max_mutation_rate: 0.01

visual_shell:
  backend: pixijs
  foveated: true
  foveal_radius: 200
  max_fps: 60

swarm:
  max_nodes: 100
  heartbeat_interval: 5.0
  task_timeout: 300
  retry_policy:
    max_retries: 3
    backoff: exponential

tectonic:
  default_district_size: 100
  negotiation_timeout: 30

logging:
  level: INFO
  format: json
  output: /var/log/geometry-os/app.log
```

---

## Service Management

### Starting Services

```bash
# Start all services
make run

# Start specific service
python3 geometry_os_cli.py start --service evolution-daemon
python3 geometry_os_cli.py start --service visual-shell
python3 geometry_os_cli.py start --service swarm

# Start with specific configuration
python3 geometry_os_cli.py start --config production.yaml
```

### Stopping Services

```bash
# Graceful shutdown
make stop

# Stop specific service
python3 geometry_os_cli.py stop --service evolution-daemon

# Force stop
pkill -f geometry_os
```

### Health Checks

```bash
# Check all services
python3 geometry_os_cli.py health

# Check specific service
curl http://localhost:8773/health
curl http://localhost:8772/health
curl http://localhost:8080/health
```

---

## Monitoring

### Log Management

Logs are written to `logs/` directory:

```
logs/
├── geometry-os.log      # Main application log
├── evolution-daemon.log # Evolution daemon log
├── visual-shell.log     # Visual shell log
├── swarm.log            # Swarm operations log
└── access.log           # HTTP access log
```

Configure log rotation:

```bash
# /etc/logrotate.d/geometry-os
/var/log/geometry-os/*.log {
    daily
    rotate 14
    compress
    delaycompress
    missingok
    notifempty
    create 0640 geometry-os geometry-os
}
```

### Metrics Collection

Enable Prometheus metrics:

```yaml
# .geometry/config.yaml
monitoring:
  prometheus:
    enabled: true
    port: 9090
    path: /metrics
```

Available metrics:

| Metric | Type | Description |
|--------|------|-------------|
| `geometry_os_evolution_cycles_total` | Counter | Total evolution cycles |
| `geometry_os_pas_score` | Gauge | Current PAS score |
| `geometry_os_mutations_applied_total` | Counter | Total mutations applied |
| `geometry_os_inference_latency_seconds` | Histogram | Inference latency |
| `geometry_os_swarm_nodes_active` | Gauge | Active swarm nodes |
| `geometry_os_tasks_completed_total` | Counter | Completed tasks |

### Dashboard

Access the monitoring dashboard at `http://localhost:8080/dashboard`.

---

## Scaling

### Horizontal Scaling

Scale swarm nodes across multiple machines:

```bash
# On coordinator node
python3 geometry_os_cli.py start --role coordinator

# On worker nodes
python3 geometry_os_cli.py start --role worker \
    --coordinator coordinator.example.com:8773
```

### Load Balancing

Use nginx for load balancing:

```nginx
# /etc/nginx/conf.d/geometry-os.conf
upstream geometry_os {
    least_conn;
    server node1.example.com:8080;
    server node2.example.com:8080;
    server node3.example.com:8080;
}

server {
    listen 80;
    server_name geometry-os.example.com;

    location / {
        proxy_pass http://geometry_os;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
    }
}
```

---

## Security Considerations

### Network Security

1. **Firewall Configuration**

```bash
# Allow only required ports
sudo ufw allow 8080/tcp  # Visual Shell
sudo ufw allow 8772/tcp  # Tectonic
sudo ufw allow 8773/tcp  # District
sudo ufw allow 3000/tcp  # MCP
sudo ufw enable
```

2. **TLS/SSL**

Enable HTTPS for the visual shell:

```yaml
# .geometry/config.yaml
visual_shell:
  tls:
    enabled: true
    cert: /etc/ssl/certs/geometry-os.crt
    key: /etc/ssl/private/geometry-os.key
```

### Authentication

Enable authentication:

```yaml
# .geometry/config.yaml
auth:
  enabled: true
  type: jwt
  jwt_secret: ${JWT_SECRET}
  token_expiry: 3600
```

### Secret Management

Use environment variables or secret management:

```bash
# Store secrets securely
export LM_STUDIO_API_KEY=$(cat /run/secrets/lm_studio_key)
export GEOMETRY_OS_SECRET_KEY=$(cat /run/secrets/geometry_os_key)
```

---

## Backup and Recovery

### Backup Strategy

```bash
# Backup configuration
tar -czf geometry-os-config-$(date +%Y%m%d).tar.gz \
    .env .geometry/

# Backup data
tar -czf geometry-os-data-$(date +%Y%m%d).tar.gz \
    data/ *.rts.png

# Backup to remote
rsync -avz geometry-os-*.tar.gz backup-server:/backups/
```

### Recovery Procedure

```bash
# Restore configuration
tar -xzf geometry-os-config-20260311.tar.gz

# Restore data
tar -xzf geometry-os-data-20260311.tar.gz

# Restart services
sudo systemctl restart geometry-os
```

---

## Troubleshooting

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| Service won't start | Missing dependencies | Run `make build` |
| High memory usage | Memory leak | Restart service, check logs |
| Connection refused | Port blocked | Check firewall, verify service running |
| GPU not detected | Driver issue | Install/update GPU drivers |

### Diagnostic Commands

```bash
# Check service status
sudo systemctl status geometry-os

# View logs
tail -f logs/geometry-os.log

# Check resource usage
htop -p $(pgrep -f geometry_os)

# Network diagnostics
netstat -tlnp | grep geometry

# GPU status
nvidia-smi
```

---

## Upgrading

### Upgrade Procedure

```bash
# 1. Backup current installation
make backup

# 2. Pull latest changes
git pull origin main

# 3. Update dependencies
pip install -r requirements.txt --upgrade

# 4. Run migrations (if any)
python3 geometry_os_cli.py migrate

# 5. Rebuild
make build

# 6. Restart services
sudo systemctl restart geometry-os

# 7. Verify
python3 geometry_os_cli.py health
```

---

## See Also

- [Monitoring Guide](MONITORING.md)
- [Security Guide](security/SECURITY_AUDIT_REPORT.md)
- [Troubleshooting Guide](../TROUBLESHOOTING.md)
- [API Reference](API_REFERENCE.md)

---

*Last Updated: 2026-03-11*
*Version: 4.0.1*
