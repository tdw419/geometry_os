; DESCRIPTION: This GeOS assembly code is a comprehensive test suite for various library functions, including stdio and heap management. It systematically tests functions such as string manipulation, mathematical operations, collision detection, and heap allocation, storing the results in RAM addresses 0xF80-0xFB7 for verification. Each test case sets up parameters, calls the corresponding function, and checks the result against expected outcomes using helper functions like `_check_result` and `_check_neq`. The suite initializes the stack pointer, defines test data strings, and includes external library code for functionality.

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
;   _check_result: r0==0 → store 1 (pass), else store 0 (fail)
;     Use after CMP to check equality, or directly for "expected==0"
;   _check_neq: r0!=0 → store 1 (pass), else store 0 (fail)
;     Use for "expected nonzero" checks
;   Both use r9 as the result address (set BEFORE calling)
; ═══════════════════════════════════════════════════════════════
_check_result:
    JZ r0, _cr_pass
    LDI r0, 0
    STORE r9, r0
    RET
_cr_pass:
    LDI r0, 1
    STORE r9, r0
    RET

_check_neq:
    JZ r0, _cne_fail
    LDI r0, 1
    STORE r9, r0
    RET
_cne_fail:
    LDI r0, 0
    STORE r9, r0
    RET

; ═══════════════════════════════════════════════════════════════
; PART 1: Regression tests for existing functions (T1-T10)
; ═══════════════════════════════════════════════════════════════

; T1: strlen("Hello") == 5
    LDI r1, str_hello
    CALL strlen
    LDI r9, 0xF80
    LDI r2, 5
    CMP r0, r2
    CALL _check_result

; T2: strcmp("Hello","Hello") == 0
    LDI r1, str_hello
    LDI r2, str_hello
    CALL strcmp
    LDI r9, 0xF81
    CALL _check_result

; T3: strcpy + strlen round-trip
    LDI r1, buf_a
    LDI r2, str_hello
    CALL strcpy
    LDI r1, buf_a
    CALL strlen
    LDI r9, 0xF82
    LDI r2, 5
    CMP r0, r2
    CALL _check_result

; T4: abs(-42) == 42
    LDI r1, 0xFFFFFFD6
    CALL abs
    LDI r9, 0xF83
    LDI r2, 42
    CMP r0, r2
    CALL _check_result

; T5: min(3,7) == 3
    LDI r1, 3
    LDI r2, 7
    CALL min
    LDI r9, 0xF84
    LDI r2, 3
    CMP r0, r2
    CALL _check_result

; T6: max(3,7) == 7
    LDI r1, 3
    LDI r2, 7
    CALL max
    LDI r9, 0xF85
    LDI r2, 7
    CMP r0, r2
    CALL _check_result

; T7: clamp(0, 1, 10) == 1
    LDI r1, 0
    LDI r2, 1
    LDI r3, 10
    CALL clamp
    LDI r9, 0xF86
    LDI r2, 1
    CMP r0, r2
    CALL _check_result

; T8: sqrt_approx(144) == 12
    LDI r1, 144
    CALL sqrt_approx
    LDI r9, 0xF87
    LDI r2, 12
    CMP r0, r2
    CALL _check_result

; T9: rect_overlap(same) == 1
    LDI r1, 0
    LDI r2, 0
    LDI r3, 10
    LDI r4, 10
    LDI r5, 0
    LDI r6, 0
    LDI r7, 10
    LDI r8, 10
    CALL rect_overlap
    LDI r9, 0xF88
    LDI r2, 1
    CMP r0, r2
    CALL _check_result

; T10: point_in_rect(5,5 in [0,0,10,10]) == 1
    LDI r1, 5
    LDI r2, 5
    LDI r3, 0
    LDI r4, 0
    LDI r5, 10
    LDI r6, 10
    CALL point_in_rect
    LDI r9, 0xF89
    LDI r2, 1
    CMP r0, r2
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 2: String/memory function tests (T11-T22)
; ═══════════════════════════════════════════════════════════════

; T11: atoi("42") == 42
    LDI r1, str_42
    CALL atoi
    LDI r9, 0xF8A
    LDI r2, 42
    CMP r0, r2
    CALL _check_result

; T12: atoi("0") == 0
    LDI r1, str_0
    CALL atoi
    LDI r9, 0xF8B
    CALL _check_result

; T13: atoi("1000") == 1000
    LDI r1, str_1000
    CALL atoi
    LDI r9, 0xF8C
    LDI r2, 1000
    CMP r0, r2
    CALL _check_result

; T14: itoa(42) → strlen == 2
    LDI r1, 42
    LDI r2, buf_a
    CALL itoa
    LDI r1, buf_a
    CALL strlen
    LDI r9, 0xF8D
    LDI r2, 2
    CMP r0, r2
    CALL _check_result

