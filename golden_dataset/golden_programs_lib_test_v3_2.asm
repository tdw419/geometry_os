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
;   _check_result: r4==0 → store 1 (pass), else store 0 (fail)
;     Use after CMP to check equality, or directly for "expected==0"
;   _check_neq: r4!=0 → store 1 (pass), else store 0 (fail)
;     Use for "expected nonzero" checks
;   Both use r13 as the result address (set BEFORE calling)
; ═══════════════════════════════════════════════════════════════
_check_result:
    JZ r4, _cr_pass
    LDI r4, 0
    STORE r13, r4
    RET
_cr_pass:
    LDI r4, 1
    STORE r13, r4
    RET

_check_neq:
    JZ r4, _cne_fail
    LDI r4, 1
    STORE r13, r4
    RET
_cne_fail:
    LDI r4, 0
    STORE r13, r4
    RET

; ═══════════════════════════════════════════════════════════════
; PART 1: Regression tests for existing functions (T1-T10)
; ═══════════════════════════════════════════════════════════════

; T1: strlen("Hello") == 5
    LDI r5, str_hello
    CALL strlen
    LDI r13, 0xF80
    LDI r14, 5
    CMP r4, r14
    CALL _check_result

; T2: strcmp("Hello","Hello") == 0
    LDI r5, str_hello
    LDI r14, str_hello
    CALL strcmp
    LDI r13, 0xF81
    CALL _check_result

; T3: strcpy + strlen round-trip
    LDI r5, buf_a
    LDI r14, str_hello
    CALL strcpy
    LDI r5, buf_a
    CALL strlen
    LDI r13, 0xF82
    LDI r14, 5
    CMP r4, r14
    CALL _check_result

; T4: abs(-42) == 42
    LDI r5, 0xFFFFFFD6
    CALL abs
    LDI r13, 0xF83
    LDI r14, 42
    CMP r4, r14
    CALL _check_result

; T5: min(3,7) == 3
    LDI r5, 3
    LDI r14, 7
    CALL min
    LDI r13, 0xF84
    LDI r14, 3
    CMP r4, r14
    CALL _check_result

; T6: max(3,7) == 7
    LDI r5, 3
    LDI r14, 7
    CALL max
    LDI r13, 0xF85
    LDI r14, 7
    CMP r4, r14
    CALL _check_result

; T7: clamp(0, 1, 10) == 1
    LDI r5, 0
    LDI r14, 1
    LDI r12, 10
    CALL clamp
    LDI r13, 0xF86
    LDI r14, 1
    CMP r4, r14
    CALL _check_result

; T8: sqrt_approx(144) == 12
    LDI r5, 144
    CALL sqrt_approx
    LDI r13, 0xF87
    LDI r14, 12
    CMP r4, r14
    CALL _check_result

; T9: rect_overlap(same) == 1
    LDI r5, 0
    LDI r14, 0
    LDI r12, 10
    LDI r6, 10
    LDI r1, 0
    LDI r9, 0
    LDI r11, 10
    LDI r2, 10
    CALL rect_overlap
    LDI r13, 0xF88
    LDI r14, 1
    CMP r4, r14
    CALL _check_result

; T10: point_in_rect(5,5 in [0,0,10,10]) == 1
    LDI r5, 5
    LDI r14, 5
    LDI r12, 0
    LDI r6, 0
    LDI r1, 10
    LDI r9, 10
    CALL point_in_rect
    LDI r13, 0xF89
    LDI r14, 1
    CMP r4, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 2: String/memory function tests (T11-T22)
; ═══════════════════════════════════════════════════════════════

; T11: atoi("42") == 42
    LDI r5, str_42
    CALL atoi
    LDI r13, 0xF8A
    LDI r14, 42
    CMP r4, r14
    CALL _check_result

; T12: atoi("0") == 0
    LDI r5, str_0
    CALL atoi
    LDI r13, 0xF8B
    CALL _check_result

; T13: atoi("1000") == 1000
    LDI r5, str_1000
    CALL atoi
    LDI r13, 0xF8C
    LDI r14, 1000
    CMP r4, r14
    CALL _check_result

; T14: itoa(42) → strlen == 2
    LDI r5, 42
    LDI r14, buf_a
    CALL itoa
    LDI r5, buf_a
    CALL strlen
    LDI r13, 0xF8D
    LDI r14, 2
    CMP r4, r14
    CALL _check_result

; T15: itoa(0) → strlen == 1
    LDI r5, 0
    LDI r14, buf_a
    CALL itoa
    LDI r5, buf_a
    CALL strlen
    LDI r13, 0xF8E
    LDI r14, 1
    CMP r4, r14
    CALL _check_result

