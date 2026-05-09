; DESCRIPTION: Draws a blue circle centered at (192, 54) with radius 37.
; PLAN: r0=192(x), r1=54(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 54
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
