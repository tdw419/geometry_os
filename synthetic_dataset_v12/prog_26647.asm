; DESCRIPTION: Draws a purple circle centered at (434, 201) with radius 11.
; PLAN: r0=434(x), r1=201(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 201
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
