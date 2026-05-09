; DESCRIPTION: Draws a blue circle centered at (342, 92) with radius 43.
; PLAN: r0=342(x), r1=92(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 92
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
