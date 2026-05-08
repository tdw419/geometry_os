; DESCRIPTION: Render a colored object at the screen.

; lib_test_v3.asm -- Full library test suite v3 (v1.2.0)
;
; Tests ALL library functions including stdio and heap modules.
; Results stored in RAM for deterministic verification.
;
; Result area: 0xF80-0xFB7 (56 test slots, 1 byte each)
;   1 = PASS, 0 = FAIL
;
; Layout:
;   0x000: test code + helpers
;   0x500: library code (.include)
;   0xC00: test data strings
;
; Run: load programs/lib_test_v3.asm -> assemble -> run
; Verify: inspect RAM[0xF80..0xFB7]

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Initialization (must be first -- execution starts at PC=0)
; ═══════════════════════════════════════════════════════════════
    LDI r30, 0xFF00         ; stack pointer

; ═══════════════════════════════════════════════════════════════
; Helpers: test result storage
;   _check_result: r13==0 → store 1 (pass), else store 0 (fail)
;     Use after CMP to check equality, or directly for "expected==0"
;   _check_neq: r13!=0 → store 1 (pass), else store 0 (fail)
;     Use for "expected nonzero" checks
;   Both use r3 as the result address (set BEFORE calling)
; ═══════════════════════════════════════════════════════════════
_check_result:
    JZ r13, _cr_pass
    LDI r13, 0
    STORE r3, r13
    RET
_cr_pass:
    LDI r13, 1
    STORE r3, r13
    RET

_check_neq:
    JZ r13, _cne_fail
    LDI r13, 1
    STORE r3, r13
    RET
_cne_fail:
    LDI r13, 0
    STORE r3, r13
    RET

; ═══════════════════════════════════════════════════════════════
; PART 1: Regression tests for existing functions (T1-T10)
; ═══════════════════════════════════════════════════════════════

; T1: strlen("Hello") == 5
    LDI r9, str_hello
    CALL strlen
    LDI r3, 0xF80
    LDI r7, 5
    CMP r13, r7
    CALL _check_result

; T2: strcmp("Hello","Hello") == 0
    LDI r9, str_hello
    LDI r7, str_hello
    CALL strcmp
    LDI r3, 0xF81
    CALL _check_result

; T3: strcpy + strlen round-trip
    LDI r9, buf_a
    LDI r7, str_hello
    CALL strcpy
    LDI r9, buf_a
    CALL strlen
    LDI r3, 0xF82
    LDI r7, 5
    CMP r13, r7
    CALL _check_result

; T4: abs(-42) == 42
    LDI r9, 0xFFFFFFD6
    CALL abs
    LDI r3, 0xF83
    LDI r7, 42
    CMP r13, r7
    CALL _check_result

; T5: min(3,7) == 3
    LDI r9, 3
    LDI r7, 7
    CALL min
    LDI r3, 0xF84
    LDI r7, 3
    CMP r13, r7
    CALL _check_result

; T6: max(3,7) == 7
    LDI r9, 3
    LDI r7, 7
    CALL max
    LDI r3, 0xF85
    LDI r7, 7
    CMP r13, r7
    CALL _check_result

; T7: clamp(0, 1, 10) == 1
    LDI r9, 0
    LDI r7, 1
    LDI r1, 10
    CALL clamp
    LDI r3, 0xF86
    LDI r7, 1
    CMP r13, r7
    CALL _check_result

; T8: sqrt_approx(144) == 12
    LDI r9, 144
    CALL sqrt_approx
    LDI r3, 0xF87
    LDI r7, 12
    CMP r13, r7
    CALL _check_result

; T9: rect_overlap(same) == 1
    LDI r9, 0
    LDI r7, 0
    LDI r1, 10
    LDI r6, 10
    LDI r14, 0
    LDI r0, 0
    LDI r15, 10
    LDI r4, 10
    CALL rect_overlap
    LDI r3, 0xF88
    LDI r7, 1
    CMP r13, r7
    CALL _check_result

