; DESCRIPTION: This GeOS assembly code is a comprehensive test suite for library functions, including new additions like `atoi`, `strncpy`, `memchr`, and `lerp`, as well as regression tests for existing functions. The tests are organized into sections for both new and existing functions, with results stored in RAM addresses 0xF80-0xFAF, where each byte represents the pass (1) or fail (0) status of a test. The code initializes by setting up the stack pointer and defining helper routines to store test results based on comparisons. It then proceeds through a series of tests that call various library functions with specific inputs and compare their outputs against expected values, using conditional branches and result storage mechanisms to record each test's outcome.

; lib_test_v2.asm -- Extended library test suite (v1.1.0)
;
; Tests new library functions added in v1.1.0: atoi, strncpy, memchr, lerp
; Also re-tests existing functions for regression.
;
; Result area: 0xF80-0xFAF (48 test slots, 1 byte each)
;   1 = PASS, 0 = FAIL
;
; Layout:
;   0x000: test code + helpers
;   0x500: library code (.include)
;   0xC00: test data strings
;
; Run: load programs/lib_test_v2.asm -> assemble -> run
; Verify: inspect RAM[0xF80..0xFAF]

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Initialization (must be first -- execution starts at PC=0)
; ═══════════════════════════════════════════════════════════════
    LDI r30, 0xFF00         ; stack pointer

; ═══════════════════════════════════════════════════════════════
; Helpers: test result storage
;   _check_result: r14==0 → store 1 (pass), else store 0 (fail)
;     Use after CMP to check equality, or directly for "expected==0"
;   _check_neq: r14!=0 → store 1 (pass), else store 0 (fail)
;     Use for "expected nonzero" checks
;   Both use r2 as the result address (set BEFORE calling)
; ═══════════════════════════════════════════════════════════════
_check_result:
    JZ r14, _cr_pass
    LDI r14, 0
    STORE r2, r14
    RET
_cr_pass:
    LDI r14, 1
    STORE r2, r14
    RET

_check_neq:
    JZ r14, _cne_fail
    LDI r14, 1
    STORE r2, r14
    RET
_cne_fail:
    LDI r14, 0
    STORE r2, r14
    RET

; ═══════════════════════════════════════════════════════════════
; REGRESSION: Re-test existing functions (T1-T10, compact)
; ═══════════════════════════════════════════════════════════════

; T1: strlen("Hello") == 5
    LDI r12, str_hello
    CALL strlen
    LDI r2, 0xF80
    LDI r10, 5
    CMP r14, r10
    CALL _check_result

; T2: strcmp("Hello","Hello") == 0
    LDI r12, str_hello
    LDI r10, str_hello
    CALL strcmp
    LDI r2, 0xF81
    CALL _check_result

; T3: strcpy + strlen round-trip
    LDI r12, buf_a
    LDI r10, str_hello
    CALL strcpy
    LDI r12, buf_a
    CALL strlen
    LDI r2, 0xF82
    LDI r10, 5
    CMP r14, r10
    CALL _check_result

; T4: abs(-42) == 42
    LDI r12, 0xFFFFFFD6
    CALL abs
    LDI r2, 0xF83
    LDI r10, 42
    CMP r14, r10
    CALL _check_result

; T5: min(3,7) == 3
    LDI r12, 3
    LDI r10, 7
    CALL min
    LDI r2, 0xF84
    LDI r10, 3
    CMP r14, r10
    CALL _check_result

; T6: max(3,7) == 7
    LDI r12, 3
    LDI r10, 7
    CALL max
    LDI r2, 0xF85
    LDI r10, 7
    CMP r14, r10
    CALL _check_result

; T7: clamp(0, 1, 10) == 1
    LDI r12, 0
    LDI r10, 1
    LDI r11, 10
    CALL clamp
    LDI r2, 0xF86
    LDI r10, 1
    CMP r14, r10
    CALL _check_result

; T8: sqrt_approx(144) == 12
    LDI r12, 144
    CALL sqrt_approx
    LDI r2, 0xF87
    LDI r10, 12
    CMP r14, r10
    CALL _check_result

; T9: rect_overlap(same) == 1
    LDI r12, 0
    LDI r10, 0
    LDI r11, 10
    LDI r6, 10
    LDI r3, 0
    LDI r1, 0
    LDI r5, 10
    LDI r9, 10
    CALL rect_overlap
    LDI r2, 0xF88
    LDI r10, 1
    CMP r14, r10
    CALL _check_result

; T10: point_in_rect(5,5 in [0,0,10,10]) == 1
    LDI r12, 5
    LDI r10, 5
    LDI r11, 0
    LDI r6, 0
    LDI r3, 10
    LDI r1, 10
    CALL point_in_rect
    LDI r2, 0xF89
    LDI r10, 1
    CMP r14, r10
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; NEW: atoi tests (T11-T16)
; ═══════════════════════════════════════════════════════════════

