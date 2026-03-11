#!/bin/bash
# Neural Pipeline End-to-End Test Script
#
# Tests the neural -> visual pipeline:
# 1. Software SHM health check
# 2. LM Studio connectivity
# 3. SSE streaming
# 4. Neural state broadcast
# 5. Token activation forwarding
#
# Usage: ./scripts/test_e2e_pipeline_v2.sh [options]
#
# Options:
#   -v, --verbose    Enable verbose output
#   -h, --help       Show this help message

set -e

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Change to project root
cd "$PROJECT_ROOT"

# Parse arguments
VERBOSE=""
SKIP_COMPOSITOR=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--verbose)
            VERBOSE="-v"
            shift
            ;;
        --skip-compositor)
            SKIP_COMPOSITOR=true
            shift
            ;;
        -h|--help)
            echo "Neural Pipeline E2E Test Script"
            echo ""
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -v, --verbose        Enable verbose output"
            echo "  --skip-compositor    Skip compositor start/stop"
            echo "  -h, --help           Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0                  # Run all tests"
            echo "  $0 -v               # Run with verbose output"
            echo "  $0 --skip-compositor # Run without compositor"
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Use -h or --help for usage information"
            exit 1
            ;;
    esac
done

echo "=========================================="
echo "NEURAL PIPELINE E2E TEST"
echo "=========================================="
echo "Project Root: $PROJECT_ROOT"
echo ""

# Function to run a test and capture result
run_test() {
    local test_name="$1"
    local test_command="$2"

    echo -e "\n--- Running: $test_name ---"

    if eval "$test_command"; then
        echo -e "${GREEN}✓ $test_name PASSED${NC}"
        return 0
    else
        local exit_code=$?
        echo -e "${RED}✗ $test_name FAILED (exit code: $exit_code)${NC}"
        return $exit_code
    fi
}

# Track overall success
ALL_TESTS_PASSED=true

# Test 1: Software SHM Health Check
echo "=========================================="
echo "[Test 1/6] Software SHM Health Check"
echo "=========================================="

if run_test "SHM Health Check" \
    "python3 -c \"import sys; sys.path.insert(0, 'systems/health'); from software_shm import SoftwareSHM; shm = SoftwareSHM(); report = shm.check_health(); print(f'PAS Score: {report.score:.4f}, Status: {report.status}'); sys.exit(0 if report.score >= 0.5 else 1)\""; then
    :
else
    ALL_TESTS_PASSED=false
fi

# Test 2: LM Studio Connection
echo ""
echo "=========================================="
echo "[Test 2/6] LM Studio Connection"
echo "=========================================="

if run_test "LM Studio Connection" \
    "python3 -c \"import requests; r = requests.get('http://localhost:1234/v1/models', timeout=5); print(f'Status: {r.status_code}, Models: {len(r.json().get(\\\"data\\\", []))}'); sys.exit(0 if r.status_code == 200 else 1)\""; then
    :
else
    ALL_TESTS_PASSED=false
fi

# Test 3: SSE Streaming
echo ""
echo "=========================================="
echo "[Test 3/6] SSE Streaming"
echo "=========================================="

if run_test "SSE Streaming" \
    "python3 -c \"
import asyncio
import sys
try:
    import aiohttp
    async def test():
        async with aiohttp.ClientSession() as session:
            async with session.post('http://localhost:1234/v1/chat/completions',
                json={'messages': [{'role': 'user', 'content': 'hi'}], 'stream': True, 'max_tokens': 5},
                timeout=aiohttp.ClientTimeout(total=10)) as resp:
                if resp.status != 200:
                    print(f'HTTP {resp.status}')
                    sys.exit(1)
                count = 0
                async for line in resp.content:
                    line_str = line.decode('utf-8').strip()
                    if line_str.startswith('data: ') and line_str != 'data: [DONE]':
                        count += 1
                        if count >= 1:
                            print(f'Received {count} tokens')
                            sys.exit(0)
                sys.exit(1)
    asyncio.run(test())
except ImportError:
    print('SKIP: aiohttp not installed')
    sys.exit(0)
except Exception as e:
    print(f'FAIL: {e}')
    sys.exit(1)
\""; then
    :
else
    ALL_TESTS_PASSED=false
fi

# Test 4: Neural State Message Creation
echo ""
echo "=========================================="
echo "[Test 4/6] Neural State Message Creation"
echo "=========================================="

if run_test "Neural State Message" \
    "python3 -c \"
import sys
sys.path.insert(0, '.')
from systems.neural_substrate.lm_studio_bridge import LMStudioBridge
bridge = LMStudioBridge()
msg = bridge.create_neural_state_message(0.8)
assert msg['message_type'] == 'NeuralStateUpdate'
assert 'payload' in msg
assert 'daemon_id' in msg['payload']
assert 'data' in msg['payload']
print(f'Created: {msg[\\\"message_type\\\"]}')
sys.exit(0)
\""; then
    :
else
    ALL_TESTS_PASSED=false
fi

# Test 5: Token Activation Message Creation
echo ""
echo "=========================================="
echo "[Test 5/6] Token Activation Message"
echo "=========================================="

if run_test "Token Activation Message" \
    "python3 -c \"
import sys
sys.path.insert(0, '.')
from systems.neural_substrate.lm_studio_bridge import LMStudioBridge
bridge = LMStudioBridge()
msg = bridge.create_token_message('test', 12345, 1.0, 0)
assert msg['message_type'] == 'TokenVisualizationUpdate'
assert msg['payload']['current_token'] == 'test'
assert msg['payload']['token_id'] == 12345
assert 'hilbert_position' in msg['payload']
x, y = msg['payload']['hilbert_position']
assert 0 <= x <= 1 and 0 <= y <= 1
print(f'Token: {msg[\\\"payload\\\"][\\\"current_token\\\"]}, Position: ({x:.2f}, {y:.2f})')
sys.exit(0)
\""; then
    :
else
    ALL_TESTS_PASSED=false
fi

# Test 6: Full E2E Pipeline Test
echo ""
echo "=========================================="
echo "[Test 6/6] Full E2E Pipeline"
echo "=========================================="

if run_test "Full E2E Pipeline" \
    "python3 tests/integration/neural_pipeline_e2e_test.py $VERBOSE"; then
    :
else
    ALL_TESTS_PASSED=false
fi

# Final summary
echo ""
echo "=========================================="
echo "FINAL SUMMARY"
echo "=========================================="

if [ "$ALL_TESTS_PASSED" = true ]; then
    echo -e "${GREEN}✓ ALL TESTS PASSED${NC}"
    exit 0
else
    echo -e "${RED}✗ SOME TESTS FAILED${NC}"
    exit 1
fi
