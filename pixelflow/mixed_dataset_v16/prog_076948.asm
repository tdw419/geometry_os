; DESCRIPTION: Draws a black circle centered at (201, 135) with radius 68.
; PLAN: r0=201(x), r1=135(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 135
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
