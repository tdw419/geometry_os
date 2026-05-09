; DESCRIPTION: Draws a blue circle centered at (451, 224) with radius 28.
; PLAN: r0=451(x), r1=224(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 224
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
