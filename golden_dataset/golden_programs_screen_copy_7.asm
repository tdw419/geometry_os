; DESCRIPTION: Draw line: pos=the screen, color=red, size=fixed size.

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
LDI r6, 0xFF0000          ; red
STORE r13, r6

LDI r13, 0x10001          ; screen[1] = pixel (1, 0)
LDI r6, 0x00FF00          ; green
STORE r13, r6

LDI r13, 0x10002          ; screen[2] = pixel (2, 0)
LDI r6, 0x0000FF          ; blue
STORE r13, r6

; ── Bulk copy first 10 screen pixels to RAM ──
LDI r5, 0x10000          ; source: screen base
LDI r7, 0x2000           ; dest: RAM at 0x2000
LDI r11, 10               ; count: 10 pixels
COPY_LOOP:
LOAD r8, r5              ; r8 = screen[i]
STORE r7, r8             ; ram[dest] = r8
ADDI r5, 1               ; source++
ADDI r7, 1               ; dest++
SUBI r11, 1               ; count--
CMPI r11, 0               ; compare count to 0
JNZ r4, COPY_LOOP        ; loop while count > 0

; ── Verify pixel 0 is red (0xFF0000) ──
LDI r1, 0x2000
LOAD r14, r1              ; r14 = ram[0x2000] (copied from screen[0])
CMPI r14, 0xFF0000
JNZ r4, FAIL

; ── Verify pixel 1 is green (0x00FF00) ──
LDI r1, 0x2001
LOAD r14, r1
CMPI r14, 0x00FF00
JNZ r4, FAIL

; ── Verify pixel 2 is blue (0x0000FF) ──
LDI r1, 0x2002
LOAD r14, r1
CMPI r14, 0x0000FF
JNZ r4, FAIL

; ── Verify pixels 3-9 are zero (black/empty) ──
LDI r11, 7                ; check 7 more pixels
LDI r1, 0x2003           ; start at pixel 3
ZERO_CHECK:
LOAD r14, r1
CMPI r14, 0
JNZ r4, FAIL
ADDI r1, 1
SUBI r11, 1
CMPI r11, 0
JNZ r4, ZERO_CHECK

; ── PASS: draw green diagonal at (2,2)-(4,4) ──
LDI r13, 2
LDI r6, 2
LDI r8, 0x00FF00
PSET r13, r6, r8
LDI r13, 3
LDI r6, 3
PSET r13, r6, r8
LDI r13, 4
LDI r6, 4
PSET r13, r6, r8
JMP DONE

; ── FAIL: draw red diagonal at (2,2)-(4,4) ──
FAIL:
LDI r13, 2
LDI r6, 2
LDI r8, 0xFF0000
PSET r13, r6, r8
LDI r13, 3
LDI r6, 3
PSET r13, r6, r8
LDI r13, 4
LDI r6, 4
PSET r13, r6, r8

DONE:
HALT
