; DESCRIPTION: Draws a green circle centered at (204, 167) with radius 14.
; PLAN: r0=204(x), r1=167(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 167
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
