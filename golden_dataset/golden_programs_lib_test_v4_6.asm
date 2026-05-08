; DESCRIPTION: A red rectangle centered at the screen with fixed size.

; lib_test_v4.asm -- Comprehensive library test suite v4
;
; Tests ALL library modules: stdlib, math, collision, time, stdio, heap,
; draw, input, random, gfx.
;
; Result area: 0x1F80-0xFF7 (120 test slots, 1 byte each)
;   1 = PASS, 0 = FAIL
;
; Layout:
;   0x000: test code + helpers
;   0x400: test data strings
;   0x500: library code (.include)
;   0x1000: gfx test data
;
; Run: load programs/lib_test_v4.asm -> assemble -> run
; Verify: inspect RAM[0x1F80..0xFF7]

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Helpers
; ═══════════════════════════════════════════════════════════════
    LDI r30, 0xFF00         ; stack pointer
    JMP _tests_start        ; skip over helper functions

; _pass: store 1 at address in r15
_pass:
    LDI r14, 1
    STORE r15, r14
    RET

; _fail: store 0 at address in r15
_fail:
    LDI r14, 0
    STORE r15, r14
    RET

; _check_eq: after CMP, if result==0 (equal) → pass
_check_eq:
    JZ r14, _pass
    JMP _fail

; _check_neq: after CMP, if result!=0 (not equal) → pass
_check_neq:
    JZ r14, _fail
    JMP _pass

; _check_z: if r14==0 → pass (for non-CMP checks)
_check_z:
    JZ r14, _pass
    JMP _fail

; _check_nz: if r14!=0 → pass
_check_nz:
    JZ r14, _fail
    JMP _pass

; Jump to test code (skip over data + library includes)
    JMP _tests_start

; ═══════════════════════════════════════════════════════════════
; Test data
; ═══════════════════════════════════════════════════════════════
.org 0x400

str_hello:
    .str "Hello"
str_world:
    .str "World"
str_42:
    .str "42"
str_0:
    .str "0"
str_1000:
    .str "1000"
str_hi:
    .str "Hi"

buf_a:    .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
buf_b:    .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
buf_c:    .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
buf_d:    .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

; ═══════════════════════════════════════════════════════════════
; Library includes
; ═══════════════════════════════════════════════════════════════
.org 0x500
.include "lib/stdlib.asm"
.include "lib/math.asm"
.include "lib/collision.asm"
.include "lib/time.asm"
.include "lib/stdio.asm"
.include "lib/heap.asm"
.include "lib/draw.asm"
.include "lib/input.asm"
.include "lib/random.asm"
.include "lib/gfx.asm"

; ═══════════════════════════════════════════════════════════════
; TESTS START HERE
; ═══════════════════════════════════════════════════════════════
.org 0x1100

_tests_start:

; ── PART 1: stdlib string ops (T1-T10) ──────────────────────

; T1: strlen("Hello") == 5
    LDI r12, str_hello
    CALL strlen
    LDI r15, 0x1F80
    LDI r13, 5
    CMP r14, r13
    CALL _check_eq

; T2: strcmp("Hello","Hello") == 0
    LDI r12, str_hello
    LDI r13, str_hello
    CALL strcmp
    LDI r15, 0x1F81
    CALL _check_z

; T3: strcmp("Hello","World") != 0
    LDI r12, str_hello
    LDI r13, str_world
    CALL strcmp
    LDI r15, 0x1F82
    CALL _check_nz

; T4: strcpy + strlen round-trip
    LDI r12, buf_a
    LDI r13, str_hello
    CALL strcpy
    LDI r12, buf_a
    CALL strlen
    LDI r15, 0x1F83
    LDI r13, 5
    CMP r14, r13
    CALL _check_eq

; T5: strncpy null-pads
    LDI r12, buf_c
    LDI r13, str_hi
    LDI r10, 4
    CALL strncpy
    LDI r15, buf_c
    LDI r14, 2
    ADD r15, r14
    LOAD r14, r15
    LDI r15, 0x1F84
    CALL _check_z            ; buf[2] should be 0 (null pad after "Hi")

