; DESCRIPTION: Draws a green circle centered at (22, 58) with radius 35.
; PLAN: r0=22(x), r1=58(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 58
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
