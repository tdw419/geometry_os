; DESCRIPTION: Draws a blue circle centered at (34, 32) with radius 29.
; PLAN: r0=34(x), r1=32(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 32
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
