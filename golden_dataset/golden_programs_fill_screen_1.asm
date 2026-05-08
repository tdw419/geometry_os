; DESCRIPTION: Geometry OS program to draw a blue object.

; FILL_SCREEN -- Fill the screen with a solid color
; Uses FILL opcode to set every pixel to bright blue
; Test: all 65536 screen pixels should be 0x0000FF

LDI r1, 0x0000FF
FILL r1
HALT
