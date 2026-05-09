; DESCRIPTION: Draws a green circle centered at (391, 88) with radius 75.
; PLAN: r0=391(x), r1=88(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 88
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
