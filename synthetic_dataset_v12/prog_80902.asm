; DESCRIPTION: Draws a green circle centered at (177, 157) with radius 36.
; PLAN: r0=177(x), r1=157(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 157
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
