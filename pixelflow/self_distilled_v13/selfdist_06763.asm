; DESCRIPTION: Draws a blue circle centered at (357, 37) with radius 14.
; PLAN: r0=357(x), r1=37(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 37
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
