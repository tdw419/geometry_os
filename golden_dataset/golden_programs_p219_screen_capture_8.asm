; DESCRIPTION: A red rectangle centered at the screen with fixed size.

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
LDI r13, 0x10000
LDI r11, 0xFF0000
STORE r13, r11

; Pixel 1: green at screen(1,0)
LDI r13, 0x10001
LDI r11, 0x00FF00
STORE r13, r11

; Pixel 2: blue at screen(2,0)
LDI r13, 0x10002
LDI r11, 0x0000FF
STORE r13, r11

; Pixel 3: white at screen(3,0)
LDI r13, 0x10003
LDI r11, 0xFFFFFF
STORE r13, r11

; Pixel 4: yellow at screen(4,0)
LDI r13, 0x10004
LDI r11, 0xFFFF00
STORE r13, r11

; Pixel 5: cyan at screen(5,0)
LDI r13, 0x10005
LDI r11, 0x00FFFF
STORE r13, r11

; Pixel 6: magenta at screen(6,0)
LDI r13, 0x10006
LDI r11, 0xFF00FF
STORE r13, r11

; Pixel 7: dark red at screen(7,0)
LDI r13, 0x10007
LDI r11, 0x800000
STORE r13, r11

; Pixel 8: dark green at screen(8,0)
LDI r13, 0x10008
LDI r11, 0x008000
STORE r13, r11

; Pixel 9: dark blue at screen(9,0)
LDI r13, 0x10009
LDI r11, 0x000080
STORE r13, r11

; === Part 2: Bulk copy screen[0..9] to RAM at 0x2000 ===
LDI r15, 0x10000   ; source: screen base
LDI r1, 0x2000    ; dest: RAM offset
LDI r6, 10        ; count: 10 pixels

COPY_LOOP:
LOAD r3, r15       ; r3 = screen pixel
STORE r1, r3      ; ram[dest] = pixel
ADDI r15, 1        ; next source
ADDI r1, 1        ; next dest
SUBI r6, 1        ; count--
CMPI r6, 0
JNZ COPY_LOOP      ; loop while count > 0

; === Part 3: Verify ram[0x2000] == red (0xFF0000) ===
LDI r13, 0x2000
LOAD r3, r13
CMPI r3, 0xFF0000
JZ PASS

; FAIL: red diagonal indicator
LDI r13, 100
LDI r11, 100
LDI r3, 0xFF0000
PSET r13, r11, r3
LDI r13, 110
LDI r11, 110
PSET r13, r11, r3
JMP DONE

; PASS: green bar indicator at y=20
PASS:
LDI r3, 0x00FF00
LDI r11, 20
LDI r13, 0
PSET r13, r11, r3
LDI r13, 5
PSET r13, r11, r3
LDI r13, 10
PSET r13, r11, r3

DONE:
FRAME
HALT