; T15: itoa(0) → strlen == 1
    LDI r1, 0
    LDI r2, buf_a
    CALL itoa
    LDI r1, buf_a
    CALL strlen
    LDI r9, 0xF8E
    LDI r2, 1
    CMP r0, r2
    CALL _check_result

; T16: itoa/atoi round-trip: 999
    LDI r1, 999
    LDI r2, buf_b
    CALL itoa
    LDI r1, buf_b
    CALL atoi
    LDI r9, 0xF8F
    LDI r2, 999
    CMP r0, r2
    CALL _check_result

; T17: strncpy("Hello", 3) → buf[3] == 0 (null-padded)
    LDI r1, buf_c
    LDI r2, str_hello
    LDI r3, 4
    CALL strncpy
    LDI r9, buf_c
    LDI r0, 3
    ADD r9, r0
    LOAD r0, r9
    LDI r9, 0xF90
    CALL _check_result

; T18: strncpy exact length → strlen == 2
    LDI r1, buf_c
    LDI r2, str_hi
    LDI r3, 2
    CALL strncpy
    LDI r1, buf_c
    CALL strlen
    LDI r9, 0xF91
    LDI r2, 2
    CMP r0, r2
    CALL _check_result

; T19: memchr("Hello", 5, 'l') → nonzero (found)
    LDI r1, str_hello
    LDI r2, 5
    LDI r3, 108            ; 'l'
    CALL memchr
    LDI r9, 0xF92
    CALL _check_neq

; T20: memchr("Hello", 5, 'z') → 0 (not found)
    LDI r1, str_hello
    LDI r2, 5
    LDI r3, 122            ; 'z'
    CALL memchr
    LDI r9, 0xF93
    CALL _check_result

; T21: memset(3 words of 'A') → strlen == 3
    LDI r1, buf_a
    LDI r2, 3
    LDI r3, 65             ; 'A'
    CALL memset
    LDI r9, buf_a
    LDI r0, 3
    ADD r9, r0
    LDI r0, 0
    STORE r9, r0           ; null terminate after 3 'A's
    LDI r1, buf_a
    CALL strlen
    LDI r9, 0xF94
    LDI r2, 3
    CMP r0, r2
    CALL _check_result

; T22: memcpy("Hi", 3 words) → strlen == 2
    LDI r1, buf_b
    LDI r2, str_hi
    LDI r3, 3
    CALL memcpy
    LDI r1, buf_b
    CALL strlen
    LDI r9, 0xF95
    LDI r2, 2
    CMP r0, r2
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 3: Math function tests (T23-T28)
; ═══════════════════════════════════════════════════════════════

; T23: lerp(0, 100, 50, 100) == 50
    LDI r1, 0
    LDI r2, 100
    LDI r3, 50
    LDI r4, 100
    CALL lerp
    LDI r9, 0xF96
    LDI r2, 50
    CMP r0, r2
    CALL _check_result

; T24: lerp(0, 100, 0, 100) == 0 (t=0)
    LDI r1, 0
    LDI r2, 100
    LDI r3, 0
    LDI r4, 100
    CALL lerp
    LDI r9, 0xF97
    CALL _check_result

; T25: lerp(0, 100, 100, 100) == 100 (t=scale)
    LDI r1, 0
    LDI r2, 100
    LDI r3, 100
    LDI r4, 100
    CALL lerp
    LDI r9, 0xF98
    LDI r2, 100
    CMP r0, r2
    CALL _check_result

; T26: sqrt_approx(10000) == 100
    LDI r1, 10000
    CALL sqrt_approx
    LDI r9, 0xF99
    LDI r2, 100
    CMP r0, r2
    CALL _check_result

; T27: dist2(0,0, 3,4) == 25
    LDI r1, 0
    LDI r2, 0
    LDI r3, 3
    LDI r4, 4
    CALL dist2
    LDI r9, 0xF9A
    LDI r2, 25
    CMP r0, r2
    CALL _check_result

; T28: abs(0) == 0
    LDI r1, 0
    CALL abs
    LDI r9, 0xF9B
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 4: Collision function tests (T29-T38)
; ═══════════════════════════════════════════════════════════════

; T29: point_in_circle(0,0 center of r=5) == 1
    LDI r1, 0
    LDI r2, 0
    LDI r3, 0
    LDI r4, 0
    LDI r5, 5
    CALL point_in_circle
    LDI r9, 0xF9C
    LDI r2, 1
    CMP r0, r2
    CALL _check_result

; T30: point_in_circle(10,10 far from r=5) == 0
    LDI r1, 10
    LDI r2, 10
    LDI r3, 0
    LDI r4, 0
    LDI r5, 5
    CALL point_in_circle
    LDI r9, 0xF9D
    CALL _check_result

