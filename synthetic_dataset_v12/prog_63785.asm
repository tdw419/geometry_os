; DESCRIPTION: Draws a green circle centered at (119, 80) with radius 60.
; PLAN: r0=119(x), r1=80(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 80
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
