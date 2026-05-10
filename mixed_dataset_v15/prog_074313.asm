; DESCRIPTION: Draws a red circle centered at (203, 100) with radius 47.
; PLAN: r0=203(x), r1=100(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 100
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
