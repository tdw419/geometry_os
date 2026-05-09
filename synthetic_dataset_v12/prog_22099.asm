; DESCRIPTION: Draws a green circle centered at (155, 178) with radius 11.
; PLAN: r0=155(x), r1=178(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 178
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
