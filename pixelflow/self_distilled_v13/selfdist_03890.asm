; DESCRIPTION: Draws a green circle centered at (117, 58) with radius 15.
; PLAN: r0=117(x), r1=58(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 58
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
