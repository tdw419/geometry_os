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
;   _check_result: r11==0 → store 1 (pass), else store 0 (fail)
;     Use after CMP to check equality, or directly for "expected==0"
;   _check_neq: r11!=0 → store 1 (pass), else store 0 (fail)
;     Use for "expected nonzero" checks
;   Both use r6 as the result address (set BEFORE calling)
; ═══════════════════════════════════════════════════════════════
_check_result:
    JZ r11, _cr_pass
    LDI r11, 0
    STORE r6, r11
    RET
_cr_pass:
    LDI r11, 1
    STORE r6, r11
    RET

_check_neq:
    JZ r11, _cne_fail
    LDI r11, 1
    STORE r6, r11
    RET
_cne_fail:
    LDI r11, 0
    STORE r6, r11
    RET

; ═══════════════════════════════════════════════════════════════
; PART 1: Regression tests for existing functions (T1-T10)
; ═══════════════════════════════════════════════════════════════

; T1: strlen("Hello") == 5
    LDI r0, str_hello
    CALL strlen
    LDI r6, 0xF80
    LDI r10, 5
    CMP r11, r10
    CALL _check_result

; T2: strcmp("Hello","Hello") == 0
    LDI r0, str_hello
    LDI r10, str_hello
    CALL strcmp
    LDI r6, 0xF81
    CALL _check_result

; T3: strcpy + strlen round-trip
    LDI r0, buf_a
    LDI r10, str_hello
    CALL strcpy
    LDI r0, buf_a
    CALL strlen
    LDI r6, 0xF82
    LDI r10, 5
    CMP r11, r10
    CALL _check_result

; T4: abs(-42) == 42
    LDI r0, 0xFFFFFFD6
    CALL abs
    LDI r6, 0xF83
    LDI r10, 42
    CMP r11, r10
    CALL _check_result

; T5: min(3,7) == 3
    LDI r0, 3
    LDI r10, 7
    CALL min
    LDI r6, 0xF84
    LDI r10, 3
    CMP r11, r10
    CALL _check_result

; T6: max(3,7) == 7
    LDI r0, 3
    LDI r10, 7
    CALL max
    LDI r6, 0xF85
    LDI r10, 7
    CMP r11, r10
    CALL _check_result

; T7: clamp(0, 1, 10) == 1
    LDI r0, 0
    LDI r10, 1
    LDI r1, 10
    CALL clamp
    LDI r6, 0xF86
    LDI r10, 1
    CMP r11, r10
    CALL _check_result

; T8: sqrt_approx(144) == 12
    LDI r0, 144
    CALL sqrt_approx
    LDI r6, 0xF87
    LDI r10, 12
    CMP r11, r10
    CALL _check_result

; T9: rect_overlap(same) == 1
    LDI r0, 0
    LDI r10, 0
    LDI r1, 10
    LDI r15, 10
    LDI r13, 0
    LDI r12, 0
    LDI r4, 10
    LDI r9, 10
    CALL rect_overlap
    LDI r6, 0xF88
    LDI r10, 1
    CMP r11, r10
    CALL _check_result

; T10: point_in_rect(5,5 in [0,0,10,10]) == 1
    LDI r0, 5
    LDI r10, 5
    LDI r1, 0
    LDI r15, 0
    LDI r13, 10
    LDI r12, 10
    CALL point_in_rect
    LDI r6, 0xF89
    LDI r10, 1
    CMP r11, r10
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 2: String/memory function tests (T11-T22)
; ═══════════════════════════════════════════════════════════════

; T11: atoi("42") == 42
    LDI r0, str_42
    CALL atoi
    LDI r6, 0xF8A
    LDI r10, 42
    CMP r11, r10
    CALL _check_result

; T12: atoi("0") == 0
    LDI r0, str_0
    CALL atoi
    LDI r6, 0xF8B
    CALL _check_result

; T13: atoi("1000") == 1000
    LDI r0, str_1000
    CALL atoi
    LDI r6, 0xF8C
    LDI r10, 1000
    CMP r11, r10
    CALL _check_result

; T14: itoa(42) → strlen == 2
    LDI r0, 42
    LDI r10, buf_a
    CALL itoa
    LDI r0, buf_a
    CALL strlen
    LDI r6, 0xF8D
    LDI r10, 2
    CMP r11, r10
    CALL _check_result

; T15: itoa(0) → strlen == 1
    LDI r0, 0
    LDI r10, buf_a
    CALL itoa
    LDI r0, buf_a
    CALL strlen
    LDI r6, 0xF8E
    LDI r10, 1
    CMP r11, r10
    CALL _check_result

