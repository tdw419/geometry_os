; DESCRIPTION: A red object centered at the screen with fixed size.

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
;   _check_result: r3==0 → store 1 (pass), else store 0 (fail)
;     Use after CMP to check equality, or directly for "expected==0"
;   _check_neq: r3!=0 → store 1 (pass), else store 0 (fail)
;     Use for "expected nonzero" checks
;   Both use r7 as the result address (set BEFORE calling)
; ═══════════════════════════════════════════════════════════════
_check_result:
    JZ r3, _cr_pass
    LDI r3, 0
    STORE r7, r3
    RET
_cr_pass:
    LDI r3, 1
    STORE r7, r3
    RET

_check_neq:
    JZ r3, _cne_fail
    LDI r3, 1
    STORE r7, r3
    RET
_cne_fail:
    LDI r3, 0
    STORE r7, r3
    RET

; ═══════════════════════════════════════════════════════════════
; T1: strlen("Hello") == 5
; ═══════════════════════════════════════════════════════════════
    LDI r8, str_hello
    CALL strlen
    LDI r7, 0xF80
    LDI r13, 5
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T2: strlen("") == 0
; ═══════════════════════════════════════════════════════════════
    LDI r8, buf_empty
    CALL strlen
    LDI r7, 0xF81
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T3: strcpy("Hello") → strlen == 5
; ═══════════════════════════════════════════════════════════════
    LDI r8, buf_a
    LDI r13, str_hello
    CALL strcpy
    LDI r8, buf_a
    CALL strlen
    LDI r7, 0xF82
    LDI r13, 5
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T4: strcmp("Hello","Hello") == 0 (equal)
; ═══════════════════════════════════════════════════════════════
    LDI r8, buf_a
    LDI r13, str_hello
    CALL strcmp
    LDI r7, 0xF83
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T5: strcmp("Hi","Hello") != 0 (not equal)
; ═══════════════════════════════════════════════════════════════
    LDI r8, str_hi
    LDI r13, str_hello
    CALL strcmp
    LDI r7, 0xF84
    CALL _check_neq

