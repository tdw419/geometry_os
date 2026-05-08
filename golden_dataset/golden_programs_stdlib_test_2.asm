; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; stdlib_test.asm -- Phase 31: Test program using standard library functions
;
; Tests: strlen, strcpy, strcmp, memset, itoa, print_str, print_int
; Also tests: .str directive and .lib/.include linking
;
; Uses .str directive to create test strings, then calls library functions
; to verify they work correctly. Displays results on screen.

.include "lib/stdlib.asm"
.include "lib/stdio.asm"

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Test data (placed at fixed addresses to avoid library code)
; ═══════════════════════════════════════════════════════════════

.org 0xA000
str_hello:
    .str "Hello"
str_world:
    .str "World"
str_copy_dst:
    .str ""
str_buf:
    .str ""             ; buffer for strcpy destination

; ═══════════════════════════════════════════════════════════════
; Test result storage
; ═══════════════════════════════════════════════════════════════
#define TEST_RESULTS 0xA100
#define TEST_COUNT_ADDR 0xA1FF

; ═══════════════════════════════════════════════════════════════
; Main program
; ═══════════════════════════════════════════════════════════════
.org 0x000

    ; Initialize screen and cursor
    LDI r11, 0
    FILL r11

    CALL stdio_init

    ; Display title
    LDI r15, title_str
    CALL print_str
    CALL print_newline

    ; ── Test 1: strlen ──
    LDI r15, str_hello
    CALL strlen
    ; r11 should be 5 (length of "Hello")
    LDI r9, 5
    CMP r11, r9
    LDI r10, 0
    CMP r11, r10             ; check if CMP(str_result, 5) == 0
    JZ r11, test1_pass
    LDI r15, fail_1
    CALL print_str
    CALL print_newline
    JMP test2
test1_pass:
    LDI r15, pass_1
    CALL print_str
    CALL print_newline

    ; ── Test 2: strcpy ──
test2:
    LDI r15, str_buf        ; destination
    LDI r9, str_hello      ; source
    CALL strcpy
    ; Verify by calling strlen on the copy
    LDI r15, str_buf
    CALL strlen
    LDI r9, 5
    CMP r11, r9
    LDI r10, 0
    CMP r11, r10
    JZ r11, test2_pass
    LDI r15, fail_2
    CALL print_str
    CALL print_newline
    JMP test3
test2_pass:
    LDI r15, pass_2
    CALL print_str
    CALL print_newline

    ; ── Test 3: strcmp equal ──
test3:
    ; First copy "Hello" to buf, then compare buf with str_hello
    LDI r15, str_buf
    LDI r9, str_hello
    CALL strcpy
    LDI r15, str_buf
    LDI r9, str_hello
    CALL strcmp
    ; r11 should be 0 (equal)
    JZ r11, test3_pass
    LDI r15, fail_3
    CALL print_str
    CALL print_newline
    JMP test4
test3_pass:
    LDI r15, pass_3
    CALL print_str
    CALL print_newline

    ; ── Test 4: itoa ──
test4:
    LDI r15, 42
    LDI r9, str_buf
    CALL itoa
    ; Verify: buf should be "42"
    LDI r15, str_buf
    CALL strlen
    LDI r9, 2
    CMP r11, r9
    LDI r10, 0
    CMP r11, r10
    JZ r11, test4_pass
    LDI r15, fail_4
    CALL print_str
    CALL print_newline
    JMP test5
test4_pass:
    LDI r15, pass_4
    CALL print_str
    CALL print_newline

    ; ── Test 5: memset ──
test5:
    ; Clear buffer, then memset with value 0x41 ('A') for 3 words
    LDI r15, str_buf
    LDI r9, 4              ; clear 4 words
    LDI r10, 0
    CALL memset
    ; Now set first 3 bytes to 'A'
    LDI r15, str_buf
    LDI r9, 3
    LDI r10, 65             ; 'A'
    CALL memset
    ; Null terminate
    LDI r14, str_buf
    LDI r10, 3
    ADD r14, r10
    LDI r11, 0
    STORE r14, r11
    ; Check strlen == 3
    LDI r15, str_buf
    CALL strlen
    LDI r9, 3
    CMP r11, r9
    LDI r10, 0
    CMP r11, r10
    JZ r11, test5_pass
    LDI r15, fail_5
    CALL print_str
    CALL print_newline
    JMP test_done
test5_pass:
    LDI r15, pass_5
    CALL print_str
    CALL print_newline

test_done:
    ; Display "Done!" message
    LDI r15, done_str
    CALL print_str
    HALT

; ═══════════════════════════════════════════════════════════════
; Test strings (placed after code)
; ═══════════════════════════════════════════════════════════════
title_str:
    .str "Stdlib Test Suite"
pass_1:
    .str "PASS: strlen"
pass_2:
    .str "PASS: strcpy"
pass_3:
    .str "PASS: strcmp"
pass_4:
    .str "PASS: itoa"
pass_5:
    .str "PASS: memset"
fail_1:
    .str "FAIL: strlen"
fail_2:
    .str "FAIL: strcpy"
fail_3:
    .str "FAIL: strcmp"
fail_4:
    .str "FAIL: itoa"
fail_5:
    .str "FAIL: memset"
done_str:
    .str "Done!"
