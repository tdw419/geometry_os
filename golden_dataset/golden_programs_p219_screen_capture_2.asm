; DESCRIPTION: Geometry OS program to draw a red rectangle.

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
LDI r0, 0x10000
LDI r1, 0xFF0000
STORE r0, r1

; Pixel 1: green at screen(1,0)
LDI r0, 0x10001
LDI r1, 0x00FF00
STORE r0, r1

; Pixel 2: blue at screen(2,0)
LDI r0, 0x10002
LDI r1, 0x0000FF
STORE r0, r1

; Pixel 3: white at screen(3,0)
LDI r0, 0x10003
LDI r1, 0xFFFFFF
STORE r0, r1

; Pixel 4: yellow at screen(4,0)
LDI r0, 0x10004
LDI r1, 0xFFFF00
STORE r0, r1

; Pixel 5: cyan at screen(5,0)
LDI r0, 0x10005
LDI r1, 0x00FFFF
STORE r0, r1

; Pixel 6: magenta at screen(6,0)
LDI r0, 0x10006
LDI r1, 0xFF00FF
STORE r0, r1

; Pixel 7: dark red at screen(7,0)
LDI r0, 0x10007
LDI r1, 0x800000
STORE r0, r1

; Pixel 8: dark green at screen(8,0)
LDI r0, 0x10008
LDI r1, 0x008000
STORE r0, r1

; Pixel 9: dark blue at screen(9,0)
LDI r0, 0x10009
LDI r1, 0x000080
STORE r0, r1

; === Part 2: Bulk copy screen[0..9] to RAM at 0x2000 ===
LDI r8, 0x10000   ; source: screen base
LDI r10, 0x2000    ; dest: RAM offset
LDI r3, 10        ; count: 10 pixels

COPY_LOOP:
LOAD r2, r8       ; r2 = screen pixel
STORE r10, r2      ; ram[dest] = pixel
ADDI r8, 1        ; next source
ADDI r10, 1        ; next dest
SUBI r3, 1        ; count--
CMPI r3, 0
JNZ COPY_LOOP      ; loop while count > 0

; === Part 3: Verify ram[0x2000] == red (0xFF0000) ===
LDI r0, 0x2000
LOAD r2, r0
CMPI r2, 0xFF0000
JZ PASS

; FAIL: red diagonal indicator
LDI r0, 100
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r0, 110
LDI r1, 110
PSET r0, r1, r2
JMP DONE

; PASS: green bar indicator at y=20
PASS:
LDI r2, 0x00FF00
LDI r1, 20
LDI r0, 0
PSET r0, r1, r2
LDI r0, 5
PSET r0, r1, r2
LDI r0, 10
PSET r0, r1, r2

DONE:
FRAME
HALT
