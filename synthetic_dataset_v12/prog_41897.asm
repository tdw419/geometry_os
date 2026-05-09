; DESCRIPTION: Draws a yellow circle centered at (177, 201) with radius 13.
; PLAN: r0=177(x), r1=201(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 201
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
