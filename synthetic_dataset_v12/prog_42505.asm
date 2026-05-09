; DESCRIPTION: Creates a purple circular shape at (125, 122) with radius 60.
; PLAN: r0=125(x), r1=122(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 122
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
