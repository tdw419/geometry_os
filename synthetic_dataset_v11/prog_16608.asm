; DESCRIPTION: Draws a red circle centered at (145, 203) with radius 49.
; PLAN: r0=145(x), r1=203(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 203
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
