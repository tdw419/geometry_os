; DESCRIPTION: Draws a red circle centered at (316, 144) with radius 73.
; PLAN: r0=316(x), r1=144(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 144
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
