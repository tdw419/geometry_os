; DESCRIPTION: Draws a blue circle centered at (342, 199) with radius 22.
; PLAN: r0=342(x), r1=199(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 199
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