; T6: strcat
    LDI r12, buf_d
    LDI r13, str_hi
    CALL strcpy
    LDI r12, buf_d
    LDI r13, str_hello
    CALL strcat
    LDI r12, buf_d
    CALL strlen
    LDI r15, 0x1F85
    LDI r13, 7               ; "HiHello" = 7
    CMP r14, r13
    CALL _check_eq

; T7: atoi("42") == 42
    LDI r12, str_42
    CALL atoi
    LDI r15, 0x1F86
    LDI r13, 42
    CMP r14, r13
    CALL _check_eq

; T8: atoi("0") == 0
    LDI r12, str_0
    CALL atoi
    LDI r15, 0x1F87
    CALL _check_z

; T9: itoa(42) → strlen == 2
    LDI r12, 42
    LDI r13, buf_a
    CALL itoa
    LDI r12, buf_a
    CALL strlen
    LDI r15, 0x1F88
    LDI r13, 2
    CMP r14, r13
    CALL _check_eq

; T10: itoa/atoi round-trip: 999
    LDI r12, 999
    LDI r13, buf_b
    CALL itoa
    LDI r12, buf_b
    CALL atoi
    LDI r15, 0x1F89
    LDI r13, 999
    CMP r14, r13
    CALL _check_eq

; ── PART 2: stdlib memory ops (T11-T16) ────────────────────

; T11: memset(3 words of 'A') + null terminate → strlen == 3
    LDI r12, buf_a
    LDI r13, 3
    LDI r10, 65              ; 'A'
    CALL memset
    LDI r15, buf_a
    LDI r14, 3
    ADD r15, r14
    LDI r14, 0
    STORE r15, r14
    LDI r12, buf_a
    CALL strlen
    LDI r15, 0x1F8A
    LDI r13, 3
    CMP r14, r13
    CALL _check_eq

; T12: memcpy("Hi", 3 words) → strlen == 2
    LDI r12, buf_b
    LDI r13, str_hi
    LDI r10, 3
    CALL memcpy
    LDI r12, buf_b
    CALL strlen
    LDI r15, 0x1F8B
    LDI r13, 2
    CMP r14, r13
    CALL _check_eq

; T13: memchr("Hello", 5, 'l') → nonzero
    LDI r12, str_hello
    LDI r13, 5
    LDI r10, 108             ; 'l'
    CALL memchr
    LDI r15, 0x1F8C
    CALL _check_nz

; T14: memchr("Hello", 5, 'z') → 0
    LDI r12, str_hello
    LDI r13, 5
    LDI r10, 122             ; 'z'
    CALL memchr
    LDI r15, 0x1F8D
    CALL _check_z

; T15: malloc(10) returns nonzero
    LDI r12, 10
    CALL malloc
    LDI r15, 0x1F8E
    CALL _check_nz

; T16: malloc returns address >= HEAP_START
    LDI r12, 5
    CALL malloc
    LDI r15, 0x1F8F
    LDI r13, 0xC000
    ; Check r14 >= 0xC000: CMP(r14, 0xC000) should NOT be -1
    CMP r14, r13
    LDI r13, 0xFFFFFFFF
    CMP r14, r13
    ; If r14 == 0xFFFFFFFF (CMP was -1, addr < heap_start), fail
    JZ r14, _t16_fail
    LDI r14, 1
    LDI r15, 0x1F8F
    STORE r15, r14
    JMP _t16_done
_t16_fail:
    LDI r14, 0
    LDI r15, 0x1F8F
    STORE r15, r14
_t16_done:

; ── PART 3: math (T17-T24) ─────────────────────────────────

; T17: abs(-42) == 42
    LDI r12, 0xFFFFFFD6      ; -42 as u32
    CALL abs
    LDI r15, 0x1F90
    LDI r13, 42
    CMP r14, r13
    CALL _check_eq

; T18: abs(0) == 0
    LDI r12, 0
    CALL abs
    LDI r15, 0x1F91
    CALL _check_z

