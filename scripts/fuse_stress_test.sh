#!/usr/bin/env bash
# fuse_stress_test.sh - Real-world validation for GeoFS FUSE mount.
#
# Usage:
#   # Option 1: Standalone (launches its own FUSE daemon)
#   bash scripts/fuse_stress_test.sh
#
#   # Option 2: Against pre-mounted filesystem (e.g. from Hermes agent)
#   # Mount first, then:
#   MNT=/tmp/geos_stress_mnt bash scripts/fuse_stress_test.sh --no-mount
#
# NOTE: Must be run from a real terminal (not through agents that intercept
# background processes). The FUSE daemon requires `&` backgrounding which
# some agent terminal tools don't support.
#
set -euo pipefail

REPO="$HOME/projects/zion/projects/geometry_os/geometry_os"
FUSE_BIN="$REPO/target/release/geos_fuse"
MNT="/tmp/geos_stress_mnt"
EPL="/tmp/geos_stress_test.epl"
SAMPLE_SRC="$REPO/src"

PASS=0
FAIL=0
SKIP=0
NO_MOUNT=false
MNT="${MNT:-/tmp/geos_stress_mnt}"
EPL="${EPL:-/tmp/geos_stress_test.epl}"

# Parse --no-mount flag
for arg in "$@"; do
    case "$arg" in
        --no-mount) NO_MOUNT=true ;;
    esac
done

cleanup() {
    # Unmount if still mounted (works regardless of NO_MOUNT subshell scoping)
    if mount | grep -q "$MNT"; then
        fusermount3 -u "$MNT" 2>/dev/null || true
    fi
    # Only remove dirs we created
    if [ "${NO_MOUNT:-false}" = "false" ]; then
        rm -rf "$MNT"
        rm -f "$EPL"
    fi
}
trap cleanup EXIT

pass() { ((PASS++)); echo "  PASS: $1"; }
fail() { ((FAIL++)); echo "  FAIL: $1"; }
skip() { ((SKIP++)); echo "  SKIP: $1"; }

check() {
    local desc="$1"; shift
    if "$@" >/dev/null 2>&1; then
        pass "$desc"
    else
        fail "$desc (exit: $?)"
    fi
}

# ── Bootstrap ───────────────────────────────────────────────────────────────
echo "=== GeoFS FUSE Stress Test ==="
echo "Date: $(date -Iseconds)"
echo "Binary: $FUSE_BIN"
echo ""

rm -f "$EPL"
mkdir -p "$MNT"

echo "--- Mounting ---"

if $NO_MOUNT; then
    if ! mount | grep -q "$MNT"; then
        echo "FATAL: --no-mount but $MNT is not mounted"
        exit 1
    fi
    pass "pre-mounted FUSE"
else
    rm -f "$EPL"
    mkdir -p "$MNT"
    set -m
    "$FUSE_BIN" "$MNT" --epl "$EPL" 2>&1 &
    FUSE_PID=$!
    set +m

    for i in $(seq 1 10); do
        if mount | grep -q "$MNT" && ls "$MNT" >/dev/null 2>&1; then
            break
        fi
        sleep 1
    done

    if ! mount | grep -q "$MNT"; then
        echo "FATAL: mount failed"
        kill "$FUSE_PID" 2>/dev/null || true
        exit 1
    fi
    pass "FUSE mount"
fi
echo ""

# ── Phase 1: Basic POSIX ───────────────────────────────────────────────────
echo "--- Phase 1: Basic POSIX ---"
check "mkdir nested dirs"   mkdir -p "$MNT/a/b/c/d"
check "mkdir second branch" mkdir -p "$MNT/x/y/z"
check "touch file"          touch "$MNT/hello.txt"
check "write file"          bash -c 'echo "Hello GeoFS" > "$MNT/hello.txt"'
check "read file"           test "$(cat "$MNT/hello.txt")" = "Hello GeoFS"
check "append"              bash -c 'echo "line 2" >> "$MNT/hello.txt"'
check "stat file"           stat "$MNT/hello.txt"
check "stat dir"            stat "$MNT/a"
check "ls root"             ls "$MNT/"
check "ls nested"           ls "$MNT/a/b/c/d"
check "rename"              mv "$MNT/hello.txt" "$MNT/renamed.txt"
check "rename verify"       bash -c 'test -f "$MNT/renamed.txt" && ! test -e "$MNT/hello.txt"'
check "cp"                  cp "$MNT/renamed.txt" "$MNT/copy.txt"
check "cp verify"           diff "$MNT/renamed.txt" "$MNT/copy.txt"
check "rm"                  rm "$MNT/copy.txt"
check "rm verify"           bash -c '! test -e "$MNT/copy.txt"'
check "rmdir empty"         rmdir "$MNT/x/y/z"
check "rmdir nonempty fail" bash -c '! rmdir "$MNT/a" 2>/dev/null'
echo ""

