; DESCRIPTION: Draws a purple circle centered at (154, 100) with radius 53.
; PLAN: r0=154(x), r1=100(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 100
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
