; DESCRIPTION: Draws a green circle centered at (121, 155) with radius 76.
; PLAN: r0=121(x), r1=155(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 155
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
