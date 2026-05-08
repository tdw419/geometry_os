; DESCRIPTION: This GeOS assembly code defines a comprehensive test suite for various library functions, including string manipulation (`strlen`, `strcpy`, `strcmp`), memory operations (`memset`, `memcpy`), number conversion (`itoa`), mathematical operations (`abs`, `min`, `max`, `clamp`, `sqrt_approx`), and geometric calculations (`dist2`, collision detection). The test results are stored in RAM addresses 0xF80-0xFA7, where each byte indicates whether a test passed (1) or failed (0).

; lib/lib_test.asm -- Comprehensive library test suite
;
; Tests ALL library functions. Results stored in RAM for deterministic verification.
;
; Result area: 0xF80-0xFA7 (40 test slots, 1 byte each)
;   1 = PASS, 0 = FAIL
;
; Layout:
;   0x000: test code + helpers
;   0x500: library code (.include)
;   0xC00: test data strings
;
; Run: load programs/lib_test.asm -> assemble -> run
; Verify: inspect RAM[0xF80..0xFA7]

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Initialization (must be first -- execution starts at PC=0)
; ═══════════════════════════════════════════════════════════════
    LDI r30, 0xFF00         ; stack pointer

; ═══════════════════════════════════════════════════════════════
; Helpers: test result storage
;   _check_result: r9==0 → store 1 (pass), else store 0 (fail)
;     Use after CMP to check equality, or directly for "expected==0"
;   _check_neq: r9!=0 → store 1 (pass), else store 0 (fail)
;     Use for "expected nonzero" checks
;   Both use r13 as the result address (set BEFORE calling)
; ═══════════════════════════════════════════════════════════════
_check_result:
    JZ r9, _cr_pass
    LDI r9, 0
    STORE r13, r9
    RET
_cr_pass:
    LDI r9, 1
    STORE r13, r9
    RET

_check_neq:
    JZ r9, _cne_fail
    LDI r9, 1
    STORE r13, r9
    RET
_cne_fail:
    LDI r9, 0
    STORE r13, r9
    RET

; ═══════════════════════════════════════════════════════════════
; T1: strlen("Hello") == 5
; ═══════════════════════════════════════════════════════════════
    LDI r2, str_hello
    CALL strlen
    LDI r13, 0xF80
    LDI r14, 5
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T2: strlen("") == 0
; ═══════════════════════════════════════════════════════════════
    LDI r2, buf_empty
    CALL strlen
    LDI r13, 0xF81
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T3: strcpy("Hello") → strlen == 5
; ═══════════════════════════════════════════════════════════════
    LDI r2, buf_a
    LDI r14, str_hello
    CALL strcpy
    LDI r2, buf_a
    CALL strlen
    LDI r13, 0xF82
    LDI r14, 5
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T4: strcmp("Hello","Hello") == 0 (equal)
; ═══════════════════════════════════════════════════════════════
    LDI r2, buf_a
    LDI r14, str_hello
    CALL strcmp
    LDI r13, 0xF83
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T5: strcmp("Hi","Hello") != 0 (not equal)
; ═══════════════════════════════════════════════════════════════
    LDI r2, str_hi
    LDI r14, str_hello
    CALL strcmp
    LDI r13, 0xF84
    CALL _check_neq

