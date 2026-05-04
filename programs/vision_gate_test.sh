#!/usr/bin/env bash
# vision_gate_test.sh -- Regression test for vision_gate.py.
#
# Runs the gate against committed PNG fixtures and asserts the expected
# exit codes. Use this to catch threshold drift or analysis bugs after
# editing programs/vision_gate.py.
#
# Exit 0 if both cases match expectations, 1 otherwise.

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GATE="$SCRIPT_DIR/vision_gate.py"
FIXTURES="$SCRIPT_DIR/fixtures"

pass_exit=0
fail_exit=0

echo "=== vision_gate regression test ==="

# PASS fixture: should exit 0
if python3 "$GATE" --image "$FIXTURES/vision_gate_pass.png" >/dev/null 2>&1; then
    echo "PASS fixture: gate exit 0 (expected)"
else
    echo "PASS fixture: gate exit 1 (UNEXPECTED -- regression!)"
    pass_exit=1
fi

# FAIL fixture: should exit 1
if python3 "$GATE" --image "$FIXTURES/vision_gate_fail.png" >/dev/null 2>&1; then
    echo "FAIL fixture: gate exit 0 (UNEXPECTED -- regression!)"
    fail_exit=1
else
    echo "FAIL fixture: gate exit 1 (expected)"
fi

echo "EXIT=$(( pass_exit || fail_exit ))"
exit $(( pass_exit || fail_exit ))
