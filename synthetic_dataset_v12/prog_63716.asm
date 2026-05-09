; DESCRIPTION: Draws a green circle centered at (266, 159) with radius 65.
; PLAN: r0=266(x), r1=159(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 159
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
