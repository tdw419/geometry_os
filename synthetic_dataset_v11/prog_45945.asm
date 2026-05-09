; DESCRIPTION: Draws a blue circle centered at (188, 134) with radius 60.
; PLAN: r0=188(x), r1=134(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 134
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
