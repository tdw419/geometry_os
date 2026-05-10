; DESCRIPTION: Draws a green circle centered at (233, 199) with radius 45.
; PLAN: r0=233(x), r1=199(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 199
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
