; DESCRIPTION: Draws a green circle centered at (116, 185) with radius 11.
; PLAN: r0=116(x), r1=185(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 185
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
