; DESCRIPTION: This GeOS assembly code draws a sequence of colored pixels across the top row of the screen, captures them to RAM at address 0x2000 using a loop, and verifies the first pixel's color. It passes by drawing a green bar at y=20 if the capture is correct; otherwise, it fails by drawing a red diagonal line from (100,100) to (110,110).

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
LDI r2, 0x10000
LDI r9, 0xFF0000
STORE r2, r9

; Pixel 1: green at screen(1,0)
LDI r2, 0x10001
LDI r9, 0x00FF00
STORE r2, r9

; Pixel 2: blue at screen(2,0)
LDI r2, 0x10002
LDI r9, 0x0000FF
STORE r2, r9

; Pixel 3: white at screen(3,0)
LDI r2, 0x10003
LDI r9, 0xFFFFFF
STORE r2, r9

; Pixel 4: yellow at screen(4,0)
LDI r2, 0x10004
LDI r9, 0xFFFF00
STORE r2, r9

; Pixel 5: cyan at screen(5,0)
LDI r2, 0x10005
LDI r9, 0x00FFFF
STORE r2, r9

; Pixel 6: magenta at screen(6,0)
LDI r2, 0x10006
LDI r9, 0xFF00FF
STORE r2, r9

; Pixel 7: dark red at screen(7,0)
LDI r2, 0x10007
LDI r9, 0x800000
STORE r2, r9

; Pixel 8: dark green at screen(8,0)
LDI r2, 0x10008
LDI r9, 0x008000
STORE r2, r9

; Pixel 9: dark blue at screen(9,0)
LDI r2, 0x10009
LDI r9, 0x000080
STORE r2, r9

; === Part 2: Bulk copy screen[0..9] to RAM at 0x2000 ===
LDI r5, 0x10000   ; source: screen base
LDI r11, 0x2000    ; dest: RAM offset
LDI r12, 10        ; count: 10 pixels

COPY_LOOP:
LOAD r15, r5       ; r15 = screen pixel
STORE r11, r15      ; ram[dest] = pixel
ADDI r5, 1        ; next source
ADDI r11, 1        ; next dest
SUBI r12, 1        ; count--
CMPI r12, 0
JNZ COPY_LOOP      ; loop while count > 0

; === Part 3: Verify ram[0x2000] == red (0xFF0000) ===
LDI r2, 0x2000
LOAD r15, r2
CMPI r15, 0xFF0000
JZ PASS

; FAIL: red diagonal indicator
LDI r2, 100
LDI r9, 100
LDI r15, 0xFF0000
PSET r2, r9, r15
LDI r2, 110
LDI r9, 110
PSET r2, r9, r15
JMP DONE

; PASS: green bar indicator at y=20
PASS:
LDI r15, 0x00FF00
LDI r9, 20
LDI r2, 0
PSET r2, r9, r15
LDI r2, 5
PSET r2, r9, r15
LDI r2, 10
PSET r2, r9, r15

DONE:
FRAME
HALT