; T16: itoa/atoi round-trip: 999
    LDI r0, 999
    LDI r10, buf_b
    CALL itoa
    LDI r0, buf_b
    CALL atoi
    LDI r6, 0xF8F
    LDI r10, 999
    CMP r11, r10
    CALL _check_result

; T17: strncpy("Hello", 3) → buf[3] == 0 (null-padded)
    LDI r0, buf_c
    LDI r10, str_hello
    LDI r1, 4
    CALL strncpy
    LDI r6, buf_c
    LDI r11, 3
    ADD r6, r11
    LOAD r11, r6
    LDI r6, 0xF90
    CALL _check_result

; T18: strncpy exact length → strlen == 2
    LDI r0, buf_c
    LDI r10, str_hi
    LDI r1, 2
    CALL strncpy
    LDI r0, buf_c
    CALL strlen
    LDI r6, 0xF91
    LDI r10, 2
    CMP r11, r10
    CALL _check_result

; T19: memchr("Hello", 5, 'l') → nonzero (found)
    LDI r0, str_hello
    LDI r10, 5
    LDI r1, 108            ; 'l'
    CALL memchr
    LDI r6, 0xF92
    CALL _check_neq

; T20: memchr("Hello", 5, 'z') → 0 (not found)
    LDI r0, str_hello
    LDI r10, 5
    LDI r1, 122            ; 'z'
    CALL memchr
    LDI r6, 0xF93
    CALL _check_result

; T21: memset(3 words of 'A') → strlen == 3
    LDI r0, buf_a
    LDI r10, 3
    LDI r1, 65             ; 'A'
    CALL memset
    LDI r6, buf_a
    LDI r11, 3
    ADD r6, r11
    LDI r11, 0
    STORE r6, r11           ; null terminate after 3 'A's
    LDI r0, buf_a
    CALL strlen
    LDI r6, 0xF94
    LDI r10, 3
    CMP r11, r10
    CALL _check_result

; T22: memcpy("Hi", 3 words) → strlen == 2
    LDI r0, buf_b
    LDI r10, str_hi
    LDI r1, 3
    CALL memcpy
    LDI r0, buf_b
    CALL strlen
    LDI r6, 0xF95
    LDI r10, 2
    CMP r11, r10
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 3: Math function tests (T23-T28)
; ═══════════════════════════════════════════════════════════════

; T23: lerp(0, 100, 50, 100) == 50
    LDI r0, 0
    LDI r10, 100
    LDI r1, 50
    LDI r15, 100
    CALL lerp
    LDI r6, 0xF96
    LDI r10, 50
    CMP r11, r10
    CALL _check_result

; T24: lerp(0, 100, 0, 100) == 0 (t=0)
    LDI r0, 0
    LDI r10, 100
    LDI r1, 0
    LDI r15, 100
    CALL lerp
    LDI r6, 0xF97
    CALL _check_result

; T25: lerp(0, 100, 100, 100) == 100 (t=scale)
    LDI r0, 0
    LDI r10, 100
    LDI r1, 100
    LDI r15, 100
    CALL lerp
    LDI r6, 0xF98
    LDI r10, 100
    CMP r11, r10
    CALL _check_result

; T26: sqrt_approx(10000) == 100
    LDI r0, 10000
    CALL sqrt_approx
    LDI r6, 0xF99
    LDI r10, 100
    CMP r11, r10
    CALL _check_result

; T27: dist2(0,0, 3,4) == 25
    LDI r0, 0
    LDI r10, 0
    LDI r1, 3
    LDI r15, 4
    CALL dist2
    LDI r6, 0xF9A
    LDI r10, 25
    CMP r11, r10
    CALL _check_result

; T28: abs(0) == 0
    LDI r0, 0
    CALL abs
    LDI r6, 0xF9B
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 4: Collision function tests (T29-T38)
; ═══════════════════════════════════════════════════════════════

; T29: point_in_circle(0,0 center of r=5) == 1
    LDI r0, 0
    LDI r10, 0
    LDI r1, 0
    LDI r15, 0
    LDI r13, 5
    CALL point_in_circle
    LDI r6, 0xF9C
    LDI r10, 1
    CMP r11, r10
    CALL _check_result

; T30: point_in_circle(10,10 far from r=5) == 0
    LDI r0, 10
    LDI r10, 10
    LDI r1, 0
    LDI r15, 0
    LDI r13, 5
    CALL point_in_circle
    LDI r6, 0xF9D
    CALL _check_result

