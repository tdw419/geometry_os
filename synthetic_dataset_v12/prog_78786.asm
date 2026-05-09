; DESCRIPTION: Draws a blue circle centered at (360, 170) with radius 56.
; PLAN: r0=360(x), r1=170(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 170
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
