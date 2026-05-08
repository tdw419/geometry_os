; DESCRIPTION: Display a rectangle using color red at the screen.

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
LDI r12, 0x10000
LDI r1, 0xFF0000
STORE r12, r1

; Pixel 1: green at screen(1,0)
LDI r12, 0x10001
LDI r1, 0x00FF00
STORE r12, r1

; Pixel 2: blue at screen(2,0)
LDI r12, 0x10002
LDI r1, 0x0000FF
STORE r12, r1

; Pixel 3: white at screen(3,0)
LDI r12, 0x10003
LDI r1, 0xFFFFFF
STORE r12, r1

; Pixel 4: yellow at screen(4,0)
LDI r12, 0x10004
LDI r1, 0xFFFF00
STORE r12, r1

; Pixel 5: cyan at screen(5,0)
LDI r12, 0x10005
LDI r1, 0x00FFFF
STORE r12, r1

; Pixel 6: magenta at screen(6,0)
LDI r12, 0x10006
LDI r1, 0xFF00FF
STORE r12, r1

; Pixel 7: dark red at screen(7,0)
LDI r12, 0x10007
LDI r1, 0x800000
STORE r12, r1

; Pixel 8: dark green at screen(8,0)
LDI r12, 0x10008
LDI r1, 0x008000
STORE r12, r1

; Pixel 9: dark blue at screen(9,0)
LDI r12, 0x10009
LDI r1, 0x000080
STORE r12, r1

; === Part 2: Bulk copy screen[0..9] to RAM at 0x2000 ===
LDI r5, 0x10000   ; source: screen base
LDI r13, 0x2000    ; dest: RAM offset
LDI r15, 10        ; count: 10 pixels

COPY_LOOP:
LOAD r7, r5       ; r7 = screen pixel
STORE r13, r7      ; ram[dest] = pixel
ADDI r5, 1        ; next source
ADDI r13, 1        ; next dest
SUBI r15, 1        ; count--
CMPI r15, 0
JNZ COPY_LOOP      ; loop while count > 0

; === Part 3: Verify ram[0x2000] == red (0xFF0000) ===
LDI r12, 0x2000
LOAD r7, r12
CMPI r7, 0xFF0000
JZ PASS

; FAIL: red diagonal indicator
LDI r12, 100
LDI r1, 100
LDI r7, 0xFF0000
PSET r12, r1, r7
LDI r12, 110
LDI r1, 110
PSET r12, r1, r7
JMP DONE

; PASS: green bar indicator at y=20
PASS:
LDI r7, 0x00FF00
LDI r1, 20
LDI r12, 0
PSET r12, r1, r7
LDI r12, 5
PSET r12, r1, r7
LDI r12, 10
PSET r12, r1, r7

DONE:
FRAME
HALT