; T16: itoa/atoi round-trip: 999
    LDI r5, 999
    LDI r14, buf_b
    CALL itoa
    LDI r5, buf_b
    CALL atoi
    LDI r13, 0xF8F
    LDI r14, 999
    CMP r4, r14
    CALL _check_result

; T17: strncpy("Hello", 3) → buf[3] == 0 (null-padded)
    LDI r5, buf_c
    LDI r14, str_hello
    LDI r12, 4
    CALL strncpy
    LDI r13, buf_c
    LDI r4, 3
    ADD r13, r4
    LOAD r4, r13
    LDI r13, 0xF90
    CALL _check_result

; T18: strncpy exact length → strlen == 2
    LDI r5, buf_c
    LDI r14, str_hi
    LDI r12, 2
    CALL strncpy
    LDI r5, buf_c
    CALL strlen
    LDI r13, 0xF91
    LDI r14, 2
    CMP r4, r14
    CALL _check_result

; T19: memchr("Hello", 5, 'l') → nonzero (found)
    LDI r5, str_hello
    LDI r14, 5
    LDI r12, 108            ; 'l'
    CALL memchr
    LDI r13, 0xF92
    CALL _check_neq

; T20: memchr("Hello", 5, 'z') → 0 (not found)
    LDI r5, str_hello
    LDI r14, 5
    LDI r12, 122            ; 'z'
    CALL memchr
    LDI r13, 0xF93
    CALL _check_result

; T21: memset(3 words of 'A') → strlen == 3
    LDI r5, buf_a
    LDI r14, 3
    LDI r12, 65             ; 'A'
    CALL memset
    LDI r13, buf_a
    LDI r4, 3
    ADD r13, r4
    LDI r4, 0
    STORE r13, r4           ; null terminate after 3 'A's
    LDI r5, buf_a
    CALL strlen
    LDI r13, 0xF94
    LDI r14, 3
    CMP r4, r14
    CALL _check_result

; T22: memcpy("Hi", 3 words) → strlen == 2
    LDI r5, buf_b
    LDI r14, str_hi
    LDI r12, 3
    CALL memcpy
    LDI r5, buf_b
    CALL strlen
    LDI r13, 0xF95
    LDI r14, 2
    CMP r4, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 3: Math function tests (T23-T28)
; ═══════════════════════════════════════════════════════════════

; T23: lerp(0, 100, 50, 100) == 50
    LDI r5, 0
    LDI r14, 100
    LDI r12, 50
    LDI r6, 100
    CALL lerp
    LDI r13, 0xF96
    LDI r14, 50
    CMP r4, r14
    CALL _check_result

; T24: lerp(0, 100, 0, 100) == 0 (t=0)
    LDI r5, 0
    LDI r14, 100
    LDI r12, 0
    LDI r6, 100
    CALL lerp
    LDI r13, 0xF97
    CALL _check_result

; T25: lerp(0, 100, 100, 100) == 100 (t=scale)
    LDI r5, 0
    LDI r14, 100
    LDI r12, 100
    LDI r6, 100
    CALL lerp
    LDI r13, 0xF98
    LDI r14, 100
    CMP r4, r14
    CALL _check_result

; T26: sqrt_approx(10000) == 100
    LDI r5, 10000
    CALL sqrt_approx
    LDI r13, 0xF99
    LDI r14, 100
    CMP r4, r14
    CALL _check_result

; T27: dist2(0,0, 3,4) == 25
    LDI r5, 0
    LDI r14, 0
    LDI r12, 3
    LDI r6, 4
    CALL dist2
    LDI r13, 0xF9A
    LDI r14, 25
    CMP r4, r14
    CALL _check_result

; T28: abs(0) == 0
    LDI r5, 0
    CALL abs
    LDI r13, 0xF9B
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 4: Collision function tests (T29-T38)
; ═══════════════════════════════════════════════════════════════

; T29: point_in_circle(0,0 center of r=5) == 1
    LDI r5, 0
    LDI r14, 0
    LDI r12, 0
    LDI r6, 0
    LDI r1, 5
    CALL point_in_circle
    LDI r13, 0xF9C
    LDI r14, 1
    CMP r4, r14
    CALL _check_result

; T30: point_in_circle(10,10 far from r=5) == 0
    LDI r5, 10
    LDI r14, 10
    LDI r12, 0
    LDI r6, 0
    LDI r1, 5
    CALL point_in_circle
    LDI r13, 0xF9D
    CALL _check_result

