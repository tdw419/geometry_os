; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; Phase 219 Demo: Screen Capture to RAM
; =======================================
; Draws 10 known pixels across the top row, captures them to RAM
; at 0x2000 via LOAD/STORE loop, then verifies the first pixel.
;
; Vision-gate verification:
;   PASS = green bar at y=20 (three green pixels at x=0,5,10)
;   FAIL = red diagonal at (100,100) and (110,110)

; === Part 1: Draw known pixels on screen ===
; Pixel 0: red at screen(0,0)
LDI r10, 0x10000
LDI r5, 0xFF0000
STORE r10, r5

; Pixel 1: green at screen(1,0)
LDI r10, 0x10001
LDI r5, 0x00FF00
STORE r10, r5

; Pixel 2: blue at screen(2,0)
LDI r10, 0x10002
LDI r5, 0x0000FF
STORE r10, r5

; Pixel 3: white at screen(3,0)
LDI r10, 0x10003
LDI r5, 0xFFFFFF
STORE r10, r5

; Pixel 4: yellow at screen(4,0)
LDI r10, 0x10004
LDI r5, 0xFFFF00
STORE r10, r5

; Pixel 5: cyan at screen(5,0)
LDI r10, 0x10005
LDI r5, 0x00FFFF
STORE r10, r5

; Pixel 6: magenta at screen(6,0)
LDI r10, 0x10006
LDI r5, 0xFF00FF
STORE r10, r5

; Pixel 7: dark red at screen(7,0)
LDI r10, 0x10007
LDI r5, 0x800000
STORE r10, r5

; Pixel 8: dark green at screen(8,0)
LDI r10, 0x10008
LDI r5, 0x008000
STORE r10, r5

; Pixel 9: dark blue at screen(9,0)
LDI r10, 0x10009
LDI r5, 0x000080
STORE r10, r5

; === Part 2: Bulk copy screen[0..9] to RAM at 0x2000 ===
LDI r4, 0x10000   ; source: screen base
LDI r6, 0x2000    ; dest: RAM offset
LDI r0, 10        ; count: 10 pixels

COPY_LOOP:
LOAD r2, r4       ; r2 = screen pixel
STORE r6, r2      ; ram[dest] = pixel
ADDI r4, 1        ; next source
ADDI r6, 1        ; next dest
SUBI r0, 1        ; count--
CMPI r0, 0
JNZ COPY_LOOP      ; loop while count > 0

; === Part 3: Verify ram[0x2000] == red (0xFF0000) ===
LDI r10, 0x2000
LOAD r2, r10
CMPI r2, 0xFF0000
JZ PASS

; FAIL: red diagonal indicator
LDI r10, 100
LDI r5, 100
LDI r2, 0xFF0000
PSET r10, r5, r2
LDI r10, 110
LDI r5, 110
PSET r10, r5, r2
JMP DONE

; PASS: green bar indicator at y=20
PASS:
LDI r2, 0x00FF00
LDI r5, 20
LDI r10, 0
PSET r10, r5, r2
LDI r10, 5
PSET r10, r5, r2
LDI r10, 10
PSET r10, r5, r2

DONE:
FRAME
HALT