; T11: atoi("42") == 42
    LDI r12, str_42
    CALL atoi
    LDI r2, 0xF8A
    LDI r10, 42
    CMP r14, r10
    CALL _check_result

; T12: atoi("0") == 0
    LDI r12, str_0
    CALL atoi
    LDI r2, 0xF8B
    CALL _check_result

; T13: atoi("123") == 123
    LDI r12, str_123
    CALL atoi
    LDI r2, 0xF8C
    LDI r10, 123
    CMP r14, r10
    CALL _check_result

; T14: atoi("1000") == 1000
    LDI r12, str_1000
    CALL atoi
    LDI r2, 0xF8D
    LDI r10, 1000
    CMP r14, r10
    CALL _check_result

; T15: atoi("") == 0 (empty string)
    LDI r12, buf_empty
    CALL atoi
    LDI r2, 0xF8E
    CALL _check_result

; T16: atoi("5") == 5 (single digit)
    LDI r12, str_5
    CALL atoi
    LDI r2, 0xF8F
    LDI r10, 5
    CMP r14, r10
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; NEW: strncpy tests (T17-T22)
; ═══════════════════════════════════════════════════════════════

; T17: strncpy("Hello", 3) → buf[0..2] = H,e,l, buf[3] = 0
    LDI r12, buf_b
    LDI r10, str_hello
    LDI r11, 4
    CALL strncpy
    ; Check buf_b[3] == 0 (null-padded)
    LDI r2, buf_b
    LDI r14, 3
    ADD r2, r14
    LOAD r14, r2
    LDI r2, 0xF90
    CALL _check_result

; T18: strncpy exact length "Hi" → strlen == 2
    LDI r12, buf_c
    LDI r10, str_hi
    LDI r11, 2
    CALL strncpy
    LDI r12, buf_c
    CALL strlen
    LDI r2, 0xF91
    LDI r10, 2
    CMP r14, r10
    CALL _check_result

; T19: strncpy with count > strlen: "Hi" into 5 slots, strlen == 2
    LDI r12, buf_c
    LDI r10, str_hi
    LDI r11, 5
    CALL strncpy
    LDI r12, buf_c
    CALL strlen
    LDI r2, 0xF92
    LDI r10, 2
    CMP r14, r10
    CALL _check_result

; T20: strncpy count == 0 is no-op
    ; Pre-fill buf_c with 'Z' at [0]
    LDI r2, buf_c
    LDI r14, 90             ; 'Z'
    STORE r2, r14
    LDI r2, buf_c
    LDI r14, 1
    ADD r2, r14
    LDI r14, 0
    STORE r2, r14           ; null at [1]
    LDI r12, buf_c
    LDI r10, str_hello
    LDI r11, 0
    CALL strncpy
    ; buf_c[0] should still be 'Z' (90)
    LDI r2, buf_c
    LOAD r14, r2
    LDI r2, 0xF93
    LDI r10, 90
    CMP r14, r10
    CALL _check_result

; T21: strncpy empty src null-pads: "" into 3 slots
    LDI r12, buf_c
    LDI r10, buf_empty
    LDI r11, 3
    CALL strncpy
    LDI r12, buf_c
    CALL strlen
    LDI r2, 0xF94
    CALL _check_result     ; strlen("") == 0

; T22: strncpy preserves content: copy "AB" then check strlen
    LDI r12, buf_c
    LDI r10, str_ab
    LDI r11, 2
    CALL strncpy
    LDI r12, buf_c
    CALL strlen
    LDI r2, 0xF95
    LDI r10, 2
    CMP r14, r10
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; NEW: memchr tests (T23-T28)
; ═══════════════════════════════════════════════════════════════

; T23: memchr("Hello", 5, 'l') → nonzero (found at index 2)
    LDI r12, str_hello
    LDI r10, 5
    LDI r11, 108            ; 'l'
    CALL memchr
    LDI r2, 0xF96
    CALL _check_neq        ; nonzero = found

; T24: memchr("Hello", 5, 'H') → nonzero (found at start)
    LDI r12, str_hello
    LDI r10, 5
    LDI r11, 72             ; 'H'
    CALL memchr
    LDI r2, 0xF97
    CALL _check_neq

; T25: memchr("Hello", 5, 'z') → 0 (not found)
    LDI r12, str_hello
    LDI r10, 5
    LDI r11, 122            ; 'z'
    CALL memchr
    LDI r2, 0xF98
    CALL _check_result     ; 0 = not found

; T26: memchr count==0 → 0
    LDI r12, str_hello
    LDI r10, 0
    LDI r11, 72             ; 'H'
    CALL memchr
    LDI r2, 0xF99
    CALL _check_result

