; DESCRIPTION: Draws a green circle centered at (39, 199) with radius 30.
; PLAN: r0=39(x), r1=199(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 199
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
