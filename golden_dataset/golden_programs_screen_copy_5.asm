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
LDI r3, 0x10000          ; screen[0] = pixel (0, 0)
LDI r15, 0xFF0000          ; red
STORE r3, r15

LDI r3, 0x10001          ; screen[1] = pixel (1, 0)
LDI r15, 0x00FF00          ; green
STORE r3, r15

LDI r3, 0x10002          ; screen[2] = pixel (2, 0)
LDI r15, 0x0000FF          ; blue
STORE r3, r15

; ── Bulk copy first 10 screen pixels to RAM ──
LDI r1, 0x10000          ; source: screen base
LDI r13, 0x2000           ; dest: RAM at 0x2000
LDI r4, 10               ; count: 10 pixels
COPY_LOOP:
LOAD r6, r1              ; r6 = screen[i]
STORE r13, r6             ; ram[dest] = r6
ADDI r1, 1               ; source++
ADDI r13, 1               ; dest++
SUBI r4, 1               ; count--
CMPI r4, 0               ; compare count to 0
JNZ r9, COPY_LOOP        ; loop while count > 0

; ── Verify pixel 0 is red (0xFF0000) ──
LDI r0, 0x2000
LOAD r14, r0              ; r14 = ram[0x2000] (copied from screen[0])
CMPI r14, 0xFF0000
JNZ r9, FAIL

; ── Verify pixel 1 is green (0x00FF00) ──
LDI r0, 0x2001
LOAD r14, r0
CMPI r14, 0x00FF00
JNZ r9, FAIL

; ── Verify pixel 2 is blue (0x0000FF) ──
LDI r0, 0x2002
LOAD r14, r0
CMPI r14, 0x0000FF
JNZ r9, FAIL

; ── Verify pixels 3-9 are zero (black/empty) ──
LDI r4, 7                ; check 7 more pixels
LDI r0, 0x2003           ; start at pixel 3
ZERO_CHECK:
LOAD r14, r0
CMPI r14, 0
JNZ r9, FAIL
ADDI r0, 1
SUBI r4, 1
CMPI r4, 0
JNZ r9, ZERO_CHECK

; ── PASS: draw green diagonal at (2,2)-(4,4) ──
LDI r3, 2
LDI r15, 2
LDI r6, 0x00FF00
PSET r3, r15, r6
LDI r3, 3
LDI r15, 3
PSET r3, r15, r6
LDI r3, 4
LDI r15, 4
PSET r3, r15, r6
JMP DONE

; ── FAIL: draw red diagonal at (2,2)-(4,4) ──
FAIL:
LDI r3, 2
LDI r15, 2
LDI r6, 0xFF0000
PSET r3, r15, r6
LDI r3, 3
LDI r15, 3
PSET r3, r15, r6
LDI r3, 4
LDI r15, 4
PSET r3, r15, r6

DONE:
HALT
