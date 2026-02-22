#!/bin/bash
#
# Desktop Agent Testing Suite - Quality Gate Script
# Runs all tests with coverage and enforces 80% minimum coverage
#
# Exit codes:
#   0 - All tests pass, coverage >= 80%
#   1 - One or more tests failed
#   2 - Coverage below 80%
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Test files (6 main test modules as specified)
TEST_FILES=(
    "tests/test_desktop_agent_backend.py"
    "tests/test_desktop_agent_session.py"
    "tests/test_desktop_agent_track.py"
    "tests/test_desktop_agent_service.py"
    "tests/test_desktop_agent_performance.py"
    "tests/test_desktop_agent/test_sanitizer.py"
)

# Coverage settings
COVERAGE_THRESHOLD=80
COVERAGE_PACKAGE="systems/desktop_agent"

# Tracking
TOTAL_PASSED=0
TOTAL_FAILED=0
FAILED_FILES=()

echo -e "${BOLD}${CYAN}========================================${NC}"
echo -e "${BOLD}${CYAN}  Desktop Agent Testing Suite${NC}"
echo -e "${BOLD}${CYAN}========================================${NC}"
echo ""
echo -e "${BLUE}Project Root:${NC} $PROJECT_ROOT"
echo -e "${BLUE}Coverage Threshold:${NC} ${COVERAGE_THRESHOLD}%"
echo ""

# Change to project root
cd "$PROJECT_ROOT"

# Activate virtual environment if present
if [ -d ".venv" ]; then
    source .venv/bin/activate
    echo -e "${GREEN}Activated virtual environment${NC}"
fi

# Ensure PYTHONPATH is set
export PYTHONPATH="${PROJECT_ROOT}:${PYTHONPATH:-}"

echo ""
echo -e "${BOLD}${YELLOW}Running Test Files...${NC}"
echo "----------------------------------------"

# Run each test file individually
for test_file in "${TEST_FILES[@]}"; do
    echo ""
    echo -e "${BOLD}Testing: ${test_file}${NC}"
    echo "----------------------------------------"

    # Run pytest for this file
    if python -m pytest "${test_file}" -v --tb=short 2>&1 | tee /tmp/test_output.txt; then
        # Count results
        passed=$(grep -oP '\d+(?= passed)' /tmp/test_output.txt | tail -1 || echo "0")
        failed=$(grep -oP '\d+(?= failed)' /tmp/test_output.txt | tail -1 || echo "0")

        if [ "$failed" = "0" ] || [ -z "$failed" ]; then
            echo -e "${GREEN}PASSED${NC} ${test_file}"
            TOTAL_PASSED=$((TOTAL_PASSED + passed))
        else
            echo -e "${RED}FAILED${NC} ${test_file} (${failed} failures)"
            TOTAL_FAILED=$((TOTAL_FAILED + failed))
            FAILED_FILES+=("$test_file")
        fi
    else
        echo -e "${RED}FAILED${NC} ${test_file}"
        FAILED_FILES+=("$test_file")
        TOTAL_FAILED=$((TOTAL_FAILED + 1))
    fi
done

echo ""
echo -e "${BOLD}${CYAN}========================================${NC}"
echo -e "${BOLD}${CYAN}  Running Coverage Analysis${NC}"
echo -e "${BOLD}${CYAN}========================================${NC}"
echo ""

# Run coverage for all test files together
COVERAGE_RESULT=0
COVERAGE_OUTPUT=$(python -m pytest "${TEST_FILES[@]}" \
    --cov="${COVERAGE_PACKAGE}" \
    --cov-report=term-missing \
    --cov-fail-under="${COVERAGE_THRESHOLD}" \
    -q \
    2>&1) || COVERAGE_RESULT=$?

echo "$COVERAGE_OUTPUT"

# Extract coverage percentage from line like "TOTAL  416  22  95%"
COVERAGE_PCT=$(echo "$COVERAGE_OUTPUT" | grep "^TOTAL" | awk '{print $4}' | tr -d '%' || echo "0")

echo ""
echo -e "${BOLD}${CYAN}========================================${NC}"
echo -e "${BOLD}${CYAN}  Summary${NC}"
echo -e "${BOLD}${CYAN}========================================${NC}"
echo ""

# Test summary
if [ ${#FAILED_FILES[@]} -eq 0 ]; then
    echo -e "${GREEN}All test files passed${NC}"
else
    echo -e "${RED}Failed test files:${NC}"
    for file in "${FAILED_FILES[@]}"; do
        echo -e "  ${RED}X${NC} ${file}"
    done
fi

echo ""
echo -e "Total Passed: ${GREEN}${TOTAL_PASSED}${NC}"
echo -e "Total Failed: ${RED}${TOTAL_FAILED}${NC}"
echo ""

# Coverage summary
if [ -n "$COVERAGE_PCT" ]; then
    if [ "$COVERAGE_PCT" -ge "$COVERAGE_THRESHOLD" ]; then
        echo -e "Coverage: ${GREEN}${COVERAGE_PCT}%${NC} (>= ${COVERAGE_THRESHOLD}% threshold)"
    else
        echo -e "Coverage: ${RED}${COVERAGE_PCT}%${NC} (< ${COVERAGE_THRESHOLD}% threshold)"
    fi
else
    echo -e "Coverage: ${YELLOW}Could not determine${NC}"
fi

echo ""

# Final result
if [ ${#FAILED_FILES[@]} -gt 0 ]; then
    echo -e "${BOLD}${RED}QUALITY GATE FAILED: Tests failed${NC}"
    exit 1
fi

if [ "$COVERAGE_RESULT" -ne 0 ]; then
    echo -e "${BOLD}${RED}QUALITY GATE FAILED: Coverage below ${COVERAGE_THRESHOLD}%${NC}"
    exit 2
fi

echo -e "${BOLD}${GREEN}QUALITY GATE PASSED${NC}"
echo -e "${GREEN}All tests passed and coverage >= ${COVERAGE_THRESHOLD}%${NC}"
exit 0