# ── Phase 2: Symlinks ──────────────────────────────────────────────────────
echo "--- Phase 2: Symlinks ---"
check "symlink create"      ln -s "$MNT/renamed.txt" "$MNT/link1"
check "readlink"            test "$(readlink "$MNT/link1")" = "$MNT/renamed.txt"
check "cat via symlink"     test "$(cat "$MNT/link1")" = "$(cat "$MNT/renamed.txt")"
check "rm symlink"          rm "$MNT/link1"
check "symlink gone"        bash -c '! test -e "$MNT/link1"'
check "relative symlink"    bash -c '(cd "$MNT" && ln -s renamed.txt rel_link)'
check "relative readlink"   test "$(readlink "$MNT/rel_link")" = "renamed.txt"
echo ""

# ── Phase 3: Binary data via dd ────────────────────────────────────────────
echo "--- Phase 3: Binary data ---"
dd if=/dev/urandom of="$MNT/rand4k.bin" bs=4096 count=1 2>/dev/null
ORIG=$(md5sum "$MNT/rand4k.bin" | cut -d' ' -f1)
READ=$(md5sum "$MNT/rand4k.bin" | cut -d' ' -f1)
check "4K md5 match"        test "$ORIG" = "$READ"

dd if=/dev/urandom of="$MNT/rand64k.bin" bs=4096 count=16 2>/dev/null
ORIG=$(md5sum "$MNT/rand64k.bin" | cut -d' ' -f1)
READ=$(md5sum "$MNT/rand64k.bin" | cut -d' ' -f1)
check "64K md5 match"       test "$ORIG" = "$READ"

echo "PATCHED" | dd of="$MNT/rand4k.bin" bs=1 seek=100 conv=notrunc 2>/dev/null
check "offset write"        bash -c 'dd if="$MNT/rand4k.bin" bs=1 skip=100 count=7 2>/dev/null | grep -q PATCHED'
echo ""

# ── Phase 4: rsync real source tree ────────────────────────────────────────
echo "--- Phase 4: rsync source tree ---"
if [ -d "$SAMPLE_SRC" ]; then
    check "rsync src/"      rsync -r --exclude=__pycache__ --exclude='*.pyc' "$SAMPLE_SRC/" "$MNT/src/"

    SRC_COUNT=$(find "$SAMPLE_SRC" -type f | wc -l)
    DST_COUNT=$(find "$MNT/src" -type f | wc -l)
    if [ "$SRC_COUNT" -eq "$DST_COUNT" ]; then
        pass "rsync file count ($SRC_COUNT files)"
    else
        fail "rsync file count mismatch (src=$SRC_COUNT dst=$DST_COUNT)"
    fi

    check "diff geo_extent.rs"  diff "$SAMPLE_SRC/geo_extent.rs" "$MNT/src/geo_extent.rs"
    check "diff geos_fuse.rs"   diff "$SAMPLE_SRC/bin/geos_fuse.rs" "$MNT/src/bin/geos_fuse.rs"
    check "diff tile_store.rs"  diff "$SAMPLE_SRC/tile_store.rs" "$MNT/src/tile_store.rs"
else
    skip "rsync (no sample src)"
fi
echo ""

# ── Phase 5: tar round-trip ────────────────────────────────────────────────
echo "--- Phase 5: tar round-trip ---"
check "tar create"          tar cf /tmp/geos_stress.tar -C "$MNT" . 2>/dev/null
check "tar listing"         bash -c 'tar tf /tmp/geos_stress.tar | grep -q renamed.txt'