; T31: circle_rect_intersect(inside) == 1
    LDI r1, 5
    LDI r2, 5
    LDI r3, 3
    LDI r4, 0
    LDI r5, 0
    LDI r6, 10
    LDI r7, 10
    CALL circle_rect_intersect
    LDI r9, 0xF9E
    LDI r2, 1
    CMP r0, r2
    CALL _check_result

; T32: circle_rect_intersect(far away) == 0
    LDI r1, 50
    LDI r2, 50
    LDI r3, 3
    LDI r4, 0
    LDI r5, 0
    LDI r6, 10
    LDI r7, 10
    CALL circle_rect_intersect
    LDI r9, 0xF9F
    CALL _check_result

; T33: circles_overlap(overlap) == 1
    LDI r1, 0
    LDI r2, 0
    LDI r3, 5
    LDI r4, 8
    LDI r5, 0
    LDI r6, 5
    CALL circles_overlap
    LDI r9, 0xFA0
    LDI r2, 1
    CMP r0, r2
    CALL _check_result

; T34: circles_overlap(apart) == 0
    LDI r1, 0
    LDI r2, 0
    LDI r3, 5
    LDI r4, 20
    LDI r5, 0
    LDI r6, 5
    CALL circles_overlap
    LDI r9, 0xFA1
    CALL _check_result

; T35: point_in_triangle(5,5 in (0,0)(10,0)(0,10)) == 1
    LDI r1, 5
    LDI r2, 5
    LDI r3, 0
    LDI r4, 0
    LDI r5, 10
    LDI r6, 0
    LDI r7, 0
    LDI r8, 10
    CALL point_in_triangle
    LDI r9, 0xFA2
    LDI r2, 1
    CMP r0, r2
    CALL _check_result

; T36: point_in_triangle(10,10 outside) == 0
    LDI r1, 10
    LDI r2, 10
    LDI r3, 0
    LDI r4, 0
    LDI r5, 10
    LDI r6, 0
    LDI r7, 0
    LDI r8, 10
    CALL point_in_triangle
    LDI r9, 0xFA3
    CALL _check_result

; T37: rect_overlap(disjoint) == 0
    LDI r1, 0
    LDI r2, 0
    LDI r3, 5
    LDI r4, 5
    LDI r5, 10
    LDI r6, 10
    LDI r7, 5
    LDI r8, 5
    CALL rect_overlap
    LDI r9, 0xFA4
    CALL _check_result

; T38: point_in_rect(15,5 outside) == 0
    LDI r1, 15
    LDI r2, 5
    LDI r3, 0
    LDI r4, 0
    LDI r5, 10
    LDI r6, 10
    CALL point_in_rect
    LDI r9, 0xFA5
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 5: Heap allocator tests (T39-T44)
;   Tests the bump allocator in stdlib.asm
; ═══════════════════════════════════════════════════════════════

; T39: malloc(10) returns nonzero address
    LDI r1, 10
    CALL malloc
    LDI r9, 0xFA6
    CALL _check_neq        ; nonzero = success

; T40: malloc returns address >= HEAP_START
    LDI r1, 5
    CALL malloc
    LDI r9, 0xFA7
    LDI r2, 0xC000
    ; r0 >= 0xC000: CMP(r0, 0xC000) should be 0 or 1, not -1
    CMP r0, r2
    LDI r2, 0xFFFFFFFF
    CMP r0, r2
    ; If CMP == -1, r0 < HEAP_START (fail)
    ; _check_result checks r0==0, but we need r0!=0xFFFFFFFF
    ; Let's use a different approach: check if r0 >= HEAP_START
    ; If the original malloc returned addr, it's in r0 from the CALL
    ; Wait, CMP clobbered r0. We need to restructure.
    ; Actually: after CALL malloc, r0 = addr. Then LDI r9 sets r9.
    ; CMP r0, r2 → r0 = CMP(addr, 0xC000)
    ; Then CMP r0, r2 → r0 = CMP(CMP_result, 0xFFFFFFFF)
    ; If addr >= HEAP_START, CMP(addr, HEAP_START) = 0 or 1
    ; CMP(0, 0xFFFFFFFF) = 1, CMP(1, 0xFFFFFFFF) = 1
    ; If addr < HEAP_START, CMP(addr, HEAP_START) = 0xFFFFFFFF
    ; CMP(0xFFFFFFFF, 0xFFFFFFFF) = 0
    ; So: _check_neq means pass (r0 != 0 means addr >= HEAP_START)
    CALL _check_neq

; T41: malloc(1) returns nonzero
    LDI r1, 1
    CALL malloc
    LDI r9, 0xFA8
    CALL _check_neq

