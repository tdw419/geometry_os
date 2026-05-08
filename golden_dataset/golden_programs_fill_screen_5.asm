; DESCRIPTION: Draw object: pos=the screen, color=blue, size=fixed size.

; FILL_SCREEN -- Fill the screen with a solid color
; Uses FILL opcode to set every pixel to bright blue
; Test: all 65536 screen pixels should be 0x0000FF

LDI r8, 0x0000FF
FILL r8
HALT
