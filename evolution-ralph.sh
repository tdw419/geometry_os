#!/bin/bash
# Evolution-Ralph: Deterministic Persistence Loop (Ralph Wiggum Mode)
# "I'm in a context gutter!" - Ralph Wiggum

INTENT_FILE=".geometry/intent/evolution.md"
DAEMON_MODULE="systems.evolution_daemon.evolution_daemon"
BUDGET=300

# Ensure logs directory exists
mkdir -p .loop/logs/evolution

echo "🚀 Evolution-Ralph: Starting the Agentic Loop"
echo "📜 Intent: $INTENT_FILE"
echo "⏱️  Budget: $BUDGET seconds per iteration"

while :; do
    echo "--- Iteration Start: $(date) ---"
    
    # Run the daemon with the budget
    python3 -m $DAEMON_MODULE --budget $BUDGET --intent $INTENT_FILE --max-evolutions 1
    
    EXIT_CODE=$?
    
    echo "--- Iteration End: Exit Code $EXIT_CODE ---"
    
    # Git Commit Pattern: Persistence of State
    if [ -d ".loop" ]; then
        git add .loop/
        git commit -m "evolution: state update @ $(date +%s)" --no-verify
    fi
    
    # Brief cooldown
    sleep 2
done