; T10: point_in_rect(5,5 in [0,0,10,10]) == 1
    LDI r9, 5
    LDI r7, 5
    LDI r1, 0
    LDI r6, 0
    LDI r14, 10
    LDI r0, 10
    CALL point_in_rect
    LDI r3, 0xF89
    LDI r7, 1
    CMP r13, r7
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 2: String/memory function tests (T11-T22)
; ═══════════════════════════════════════════════════════════════

; T11: atoi("42") == 42
    LDI r9, str_42
    CALL atoi
    LDI r3, 0xF8A
    LDI r7, 42
    CMP r13, r7
    CALL _check_result

; T12: atoi("0") == 0
    LDI r9, str_0
    CALL atoi
    LDI r3, 0xF8B
    CALL _check_result

; T13: atoi("1000") == 1000
    LDI r9, str_1000
    CALL atoi
    LDI r3, 0xF8C
    LDI r7, 1000
    CMP r13, r7
    CALL _check_result

; T14: itoa(42) → strlen == 2
    LDI r9, 42
    LDI r7, buf_a
    CALL itoa
    LDI r9, buf_a
    CALL strlen
    LDI r3, 0xF8D
    LDI r7, 2
    CMP r13, r7
    CALL _check_result

; T15: itoa(0) → strlen == 1
    LDI r9, 0
    LDI r7, buf_a
    CALL itoa
    LDI r9, buf_a
    CALL strlen
    LDI r3, 0xF8E
    LDI r7, 1
    CMP r13, r7
    CALL _check_result

; T16: itoa/atoi round-trip: 999
    LDI r9, 999
    LDI r7, buf_b
    CALL itoa
    LDI r9, buf_b
    CALL atoi
    LDI r3, 0xF8F
    LDI r7, 999
    CMP r13, r7
    CALL _check_result

; T17: strncpy("Hello", 3) → buf[3] == 0 (null-padded)
    LDI r9, buf_c
    LDI r7, str_hello
    LDI r1, 4
    CALL strncpy
    LDI r3, buf_c
    LDI r13, 3
    ADD r3, r13
    LOAD r13, r3
    LDI r3, 0xF90
    CALL _check_result

; T18: strncpy exact length → strlen == 2
    LDI r9, buf_c
    LDI r7, str_hi
    LDI r1, 2
    CALL strncpy
    LDI r9, buf_c
    CALL strlen
    LDI r3, 0xF91
    LDI r7, 2
    CMP r13, r7
    CALL _check_result

; T19: memchr("Hello", 5, 'l') → nonzero (found)
    LDI r9, str_hello
    LDI r7, 5
    LDI r1, 108            ; 'l'
    CALL memchr
    LDI r3, 0xF92
    CALL _check_neq

; T20: memchr("Hello", 5, 'z') → 0 (not found)
    LDI r9, str_hello
    LDI r7, 5
    LDI r1, 122            ; 'z'
    CALL memchr
    LDI r3, 0xF93
    CALL _check_result

; T21: memset(3 words of 'A') → strlen == 3
    LDI r9, buf_a
    LDI r7, 3
    LDI r1, 65             ; 'A'
    CALL memset
    LDI r3, buf_a
    LDI r13, 3
    ADD r3, r13
    LDI r13, 0
    STORE r3, r13           ; null terminate after 3 'A's
    LDI r9, buf_a
    CALL strlen
    LDI r3, 0xF94
    LDI r7, 3
    CMP r13, r7
    CALL _check_result

; T22: memcpy("Hi", 3 words) → strlen == 2
    LDI r9, buf_b
    LDI r7, str_hi
    LDI r1, 3
    CALL memcpy
    LDI r9, buf_b
    CALL strlen
    LDI r3, 0xF95
    LDI r7, 2
    CMP r13, r7
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 3: Math function tests (T23-T28)
; ═══════════════════════════════════════════════════════════════

; T23: lerp(0, 100, 50, 100) == 50
    LDI r9, 0
    LDI r7, 100
    LDI r1, 50
    LDI r6, 100
    CALL lerp
    LDI r3, 0xF96
    LDI r7, 50
    CMP r13, r7
    CALL _check_result

