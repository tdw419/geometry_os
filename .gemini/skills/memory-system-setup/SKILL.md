---
name: memory-system-setup
description: Set up PostgreSQL with pgvector for semantic memory storage and retrieval (the Geometry OS Hippocampus)
category: operations
---

# Memory System Setup

Configure PostgreSQL with pgvector extension for long-term semantic memory storage.

## When to Use

- Setting up vector memory for the first time
- Configuring semantic similarity search
- Enabling memory beams visualization
- Creating persistent thought pixel storage

## Procedure

### Step 1: Install PostgreSQL and pgvector

```bash
cd systems/memory
./setup_postgres.sh
```

This script:
- Installs PostgreSQL 14+
- Compiles pgvector extension
- Creates geometry_os database
- Creates geometry_os user
- Enables pgvector extension

### Step 2: Verify Installation

```bash
# Check PostgreSQL is running
sudo systemctl status postgresql

# Test pgvector extension
sudo -u postgres psql -d geometry_os -c "SELECT * FROM pg_extension WHERE extname = 'vector';"
```

### Step 3: Start Memory Daemon

```bash
python3 vector_memory_daemon.py &

# Check logs
tail -f /tmp/vector_memory_daemon.log
```

### Step 4: Test Memory Operations

```bash
python3 test_vector_memory.py
```

Expected output:
```
test_store_thought_pixel ... ok
test_semantic_search ... ok
test_hilbert_mapping ... ok
test_performance ... ok
```

### Step 5: Connect Visual Bridge

```bash
python3 memory_visual_bridge.py &

# Verify WebSocket connection
curl http://localhost:8768/health
```

## Configuration

### Database Settings

```bash
# ~/.pgpass or environment
export PGHOST=localhost
export PGPORT=5432
export PGDATABASE=geometry_os
export PGUSER=geometry_os
export PGPASSWORD=your_password
```

### Daemon Settings

```bash
# Environment variables
export VECTOR_MEMORY_SOCKET=/tmp/vector_memory.sock
export VECTOR_MEMORY_BATCH_SIZE=100
export VECTOR_MEMORY_DIMENSION=384
```

## Architecture

```
┌─────────────────┐
│   LM Studio     │
└────────┬────────┘
         │ embeddings
         ▼
┌─────────────────┐
│  Memory Daemon  │◄─── Unix Socket
└────────┬────────┘
         │ SQL + pgvector
         ▼
┌─────────────────┐
│   PostgreSQL    │
│   + pgvector    │
└─────────────────┘
         │
         ▼
┌─────────────────┐
│  Memory Beams   │───► Visual Shell
└─────────────────┘
```

## Troubleshooting

### "pgvector extension not found"

**Cause**: pgvector not installed or compiled.
**Fix**: Reinstall pgvector from source.

```bash
# Ubuntu/Debian
sudo apt install postgresql-server-dev-14
cd /tmp
git clone https://github.com/pgvector/pgvector.git
cd pgvector
make
sudo make install

# Enable in database
sudo -u postgres psql -d geometry_os -c "CREATE EXTENSION vector;"
```

### "Connection refused to PostgreSQL"

**Cause**: PostgreSQL not running or not accepting connections.
**Fix**: Start service and check configuration.

```bash
# Start PostgreSQL
sudo systemctl start postgresql

# Check listening
sudo netstat -tlnp | grep 5432

# Enable remote connections (if needed)
sudo vim /etc/postgresql/14/main/postgresql.conf
# listen_addresses = '*'
```

### "Permission denied for schema public"

**Cause**: User lacks required permissions.
**Fix**: Grant permissions to geometry_os user.

```bash
sudo -u postgres psql << 'EOF'
GRANT ALL ON SCHEMA public TO geometry_os;
GRANT ALL PRIVILEGES ON DATABASE geometry_os TO geometry_os;
ALTER DATABASE geometry_os OWNER TO geometry_os;
EOF
```

### "Memory daemon socket not found"

**Cause**: Daemon not running or wrong socket path.
**Fix**: Restart daemon and verify path.

```bash
# Kill stale daemon
pkill -f vector_memory_daemon

# Restart with explicit path
python3 vector_memory_daemon.py --socket /tmp/vector_memory.sock &

# Verify socket exists
ls -la /tmp/vector_memory.sock
```

## Performance Targets

| Metric | Target |
|--------|--------|
| Store latency | <10ms |
| Retrieval (k=10) | <50ms |
| Throughput | 1000+ stores/sec |
| Memory per pixel | ~1KB |

## Examples

### Store a Thought Pixel

```python
import socket
import json

sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
sock.connect('/tmp/vector_memory.sock')

thought = {
    "type": "store",
    "embedding": [0.1, 0.2, ...],  # 384-dim vector
    "content": "Remember to check the logs",
    "hilbert_x": 512,
    "hilbert_y": 512,
    "layer": "memory",
    "session": "session-123"
}

sock.send(json.dumps(thought).encode())
response = sock.recv(4096)
print(json.loads(response))
sock.close()
```

### Query Semantic Neighbors

```python
query = {
    "type": "search",
    "embedding": [0.1, 0.2, ...],
    "k": 10
}

sock.send(json.dumps(query).encode())
neighbors = json.loads(sock.recv(65536))
for n in neighbors:
    print(f"Score: {n['score']:.3f} - {n['content'][:50]}")
```

## Related Skills

- `evolution-daemon-control` - Uses memory for evolution
- `visual-shell-debug` - Debug memory beam issues
- `pixelrts-analyze` - Analyze memory patterns
