; DESCRIPTION: Draws a purple circle centered at (167, 92) with radius 75.
; PLAN: r0=167(x), r1=92(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 92
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
