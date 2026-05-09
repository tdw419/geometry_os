; DESCRIPTION: Draws a green circle centered at (58, 170) with radius 23.
; PLAN: r0=58(x), r1=170(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 170
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