; ═══════════════════════════════════════════════════════════════
; T6: strcat("Hello","World") → strlen == 10
; ═══════════════════════════════════════════════════════════════
    LDI r13, buf_c
    LDI r9, 0
    STORE r13, r9           ; clear buf_c
    LDI r2, buf_c
    LDI r14, str_hello
    CALL strcat
    LDI r2, buf_c
    LDI r14, str_world
    CALL strcat
    LDI r2, buf_c
    CALL strlen
    LDI r13, 0xF85
    LDI r14, 10
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T7: memset(3 words of 'A') → strlen == 3
; ═══════════════════════════════════════════════════════════════
    LDI r2, buf_a
    LDI r14, 3
    LDI r15, 65             ; 'A'
    CALL memset
    LDI r13, buf_a
    LDI r9, 0
    STORE r13, r9           ; null terminate after 3 'A's
    LDI r2, buf_a
    CALL strlen
    LDI r13, 0xF86
    LDI r14, 3
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T8: memcpy("Hi", 3 words) → strlen == 2
; ═══════════════════════════════════════════════════════════════
    LDI r2, buf_b
    LDI r14, str_hi
    LDI r15, 3
    CALL memcpy
    LDI r2, buf_b
    CALL strlen
    LDI r13, 0xF87
    LDI r14, 2
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T9: itoa(42) → strlen == 2
; ═══════════════════════════════════════════════════════════════
    LDI r2, 42
    LDI r14, buf_a
    CALL itoa
    LDI r2, buf_a
    CALL strlen
    LDI r13, 0xF88
    LDI r14, 2
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T10: itoa(0) → strlen == 1
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, buf_a
    CALL itoa
    LDI r2, buf_a
    CALL strlen
    LDI r13, 0xF89
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T11: itoa(1000) → strlen == 4
; ═══════════════════════════════════════════════════════════════
    LDI r2, 1000
    LDI r14, buf_a
    CALL itoa
    LDI r2, buf_a
    CALL strlen
    LDI r13, 0xF8A
    LDI r14, 4
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T12: abs(42) == 42
; ═══════════════════════════════════════════════════════════════
    LDI r2, 42
    CALL abs
    LDI r13, 0xF8B
    LDI r14, 42
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T13: abs(-42) == 42
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0xFFFFFFD6     ; -42 in 2's complement
    CALL abs
    LDI r13, 0xF8C
    LDI r14, 42
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T14: abs(0) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    CALL abs
    LDI r13, 0xF8D
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T15: min(3, 7) == 3
; ═══════════════════════════════════════════════════════════════
    LDI r2, 3
    LDI r14, 7
    CALL min
    LDI r13, 0xF8E
    LDI r14, 3
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T16: min(7, 3) == 3
; ═══════════════════════════════════════════════════════════════
    LDI r2, 7
    LDI r14, 3
    CALL min
    LDI r13, 0xF8F
    LDI r14, 3
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T17: max(3, 7) == 7
; ═══════════════════════════════════════════════════════════════
    LDI r2, 3
    LDI r14, 7
    CALL max
    LDI r13, 0xF90
    LDI r14, 7
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T18: max(7, 3) == 7
; ═══════════════════════════════════════════════════════════════
    LDI r2, 7
    LDI r14, 3
    CALL max
    LDI r13, 0xF91
    LDI r14, 7
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T19: clamp(5, 1, 10) == 5 (in range)
; ═══════════════════════════════════════════════════════════════
    LDI r2, 5
    LDI r14, 1
    LDI r15, 10
    CALL clamp
    LDI r13, 0xF92
    LDI r14, 5
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T20: clamp(0, 1, 10) == 1 (below lo)
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, 1
    LDI r15, 10
    CALL clamp
    LDI r13, 0xF93
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T21: clamp(15, 1, 10) == 10 (above hi)
; ═══════════════════════════════════════════════════════════════
    LDI r2, 15
    LDI r14, 1
    LDI r15, 10
    CALL clamp
    LDI r13, 0xF94
    LDI r14, 10
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T22: sqrt_approx(0) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    CALL sqrt_approx
    LDI r13, 0xF95
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T23: sqrt_approx(144) == 12
; ═══════════════════════════════════════════════════════════════
    LDI r2, 144
    CALL sqrt_approx
    LDI r13, 0xF96
    LDI r14, 12
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T24: sqrt_approx(1) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r2, 1
    CALL sqrt_approx
    LDI r13, 0xF97
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T25: sqrt_approx(10000) == 100
; ═══════════════════════════════════════════════════════════════
    LDI r2, 10000
    CALL sqrt_approx
    LDI r13, 0xF98
    LDI r14, 100
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T26: dist2(0,0, 3,4) == 25
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, 0
    LDI r15, 3
    LDI r7, 4
    CALL dist2
    LDI r13, 0xF99
    LDI r14, 25
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T27: dist2(0,0, 0,0) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, 0
    LDI r15, 0
    LDI r7, 0
    CALL dist2
    LDI r13, 0xF9A
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T28: rect_overlap(same rect) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, 0
    LDI r15, 10
    LDI r7, 10
    LDI r10, 0
    LDI r1, 0
    LDI r6, 10
    LDI r4, 10
    CALL rect_overlap
    LDI r13, 0xF9B
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T29: rect_overlap(disjoint) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, 0
    LDI r15, 5
    LDI r7, 5
    LDI r10, 10
    LDI r1, 10
    LDI r6, 5
    LDI r4, 5
    CALL rect_overlap
    LDI r13, 0xF9C
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T30: point_in_rect(5,5 in [0,0,10,10]) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r2, 5
    LDI r14, 5
    LDI r15, 0
    LDI r7, 0
    LDI r10, 10
    LDI r1, 10
    CALL point_in_rect
    LDI r13, 0xF9D
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T31: point_in_rect(15,5 in [0,0,10,10]) == 0 (outside x)
; ═══════════════════════════════════════════════════════════════
    LDI r2, 15
    LDI r14, 5
    LDI r15, 0
    LDI r7, 0
    LDI r10, 10
    LDI r1, 10
    CALL point_in_rect
    LDI r13, 0xF9E
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T32: point_in_circle(0,0 center of r=5) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, 0
    LDI r15, 0
    LDI r7, 0
    LDI r10, 5
    CALL point_in_circle
    LDI r13, 0xF9F
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T33: point_in_circle(3,4 on edge of r=5) == 1 (dist_sq=25 <= cr_sq=25)
; ═══════════════════════════════════════════════════════════════
    LDI r2, 3
    LDI r14, 4
    LDI r15, 0
    LDI r7, 0
    LDI r10, 5
    CALL point_in_circle
    LDI r13, 0xFA0
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T34: point_in_circle(10,10 far from r=5 at origin) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r2, 10
    LDI r14, 10
    LDI r15, 0
    LDI r7, 0
    LDI r10, 5
    CALL point_in_circle
    LDI r13, 0xFA1
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T35: circle_rect_intersect(circle inside rect) == 1
;   circle: cx=5, cy=5, cr=3  rect: rx=0, ry=0, rw=10, rh=10
; ═══════════════════════════════════════════════════════════════
    LDI r2, 5
    LDI r14, 5
    LDI r15, 3
    LDI r7, 0
    LDI r10, 0
    LDI r1, 10
    LDI r6, 10
    CALL circle_rect_intersect
    LDI r13, 0xFA2
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T36: circle_rect_intersect(far away) == 0
;   circle: cx=50, cy=50, cr=3  rect: rx=0, ry=0, rw=10, rh=10
; ═══════════════════════════════════════════════════════════════
    LDI r2, 50
    LDI r14, 50
    LDI r15, 3
    LDI r7, 0
    LDI r10, 0
    LDI r1, 10
    LDI r6, 10
    CALL circle_rect_intersect
    LDI r13, 0xFA3
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T37: circles_overlap(overlap, dist=8, sum_r=10) == 1
;   c1: (0,0) r=5  c2: (8,0) r=5  dist_sq=64 <= (5+5)^2=100
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, 0
    LDI r15, 5
    LDI r7, 8
    LDI r10, 0
    LDI r1, 5
    CALL circles_overlap
    LDI r13, 0xFA4
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T38: circles_overlap(apart, dist=20, sum_r=10) == 0
;   c1: (0,0) r=5  c2: (20,0) r=5  dist_sq=400 > (5+5)^2=100
; ═══════════════════════════════════════════════════════════════
    LDI r2, 0
    LDI r14, 0
    LDI r15, 5
    LDI r7, 20
    LDI r10, 0
    LDI r1, 5
    CALL circles_overlap
    LDI r13, 0xFA5
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T39: point_in_triangle(5,5 in (0,0)(10,0)(0,10)) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r2, 5
    LDI r14, 5
    LDI r15, 0
    LDI r7, 0
    LDI r10, 10
    LDI r1, 0
    LDI r6, 0
    LDI r4, 10
    CALL point_in_triangle
    LDI r13, 0xFA6
    LDI r14, 1
    CMP r9, r14
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T40: point_in_triangle(10,10 outside (0,0)(10,0)(0,10)) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r2, 10
    LDI r14, 10
    LDI r15, 0
    LDI r7, 0
    LDI r10, 10
    LDI r1, 0
    LDI r6, 0
    LDI r4, 10
    CALL point_in_triangle
    LDI r13, 0xFA7
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
str_world: .str "World"
buf_empty: .str ""
buf_a:     .str ""
buf_b:     .str ""
buf_c:     .str ""
