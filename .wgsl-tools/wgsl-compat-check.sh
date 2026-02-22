#!/bin/bash
# WGSL Compatibility Checker
# Scans WGSL files for incompatible patterns (i64/u64 types and casts)
# Part of Geometry OS Phase 1.1: Automated Detection and Fixing

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counter for issues
ISSUES_FOUND=0
FILES_CHECKED=0
FALSE_POSITIVES=0

echo "🔍 WGSL Compatibility Checker"
echo "================================"
echo ""

# Get list of WGSL files to check
# If files provided as arguments, check those; otherwise scan all
if [ $# -gt 0 ]; then
    WGSL_FILES="$@"
else
    WGSL_FILES=$(find . -name "*.wgsl" -type f 2>/dev/null | grep -v "target/" | grep -v ".git/")
fi

# Patterns that indicate ACTUAL i64/u64 type usage (not function names)
# We need to catch:
# - Type annotations: var x: i64, let y: u64
# - Type constructors: bitcast<i64>(), vec2<u64>()
# - Generic types: array<i64>, vec3<u64>
#
# FALSE POSITIVES to exclude:
# - Function definitions: fn push_i64(...)
# - Function calls: push_i64(...) where the function uses vec2<u32> internally

for file in $WGSL_FILES; do
    if [ ! -f "$file" ]; then
        continue
    fi

    FILES_CHECKED=$((FILES_CHECKED + 1))
    FILE_ISSUES=0

    # Check each line for problematic patterns
    while IFS= read -r line; do
        LINE_NUM=$(echo "$line" | cut -d':' -f1)
        LINE_CONTENT=$(echo "$line" | cut -d':' -f2-)

        # Skip function definitions (fn ...) - these are ok if they use vec2<u32> internally
        if [[ "$LINE_CONTENT" =~ ^[[:space:]]*fn[[:space:]] ]]; then
            continue
        fi

        # Skip comments
        if [[ "$LINE_CONTENT" =~ ^[[:space:]]*// ]]; then
            continue
        fi

        # Skip empty lines
        if [[ -z "${LINE_CONTENT// }" ]]; then
            continue
        fi

        # Check for actual i64/u64 TYPE usage (not function names)
        # Pattern 1: Type annotations ": i64" or ": u64" (but not as part of function names)
        if [[ "$LINE_CONTENT" =~ :[[:space:]]*i64[^a-z] ]] || [[ "$LINE_CONTENT" =~ :[[:space:]]*u64[^a-z] ]]; then
            # This is a real issue - type annotation using i64/u64
            if [ $FILE_ISSUES -eq 0 ]; then
                echo -e "${RED}❌ $file${NC}"
                FILE_ISSUES=1
                ISSUES_FOUND=$((ISSUES_FOUND + 1))
            fi
            echo -e "   ${YELLOW}Type annotation: i64/u64${NC}"
            echo "     $LINE_NUM:$LINE_CONTENT"
            continue
        fi

        # Pattern 2: Generic types with i64/u64: vec2<i64>, array<u64>, etc.
        if [[ "$LINE_CONTENT" =~ \<(i64|u64)\> ]] || [[ "$LINE_CONTENT" =~ array.*(i64|u64) ]]; then
            # This is a real issue - vector/matrix/array using i64/u64
            if [ $FILE_ISSUES -eq 0 ]; then
                echo -e "${RED}❌ $file${NC}"
                FILE_ISSUES=1
                ISSUES_FOUND=$((ISSUES_FOUND + 1))
            fi
            echo -e "   ${YELLOW}Generic type: i64/u64${NC}"
            echo "     $LINE_NUM:$LINE_CONTENT"
            continue
        fi

        # Pattern 3: Bitcast to/from i64/u64
        if [[ "$LINE_CONTENT" =~ bitcast.*(i64|u64) ]]; then
            # This is a real issue - bitcast using i64/u64
            if [ $FILE_ISSUES -eq 0 ]; then
                echo -e "${RED}❌ $file${NC}"
                FILE_ISSUES=1
                ISSUES_FOUND=$((ISSUES_FOUND + 1))
            fi
            echo -e "   ${YELLOW}Bitcast: i64/u64${NC}"
            echo "     $LINE_NUM:$LINE_CONTENT"
            continue
        fi

    done < <(grep -n -E "(i64|u64)" "$file" 2>/dev/null || true)
done

echo ""
echo "================================"
echo "Files checked: $FILES_CHECKED"

if [ $ISSUES_FOUND -gt 0 ]; then
    echo -e "${RED}❌ Issues found in $ISSUES_FOUND file(s)${NC}"
    echo ""
    echo "WGSL does not support i64/u64 types."
    echo "Use vec2<u32> to represent 64-bit values instead."
    echo ""
    echo "Acceptable patterns:"
    echo "  - Function names: fn push_i64(...), fn pop_i64() // OK if using vec2<u32>"
    echo "  - Parameters: (low: u32, high: u32) or (value: vec2<u32>)"
    echo "  - Returns: -> vec2<u32>"
    echo ""
    echo "Problematic patterns to avoid:"
    echo "  - Type annotations: var x: i64, let y: u64"
    echo "  - Generic types: vec2<i64>, array<u64>"
    echo "  - Bitcasts: bitcast<i64>()"
    echo ""
    echo "For 64-bit arithmetic, use 32-bit multiplication helpers:"
    echo "  - mulh_signed(a, b) for signed 64-bit multiplication"
    echo "  - mulh_unsigned(a, b) for unsigned 64-bit multiplication"
    exit 1
else
    echo -e "${GREEN}✅ No WGSL compatibility issues found${NC}"
    echo -e "${GREEN}✅ Function names with i64/u64 are OK (using vec2<u32> internally)${NC}"
    exit 0
fi
