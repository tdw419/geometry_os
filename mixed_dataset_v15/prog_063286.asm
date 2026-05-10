; DESCRIPTION: Draws a green circle centered at (204, 171) with radius 15.
; PLAN: r0=204(x), r1=171(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 171
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