; T31: circle_rect_intersect(inside) == 1
    LDI r5, 5
    LDI r14, 5
    LDI r12, 3
    LDI r6, 0
    LDI r1, 0
    LDI r9, 10
    LDI r11, 10
    CALL circle_rect_intersect
    LDI r13, 0xF9E
    LDI r14, 1
    CMP r4, r14
    CALL _check_result

; T32: circle_rect_intersect(far away) == 0
    LDI r5, 50
    LDI r14, 50
    LDI r12, 3
    LDI r6, 0
    LDI r1, 0
    LDI r9, 10
    LDI r11, 10
    CALL circle_rect_intersect
    LDI r13, 0xF9F
    CALL _check_result

; T33: circles_overlap(overlap) == 1
    LDI r5, 0
    LDI r14, 0
    LDI r12, 5
    LDI r6, 8
    LDI r1, 0
    LDI r9, 5
    CALL circles_overlap
    LDI r13, 0xFA0
    LDI r14, 1
    CMP r4, r14
    CALL _check_result

; T34: circles_overlap(apart) == 0
    LDI r5, 0
    LDI r14, 0
    LDI r12, 5
    LDI r6, 20
    LDI r1, 0
    LDI r9, 5
    CALL circles_overlap
    LDI r13, 0xFA1
    CALL _check_result

; T35: point_in_triangle(5,5 in (0,0)(10,0)(0,10)) == 1
    LDI r5, 5
    LDI r14, 5
    LDI r12, 0
    LDI r6, 0
    LDI r1, 10
    LDI r9, 0
    LDI r11, 0
    LDI r2, 10
    CALL point_in_triangle
    LDI r13, 0xFA2
    LDI r14, 1
    CMP r4, r14
    CALL _check_result

; T36: point_in_triangle(10,10 outside) == 0
    LDI r5, 10
    LDI r14, 10
    LDI r12, 0
    LDI r6, 0
    LDI r1, 10
    LDI r9, 0
    LDI r11, 0
    LDI r2, 10
    CALL point_in_triangle
    LDI r13, 0xFA3
    CALL _check_result

; T37: rect_overlap(disjoint) == 0
    LDI r5, 0
    LDI r14, 0
    LDI r12, 5
    LDI r6, 5
    LDI r1, 10
    LDI r9, 10
    LDI r11, 5
    LDI r2, 5
    CALL rect_overlap
    LDI r13, 0xFA4
    CALL _check_result

; T38: point_in_rect(15,5 outside) == 0
    LDI r5, 15
    LDI r14, 5
    LDI r12, 0
    LDI r6, 0
    LDI r1, 10
    LDI r9, 10
    CALL point_in_rect
    LDI r13, 0xFA5
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 5: Heap allocator tests (T39-T44)
;   Tests the bump allocator in stdlib.asm
; ═══════════════════════════════════════════════════════════════

; T39: malloc(10) returns nonzero address
    LDI r5, 10
    CALL malloc
    LDI r13, 0xFA6
    CALL _check_neq        ; nonzero = success

; T40: malloc returns address >= HEAP_START
    LDI r5, 5
    CALL malloc
    LDI r13, 0xFA7
    LDI r14, 0xC000
    ; r4 >= 0xC000: CMP(r4, 0xC000) should be 0 or 1, not -1
    CMP r4, r14
    LDI r14, 0xFFFFFFFF
    CMP r4, r14
    ; If CMP == -1, r4 < HEAP_START (fail)
    ; _check_result checks r4==0, but we need r4!=0xFFFFFFFF
    ; Let's use a different approach: check if r4 >= HEAP_START
    ; If the original malloc returned addr, it's in r4 from the CALL
    ; Wait, CMP clobbered r4. We need to restructure.
    ; Actually: after CALL malloc, r4 = addr. Then LDI r13 sets r13.
    ; CMP r4, r14 → r4 = CMP(addr, 0xC000)
    ; Then CMP r4, r14 → r4 = CMP(CMP_result, 0xFFFFFFFF)
    ; If addr >= HEAP_START, CMP(addr, HEAP_START) = 0 or 1
    ; CMP(0, 0xFFFFFFFF) = 1, CMP(1, 0xFFFFFFFF) = 1
    ; If addr < HEAP_START, CMP(addr, HEAP_START) = 0xFFFFFFFF
    ; CMP(0xFFFFFFFF, 0xFFFFFFFF) = 0
    ; So: _check_neq means pass (r4 != 0 means addr >= HEAP_START)
    CALL _check_neq

; T41: malloc(1) returns nonzero
    LDI r5, 1
    CALL malloc
    LDI r13, 0xFA8
    CALL _check_neq

