; DESCRIPTION: Draws a purple circle centered at (98, 196) with radius 58.
; PLAN: r0=98(x), r1=196(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 196
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
