; DESCRIPTION: Display a line using color red at the screen.

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
LDI r4, 0xFF0000          ; red
STORE r13, r4

LDI r13, 0x10001          ; screen[1] = pixel (1, 0)
LDI r4, 0x00FF00          ; green
STORE r13, r4

LDI r13, 0x10002          ; screen[2] = pixel (2, 0)
LDI r4, 0x0000FF          ; blue
STORE r13, r4

; ── Bulk copy first 10 screen pixels to RAM ──
LDI r14, 0x10000          ; source: screen base
LDI r15, 0x2000           ; dest: RAM at 0x2000
LDI r5, 10               ; count: 10 pixels
COPY_LOOP:
LOAD r1, r14              ; r1 = screen[i]
STORE r15, r1             ; ram[dest] = r1
ADDI r14, 1               ; source++
ADDI r15, 1               ; dest++
SUBI r5, 1               ; count--
CMPI r5, 0               ; compare count to 0
JNZ r6, COPY_LOOP        ; loop while count > 0

; ── Verify pixel 0 is red (0xFF0000) ──
LDI r9, 0x2000
LOAD r12, r9              ; r12 = ram[0x2000] (copied from screen[0])
CMPI r12, 0xFF0000
JNZ r6, FAIL

; ── Verify pixel 1 is green (0x00FF00) ──
LDI r9, 0x2001
LOAD r12, r9
CMPI r12, 0x00FF00
JNZ r6, FAIL

; ── Verify pixel 2 is blue (0x0000FF) ──
LDI r9, 0x2002
LOAD r12, r9
CMPI r12, 0x0000FF
JNZ r6, FAIL

; ── Verify pixels 3-9 are zero (black/empty) ──
LDI r5, 7                ; check 7 more pixels
LDI r9, 0x2003           ; start at pixel 3
ZERO_CHECK:
LOAD r12, r9
CMPI r12, 0
JNZ r6, FAIL
ADDI r9, 1
SUBI r5, 1
CMPI r5, 0
JNZ r6, ZERO_CHECK

; ── PASS: draw green diagonal at (2,2)-(4,4) ──
LDI r13, 2
LDI r4, 2
LDI r1, 0x00FF00
PSET r13, r4, r1
LDI r13, 3
LDI r4, 3
PSET r13, r4, r1
LDI r13, 4
LDI r4, 4
PSET r13, r4, r1
JMP DONE

; ── FAIL: draw red diagonal at (2,2)-(4,4) ──
FAIL:
LDI r13, 2
LDI r4, 2
LDI r1, 0xFF0000
PSET r13, r4, r1
LDI r13, 3
LDI r4, 3
PSET r13, r4, r1
LDI r13, 4
LDI r4, 4
PSET r13, r4, r1

DONE:
HALT
