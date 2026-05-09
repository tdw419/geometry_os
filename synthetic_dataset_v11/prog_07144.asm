; DESCRIPTION: Draws a blue circle centered at (164, 170) with radius 77.
; PLAN: r0=164(x), r1=170(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 170
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
