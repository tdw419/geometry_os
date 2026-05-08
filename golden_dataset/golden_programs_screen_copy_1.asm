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
LDI r9, 0x10000          ; screen[0] = pixel (0, 0)
LDI r8, 0xFF0000          ; red
STORE r9, r8

LDI r9, 0x10001          ; screen[1] = pixel (1, 0)
LDI r8, 0x00FF00          ; green
STORE r9, r8

LDI r9, 0x10002          ; screen[2] = pixel (2, 0)
LDI r8, 0x0000FF          ; blue
STORE r9, r8

; ── Bulk copy first 10 screen pixels to RAM ──
LDI r4, 0x10000          ; source: screen base
LDI r2, 0x2000           ; dest: RAM at 0x2000
LDI r14, 10               ; count: 10 pixels
COPY_LOOP:
LOAD r7, r4              ; r7 = screen[i]
STORE r2, r7             ; ram[dest] = r7
ADDI r4, 1               ; source++
ADDI r2, 1               ; dest++
SUBI r14, 1               ; count--
CMPI r14, 0               ; compare count to 0
JNZ r15, COPY_LOOP        ; loop while count > 0

; ── Verify pixel 0 is red (0xFF0000) ──
LDI r3, 0x2000
LOAD r11, r3              ; r11 = ram[0x2000] (copied from screen[0])
CMPI r11, 0xFF0000
JNZ r15, FAIL

; ── Verify pixel 1 is green (0x00FF00) ──
LDI r3, 0x2001
LOAD r11, r3
CMPI r11, 0x00FF00
JNZ r15, FAIL

; ── Verify pixel 2 is blue (0x0000FF) ──
LDI r3, 0x2002
LOAD r11, r3
CMPI r11, 0x0000FF
JNZ r15, FAIL

; ── Verify pixels 3-9 are zero (black/empty) ──
LDI r14, 7                ; check 7 more pixels
LDI r3, 0x2003           ; start at pixel 3
ZERO_CHECK:
LOAD r11, r3
CMPI r11, 0
JNZ r15, FAIL
ADDI r3, 1
SUBI r14, 1
CMPI r14, 0
JNZ r15, ZERO_CHECK

; ── PASS: draw green diagonal at (2,2)-(4,4) ──
LDI r9, 2
LDI r8, 2
LDI r7, 0x00FF00
PSET r9, r8, r7
LDI r9, 3
LDI r8, 3
PSET r9, r8, r7
LDI r9, 4
LDI r8, 4
PSET r9, r8, r7
JMP DONE

; ── FAIL: draw red diagonal at (2,2)-(4,4) ──
FAIL:
LDI r9, 2
LDI r8, 2
LDI r7, 0xFF0000
PSET r9, r8, r7
LDI r9, 3
LDI r8, 3
PSET r9, r8, r7
LDI r9, 4
LDI r8, 4
PSET r9, r8, r7

DONE:
HALT
