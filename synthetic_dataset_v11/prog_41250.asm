; DESCRIPTION: Draws a blue circle centered at (76, 110) with radius 27.
; PLAN: r0=76(x), r1=110(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 110
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
