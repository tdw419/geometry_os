; DESCRIPTION: Draws a purple circle centered at (117, 77) with radius 60.
; PLAN: r0=117(x), r1=77(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 77
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
