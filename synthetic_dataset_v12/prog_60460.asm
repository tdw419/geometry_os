; DESCRIPTION: Creates a purple circular shape at (107, 121) with radius 66.
; PLAN: r0=107(x), r1=121(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 121
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
