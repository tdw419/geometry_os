; DESCRIPTION: Draws a green circle centered at (249, 100) with radius 15.
; PLAN: r0=249(x), r1=100(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 100
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