; T19: min(3,7) == 3
    LDI r12, 3
    LDI r13, 7
    CALL min
    LDI r15, 0x1F92
    LDI r13, 3
    CMP r14, r13
    CALL _check_eq

; T20: max(3,7) == 7
    LDI r12, 3
    LDI r13, 7
    CALL max
    LDI r15, 0x1F93
    LDI r13, 7
    CMP r14, r13
    CALL _check_eq

; T21: clamp(0, 1, 10) == 1
    LDI r12, 0
    LDI r13, 1
    LDI r10, 10
    CALL clamp
    LDI r15, 0x1F94
    LDI r13, 1
    CMP r14, r13
    CALL _check_eq

; T22: lerp(0, 100, 50, 100) == 50
    LDI r12, 0
    LDI r13, 100
    LDI r10, 50
    LDI r6, 100
    CALL lerp
    LDI r15, 0x1F95
    LDI r13, 50
    CMP r14, r13
    CALL _check_eq

; T23: sqrt_approx(144) == 12
    LDI r12, 144
    CALL sqrt_approx
    LDI r15, 0x1F96
    LDI r13, 12
    CMP r14, r13
    CALL _check_eq

; T24: dist2(0,0, 3,4) == 25
    LDI r12, 0
    LDI r13, 0
    LDI r10, 3
    LDI r6, 4
    CALL dist2
    LDI r15, 0x1F97
    LDI r13, 25
    CMP r14, r13
    CALL _check_eq

; ── PART 4: collision (T25-T34) ────────────────────────────

; T25: rect_overlap(same rect) == 1
    LDI r12, 0
    LDI r13, 0
    LDI r10, 10
    LDI r6, 10
    LDI r0, 0
    LDI r7, 0
    LDI r9, 10
    LDI r1, 10
    CALL rect_overlap
    LDI r15, 0x1F98
    LDI r13, 1
    CMP r14, r13
    CALL _check_eq

; T26: rect_overlap(disjoint) == 0
    LDI r12, 0
    LDI r13, 0
    LDI r10, 5
    LDI r6, 5
    LDI r0, 10
    LDI r7, 10
    LDI r9, 5
    LDI r1, 5
    CALL rect_overlap
    LDI r15, 0x1F99
    CALL _check_z

; T27: point_in_rect(5,5 in [0,0,10,10]) == 1
    LDI r12, 5
    LDI r13, 5
    LDI r10, 0
    LDI r6, 0
    LDI r0, 10
    LDI r7, 10
    CALL point_in_rect
    LDI r15, 0x1F9A
    LDI r13, 1
    CMP r14, r13
    CALL _check_eq

; T28: point_in_rect(15,5 outside) == 0
    LDI r12, 15
    LDI r13, 5
    LDI r10, 0
    LDI r6, 0
    LDI r0, 10
    LDI r7, 10
    CALL point_in_rect
    LDI r15, 0x1F9B
    CALL _check_z

; T29: point_in_circle(center of r=5) == 1
    LDI r12, 0
    LDI r13, 0
    LDI r10, 0
    LDI r6, 0
    LDI r0, 5
    CALL point_in_circle
    LDI r15, 0x1F9C
    LDI r13, 1
    CMP r14, r13
    CALL _check_eq

; T30: point_in_circle(10,10 far from r=5) == 0
    LDI r12, 10
    LDI r13, 10
    LDI r10, 0
    LDI r6, 0
    LDI r0, 5
    CALL point_in_circle
    LDI r15, 0x1F9D
    CALL _check_z

; T31: circle_rect_intersect(inside) == 1
    LDI r12, 5
    LDI r13, 5
    LDI r10, 3
    LDI r6, 0
    LDI r0, 0
    LDI r7, 10
    LDI r9, 10
    CALL circle_rect_intersect
    LDI r15, 0x1F9E
    LDI r13, 1
    CMP r14, r13
    CALL _check_eq

; T32: circle_rect_intersect(far) == 0
    LDI r12, 50
    LDI r13, 50
    LDI r10, 3
    LDI r6, 0
    LDI r0, 0
    LDI r7, 10
    LDI r9, 10
    CALL circle_rect_intersect
    LDI r15, 0x1F9F
    CALL _check_z

