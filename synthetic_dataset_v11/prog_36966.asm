; DESCRIPTION: Draws a green circle centered at (102, 225) with radius 13.
; PLAN: r0=102(x), r1=225(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 225
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
