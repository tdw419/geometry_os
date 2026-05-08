; DESCRIPTION: Draws a blue object at the screen with fixed size.

; FILL_SCREEN -- Fill the screen with a solid color
; Uses FILL opcode to set every pixel to bright blue
; Test: all 65536 screen pixels should be 0x0000FF

LDI r5, 0x0000FF
FILL r5
HALT
