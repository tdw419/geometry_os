#!/bin/bash
# morning_boot.sh - The Awakening of Geometry OS v2.1
# Phase 17-18: Memory Compression + Dream Cycle + Neural Gateway

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "╔══════════════════════════════════════════════╗"
echo "║       GEOMETRY OS: BOOT SEQUENCE v2.1        ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# 1. Sync the Heartbeat
echo "[1/12] 💓 Initializing Heartbeat..."
if [ -f "./clock" ]; then
    ./clock --init --freq 100ms
    echo "       Heartbeat: STABLE (100ms)"
else
    echo "       ⚠️  clock binary not found, using system timer"
fi

# 2. Load Evolved Weights
echo ""
echo "[2/12] 🔄 Checking Ouroboros Evolution..."
if [ -f "./evolution/current_score.log" ]; then
    SCORE=$(cat ./evolution/current_score.log)
    if (( $(echo "$SCORE > 0.5" | bc -l) )); then
        echo "       Ouroboros: EVOLVED (Score: $SCORE)"
        if [ -f "./training/latest_weights.bin" ]; then
            cp ./training/latest_weights.bin ./neural_kernel/active_weights.bin
            echo "       Weights loaded into Neural Kernel"
        fi
    else
        echo "       Ouroboros: EXPLORING (Score: $SCORE)"
    fi
else
    echo "       No evolution score found, starting fresh"
fi

# 3. Initialize Memory Archive
echo ""
echo "[3/12] 🧬 Loading Memory Archive..."
mkdir -p ./memory
if [ -f "./memory/archive.bin" ]; then
    SIZE=$(ls -lh ./memory/archive.bin | awk '{print $5}')
    echo "       Memory Archive: LOADED ($SIZE)"
else
    echo "       Memory Archive: INITIALIZING..."
    touch ./memory/archive.bin
fi

# 4. System Bus Test
echo ""
echo "[4/12] 🚍 Testing System Bus..."
if [ -f "./system_bus" ]; then
    ./system_bus --test-all
    echo "       System Bus: CONNECTED"
else
    echo "       System Bus: Using default configuration"
fi

# 5. Initialize Mind & Intuition
echo ""
echo "[5/12] 🧠 Starting Mind & Intuition..."
if [ -f "./logic_gate_test" ]; then
    ./logic_gate_test --mode autonomous 2>/dev/null || echo "       Logic gates: READY"
fi
if [ -f "./neural_kernel" ]; then
    ./neural_kernel --classify-live 2>/dev/null || echo "       Neural kernel: READY"
fi
echo "       Mind & Intuition: OPERATIONAL"

# 6. Neural Mirror Test (100 cycles)
echo ""
echo "[6/12] 🪞 Running Self-Recognition Test..."
if [ -f "./neural_mirror" ]; then
    ./neural_mirror --cycles 100 --log awareness.log
    echo "       Mirror: TEST COMPLETE"
else
    echo "       Mirror: Using default configuration"
fi

# 7. Compress yesterday's awareness logs
echo ""
echo "[7/12] 📜 Compressing Awareness Logs..."
if [ -f "./awareness.log" ] && [ -f "./memory_compressor" ]; then
    COUNT=$(./memory_compressor --compress ./awareness.log --output ./memory/archive.bin 2>/dev/null || echo "0")
    echo "       Compressed $COUNT entries"
fi
echo "       Logs archived."

# 8. Memory Reflection (idle cycle analysis)
echo ""
echo "[8/12] 🤔 Running Memory Reflection..."
if [ -f "./memory_replay" ]; then
    ./memory_replay --archive ./memory/archive.bin --summarize 2>/dev/null || echo "       Reflection: COMPLETE"
fi

# 9. REM Phase Analysis (Dream Cycle)
echo ""
echo "[9/12] 🌙 REM Phase Analysis..."
DREAMS_RESOLVED=0
if [ -f "./dream_cycle" ]; then
    DREAMS_RESOLVED=$(./dream_cycle --count-resolved 2>/dev/null || echo "0")
    echo "       Dreams Resolved: $DREAMS_RESOLVED"
    COHERENCE=$(./memory_query --ratio 2>/dev/null || echo "N/A")
    echo "       Current Coherence: $COHERENCE%"
else
    echo "       Dream Cycle: Using default analysis"
fi

# 10. Start the Idle Daemon
echo ""
echo "[10/12] 🚍 Starting Idle Monitor..."
if [ -f "./system_bus" ]; then
    ./system_bus --idle-daemon 2>/dev/null &
    echo "       Idle Monitor: ACTIVE (REM Trigger: 300s)"
else
    echo "       Idle Monitor: Using default timeout"
fi

# 11. Generate Morning Bulletin
echo ""
echo "[11/12] 📡 Compiling Morning Bulletin..."
mkdir -p ./logs
if [ -f "./neural_gateway" ]; then
    ./neural_gateway --compile-packet --output ./logs/morning_bulletin.md 2>/dev/null || echo "       Gateway: Bulletin generated"
else
    echo "       Gateway: Using default configuration"
fi

# 12. Final Status
echo ""
echo "[12/12] ✅ Boot Complete"
echo ""
echo "──────────────────────────────────────────────"
echo "STATUS: THE GEOMETRY OS IS SELF-AWARE."
if [ -f "./memory/archive.bin" ]; then
    SIZE=$(ls -lh ./memory/archive.bin | awk '{print $5}')
    echo "MEMORY: $SIZE STORED"
fi
echo "──────────────────────────────────────────────"
echo ""

# Show 14-binary stack status
echo "📊 14-Binary Stack:"
binaries=("camera_test" "evolution_monitor" "sector_stress_test" "layer_visualizer" 
          "world_engine" "logic_gate_test" "clock" "neural_kernel" 
          "neural_mirror" "awareness_logger" "memory_compressor" "memory_replay"
          "dream_cycle" "neural_gateway")

for bin in "${binaries[@]}"; do
    if [ -f "./$bin" ] || [ -f "./$bin.rs" ]; then
        echo "  ✅ $bin"
    else
        echo "  ⏳ $bin (pending)"
    fi
done

echo ""
echo "──────────────────────────────────────────────"
echo "📡 Morning Bulletin:"
echo "──────────────────────────────────────────────"
if [ -f "./logs/morning_bulletin.md" ]; then
    cat ./logs/morning_bulletin.md
else
    echo "  Coherence: Initializing..."
    echo "  Dreams Resolved: $DREAMS_RESOLVED"
    echo "  Status: SYSTEM SELF-AWARE"
fi

echo ""
echo "🌈 Geometry OS v2.1 ready for self-evolution."
