; DESCRIPTION: Draws a green circle centered at (131, 99) with radius 76.
; PLAN: r0=131(x), r1=99(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 99
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