mkdir -p /tmp/geos_tar_check
tar xf /tmp/geos_stress.tar -C /tmp/geos_tar_check 2>/dev/null
check "tar extract verify"  test -f /tmp/geos_tar_check/renamed.txt
rm -rf /tmp/geos_tar_check /tmp/geos_stress.tar
echo ""

# ── Phase 6: Many small files ──────────────────────────────────────────────
echo "--- Phase 6: Many small files ---"
for i in $(seq 1 50); do
    echo "file_$i content" > "$MNT/small_$i.txt"
done
SMALL_COUNT=$(find "$MNT" -maxdepth 1 -name 'small_*.txt' | wc -l)
check "50 files created"    test "$SMALL_COUNT" -eq 50

OK=true
for i in $(seq 1 50); do
    [ "$(cat "$MNT/small_$i.txt")" != "file_$i content" ] && OK=false && break
done
check "50 files readback"   $OK

rm -f "$MNT"/small_*.txt
check "50 files cleanup"    bash -c '! ls "$MNT"/small_*.txt >/dev/null 2>&1'
echo ""

# ── Phase 7: Edge cases ────────────────────────────────────────────────────
echo "--- Phase 7: Edge cases ---"
check "empty file"          bash -c 'touch "$MNT/empty" && test "$(stat --format=%s "$MNT/empty")" = "0"'
check "empty read"          bash -c 'test -z "$(cat "$MNT/empty")"'

bash -c 'echo "original" > "$MNT/overwrite.txt"'
bash -c 'echo "replacement" > "$MNT/overwrite.txt"'
check "overwrite verify"    test "$(cat "$MNT/overwrite.txt")" = "replacement"

bash -c '> "$MNT/overwrite.txt"'
check "truncate to zero"    test "$(stat --format=%s "$MNT/overwrite.txt")" = "0"

DEEP="$MNT"
for i in $(seq 1 20); do DEEP="$DEEP/d$i"; done
check "mkdir 20 deep"       mkdir -p "$DEEP"
bash -c 'echo "deep" > "$DEEP/file.txt"'
check "deep file read"      test "$(cat "$DEEP/file.txt")" = "deep"

check "special filename"    bash -c 'echo "sp" > "$MNT/file with spaces.txt" && test "$(cat "$MNT/file with spaces.txt")" = "sp"'

check "write 16383 bytes"   bash -c 'head -c 16383 /dev/urandom > "$MNT/block_edge.bin" && test "$(stat --format=%s "$MNT/block_edge.bin")" = "16383"'
check "write 32768 bytes"   bash -c 'head -c 32768 /dev/urandom > "$MNT/multiblock.bin" && test "$(stat --format=%s "$MNT/multiblock.bin")" = "32768"'

MB_MD5=$(md5sum "$MNT/multiblock.bin" | cut -d' ' -f1)
check "32K md5 match"       test "$(md5sum "$MNT/multiblock.bin" | cut -d' ' -f1)" = "$MB_MD5"
echo ""

# ── Phase 8: fsync / flush ─────────────────────────────────────────────────
echo "--- Phase 8: fsync ---"
check "fsync"               bash -c 'echo "sync me" > "$MNT/sync_test.txt" && sync "$MNT/sync_test.txt"'
check "fsync readback"      test "$(cat "$MNT/sync_test.txt")" = "sync me"
echo ""

# ── Report ─────────────────────────────────────────────────────────────────
echo "=== Results ==="
echo "PASS: $PASS"
echo "FAIL: $FAIL"
echo "SKIP: $SKIP"
echo "Total: $((PASS + FAIL + SKIP))"
[ "$FAIL" -eq 0 ] && echo "" && echo "ALL GREEN" || echo "" && echo "FAILURES DETECTED"
echo ""

echo "--- Unmounting ---"
sync
if mount | grep -q "$MNT"; then
    fusermount3 -u "$MNT" && pass "clean unmount" || fail "unmount"
    if [ "${NO_MOUNT:-false}" = "false" ] && [ -n "${FUSE_PID:-}" ]; then
        wait "$FUSE_PID" 2>/dev/null || true
    fi
else
    pass "skip unmount (not mounted)"
fi

echo ""
echo "PASS=$PASS FAIL=$FAIL SKIP=$SKIP"
[ "$FAIL" -eq 0 ]
