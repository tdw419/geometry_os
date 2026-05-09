; DESCRIPTION: Draws a green circle centered at (203, 89) with radius 36.
; PLAN: r0=203(x), r1=89(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 89
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