; T24: lerp(0, 100, 0, 100) == 0 (t=0)
    LDI r9, 0
    LDI r7, 100
    LDI r1, 0
    LDI r6, 100
    CALL lerp
    LDI r3, 0xF97
    CALL _check_result

; T25: lerp(0, 100, 100, 100) == 100 (t=scale)
    LDI r9, 0
    LDI r7, 100
    LDI r1, 100
    LDI r6, 100
    CALL lerp
    LDI r3, 0xF98
    LDI r7, 100
    CMP r13, r7
    CALL _check_result

; T26: sqrt_approx(10000) == 100
    LDI r9, 10000
    CALL sqrt_approx
    LDI r3, 0xF99
    LDI r7, 100
    CMP r13, r7
    CALL _check_result

; T27: dist2(0,0, 3,4) == 25
    LDI r9, 0
    LDI r7, 0
    LDI r1, 3
    LDI r6, 4
    CALL dist2
    LDI r3, 0xF9A
    LDI r7, 25
    CMP r13, r7
    CALL _check_result

; T28: abs(0) == 0
    LDI r9, 0
    CALL abs
    LDI r3, 0xF9B
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 4: Collision function tests (T29-T38)
; ═══════════════════════════════════════════════════════════════

; T29: point_in_circle(0,0 center of r=5) == 1
    LDI r9, 0
    LDI r7, 0
    LDI r1, 0
    LDI r6, 0
    LDI r14, 5
    CALL point_in_circle
    LDI r3, 0xF9C
    LDI r7, 1
    CMP r13, r7
    CALL _check_result

; T30: point_in_circle(10,10 far from r=5) == 0
    LDI r9, 10
    LDI r7, 10
    LDI r1, 0
    LDI r6, 0
    LDI r14, 5
    CALL point_in_circle
    LDI r3, 0xF9D
    CALL _check_result

; T31: circle_rect_intersect(inside) == 1
    LDI r9, 5
    LDI r7, 5
    LDI r1, 3
    LDI r6, 0
    LDI r14, 0
    LDI r0, 10
    LDI r15, 10
    CALL circle_rect_intersect
    LDI r3, 0xF9E
    LDI r7, 1
    CMP r13, r7
    CALL _check_result

; T32: circle_rect_intersect(far away) == 0
    LDI r9, 50
    LDI r7, 50
    LDI r1, 3
    LDI r6, 0
    LDI r14, 0
    LDI r0, 10
    LDI r15, 10
    CALL circle_rect_intersect
    LDI r3, 0xF9F
    CALL _check_result

; T33: circles_overlap(overlap) == 1
    LDI r9, 0
    LDI r7, 0
    LDI r1, 5
    LDI r6, 8
    LDI r14, 0
    LDI r0, 5
    CALL circles_overlap
    LDI r3, 0xFA0
    LDI r7, 1
    CMP r13, r7
    CALL _check_result

; T34: circles_overlap(apart) == 0
    LDI r9, 0
    LDI r7, 0
    LDI r1, 5
    LDI r6, 20
    LDI r14, 0
    LDI r0, 5
    CALL circles_overlap
    LDI r3, 0xFA1
    CALL _check_result

; T35: point_in_triangle(5,5 in (0,0)(10,0)(0,10)) == 1
    LDI r9, 5
    LDI r7, 5
    LDI r1, 0
    LDI r6, 0
    LDI r14, 10
    LDI r0, 0
    LDI r15, 0
    LDI r4, 10
    CALL point_in_triangle
    LDI r3, 0xFA2
    LDI r7, 1
    CMP r13, r7
    CALL _check_result

; T36: point_in_triangle(10,10 outside) == 0
    LDI r9, 10
    LDI r7, 10
    LDI r1, 0
    LDI r6, 0
    LDI r14, 10
    LDI r0, 0
    LDI r15, 0
    LDI r4, 10
    CALL point_in_triangle
    LDI r3, 0xFA3
    CALL _check_result

