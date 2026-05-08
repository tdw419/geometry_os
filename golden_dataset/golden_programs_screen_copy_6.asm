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
LDI r14, 0x10000          ; source: screen base
LDI r12, 0x2000           ; dest: RAM at 0x2000
LDI r2, 10               ; count: 10 pixels
COPY_LOOP:
LOAD r0, r14              ; r0 = screen[i]
STORE r12, r0             ; ram[dest] = r0
ADDI r14, 1               ; source++
ADDI r12, 1               ; dest++
SUBI r2, 1               ; count--
CMPI r2, 0               ; compare count to 0
JNZ r9, COPY_LOOP        ; loop while count > 0

; ── Verify pixel 0 is red (0xFF0000) ──
LDI r4, 0x2000
LOAD r15, r4              ; r15 = ram[0x2000] (copied from screen[0])
CMPI r15, 0xFF0000
JNZ r9, FAIL

; ── Verify pixel 1 is green (0x00FF00) ──
LDI r4, 0x2001
LOAD r15, r4
CMPI r15, 0x00FF00
JNZ r9, FAIL

; ── Verify pixel 2 is blue (0x0000FF) ──
LDI r4, 0x2002
LOAD r15, r4
CMPI r15, 0x0000FF
JNZ r9, FAIL

; ── Verify pixels 3-9 are zero (black/empty) ──
LDI r2, 7                ; check 7 more pixels
LDI r4, 0x2003           ; start at pixel 3
ZERO_CHECK:
LOAD r15, r4
CMPI r15, 0
JNZ r9, FAIL
ADDI r4, 1
SUBI r2, 1
CMPI r2, 0
JNZ r9, ZERO_CHECK

; ── PASS: draw green diagonal at (2,2)-(4,4) ──
LDI r1, 2
LDI r11, 2
LDI r0, 0x00FF00
PSET r1, r11, r0
LDI r1, 3
LDI r11, 3
PSET r1, r11, r0
LDI r1, 4
LDI r11, 4
PSET r1, r11, r0
JMP DONE

; ── FAIL: draw red diagonal at (2,2)-(4,4) ──
FAIL:
LDI r1, 2
LDI r11, 2
LDI r0, 0xFF0000
PSET r1, r11, r0
LDI r1, 3
LDI r11, 3
PSET r1, r11, r0
LDI r1, 4
LDI r11, 4
PSET r1, r11, r0

DONE:
HALT
