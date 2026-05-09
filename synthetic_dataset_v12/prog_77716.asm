; DESCRIPTION: Draws a yellow circle centered at (159, 147) with radius 76.
; PLAN: r0=159(x), r1=147(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 147
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