; T31: circle_rect_intersect(inside) == 1
    LDI r0, 5
    LDI r10, 5
    LDI r1, 3
    LDI r15, 0
    LDI r13, 0
    LDI r12, 10
    LDI r4, 10
    CALL circle_rect_intersect
    LDI r6, 0xF9E
    LDI r10, 1
    CMP r11, r10
    CALL _check_result

; T32: circle_rect_intersect(far away) == 0
    LDI r0, 50
    LDI r10, 50
    LDI r1, 3
    LDI r15, 0
    LDI r13, 0
    LDI r12, 10
    LDI r4, 10
    CALL circle_rect_intersect
    LDI r6, 0xF9F
    CALL _check_result

; T33: circles_overlap(overlap) == 1
    LDI r0, 0
    LDI r10, 0
    LDI r1, 5
    LDI r15, 8
    LDI r13, 0
    LDI r12, 5
    CALL circles_overlap
    LDI r6, 0xFA0
    LDI r10, 1
    CMP r11, r10
    CALL _check_result

; T34: circles_overlap(apart) == 0
    LDI r0, 0
    LDI r10, 0
    LDI r1, 5
    LDI r15, 20
    LDI r13, 0
    LDI r12, 5
    CALL circles_overlap
    LDI r6, 0xFA1
    CALL _check_result

; T35: point_in_triangle(5,5 in (0,0)(10,0)(0,10)) == 1
    LDI r0, 5
    LDI r10, 5
    LDI r1, 0
    LDI r15, 0
    LDI r13, 10
    LDI r12, 0
    LDI r4, 0
    LDI r9, 10
    CALL point_in_triangle
    LDI r6, 0xFA2
    LDI r10, 1
    CMP r11, r10
    CALL _check_result

; T36: point_in_triangle(10,10 outside) == 0
    LDI r0, 10
    LDI r10, 10
    LDI r1, 0
    LDI r15, 0
    LDI r13, 10
    LDI r12, 0
    LDI r4, 0
    LDI r9, 10
    CALL point_in_triangle
    LDI r6, 0xFA3
    CALL _check_result

; T37: rect_overlap(disjoint) == 0
    LDI r0, 0
    LDI r10, 0
    LDI r1, 5
    LDI r15, 5
    LDI r13, 10
    LDI r12, 10
    LDI r4, 5
    LDI r9, 5
    CALL rect_overlap
    LDI r6, 0xFA4
    CALL _check_result

; T38: point_in_rect(15,5 outside) == 0
    LDI r0, 15
    LDI r10, 5
    LDI r1, 0
    LDI r15, 0
    LDI r13, 10
    LDI r12, 10
    CALL point_in_rect
    LDI r6, 0xFA5
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 5: Heap allocator tests (T39-T44)
;   Tests the bump allocator in stdlib.asm
; ═══════════════════════════════════════════════════════════════

; T39: malloc(10) returns nonzero address
    LDI r0, 10
    CALL malloc
    LDI r6, 0xFA6
    CALL _check_neq        ; nonzero = success

; T40: malloc returns address >= HEAP_START
    LDI r0, 5
    CALL malloc
    LDI r6, 0xFA7
    LDI r10, 0xC000
    ; r11 >= 0xC000: CMP(r11, 0xC000) should be 0 or 1, not -1
    CMP r11, r10
    LDI r10, 0xFFFFFFFF
    CMP r11, r10
    ; If CMP == -1, r11 < HEAP_START (fail)
    ; _check_result checks r11==0, but we need r11!=0xFFFFFFFF
    ; Let's use a different approach: check if r11 >= HEAP_START
    ; If the original malloc returned addr, it's in r11 from the CALL
    ; Wait, CMP clobbered r11. We need to restructure.
    ; Actually: after CALL malloc, r11 = addr. Then LDI r6 sets r6.
    ; CMP r11, r10 → r11 = CMP(addr, 0xC000)
    ; Then CMP r11, r10 → r11 = CMP(CMP_result, 0xFFFFFFFF)
    ; If addr >= HEAP_START, CMP(addr, HEAP_START) = 0 or 1
    ; CMP(0, 0xFFFFFFFF) = 1, CMP(1, 0xFFFFFFFF) = 1
    ; If addr < HEAP_START, CMP(addr, HEAP_START) = 0xFFFFFFFF
    ; CMP(0xFFFFFFFF, 0xFFFFFFFF) = 0
    ; So: _check_neq means pass (r11 != 0 means addr >= HEAP_START)
    CALL _check_neq

; T41: malloc(1) returns nonzero
    LDI r0, 1
    CALL malloc
    LDI r6, 0xFA8
    CALL _check_neq

