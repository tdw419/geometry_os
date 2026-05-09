; DESCRIPTION: Draws a yellow circle centered at (348, 166) with radius 28.
; PLAN: r0=348(x), r1=166(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 166
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
