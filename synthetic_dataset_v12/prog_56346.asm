; DESCRIPTION: Draws a green circle centered at (211, 207) with radius 49.
; PLAN: r0=211(x), r1=207(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 207
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
