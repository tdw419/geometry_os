; DESCRIPTION: Draws a blue circle centered at (178, 193) with radius 60.
; PLAN: r0=178(x), r1=193(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 193
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
