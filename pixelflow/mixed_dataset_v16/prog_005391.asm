; DESCRIPTION: Draws a blue circle centered at (359, 157) with radius 60.
; PLAN: r0=359(x), r1=157(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 157
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
