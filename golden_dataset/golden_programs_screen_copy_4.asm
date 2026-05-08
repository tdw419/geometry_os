; DESCRIPTION: Geometry OS program to draw a red line.

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
LDI r1, 0x10000          ; screen[0] = pixel (0, 0)
LDI r11, 0xFF0000          ; red
STORE r1, r11

LDI r1, 0x10001          ; screen[1] = pixel (1, 0)
LDI r11, 0x00FF00          ; green
STORE r1, r11

LDI r1, 0x10002          ; screen[2] = pixel (2, 0)
LDI r11, 0x0000FF          ; blue
STORE r1, r11

; ── Bulk copy first 10 screen pixels to RAM ──
LDI r4, 0x10000          ; source: screen base
LDI r3, 0x2000           ; dest: RAM at 0x2000
LDI r12, 10               ; count: 10 pixels
COPY_LOOP:
LOAD r14, r4              ; r14 = screen[i]
STORE r3, r14             ; ram[dest] = r14
ADDI r4, 1               ; source++
ADDI r3, 1               ; dest++
SUBI r12, 1               ; count--
CMPI r12, 0               ; compare count to 0
JNZ r7, COPY_LOOP        ; loop while count > 0

; ── Verify pixel 0 is red (0xFF0000) ──
LDI r2, 0x2000
LOAD r9, r2              ; r9 = ram[0x2000] (copied from screen[0])
CMPI r9, 0xFF0000
JNZ r7, FAIL

; ── Verify pixel 1 is green (0x00FF00) ──
LDI r2, 0x2001
LOAD r9, r2
CMPI r9, 0x00FF00
JNZ r7, FAIL

; ── Verify pixel 2 is blue (0x0000FF) ──
LDI r2, 0x2002
LOAD r9, r2
CMPI r9, 0x0000FF
JNZ r7, FAIL

; ── Verify pixels 3-9 are zero (black/empty) ──
LDI r12, 7                ; check 7 more pixels
LDI r2, 0x2003           ; start at pixel 3
ZERO_CHECK:
LOAD r9, r2
CMPI r9, 0
JNZ r7, FAIL
ADDI r2, 1
SUBI r12, 1
CMPI r12, 0
JNZ r7, ZERO_CHECK

; ── PASS: draw green diagonal at (2,2)-(4,4) ──
LDI r1, 2
LDI r11, 2
LDI r14, 0x00FF00
PSET r1, r11, r14
LDI r1, 3
LDI r11, 3
PSET r1, r11, r14
LDI r1, 4
LDI r11, 4
PSET r1, r11, r14
JMP DONE

; ── FAIL: draw red diagonal at (2,2)-(4,4) ──
FAIL:
LDI r1, 2
LDI r11, 2
LDI r14, 0xFF0000
PSET r1, r11, r14
LDI r1, 3
LDI r11, 3
PSET r1, r11, r14
LDI r1, 4
LDI r11, 4
PSET r1, r11, r14

DONE:
HALT