; T33: circles_overlap(overlap) == 1
    LDI r12, 0
    LDI r13, 0
    LDI r10, 5
    LDI r6, 8
    LDI r0, 0
    LDI r7, 5
    CALL circles_overlap
    LDI r15, 0x1FA0
    LDI r13, 1
    CMP r14, r13
    CALL _check_eq

; T34: circles_overlap(apart) == 0
    LDI r12, 0
    LDI r13, 0
    LDI r10, 5
    LDI r6, 20
    LDI r0, 0
    LDI r7, 5
    CALL circles_overlap
    LDI r15, 0x1FA1
    CALL _check_z

; ── PART 5: point_in_triangle (T35-T36) ────────────────────

; T35: point_in_triangle(5,5 in (0,0)(10,0)(0,10)) == 1
    LDI r12, 5
    LDI r13, 5
    LDI r10, 0
    LDI r6, 0
    LDI r0, 10
    LDI r7, 0
    LDI r9, 0
    LDI r1, 10
    CALL point_in_triangle
    LDI r15, 0x1FA2
    LDI r13, 1
    CMP r14, r13
    CALL _check_eq

; T36: point_in_triangle(10,10 outside) == 0
    LDI r12, 10
    LDI r13, 10
    LDI r10, 0
    LDI r6, 0
    LDI r0, 10
    LDI r7, 0
    LDI r9, 0
    LDI r1, 10
    CALL point_in_triangle
    LDI r15, 0x1FA3
    CALL _check_z

; ── PART 6: time (T37-T38) ─────────────────────────────────

; T37: get_ticks returns some value (non-crash)
    CALL get_ticks
    LDI r15, 0x1FA4
    ; Just check it doesn't crash -- store 1
    LDI r14, 1
    STORE r15, r14

; T38: get_ticks idempotent (two reads in sequence)
    CALL get_ticks
    MOV r12, r14              ; save first
    CALL get_ticks
    ; Second >= first (ticks are monotonic)
    LDI r15, 0x1FA5
    CMP r14, r12
    ; If CMP == -1, second < first → fail
    LDI r13, 0xFFFFFFFF
    CMP r14, r13
    JZ r14, _t38_fail
    LDI r14, 1
    STORE r15, r14
    JMP _t38_done
_t38_fail:
    LDI r14, 0
    STORE r15, r14
_t38_done:

; ── PART 7: gfx (T39-T46) ──────────────────────────────────

; T39: rgb_pack(255, 128, 0) == 0x00FF8000
    LDI r12, 255
    LDI r13, 128
    LDI r10, 0
    CALL rgb_pack
    LDI r15, 0x1FA6
    LDI r13, 0x00FF8000
    CMP r14, r13
    CALL _check_eq

; T40: rgb_pack(0, 0, 0) == 0
    LDI r12, 0
    LDI r13, 0
    LDI r10, 0
    CALL rgb_pack
    LDI r15, 0x1FA7
    CALL _check_z

; T41: rgb_unpack_r(0x00FF0000) == 255
    LDI r12, 0x00FF0000
    CALL rgb_unpack_r
    LDI r15, 0x1FA8
    LDI r13, 255
    CMP r14, r13
    CALL _check_eq

; T42: rgb_unpack_g(0x0000FF00) == 255
    LDI r12, 0x0000FF00
    CALL rgb_unpack_g
    LDI r15, 0x1FA9
    LDI r13, 255
    CMP r14, r13
    CALL _check_eq

; T43: rgb_unpack_b(0x000000FF) == 255
    LDI r12, 0x000000FF
    CALL rgb_unpack_b
    LDI r15, 0x1FAA
    LDI r13, 255
    CMP r14, r13
    CALL _check_eq

; T44: rgb_invert(0x00FFFFFF) == 0
    LDI r12, 0x00FFFFFF
    CALL rgb_invert
    LDI r15, 0x1FAB
    CALL _check_z

