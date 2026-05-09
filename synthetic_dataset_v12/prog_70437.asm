; DESCRIPTION: Draws a purple circle centered at (167, 163) with radius 77.
; PLAN: r0=167(x), r1=163(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 163
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