; T27: memchr("AAAA", 4, 65) → nonzero (found at start)
    LDI r12, str_aaaa
    LDI r10, 4
    LDI r11, 65             ; 'A'
    CALL memchr
    LDI r2, 0xF9A
    CALL _check_neq

; T28: memchr single element match
    LDI r12, str_5
    LDI r10, 1
    LDI r11, 53             ; '5'
    CALL memchr
    LDI r2, 0xF9B
    CALL _check_neq

; ═══════════════════════════════════════════════════════════════
; NEW: lerp tests (T29-T34)
; ═══════════════════════════════════════════════════════════════

; T29: lerp(0, 100, 0, 100) == 0 (t=0 → a)
    LDI r12, 0
    LDI r10, 100
    LDI r11, 0
    LDI r6, 100
    CALL lerp
    LDI r2, 0xF9C
    CALL _check_result

; T30: lerp(0, 100, 100, 100) == 100 (t=scale → b)
    LDI r12, 0
    LDI r10, 100
    LDI r11, 100
    LDI r6, 100
    CALL lerp
    LDI r2, 0xF9D
    LDI r10, 100
    CMP r14, r10
    CALL _check_result

; T31: lerp(0, 100, 50, 100) == 50 (t=half → midpoint)
    LDI r12, 0
    LDI r10, 100
    LDI r11, 50
    LDI r6, 100
    CALL lerp
    LDI r2, 0xF9E
    LDI r10, 50
    CMP r14, r10
    CALL _check_result

; T32: lerp(10, 20, 25, 100) == 12 (a=10, b=20, t=25/100=0.25 → 12.5→12)
    LDI r12, 10
    LDI r10, 20
    LDI r11, 25
    LDI r6, 100
    CALL lerp
    LDI r2, 0xF9F
    LDI r10, 12
    CMP r14, r10
    CALL _check_result

; T33: lerp(0, 256, 128, 256) == 128 (8-bit fraction, exact midpoint)
    LDI r12, 0
    LDI r10, 256
    LDI r11, 128
    LDI r6, 256
    CALL lerp
    LDI r2, 0xFA0
    LDI r10, 128
    CMP r14, r10
    CALL _check_result

; T34: lerp(0, 0, 50, 100) == 0 (a==b → always a)
    LDI r12, 0
    LDI r10, 0
    LDI r11, 50
    LDI r6, 100
    CALL lerp
    LDI r2, 0xFA1
    CALL _check_result

; ═══════════════════════════════════════════════════════════════
; REGRESSION: More existing function tests (T35-T40)
; ═══════════════════════════════════════════════════════════════

; T35: point_in_circle(3,4 on edge of r=5) == 1
    LDI r12, 3
    LDI r10, 4
    LDI r11, 0
    LDI r6, 0
    LDI r3, 5
    CALL point_in_circle
    LDI r2, 0xFA2
    LDI r10, 1
    CMP r14, r10
    CALL _check_result

; T36: circles_overlap(overlap, dist=8, sum_r=10) == 1
    LDI r12, 0
    LDI r10, 0
    LDI r11, 5
    LDI r6, 8
    LDI r3, 0
    LDI r1, 5
    CALL circles_overlap
    LDI r2, 0xFA3
    LDI r10, 1
    CMP r14, r10
    CALL _check_result

; T37: point_in_triangle(5,5 in (0,0)(10,0)(0,10)) == 1
    LDI r12, 5
    LDI r10, 5
    LDI r11, 0
    LDI r6, 0
    LDI r3, 10
    LDI r1, 0
    LDI r5, 0
    LDI r9, 10
    CALL point_in_triangle
    LDI r2, 0xFA4
    LDI r10, 1
    CMP r14, r10
    CALL _check_result

; T38: itoa/atoi round-trip: itoa(999) → atoi → 999
    LDI r12, 999
    LDI r10, buf_d
    CALL itoa
    LDI r12, buf_d
    CALL atoi
    LDI r2, 0xFA5
    LDI r10, 999
    CMP r14, r10
    CALL _check_result

; T39: itoa/atoi round-trip: itoa(0) → atoi → 0
    LDI r12, 0
    LDI r10, buf_d
    CALL itoa
    LDI r12, buf_d
    CALL atoi
    LDI r2, 0xFA6
    CALL _check_result

; T40: dist2(0,0, 3,4) == 25
    LDI r12, 0
    LDI r10, 0
    LDI r11, 3
    LDI r6, 4
    CALL dist2
    LDI r2, 0xFA7
    LDI r10, 25
    CMP r14, r10
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
str_ab:    .str "AB"
str_5:     .str "5"
str_42:    .str "42"
str_0:     .str "0"
str_123:   .str "123"
str_1000:  .str "1000"
str_aaaa:  .str "AAAA"
str_world: .str "World"
buf_empty: .str ""
buf_a:     .str ""
buf_b:     .str ""
buf_c:     .str ""
buf_d:     .str ""
