; DESCRIPTION: Draws a green circle centered at (194, 198) with radius 43.
; PLAN: r0=194(x), r1=198(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 198
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