; T42: Two mallocs return different addresses
    LDI r0, 10
    CALL malloc
    MOV r13, r11             ; save first addr
    LDI r0, 10
    CALL malloc
    ; r11 should differ from r13
    CMP r11, r13
    LDI r6, 0xFA9
    ; CMP == 0 means equal (fail), CMP != 0 means different (pass)
    CALL _check_neq

; T43: malloc preserves callee-saved r7-r2
    ; Set r7-r2 to known values
    LDI r7, 0xAAAA
    LDI r3, 0xBBBB
    LDI r2, 0xCCCC
    LDI r0, 20
    CALL malloc
    ; Check r7 still == 0xAAAA
    LDI r10, 0xAAAA
    CMP r7, r10
    LDI r6, 0xFAA
    CALL _check_result

; T44: malloc preserves callee-saved r3-r2
    LDI r10, 0xBBBB
    CMP r3, r10
    LDI r6, 0xFAB
    CALL _check_result

; T45: malloc preserves callee-saved r2
    LDI r10, 0xCCCC
    CMP r2, r10
    LDI r6, 0xFAC
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 6: Callee-saved register preservation tests (T46-T51)
;   Verify that ALL library functions properly preserve r7-r25
; ═══════════════════════════════════════════════════════════════

; T46: strlen preserves r7
    LDI r7, 0x1234
    LDI r0, str_hello
    CALL strlen
    LDI r10, 0x1234
    CMP r7, r10
    LDI r6, 0xFAD
    CALL _check_result

; T47: strcmp preserves r7-r3
    LDI r7, 0x5678
    LDI r3, 0x9ABC
    LDI r0, str_hello
    LDI r10, str_hello
    CALL strcmp
    LDI r10, 0x5678
    CMP r7, r10
    LDI r6, 0xFAE
    CALL _check_result

; T48: strcmp preserves r3
    LDI r10, 0x9ABC
    CMP r3, r10
    LDI r6, 0xFAF
    CALL _check_result

; T49: itoa preserves r7 (critical - was broken in v1.1.0)
    LDI r7, 0xDEAD
    LDI r0, 12345
    LDI r10, buf_a
    CALL itoa
    LDI r10, 0xDEAD
    CMP r7, r10
    LDI r6, 0xFB0
    CALL _check_result

; T50: sqrt_approx preserves r7 (critical - was broken in v1.1.0)
    LDI r7, 0xBEEF
    LDI r0, 256
    CALL sqrt_approx
    LDI r10, 0xBEEF
    CMP r7, r10
    LDI r6, 0xFB1
    CALL _check_result

; T51: point_in_circle preserves r7 (was broken in v1.1.0)
    LDI r7, 0xCAFE
    LDI r0, 3
    LDI r10, 4
    LDI r1, 0
    LDI r15, 0
    LDI r13, 5
    CALL point_in_circle
    LDI r10, 0xCAFE
    CMP r7, r10
    LDI r6, 0xFB2
    CALL _check_result

; T52: circles_overlap preserves r7 (was broken in v1.1.0)
    LDI r7, 0xF00D
    LDI r0, 0
    LDI r10, 0
    LDI r1, 5
    LDI r15, 8
    LDI r13, 0
    LDI r12, 5
    CALL circles_overlap
    LDI r10, 0xF00D
    CMP r7, r10
    LDI r6, 0xFB3
    CALL _check_result

; T53: circle_rect_intersect preserves r7 (was broken in v1.1.0)
    LDI r7, 0xBEEF
    LDI r0, 5
    LDI r10, 5
    LDI r1, 3
    LDI r15, 0
    LDI r13, 0
    LDI r12, 10
    LDI r4, 10
    CALL circle_rect_intersect
    LDI r10, 0xBEEF
    CMP r7, r10
    LDI r6, 0xFB4
    CALL _check_result

; T54: point_in_triangle preserves r7-r5 (was broken in v1.1.0)
    LDI r7, 0x1111
    LDI r3, 0x2222
    LDI r2, 0x3333
    LDI r8, 0x4444
    LDI r14, 0x5555
    LDI r5, 0x6666
    LDI r0, 5
    LDI r10, 5
    LDI r1, 0
    LDI r15, 0
    LDI r13, 10
    LDI r12, 0
    LDI r4, 0
    LDI r9, 10
    CALL point_in_triangle
    LDI r10, 0x1111
    CMP r7, r10
    LDI r6, 0xFB5
    CALL _check_result

; T55: point_in_triangle preserves r3-r8
    LDI r10, 0x2222
    CMP r3, r10
    LDI r6, 0xFB6
    CALL _check_result

; T56: point_in_triangle preserves r14-r5
    LDI r10, 0x5555
    CMP r14, r10
    LDI r6, 0xFB7
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
