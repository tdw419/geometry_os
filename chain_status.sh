#!/usr/bin/env bash
# Geometry OS Dev Chain Status Dashboard
# Usage: ./chain_status.sh          (one-shot)
#       :watch -n 10 ./chain_status.sh  (live refresh)
set -euo pipefail

STATE_DB="$HOME/.hermes/state.db"
CARRY_DB="$HOME/.hermes/carry_forward.db"
PROJECT="$HOME/zion/projects/geometry_os/geometry_os"

# Colors
GRN='\033[0;32m'
RED='\033[0;31m'
YLW='\033[0;33m'
BLU='\033[0;34m'
CYN='\033[0;36m'
DIM='\033[2m'
RST='\033[0m'
BOLD='\033[1m'

now=$(date +%s)
cols=$(tput cols 2>/dev/null || echo 80)

echo -e "${BOLD}═══ Geometry OS Dev Chain ═══${RST}  $(date '+%H:%M:%S')"

# --- Chain Mode ---
mode=$(cat ~/.hermes/chain-mode 2>/dev/null || echo "2")
active=$(python3 -c "
import sqlite3, time, os
conn = sqlite3.connect(os.path.expanduser('~/.hermes/state.db'))
cutoff = time.time() - 1800
row = conn.execute('''
    SELECT COUNT(*) FROM sessions 
    WHERE started_at > ? 
      AND source IN ('cli', 'telegram', 'whatsapp', 'cron')
      AND tool_call_count > 0
      AND NOT (source = 'cron' AND tool_call_count <= 2)
''', (cutoff,)).fetchone()
print(row[0] if row else 0)
conn.close()
" 2>/dev/null || echo "?")

slot_color=$GRN
if [ "$active" -ge "$mode" ] 2>/dev/null; then slot_color=$RED; fi
echo -e "  Slots: ${slot_color}${active}/${mode}${RST} active"

# --- Lock ---
if [ -f /tmp/geo-chain.lock ]; then
    pid=$(cat /tmp/geo-chain.lock 2>/dev/null)
    if kill -0 "$pid" 2>/dev/null; then
        echo -e "  Lock:  ${GRN}HELD by PID ${pid}${RST}"
    else
        echo -e "  Lock:  ${YLW}STALE (PID ${pid} dead)${RST}"
    fi
else
    echo -e "  Lock:  ${DIM}none${RST}"
fi

# --- Git ---
echo ""
echo -e "${BOLD}── Git ──${RST}"
cd "$PROJECT" 2>/dev/null || true
head=$(git rev-parse --short HEAD 2>/dev/null || echo "?")
echo -e "  HEAD:  ${CYN}${head}${RST}"
commits_today=$(git log --oneline --since="$(date +%Y-%m-%d) 00:00" 2>/dev/null | wc -l)
echo -e "  Today: ${GRN}${commits_today} commits${RST}"
dirty=$(git status --porcelain 2>/dev/null | wc -l)
if [ "$dirty" -gt 0 ]; then
    echo -e "  Dirty: ${YLW}${dirty} files${RST}"
else
    echo -e "  Dirty: ${DIM}clean${RST}"
fi

# --- Tests ---
echo ""
echo -e "${BOLD}── Tests ──${RST}"
test_count=$(cargo test 2>&1 | grep -oP '\d+ passed' | awk '{s+=$1} END {print s}' 2>/dev/null || echo "?")
last_pass=$(cargo test 2>&1 | grep "test result:" | tail -1 2>/dev/null || echo "")
if echo "$last_pass" | grep -q "0 failed"; then
    echo -e "  Count: ${GRN}${test_count} passing${RST}"
else
    fails=$(echo "$last_pass" | grep -oP '\d+ failed' | head -1)
    echo -e "  Count: ${RED}${test_count} (${fails})${RST}"
fi

# --- Recent Sessions ---
echo ""
echo -e "${BOLD}── Recent Sessions (last 30min) ──${RST}"
python3 -c "
import sqlite3, os, datetime, time
conn = sqlite3.connect(os.path.expanduser('~/.hermes/state.db'))
cutoff = time.time() - 1800
rows = conn.execute('''
    SELECT id, source, tool_call_count, message_count, started_at 
    FROM sessions 
    WHERE started_at > ?
    ORDER BY started_at DESC LIMIT 8
''', (cutoff,)).fetchall()

if not rows:
    print('  (no recent sessions)')

for r in rows:
    sid = r[0]
    src = r[1]
    tools = r[2]
    msgs = r[3]
    ts = datetime.datetime.fromtimestamp(r[4]).strftime('%H:%M:%S')
    
    # Shorten session ID
    if sid.startswith('cron_'):
        parts = sid.split('_')
        job = parts[1][:8]
        short = 'cron:' + job[-4:]
    else:
        short = sid.split('_')[-1][:7]
    
    # Determine status
    if tools == 0 and msgs <= 2:
        status = '\033[2mdead\033[0m'
    elif tools == 1 and src == 'cron':
        status = '\033[2mpreflight\033[0m'
    elif tools > 2:
        age = time.time() - r[4]
        if age < 600:
            status = '\033[1;32mACTIVE\033[0m'
        else:
            status = '\033[0;32mdone\033[0m'
    else:
        status = '\033[0;33midle\033[0m'
    
    print(f'  {ts} {short:12s} {src:6s} tools={tools:3d} msgs={msgs:3d} {status}')
conn.close()
" 2>/dev/null

# --- Recent Decisions ---
echo ""
echo -e "${BOLD}── Carry Forward (last 5 decisions) ──${RST}"
python3 -c "
import sqlite3, os, datetime
conn = sqlite3.connect(os.path.expanduser('~/.hermes/carry_forward.db'))
rows = conn.execute('''
    SELECT session_id, decision, reasons_json, created_at
    FROM decision_log ORDER BY id DESC LIMIT 5
''').fetchall()
for r in rows:
    ts = datetime.datetime.fromtimestamp(r[3]).strftime('%H:%M:%S')
    sid = r[0].split('_')[-1][:7]
    dec = r[1]
    if dec == 'continue':
        color = '\033[0;32m'
    else:
        color = '\033[0;31m'
    
    # Parse first reason
    import json
    try:
        reasons = json.loads(r[2]) if r[2] else []
        reason = reasons[0][:60] if reasons else ''
    except:
        reason = str(r[2])[:60] if r[2] else ''
    
    print(f'  {ts} {sid} {color}{dec:10s}\033[0m {reason}')
conn.close()
" 2>/dev/null

# --- ROADMAP Progress ---
echo ""
echo -e "${BOLD}── ROADMAP Progress ──${RST}"
python3 -c "
import os
roadmap = os.path.expanduser('$PROJECT/ROADMAP.md')
try:
    with open(roadmap) as f:
        content = f.read()
    unchecked = content.count('- [ ]')
    checked = content.count('- [x]')
    total = checked + unchecked
    pct = int(checked / total * 100) if total else 0
    bar_len = 30
    filled = int(bar_len * pct / 100)
    bar = '\033[0;32m' + '█' * filled + '\033[2m' + '░' * (bar_len - filled) + '\033[0m'
    print(f'  [{bar}] {pct}% ({checked}/{total})')
    print(f'  Remaining: {unchecked} items')
    
    # Next task
    for line in content.split('\n'):
        if line.strip().startswith('- [ ] '):
            task = line.strip()[6:65]
            print(f'  Next: {task}')
            break
except:
    print('  (could not read ROADMAP)')
" 2>/dev/null

echo ""
echo -e "${DIM}Tip: watch -n 10 $0${RST}"
