; DESCRIPTION: Draws a red circle centered at (203, 75) with radius 51.
; PLAN: r0=203(x), r1=75(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 75
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
