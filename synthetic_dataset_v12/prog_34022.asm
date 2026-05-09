; DESCRIPTION: Draws a green circle centered at (148, 192) with radius 58.
; PLAN: r0=148(x), r1=192(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 192
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
