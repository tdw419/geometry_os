; DESCRIPTION: Draws a green circle centered at (244, 230) with radius 10.
; PLAN: r0=244(x), r1=230(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 230
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
