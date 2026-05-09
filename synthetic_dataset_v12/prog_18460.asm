; DESCRIPTION: Draws a blue circle centered at (433, 188) with radius 22.
; PLAN: r0=433(x), r1=188(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 188
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
