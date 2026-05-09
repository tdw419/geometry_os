; DESCRIPTION: Draws a green circle centered at (159, 153) with radius 50.
; PLAN: r0=159(x), r1=153(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 153
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
