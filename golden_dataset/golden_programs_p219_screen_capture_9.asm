; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

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
LDI r6, 0xFF0000
STORE r2, r6

; Pixel 1: green at screen(1,0)
LDI r2, 0x10001
LDI r6, 0x00FF00
STORE r2, r6

; Pixel 2: blue at screen(2,0)
LDI r2, 0x10002
LDI r6, 0x0000FF
STORE r2, r6

; Pixel 3: white at screen(3,0)
LDI r2, 0x10003
LDI r6, 0xFFFFFF
STORE r2, r6

; Pixel 4: yellow at screen(4,0)
LDI r2, 0x10004
LDI r6, 0xFFFF00
STORE r2, r6

; Pixel 5: cyan at screen(5,0)
LDI r2, 0x10005
LDI r6, 0x00FFFF
STORE r2, r6

; Pixel 6: magenta at screen(6,0)
LDI r2, 0x10006
LDI r6, 0xFF00FF
STORE r2, r6

; Pixel 7: dark red at screen(7,0)
LDI r2, 0x10007
LDI r6, 0x800000
STORE r2, r6

; Pixel 8: dark green at screen(8,0)
LDI r2, 0x10008
LDI r6, 0x008000
STORE r2, r6

; Pixel 9: dark blue at screen(9,0)
LDI r2, 0x10009
LDI r6, 0x000080
STORE r2, r6

; === Part 2: Bulk copy screen[0..9] to RAM at 0x2000 ===
LDI r1, 0x10000   ; source: screen base
LDI r15, 0x2000    ; dest: RAM offset
LDI r0, 10        ; count: 10 pixels

COPY_LOOP:
LOAD r10, r1       ; r10 = screen pixel
STORE r15, r10      ; ram[dest] = pixel
ADDI r1, 1        ; next source
ADDI r15, 1        ; next dest
SUBI r0, 1        ; count--
CMPI r0, 0
JNZ COPY_LOOP      ; loop while count > 0

; === Part 3: Verify ram[0x2000] == red (0xFF0000) ===
LDI r2, 0x2000
LOAD r10, r2
CMPI r10, 0xFF0000
JZ PASS

; FAIL: red diagonal indicator
LDI r2, 100
LDI r6, 100
LDI r10, 0xFF0000
PSET r2, r6, r10
LDI r2, 110
LDI r6, 110
PSET r2, r6, r10
JMP DONE

; PASS: green bar indicator at y=20
PASS:
LDI r10, 0x00FF00
LDI r6, 20
LDI r2, 0
PSET r2, r6, r10
LDI r2, 5
PSET r2, r6, r10
LDI r2, 10
PSET r2, r6, r10

DONE:
FRAME
HALT
