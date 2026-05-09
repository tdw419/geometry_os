; DESCRIPTION: Draws a green circle centered at (170, 83) with radius 75.
; PLAN: r0=170(x), r1=83(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 83
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
