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
LDI r13, 0x10000          ; screen[0] = pixel (0, 0)
LDI r1, 0xFF0000          ; red
STORE r13, r1

LDI r13, 0x10001          ; screen[1] = pixel (1, 0)
LDI r1, 0x00FF00          ; green
STORE r13, r1

LDI r13, 0x10002          ; screen[2] = pixel (2, 0)
LDI r1, 0x0000FF          ; blue
STORE r13, r1

; ── Bulk copy first 10 screen pixels to RAM ──
LDI r11, 0x10000          ; source: screen base
LDI r7, 0x2000           ; dest: RAM at 0x2000
LDI r15, 10               ; count: 10 pixels
COPY_LOOP:
LOAD r9, r11              ; r9 = screen[i]
STORE r7, r9             ; ram[dest] = r9
ADDI r11, 1               ; source++
ADDI r7, 1               ; dest++
SUBI r15, 1               ; count--
CMPI r15, 0               ; compare count to 0
JNZ r14, COPY_LOOP        ; loop while count > 0

; ── Verify pixel 0 is red (0xFF0000) ──
LDI r8, 0x2000
LOAD r0, r8              ; r0 = ram[0x2000] (copied from screen[0])
CMPI r0, 0xFF0000
JNZ r14, FAIL

; ── Verify pixel 1 is green (0x00FF00) ──
LDI r8, 0x2001
LOAD r0, r8
CMPI r0, 0x00FF00
JNZ r14, FAIL

; ── Verify pixel 2 is blue (0x0000FF) ──
LDI r8, 0x2002
LOAD r0, r8
CMPI r0, 0x0000FF
JNZ r14, FAIL

; ── Verify pixels 3-9 are zero (black/empty) ──
LDI r15, 7                ; check 7 more pixels
LDI r8, 0x2003           ; start at pixel 3
ZERO_CHECK:
LOAD r0, r8
CMPI r0, 0
JNZ r14, FAIL
ADDI r8, 1
SUBI r15, 1
CMPI r15, 0
JNZ r14, ZERO_CHECK

; ── PASS: draw green diagonal at (2,2)-(4,4) ──
LDI r13, 2
LDI r1, 2
LDI r9, 0x00FF00
PSET r13, r1, r9
LDI r13, 3
LDI r1, 3
PSET r13, r1, r9
LDI r13, 4
LDI r1, 4
PSET r13, r1, r9
JMP DONE

; ── FAIL: draw red diagonal at (2,2)-(4,4) ──
FAIL:
LDI r13, 2
LDI r1, 2
LDI r9, 0xFF0000
PSET r13, r1, r9
LDI r13, 3
LDI r1, 3
PSET r13, r1, r9
LDI r13, 4
LDI r1, 4
PSET r13, r1, r9

DONE:
HALT
