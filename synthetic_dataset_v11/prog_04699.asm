; DESCRIPTION: Draws a green circle centered at (190, 201) with radius 45.
; PLAN: r0=190(x), r1=201(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 201
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