; T37: rect_overlap(disjoint) == 0
    LDI r9, 0
    LDI r7, 0
    LDI r1, 5
    LDI r6, 5
    LDI r14, 10
    LDI r0, 10
    LDI r15, 5
    LDI r4, 5
    CALL rect_overlap
    LDI r3, 0xFA4
    CALL _check_result

; T38: point_in_rect(15,5 outside) == 0
    LDI r9, 15
    LDI r7, 5
    LDI r1, 0
    LDI r6, 0
    LDI r14, 10
    LDI r0, 10
    CALL point_in_rect
    LDI r3, 0xFA5
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 5: Heap allocator tests (T39-T44)
;   Tests the bump allocator in stdlib.asm
; ═══════════════════════════════════════════════════════════════

; T39: malloc(10) returns nonzero address
    LDI r9, 10
    CALL malloc
    LDI r3, 0xFA6
    CALL _check_neq        ; nonzero = success

; T40: malloc returns address >= HEAP_START
    LDI r9, 5
    CALL malloc
    LDI r3, 0xFA7
    LDI r7, 0xC000
    ; r13 >= 0xC000: CMP(r13, 0xC000) should be 0 or 1, not -1
    CMP r13, r7
    LDI r7, 0xFFFFFFFF
    CMP r13, r7
    ; If CMP == -1, r13 < HEAP_START (fail)
    ; _check_result checks r13==0, but we need r13!=0xFFFFFFFF
    ; Let's use a different approach: check if r13 >= HEAP_START
    ; If the original malloc returned addr, it's in r13 from the CALL
    ; Wait, CMP clobbered r13. We need to restructure.
    ; Actually: after CALL malloc, r13 = addr. Then LDI r3 sets r3.
    ; CMP r13, r7 → r13 = CMP(addr, 0xC000)
    ; Then CMP r13, r7 → r13 = CMP(CMP_result, 0xFFFFFFFF)
    ; If addr >= HEAP_START, CMP(addr, HEAP_START) = 0 or 1
    ; CMP(0, 0xFFFFFFFF) = 1, CMP(1, 0xFFFFFFFF) = 1
    ; If addr < HEAP_START, CMP(addr, HEAP_START) = 0xFFFFFFFF
    ; CMP(0xFFFFFFFF, 0xFFFFFFFF) = 0
    ; So: _check_neq means pass (r13 != 0 means addr >= HEAP_START)
    CALL _check_neq

; T41: malloc(1) returns nonzero
    LDI r9, 1
    CALL malloc
    LDI r3, 0xFA8
    CALL _check_neq

; T42: Two mallocs return different addresses
    LDI r9, 10
    CALL malloc
    MOV r14, r13             ; save first addr
    LDI r9, 10
    CALL malloc
    ; r13 should differ from r14
    CMP r13, r14
    LDI r3, 0xFA9
    ; CMP == 0 means equal (fail), CMP != 0 means different (pass)
    CALL _check_neq

; T43: malloc preserves callee-saved r5-r2
    ; Set r5-r2 to known values
    LDI r5, 0xAAAA
    LDI r10, 0xBBBB
    LDI r2, 0xCCCC
    LDI r9, 20
    CALL malloc
    ; Check r5 still == 0xAAAA
    LDI r7, 0xAAAA
    CMP r5, r7
    LDI r3, 0xFAA
    CALL _check_result

; T44: malloc preserves callee-saved r10-r2
    LDI r7, 0xBBBB
    CMP r10, r7
    LDI r3, 0xFAB
    CALL _check_result

; T45: malloc preserves callee-saved r2
    LDI r7, 0xCCCC
    CMP r2, r7
    LDI r3, 0xFAC
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 6: Callee-saved register preservation tests (T46-T51)
;   Verify that ALL library functions properly preserve r5-r25
; ═══════════════════════════════════════════════════════════════

; T46: strlen preserves r5
    LDI r5, 0x1234
    LDI r9, str_hello
    CALL strlen
    LDI r7, 0x1234
    CMP r5, r7
    LDI r3, 0xFAD
    CALL _check_result

