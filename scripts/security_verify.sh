#!/bin/bash
# Security Verification Script for Geometry OS
# Run this script to verify security fixes have been applied

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "=========================================="
echo "Geometry OS Security Verification"
echo "=========================================="
echo ""

PASSED=0
FAILED=0
WARNINGS=0

check_pass() {
    echo -e "${GREEN}✓ PASS${NC}: $1"
    ((PASSED++))
}

check_fail() {
    echo -e "${RED}✗ FAIL${NC}: $1"
    ((FAILED++))
}

check_warn() {
    echo -e "${YELLOW}⚠ WARN${NC}: $1"
    ((WARNINGS++))
}

# ==========================================
# 1. Check for .env files in git tracking
# ==========================================
echo "--- Checking for committed secrets ---"

if git ls-files | grep -qE "\.env$|\.env\." 2>/dev/null; then
    check_fail ".env files are tracked in git"
else
    check_pass "No .env files tracked in git"
fi

if git ls-files | grep -qE "\.pem$|\.key$" 2>/dev/null; then
    check_fail "Key files are tracked in git"
else
    check_pass "No key files tracked in git"
fi

# ==========================================
# 2. Check for hardcoded secrets
# ==========================================
echo ""
echo "--- Checking for hardcoded secrets ---"

# Check for API keys in code
if grep -rn --include="*.py" --include="*.rs" \
    -E "(api[_-]?key|apikey|secret[_-]?key)[\"']?\s*[:=]\s*[\"'][a-zA-Z0-9_-]{20,}[\"']" \
    --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | grep -qv "# "; then
    check_fail "Potential hardcoded API keys found"
    grep -rn --include="*.py" --include="*.rs" \
        -E "(api[_-]?key|apikey|secret[_-]?key)[\"']?\s*[:=]\s*[\"'][a-zA-Z0-9_-]{20,}[\"']" \
        --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | head -5
else
    check_pass "No hardcoded API keys found"
fi

# ==========================================
# 3. Check for shell=True usage
# ==========================================
echo ""
echo "--- Checking for command injection vulnerabilities ---"

SHELL_TRUE_COUNT=$(grep -rn "shell\s*=\s*True" --include="*.py" \
    --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | \
    grep -v "# SECURITY" | grep -v "shell=True, capture_output" | wc -l)

if [ "$SHELL_TRUE_COUNT" -gt 0 ]; then
    check_fail "Found $SHELL_TRUE_COUNT instances of shell=True"
    grep -rn "shell\s*=\s*True" --include="*.py" \
        --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | \
        grep -v "# SECURITY" | head -5
else
    check_pass "No shell=True usage found"
fi

# ==========================================
# 4. Check for CORS wildcards
# ==========================================
echo ""
echo "--- Checking for CORS misconfigurations ---"

CORS_WILDCARD_COUNT=$(grep -rn 'allow_origins.*\[\s*"\*"\s*\]\|Allow-Origin.*\*\|CorsLayer::permissive()' \
    --include="*.py" --include="*.rs" \
    --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | wc -l)

if [ "$CORS_WILDCARD_COUNT" -gt 0 ]; then
    check_fail "Found $CORS_WILDCARD_COUNT CORS wildcard configurations"
    grep -rn 'allow_origins.*\[\s*"\*"\s*\]\|Allow-Origin.*\*' \
        --include="*.py" --include="*.rs" \
        --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | head -5
else
    check_pass "No CORS wildcard configurations found"
fi

# ==========================================
# 5. Check for 0.0.0.0 bindings
# ==========================================
echo ""
echo "--- Checking for network exposure ---"

# Exclude test files and legitimate uses (DHCP, TFTP)
BIND_ALL_COUNT=$(grep -rn 'host\s*=\s*"0\.0\.0\.0"\|bind(\s*"0\.0\.0.0"' \
    --include="*.py" --include="*.rs" \
    --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | \
    grep -v "test_\|_test\." | wc -l)

if [ "$BIND_ALL_COUNT" -gt 0 ]; then
    check_warn "Found $BIND_ALL_COUNT services binding to 0.0.0.0 (may be intentional)"
    grep -rn 'host\s*=\s*"0\.0\.0\.0"' \
        --include="*.py" \
        --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | \
        grep -v "test_\|_test\." | head -5
else
    check_pass "No services binding to 0.0.0.0"
fi

# ==========================================
# 6. Check .gitignore for sensitive patterns
# ==========================================
echo ""
echo "--- Checking .gitignore configuration ---"