; T45: rgb_invert(0) == 0x00FFFFFF
    LDI r12, 0
    CALL rgb_invert
    LDI r15, 0x1FAC
    LDI r13, 0x00FFFFFF
    CMP r14, r13
    CALL _check_eq

; T46: color_dim(0x00FFFFFF, 128) ≈ 0x007FFFFF
    LDI r12, 0x00FFFFFF
    LDI r13, 128
    CALL color_dim
    LDI r15, 0x1FAD
    LDI r13, 0x007FFFFF
    CMP r14, r13
    CALL _check_eq

; ── PART 8: random (T47-T50) ───────────────────────────────

; T47: rng_init with known seed, rng_next produces value
    LDI r12, 42
    CALL rng_init
    CALL rng_next
    LDI r15, 0x1FAE
    CALL _check_nz           ; should be nonzero

; T48: rng_range(10) < 10
    LDI r12, 10
    CALL rng_range
    LDI r15, 0x1FAF
    LDI r13, 10
    CMP r14, r13
    ; If CMP >= 1 (result >= 10), fail
    LDI r13, 1
    CMP r14, r13
    JZ r14, _t48_fail
    LDI r14, 1
    STORE r15, r14
    JMP _t48_done
_t48_fail:
    LDI r14, 0
    STORE r15, r14
_t48_done:

; T49: rng_range_bounded(5, 10) >= 5
    LDI r12, 5
    LDI r13, 10
    CALL rng_range_bounded
    LDI r15, 0x1FB0
    LDI r13, 5
    CMP r14, r13
    ; If CMP == -1 (result < 5), fail
    LDI r13, 0xFFFFFFFF
    CMP r14, r13
    JZ r14, _t49_fail
    LDI r14, 1
    STORE r15, r14
    JMP _t49_done
_t49_fail:
    LDI r14, 0
    STORE r15, r14
_t49_done:

; T50: rng_coin returns 0 or 1
    CALL rng_coin
    LDI r15, 0x1FB1
    LDI r13, 2
    CMP r14, r13
    ; Must be < 2
    LDI r13, 1
    CMP r14, r13
    JZ r14, _t50_fail
    ; Also check >= 0 (it's unsigned, always >= 0)
    LDI r14, 1
    STORE r15, r14
    JMP _t50_done
_t50_fail:
    LDI r14, 0
    STORE r15, r14
_t50_done:

; ── PART 9: draw (no screen verification, just non-crash) ──
; T51-T54: draw functions don't crash (execute on offscreen area)

; T51: draw_hline doesn't crash
    LDI r12, 0
    LDI r13, 0
    LDI r10, 0               ; length 0 = no-op
    LDI r6, 0xFFFFFF
    CALL draw_hline
    LDI r15, 0x1FB2
    LDI r14, 1
    STORE r15, r14

; T52: draw_vline doesn't crash
    LDI r12, 0
    LDI r13, 0
    LDI r10, 0
    LDI r6, 0xFFFFFF
    CALL draw_vline
    LDI r15, 0x1FB3
    LDI r14, 1
    STORE r15, r14

; T53: draw_bar returns 0 for value 0
    LDI r12, 100
    LDI r13, 200
    LDI r10, 50
    LDI r6, 0               ; value 0
    LDI r0, 0xFF0000
    CALL draw_bar
    LDI r15, 0x1FB4
    CALL _check_z

; T54: draw_bar_h returns 0 for value 0
    LDI r12, 100
    LDI r13, 200
    LDI r10, 50
    LDI r6, 0
    LDI r0, 0xFF0000
    CALL draw_bar_h
    LDI r15, 0x1FB5
    CALL _check_z

; ── PART 10: input (non-crash, no keypress in test) ────────

; T55: key_poll doesn't crash (returns 0 in test env)
    CALL key_poll
    LDI r15, 0x1FB6
    ; In test env, no key pressed → should return 0
    CALL _check_z

; T56: key_any doesn't crash (returns 0 in test env)
    CALL key_any
    LDI r15, 0x1FB7
    CALL _check_z

; ── Summary: halt ──────────────────────────────────────────
    HALT
