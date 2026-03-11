#!/usr/bin/env bash
# install.sh — Install the Geometry OS autopilot hooks
#
# Usage:
#   chmod +x install.sh && ./install.sh
#
# What it does:
#   1. Copies hook scripts to ~/.claude/hooks/
#   2. Merges hook config into ~/.claude/settings.json
#   3. Creates a project-level .claude/settings.json for geometry-os
#   4. Optionally creates a goal.md template

set -e

HOOKS_DIR="$HOME/.claude/hooks"
SETTINGS="$HOME/.claude/settings.json"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "▸ Installing Geometry OS Autopilot Hooks"
echo ""

# ── 1. Create hooks dir ────────────────────────────────────────────────────
mkdir -p "$HOOKS_DIR"
echo "  ✓ Created $HOOKS_DIR"

# ── 2. Copy scripts ────────────────────────────────────────────────────────
cp "$SCRIPT_DIR/autopilot.py"          "$HOOKS_DIR/autopilot.py"
cp "$SCRIPT_DIR/session_init.py"       "$HOOKS_DIR/session_init.py"
chmod +x "$HOOKS_DIR/"*.py
echo "  ✓ Copied hook scripts to $HOOKS_DIR"

# ── 3. Merge into ~/.claude/settings.json ─────────────────────────────────
# We use Python to safely merge (preserves any existing settings)
python3 - <<'PYEOF'
import json, os
from pathlib import Path

settings_path = Path.home() / ".claude" / "settings.json"
hooks_src     = Path(__file__).parent / "settings.json" if False else \
                Path(os.environ.get("SCRIPT_DIR", ".")) / "settings.json"

new_hooks = json.loads(hooks_src.read_text()) if hooks_src.exists() else \
            {"hooks": {"Stop": [], "SubagentStop": [], "SessionStart": []}}

if settings_path.exists():
    existing = json.loads(settings_path.read_text())
else:
    existing = {}

existing.setdefault("hooks", {})

for event, entries in new_hooks.get("hooks", {}).items():
    existing["hooks"].setdefault(event, [])
    # Avoid duplicates — remove old autopilot entries first
    existing["hooks"][event] = [
        h for h in existing["hooks"][event]
        if "autopilot" not in json.dumps(h) and "session_init" not in json.dumps(h)
    ]
    existing["hooks"][event].extend(entries)

settings_path.write_text(json.dumps(existing, indent=2))
print(f"  ✓ Merged hooks into {settings_path}")
PYEOF

# Fix: pass SCRIPT_DIR to the python script
python3 - "$SCRIPT_DIR" <<'PYEOF'
import json, os, sys
from pathlib import Path

script_dir    = Path(sys.argv[1])
settings_path = Path.home() / ".claude" / "settings.json"
hooks_src     = script_dir / "settings.json"

new_hooks = json.loads(hooks_src.read_text())

if settings_path.exists():
    existing = json.loads(settings_path.read_text())
else:
    existing = {}

existing.setdefault("hooks", {})

for event, entries in new_hooks.get("hooks", {}).items():
    existing["hooks"].setdefault(event, [])
    existing["hooks"][event] = [
        h for h in existing["hooks"][event]
        if "autopilot" not in json.dumps(h) and "session_init" not in json.dumps(h)
    ]
    existing["hooks"][event].extend(entries)

settings_path.write_text(json.dumps(existing, indent=2))
print(f"  ✓ Merged hooks into {settings_path}")
PYEOF

# ── 4. Create project-level settings in current dir (if it looks like a project) ──
if [[ -f "CLAUDE.md" || -f ".git/config" ]]; then
  mkdir -p ".claude"
  if [[ ! -f ".claude/settings.json" ]]; then
    cp "$SCRIPT_DIR/settings.json" ".claude/settings.json"
    echo "  ✓ Created .claude/settings.json in project"
  else
    echo "  ℹ .claude/settings.json already exists — skipping (merge manually if needed)"
  fi
fi

# ── 5. Create goal.md template if none exists ──────────────────────────────
if [[ ! -f "CLAUDE.md" ]]; then
  cat > "CLAUDE.md" <<'GOALEOF'
# Project Goal

## Objective
[Describe what Claude should be building toward]

## Current Phase
[e.g., "Close the triangle: geo_cc.py → geometry_os.rts.png → geometry_os.wgsl"]

## Success Criteria
- [ ] criterion 1
- [ ] criterion 2

## Constraints
- [Any hard constraints Claude must respect]

## Completion Signal
When all criteria are met, end your response with: TASK COMPLETE
GOALEOF
  echo "  ✓ Created CLAUDE.md template — fill in your project goal!"
fi

echo ""
echo "▸ Install complete!"
echo ""
echo "  Environment variables (optional, set in shell or .env):"
echo "    AUTOPILOT_MAX_LOOPS=50    # max loops before stopping (default: 50)"
echo "    AUTOPILOT_LOG=/tmp/autopilot.log  # log file location"
echo ""
echo "  Monitor the autopilot:"
echo "    tail -f /tmp/autopilot.log"
echo ""
echo "  To disable temporarily:"
echo "    AUTOPILOT_MAX_LOOPS=0 claude"
echo ""
echo "  Start Claude Code and it will run continuously toward your CLAUDE.md goal."