if [ -f ".gitignore" ]; then
    if grep -qE "\.env|\.pem|\.key|secrets/" .gitignore 2>/dev/null; then
        check_pass ".gitignore contains secret exclusions"
    else
        check_fail ".gitignore missing secret exclusions"
    fi
else
    check_fail ".gitignore not found"
fi

# ==========================================
# 7. Check for unsafe deserialization
# ==========================================
echo ""
echo "--- Checking for unsafe deserialization ---"

PICKLE_LOADS_COUNT=$(grep -rn "pickle\.loads\|pickle\.load\s*(" \
    --include="*.py" \
    --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | wc -l)

if [ "$PICKLE_LOADS_COUNT" -gt 0 ]; then
    check_warn "Found $PICKLE_LOADS_COUNT pickle.load(s) calls (review for safety)"
else
    check_pass "No pickle.load(s) calls found"
fi

# ==========================================
# 8. Check for unsafe YAML loading
# ==========================================
echo ""
echo "--- Checking for unsafe YAML loading ---"

YAML_LOAD_COUNT=$(grep -rn "yaml\.load\s*(" \
    --include="*.py" \
    --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | \
    grep -v "safe_load\|yaml\.load\s*(" | wc -l)

if [ "$YAML_LOAD_COUNT" -gt 0 ]; then
    check_fail "Found unsafe yaml.load() calls"
    grep -rn "yaml\.load\s*(" \
        --include="*.py" \
        --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | \
        grep -v "safe_load" | head -5
else
    check_pass "No unsafe yaml.load() calls found"
fi

# ==========================================
# 9. Check for XXE vulnerabilities
# ==========================================
echo ""
echo "--- Checking for XXE vulnerabilities ---"

XML_PARSE_COUNT=$(grep -rn "import xml\.etree\.ElementTree\|from xml\.etree" \
    --include="*.py" \
    --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | wc -l)

if [ "$XML_PARSE_COUNT" -gt 0 ]; then
    check_warn "Found $XML_PARSE_COUNT files using xml.etree.ElementTree (consider defusedxml)"
else
    check_pass "No xml.etree.ElementTree usage found"
fi

# ==========================================
# 10. Check for eval/exec usage
# ==========================================
echo ""
echo "--- Checking for dynamic code execution ---"

EVAL_EXEC_COUNT=$(grep -rn "\(^|[^_]\)eval\s*(\|(^|[^_])exec\s*(" \
    --include="*.py" \
    --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | \
    grep -v "test_\|_test\.\|# eval\|# exec\|async def\|def " | wc -l)

if [ "$EVAL_EXEC_COUNT" -gt 0 ]; then
    check_warn "Found $EVAL_EXEC_COUNT eval/exec calls (review for safety)"
    grep -rn "\(^|[^_]\)eval\s*(\|(^|[^_])exec\s*(" \
        --include="*.py" \
        --exclude-dir=".venv" --exclude-dir="node_modules" --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | \
        grep -v "test_\|_test\.\|# eval\|# exec\|async def\|def " | head -5
else
    check_pass "No eval/exec calls found"
fi

# ==========================================
# 11. Check for unsafe Rust code
# ==========================================
echo ""
echo "--- Checking for unsafe Rust code ---"

UNSAFE_COUNT=$(grep -rn "unsafe\s*{" --include="*.rs" \
    --exclude-dir=".git" --exclude-dir="worktrees" --exclude-dir=".worktrees" 2>/dev/null | wc -l)

if [ "$UNSAFE_COUNT" -gt 0 ]; then
    check_warn "Found $UNSAFE_COUNT unsafe blocks in Rust code (requires review)"
else
    check_pass "No unsafe Rust blocks found"
fi

# ==========================================
# Summary
# ==========================================
echo ""
echo "=========================================="
echo "Security Verification Summary"
echo "=========================================="
echo -e "${GREEN}Passed: $PASSED${NC}"
echo -e "${RED}Failed: $FAILED${NC}"
echo -e "${YELLOW}Warnings: $WARNINGS${NC}"
echo ""

if [ "$FAILED" -gt 0 ]; then
    echo -e "${RED}SECURITY ISSUES DETECTED - Please review and remediate${NC}"
    exit 1
elif [ "$WARNINGS" -gt 0 ]; then
    echo -e "${YELLOW}Warnings detected - Review recommended${NC}"
    exit 0
else
    echo -e "${GREEN}All security checks passed${NC}"
    exit 0
fi