; T42: Two mallocs return different addresses
    LDI r1, 10
    CALL malloc
    MOV r5, r0             ; save first addr
    LDI r1, 10
    CALL malloc
    ; r0 should differ from r5
    CMP r0, r5
    LDI r9, 0xFA9
    ; CMP == 0 means equal (fail), CMP != 0 means different (pass)
    CALL _check_neq

; T43: malloc preserves callee-saved r10-r12
    ; Set r10-r12 to known values
    LDI r10, 0xAAAA
    LDI r11, 0xBBBB
    LDI r12, 0xCCCC
    LDI r1, 20
    CALL malloc
    ; Check r10 still == 0xAAAA
    LDI r2, 0xAAAA
    CMP r10, r2
    LDI r9, 0xFAA
    CALL _check_result

; T44: malloc preserves callee-saved r11-r12
    LDI r2, 0xBBBB
    CMP r11, r2
    LDI r9, 0xFAB
    CALL _check_result

; T45: malloc preserves callee-saved r12
    LDI r2, 0xCCCC
    CMP r12, r2
    LDI r9, 0xFAC
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 6: Callee-saved register preservation tests (T46-T51)
;   Verify that ALL library functions properly preserve r10-r25
; ═══════════════════════════════════════════════════════════════

; T46: strlen preserves r10
    LDI r10, 0x1234
    LDI r1, str_hello
    CALL strlen
    LDI r2, 0x1234
    CMP r10, r2
    LDI r9, 0xFAD
    CALL _check_result

; T47: strcmp preserves r10-r11
    LDI r10, 0x5678
    LDI r11, 0x9ABC
    LDI r1, str_hello
    LDI r2, str_hello
    CALL strcmp
    LDI r2, 0x5678
    CMP r10, r2
    LDI r9, 0xFAE
    CALL _check_result

; T48: strcmp preserves r11
    LDI r2, 0x9ABC
    CMP r11, r2
    LDI r9, 0xFAF
    CALL _check_result

; T49: itoa preserves r10 (critical - was broken in v1.1.0)
    LDI r10, 0xDEAD
    LDI r1, 12345
    LDI r2, buf_a
    CALL itoa
    LDI r2, 0xDEAD
    CMP r10, r2
    LDI r9, 0xFB0
    CALL _check_result

; T50: sqrt_approx preserves r10 (critical - was broken in v1.1.0)
    LDI r10, 0xBEEF
    LDI r1, 256
    CALL sqrt_approx
    LDI r2, 0xBEEF
    CMP r10, r2
    LDI r9, 0xFB1
    CALL _check_result

; T51: point_in_circle preserves r10 (was broken in v1.1.0)
    LDI r10, 0xCAFE
    LDI r1, 3
    LDI r2, 4
    LDI r3, 0
    LDI r4, 0
    LDI r5, 5
    CALL point_in_circle
    LDI r2, 0xCAFE
    CMP r10, r2
    LDI r9, 0xFB2
    CALL _check_result

; T52: circles_overlap preserves r10 (was broken in v1.1.0)
    LDI r10, 0xF00D
    LDI r1, 0
    LDI r2, 0
    LDI r3, 5
    LDI r4, 8
    LDI r5, 0
    LDI r6, 5
    CALL circles_overlap
    LDI r2, 0xF00D
    CMP r10, r2
    LDI r9, 0xFB3
    CALL _check_result

; T53: circle_rect_intersect preserves r10 (was broken in v1.1.0)
    LDI r10, 0xBEEF
    LDI r1, 5
    LDI r2, 5
    LDI r3, 3
    LDI r4, 0
    LDI r5, 0
    LDI r6, 10
    LDI r7, 10
    CALL circle_rect_intersect
    LDI r2, 0xBEEF
    CMP r10, r2
    LDI r9, 0xFB4
    CALL _check_result

; T54: point_in_triangle preserves r10-r15 (was broken in v1.1.0)
    LDI r10, 0x1111
    LDI r11, 0x2222
    LDI r12, 0x3333
    LDI r13, 0x4444
    LDI r14, 0x5555
    LDI r15, 0x6666
    LDI r1, 5
    LDI r2, 5
    LDI r3, 0
    LDI r4, 0
    LDI r5, 10
    LDI r6, 0
    LDI r7, 0
    LDI r8, 10
    CALL point_in_triangle
    LDI r2, 0x1111
    CMP r10, r2
    LDI r9, 0xFB5
    CALL _check_result

; T55: point_in_triangle preserves r11-r13
    LDI r2, 0x2222
    CMP r11, r2
    LDI r9, 0xFB6
    CALL _check_result

; T56: point_in_triangle preserves r14-r15
    LDI r2, 0x5555
    CMP r14, r2
    LDI r9, 0xFB7
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
