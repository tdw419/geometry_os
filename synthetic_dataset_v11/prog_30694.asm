; DESCRIPTION: Draws a green circle centered at (55, 109) with radius 49.
; PLAN: r0=55(x), r1=109(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 109
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
