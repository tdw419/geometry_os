; DESCRIPTION: Draws a blue circle centered at (425, 232) with radius 16.
; PLAN: r0=425(x), r1=232(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 232
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
