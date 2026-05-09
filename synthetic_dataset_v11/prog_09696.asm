; DESCRIPTION: Draws a blue circle centered at (224, 181) with radius 14.
; PLAN: r0=224(x), r1=181(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 181
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
