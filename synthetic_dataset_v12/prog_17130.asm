; DESCRIPTION: Draws a yellow circle centered at (397, 201) with radius 50.
; PLAN: r0=397(x), r1=201(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 201
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