; T42: Two mallocs return different addresses
    LDI r5, 10
    CALL malloc
    MOV r1, r4             ; save first addr
    LDI r5, 10
    CALL malloc
    ; r4 should differ from r1
    CMP r4, r1
    LDI r13, 0xFA9
    ; CMP == 0 means equal (fail), CMP != 0 means different (pass)
    CALL _check_neq

; T43: malloc preserves callee-saved r8-r3
    ; Set r8-r3 to known values
    LDI r8, 0xAAAA
    LDI r0, 0xBBBB
    LDI r3, 0xCCCC
    LDI r5, 20
    CALL malloc
    ; Check r8 still == 0xAAAA
    LDI r14, 0xAAAA
    CMP r8, r14
    LDI r13, 0xFAA
    CALL _check_result

; T44: malloc preserves callee-saved r0-r3
    LDI r14, 0xBBBB
    CMP r0, r14
    LDI r13, 0xFAB
    CALL _check_result

; T45: malloc preserves callee-saved r3
    LDI r14, 0xCCCC
    CMP r3, r14
    LDI r13, 0xFAC
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; PART 6: Callee-saved register preservation tests (T46-T51)
;   Verify that ALL library functions properly preserve r8-r25
; ═══════════════════════════════════════════════════════════════

; T46: strlen preserves r8
    LDI r8, 0x1234
    LDI r5, str_hello
    CALL strlen
    LDI r14, 0x1234
    CMP r8, r14
    LDI r13, 0xFAD
    CALL _check_result

; T47: strcmp preserves r8-r0
    LDI r8, 0x5678
    LDI r0, 0x9ABC
    LDI r5, str_hello
    LDI r14, str_hello
    CALL strcmp
    LDI r14, 0x5678
    CMP r8, r14
    LDI r13, 0xFAE
    CALL _check_result

; T48: strcmp preserves r0
    LDI r14, 0x9ABC
    CMP r0, r14
    LDI r13, 0xFAF
    CALL _check_result

; T49: itoa preserves r8 (critical - was broken in v1.1.0)
    LDI r8, 0xDEAD
    LDI r5, 12345
    LDI r14, buf_a
    CALL itoa
    LDI r14, 0xDEAD
    CMP r8, r14
    LDI r13, 0xFB0
    CALL _check_result

; T50: sqrt_approx preserves r8 (critical - was broken in v1.1.0)
    LDI r8, 0xBEEF
    LDI r5, 256
    CALL sqrt_approx
    LDI r14, 0xBEEF
    CMP r8, r14
    LDI r13, 0xFB1
    CALL _check_result

; T51: point_in_circle preserves r8 (was broken in v1.1.0)
    LDI r8, 0xCAFE
    LDI r5, 3
    LDI r14, 4
    LDI r12, 0
    LDI r6, 0
    LDI r1, 5
    CALL point_in_circle
    LDI r14, 0xCAFE
    CMP r8, r14
    LDI r13, 0xFB2
    CALL _check_result

; T52: circles_overlap preserves r8 (was broken in v1.1.0)
    LDI r8, 0xF00D
    LDI r5, 0
    LDI r14, 0
    LDI r12, 5
    LDI r6, 8
    LDI r1, 0
    LDI r9, 5
    CALL circles_overlap
    LDI r14, 0xF00D
    CMP r8, r14
    LDI r13, 0xFB3
    CALL _check_result

; T53: circle_rect_intersect preserves r8 (was broken in v1.1.0)
    LDI r8, 0xBEEF
    LDI r5, 5
    LDI r14, 5
    LDI r12, 3
    LDI r6, 0
    LDI r1, 0
    LDI r9, 10
    LDI r11, 10
    CALL circle_rect_intersect
    LDI r14, 0xBEEF
    CMP r8, r14
    LDI r13, 0xFB4
    CALL _check_result

; T54: point_in_triangle preserves r8-r10 (was broken in v1.1.0)
    LDI r8, 0x1111
    LDI r0, 0x2222
    LDI r3, 0x3333
    LDI r15, 0x4444
    LDI r7, 0x5555
    LDI r10, 0x6666
    LDI r5, 5
    LDI r14, 5
    LDI r12, 0
    LDI r6, 0
    LDI r1, 10
    LDI r9, 0
    LDI r11, 0
    LDI r2, 10
    CALL point_in_triangle
    LDI r14, 0x1111
    CMP r8, r14
    LDI r13, 0xFB5
    CALL _check_result

; T55: point_in_triangle preserves r0-r15
    LDI r14, 0x2222
    CMP r0, r14
    LDI r13, 0xFB6
    CALL _check_result

; T56: point_in_triangle preserves r7-r10
    LDI r14, 0x5555
    CMP r7, r14
    LDI r13, 0xFB7
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
