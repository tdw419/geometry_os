#!/bin/bash
# Sisyphus-Ralph: Deterministic Persistence Loop (Ralph Wiggum Mode)
# "I'm in a context gutter!" - Ralph Wiggum

INTENT_FILE=".geometry/intent/sisyphus.md"
DAEMON_MODULE="systems.sisyphus.daemon"
BUDGET=300

# Use LM Studio as cognitive engine (PixelBrain needs WGPU context)
export COGNITIVE_ENGINE=lmstudio

# Ensure logs directory exists
mkdir -p .loop/logs/v4

echo "🚀 Sisyphus-Ralph: Starting the Agentic Loop"
echo "📜 Intent: $INTENT_FILE"
echo "⏱️  Budget: $BUDGET seconds per iteration"

while :; do
    echo "--- Iteration Start: $(date) ---"
    
    # Run the daemon with the budget
    # We pipe the intent file to it, though it reads the file directly now
    python3 -m $DAEMON_MODULE --budget $BUDGET --intent $INTENT_FILE --verbose --enable-brain-evolution
    
    EXIT_CODE=$?
    
    echo "--- Iteration End: Exit Code $EXIT_CODE ---"
    
    # Git Commit Pattern: Persistence of State
    if [ -d ".loop" ]; then
        git add .loop/
        git commit -m "sisyphus: state update @ $(date +%s)" --no-verify
    fi
    
    # Brief cooldown
    sleep 2
done