; ═══════════════════════════════════════════════════════════════
; T6: strcat("Hello","World") → strlen == 10
; ═══════════════════════════════════════════════════════════════
    LDI r7, buf_c
    LDI r3, 0
    STORE r7, r3           ; clear buf_c
    LDI r8, buf_c
    LDI r13, str_hello
    CALL strcat
    LDI r8, buf_c
    LDI r13, str_world
    CALL strcat
    LDI r8, buf_c
    CALL strlen
    LDI r7, 0xF85
    LDI r13, 10
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T7: memset(3 words of 'A') → strlen == 3
; ═══════════════════════════════════════════════════════════════
    LDI r8, buf_a
    LDI r13, 3
    LDI r6, 65             ; 'A'
    CALL memset
    LDI r7, buf_a
    LDI r3, 0
    STORE r7, r3           ; null terminate after 3 'A's
    LDI r8, buf_a
    CALL strlen
    LDI r7, 0xF86
    LDI r13, 3
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T8: memcpy("Hi", 3 words) → strlen == 2
; ═══════════════════════════════════════════════════════════════
    LDI r8, buf_b
    LDI r13, str_hi
    LDI r6, 3
    CALL memcpy
    LDI r8, buf_b
    CALL strlen
    LDI r7, 0xF87
    LDI r13, 2
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T9: itoa(42) → strlen == 2
; ═══════════════════════════════════════════════════════════════
    LDI r8, 42
    LDI r13, buf_a
    CALL itoa
    LDI r8, buf_a
    CALL strlen
    LDI r7, 0xF88
    LDI r13, 2
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T10: itoa(0) → strlen == 1
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, buf_a
    CALL itoa
    LDI r8, buf_a
    CALL strlen
    LDI r7, 0xF89
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T11: itoa(1000) → strlen == 4
; ═══════════════════════════════════════════════════════════════
    LDI r8, 1000
    LDI r13, buf_a
    CALL itoa
    LDI r8, buf_a
    CALL strlen
    LDI r7, 0xF8A
    LDI r13, 4
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T12: abs(42) == 42
; ═══════════════════════════════════════════════════════════════
    LDI r8, 42
    CALL abs
    LDI r7, 0xF8B
    LDI r13, 42
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T13: abs(-42) == 42
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0xFFFFFFD6     ; -42 in 2's complement
    CALL abs
    LDI r7, 0xF8C
    LDI r13, 42
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T14: abs(0) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    CALL abs
    LDI r7, 0xF8D
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T15: min(3, 7) == 3
; ═══════════════════════════════════════════════════════════════
    LDI r8, 3
    LDI r13, 7
    CALL min
    LDI r7, 0xF8E
    LDI r13, 3
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T16: min(7, 3) == 3
; ═══════════════════════════════════════════════════════════════
    LDI r8, 7
    LDI r13, 3
    CALL min
    LDI r7, 0xF8F
    LDI r13, 3
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T17: max(3, 7) == 7
; ═══════════════════════════════════════════════════════════════
    LDI r8, 3
    LDI r13, 7
    CALL max
    LDI r7, 0xF90
    LDI r13, 7
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T18: max(7, 3) == 7
; ═══════════════════════════════════════════════════════════════
    LDI r8, 7
    LDI r13, 3
    CALL max
    LDI r7, 0xF91
    LDI r13, 7
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T19: clamp(5, 1, 10) == 5 (in range)
; ═══════════════════════════════════════════════════════════════
    LDI r8, 5
    LDI r13, 1
    LDI r6, 10
    CALL clamp
    LDI r7, 0xF92
    LDI r13, 5
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T20: clamp(0, 1, 10) == 1 (below lo)
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, 1
    LDI r6, 10
    CALL clamp
    LDI r7, 0xF93
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T21: clamp(15, 1, 10) == 10 (above hi)
; ═══════════════════════════════════════════════════════════════
    LDI r8, 15
    LDI r13, 1
    LDI r6, 10
    CALL clamp
    LDI r7, 0xF94
    LDI r13, 10
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T22: sqrt_approx(0) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    CALL sqrt_approx
    LDI r7, 0xF95
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T23: sqrt_approx(144) == 12
; ═══════════════════════════════════════════════════════════════
    LDI r8, 144
    CALL sqrt_approx
    LDI r7, 0xF96
    LDI r13, 12
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T24: sqrt_approx(1) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r8, 1
    CALL sqrt_approx
    LDI r7, 0xF97
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T25: sqrt_approx(10000) == 100
; ═══════════════════════════════════════════════════════════════
    LDI r8, 10000
    CALL sqrt_approx
    LDI r7, 0xF98
    LDI r13, 100
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T26: dist2(0,0, 3,4) == 25
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, 0
    LDI r6, 3
    LDI r11, 4
    CALL dist2
    LDI r7, 0xF99
    LDI r13, 25
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T27: dist2(0,0, 0,0) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, 0
    LDI r6, 0
    LDI r11, 0
    CALL dist2
    LDI r7, 0xF9A
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T28: rect_overlap(same rect) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, 0
    LDI r6, 10
    LDI r11, 10
    LDI r2, 0
    LDI r9, 0
    LDI r0, 10
    LDI r5, 10
    CALL rect_overlap
    LDI r7, 0xF9B
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T29: rect_overlap(disjoint) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, 0
    LDI r6, 5
    LDI r11, 5
    LDI r2, 10
    LDI r9, 10
    LDI r0, 5
    LDI r5, 5
    CALL rect_overlap
    LDI r7, 0xF9C
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T30: point_in_rect(5,5 in [0,0,10,10]) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r8, 5
    LDI r13, 5
    LDI r6, 0
    LDI r11, 0
    LDI r2, 10
    LDI r9, 10
    CALL point_in_rect
    LDI r7, 0xF9D
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T31: point_in_rect(15,5 in [0,0,10,10]) == 0 (outside x)
; ═══════════════════════════════════════════════════════════════
    LDI r8, 15
    LDI r13, 5
    LDI r6, 0
    LDI r11, 0
    LDI r2, 10
    LDI r9, 10
    CALL point_in_rect
    LDI r7, 0xF9E
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T32: point_in_circle(0,0 center of r=5) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, 0
    LDI r6, 0
    LDI r11, 0
    LDI r2, 5
    CALL point_in_circle
    LDI r7, 0xF9F
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T33: point_in_circle(3,4 on edge of r=5) == 1 (dist_sq=25 <= cr_sq=25)
; ═══════════════════════════════════════════════════════════════
    LDI r8, 3
    LDI r13, 4
    LDI r6, 0
    LDI r11, 0
    LDI r2, 5
    CALL point_in_circle
    LDI r7, 0xFA0
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T34: point_in_circle(10,10 far from r=5 at origin) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r8, 10
    LDI r13, 10
    LDI r6, 0
    LDI r11, 0
    LDI r2, 5
    CALL point_in_circle
    LDI r7, 0xFA1
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T35: circle_rect_intersect(circle inside rect) == 1
;   circle: cx=5, cy=5, cr=3  rect: rx=0, ry=0, rw=10, rh=10
; ═══════════════════════════════════════════════════════════════
    LDI r8, 5
    LDI r13, 5
    LDI r6, 3
    LDI r11, 0
    LDI r2, 0
    LDI r9, 10
    LDI r0, 10
    CALL circle_rect_intersect
    LDI r7, 0xFA2
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T36: circle_rect_intersect(far away) == 0
;   circle: cx=50, cy=50, cr=3  rect: rx=0, ry=0, rw=10, rh=10
; ═══════════════════════════════════════════════════════════════
    LDI r8, 50
    LDI r13, 50
    LDI r6, 3
    LDI r11, 0
    LDI r2, 0
    LDI r9, 10
    LDI r0, 10
    CALL circle_rect_intersect
    LDI r7, 0xFA3
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T37: circles_overlap(overlap, dist=8, sum_r=10) == 1
;   c1: (0,0) r=5  c2: (8,0) r=5  dist_sq=64 <= (5+5)^2=100
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, 0
    LDI r6, 5
    LDI r11, 8
    LDI r2, 0
    LDI r9, 5
    CALL circles_overlap
    LDI r7, 0xFA4
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T38: circles_overlap(apart, dist=20, sum_r=10) == 0
;   c1: (0,0) r=5  c2: (20,0) r=5  dist_sq=400 > (5+5)^2=100
; ═══════════════════════════════════════════════════════════════
    LDI r8, 0
    LDI r13, 0
    LDI r6, 5
    LDI r11, 20
    LDI r2, 0
    LDI r9, 5
    CALL circles_overlap
    LDI r7, 0xFA5
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T39: point_in_triangle(5,5 in (0,0)(10,0)(0,10)) == 1
; ═══════════════════════════════════════════════════════════════
    LDI r8, 5
    LDI r13, 5
    LDI r6, 0
    LDI r11, 0
    LDI r2, 10
    LDI r9, 0
    LDI r0, 0
    LDI r5, 10
    CALL point_in_triangle
    LDI r7, 0xFA6
    LDI r13, 1
    CMP r3, r13
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; T40: point_in_triangle(10,10 outside (0,0)(10,0)(0,10)) == 0
; ═══════════════════════════════════════════════════════════════
    LDI r8, 10
    LDI r13, 10
    LDI r6, 0
    LDI r11, 0
    LDI r2, 10
    LDI r9, 0
    LDI r0, 0
    LDI r5, 10
    CALL point_in_triangle
    LDI r7, 0xFA7
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
