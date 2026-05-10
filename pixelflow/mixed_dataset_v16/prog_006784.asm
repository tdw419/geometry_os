; DESCRIPTION: Draws a purple circle centered at (241, 179) with radius 44.
; PLAN: r0=241(x), r1=179(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 179
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
