; DESCRIPTION: Draws a green circle centered at (35, 190) with radius 31.
; PLAN: r0=35(x), r1=190(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 190
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
