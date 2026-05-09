; DESCRIPTION: Draws a green circle centered at (325, 94) with radius 43.
; PLAN: r0=325(x), r1=94(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 94
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
