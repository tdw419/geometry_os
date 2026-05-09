; DESCRIPTION: Draws a green circle centered at (28, 89) with radius 20.
; PLAN: r0=28(x), r1=89(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 89
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
