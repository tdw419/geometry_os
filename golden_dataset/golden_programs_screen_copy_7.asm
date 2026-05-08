; DESCRIPTION: This GeOS assembly code draws three colored pixels on the screen, copies the first ten screen pixels to RAM, verifies the copied values against expected colors, and then draws a green diagonal line if the verification passes or a red diagonal line if it fails.

; screen_copy.asm -- Screen buffer LOAD readback demo
; Phase 219: Copy screen pixels to RAM via LOAD/STORE loop, verify consistency.
;
; How it works:
; 1. Draw 3 colored pixels on the screen via STORE to screen-mapped I/O (0x10000+)
; 2. Copy first 10 pixels from screen (0x10000-0x10009) to RAM (0x2000-0x2009)
; 3. Compare copied values against expected colors
; 4. Draw green diagonal line at (2,2)-(4,4) if pass, red if fail
;
; Memory layout:
;   0x2000-0x2009: copied screen pixels (first 10)

; ── Draw 3 test pixels on screen ──
LDI r2, 0x10000          ; screen[0] = pixel (0, 0)
LDI r1, 0xFF0000          ; red
STORE r2, r1

LDI r2, 0x10001          ; screen[1] = pixel (1, 0)
LDI r1, 0x00FF00          ; green
STORE r2, r1

LDI r2, 0x10002          ; screen[2] = pixel (2, 0)
LDI r1, 0x0000FF          ; blue
STORE r2, r1

; ── Bulk copy first 10 screen pixels to RAM ──
LDI r14, 0x10000          ; source: screen base
LDI r13, 0x2000           ; dest: RAM at 0x2000
LDI r15, 10               ; count: 10 pixels
COPY_LOOP:
LOAD r12, r14              ; r12 = screen[i]
STORE r13, r12             ; ram[dest] = r12
ADDI r14, 1               ; source++
ADDI r13, 1               ; dest++
SUBI r15, 1               ; count--
CMPI r15, 0               ; compare count to 0
JNZ r11, COPY_LOOP        ; loop while count > 0

; ── Verify pixel 0 is red (0xFF0000) ──
LDI r4, 0x2000
LOAD r9, r4              ; r9 = ram[0x2000] (copied from screen[0])
CMPI r9, 0xFF0000
JNZ r11, FAIL

; ── Verify pixel 1 is green (0x00FF00) ──
LDI r4, 0x2001
LOAD r9, r4
CMPI r9, 0x00FF00
JNZ r11, FAIL

; ── Verify pixel 2 is blue (0x0000FF) ──
LDI r4, 0x2002
LOAD r9, r4
CMPI r9, 0x0000FF
JNZ r11, FAIL

; ── Verify pixels 3-9 are zero (black/empty) ──
LDI r15, 7                ; check 7 more pixels
LDI r4, 0x2003           ; start at pixel 3
ZERO_CHECK:
LOAD r9, r4
CMPI r9, 0
JNZ r11, FAIL
ADDI r4, 1
SUBI r15, 1
CMPI r15, 0
JNZ r11, ZERO_CHECK

; ── PASS: draw green diagonal at (2,2)-(4,4) ──
LDI r2, 2
LDI r1, 2
LDI r12, 0x00FF00
PSET r2, r1, r12
LDI r2, 3
LDI r1, 3
PSET r2, r1, r12
LDI r2, 4
LDI r1, 4
PSET r2, r1, r12
JMP DONE

; ── FAIL: draw red diagonal at (2,2)-(4,4) ──
FAIL:
LDI r2, 2
LDI r1, 2
LDI r12, 0xFF0000
PSET r2, r1, r12
LDI r2, 3
LDI r1, 3
PSET r2, r1, r12
LDI r2, 4
LDI r1, 4
PSET r2, r1, r12

DONE:
HALT