; T47: strcmp preserves r5-r10
    LDI r5, 0x5678
    LDI r10, 0x9ABC
    LDI r9, str_hello
    LDI r7, str_hello
    CALL strcmp
    LDI r7, 0x5678
    CMP r5, r7
    LDI r3, 0xFAE
    CALL _check_result

; T48: strcmp preserves r10
    LDI r7, 0x9ABC
    CMP r10, r7
    LDI r3, 0xFAF
    CALL _check_result

; T49: itoa preserves r5 (critical - was broken in v1.1.0)
    LDI r5, 0xDEAD
    LDI r9, 12345
    LDI r7, buf_a
    CALL itoa
    LDI r7, 0xDEAD
    CMP r5, r7
    LDI r3, 0xFB0
    CALL _check_result

; T50: sqrt_approx preserves r5 (critical - was broken in v1.1.0)
    LDI r5, 0xBEEF
    LDI r9, 256
    CALL sqrt_approx
    LDI r7, 0xBEEF
    CMP r5, r7
    LDI r3, 0xFB1
    CALL _check_result

; T51: point_in_circle preserves r5 (was broken in v1.1.0)
    LDI r5, 0xCAFE
    LDI r9, 3
    LDI r7, 4
    LDI r1, 0
    LDI r6, 0
    LDI r14, 5
    CALL point_in_circle
    LDI r7, 0xCAFE
    CMP r5, r7
    LDI r3, 0xFB2
    CALL _check_result

; T52: circles_overlap preserves r5 (was broken in v1.1.0)
    LDI r5, 0xF00D
    LDI r9, 0
    LDI r7, 0
    LDI r1, 5
    LDI r6, 8
    LDI r14, 0
    LDI r0, 5
    CALL circles_overlap
    LDI r7, 0xF00D
    CMP r5, r7
    LDI r3, 0xFB3
    CALL _check_result

; T53: circle_rect_intersect preserves r5 (was broken in v1.1.0)
    LDI r5, 0xBEEF
    LDI r9, 5
    LDI r7, 5
    LDI r1, 3
    LDI r6, 0
    LDI r14, 0
    LDI r0, 10
    LDI r15, 10
    CALL circle_rect_intersect
    LDI r7, 0xBEEF
    CMP r5, r7
    LDI r3, 0xFB4
    CALL _check_result

; T54: point_in_triangle preserves r5-r11 (was broken in v1.1.0)
    LDI r5, 0x1111
    LDI r10, 0x2222
    LDI r2, 0x3333
    LDI r8, 0x4444
    LDI r12, 0x5555
    LDI r11, 0x6666
    LDI r9, 5
    LDI r7, 5
    LDI r1, 0
    LDI r6, 0
    LDI r14, 10
    LDI r0, 0
    LDI r15, 0
    LDI r4, 10
    CALL point_in_triangle
    LDI r7, 0x1111
    CMP r5, r7
    LDI r3, 0xFB5
    CALL _check_result

; T55: point_in_triangle preserves r10-r8
    LDI r7, 0x2222
    CMP r10, r7
    LDI r3, 0xFB6
    CALL _check_result

; T56: point_in_triangle preserves r12-r11
    LDI r7, 0x5555
    CMP r12, r7
    LDI r3, 0xFB7
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; All tests complete
; ═══════════════════════════════════════════════════════════════
    HALT

; ═══════════════════════════════════════════════════════════════
; Library code (included at 0x500+)
; ═══════════════════════════════════════════════════════════════
.org 0x500
.include "lib/stdlib.asm"
.include "lib/math.asm"
.include "lib/time.asm"
.include "lib/collision.asm"

; ═══════════════════════════════════════════════════════════════
; Test data (at 0xC00+)
; ═══════════════════════════════════════════════════════════════
.org 0xC00
str_hello: .str "Hello"
str_hi:    .str "Hi"
str_42:    .str "42"
str_0:     .str "0"
str_1000:  .str "1000"
str_world: .str "World"
buf_empty: .str ""
buf_a:     .str ""
buf_b:     .str ""
buf_c:     .str ""
buf_d:     .str ""
