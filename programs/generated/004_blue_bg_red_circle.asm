; 004_blue_bg_red_circle.asm - Blue background with centered red circle

; Fill screen with blue
LDI r0, 0x0000FF
FILL r0

; Draw a red circle at center (128, 128) with radius 80
LDI r0, 128
LDI r1, 128
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3

; Draw a smaller white circle inside
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

HALT
