; DESCRIPTION: Draws a green circle centered at (139, 184) with radius 62.
; PLAN: r0=139(x), r1=184(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 184
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
