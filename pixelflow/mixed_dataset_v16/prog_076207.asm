; DESCRIPTION: Creates a purple circular shape at (217, 121) with radius 53.
; PLAN: r0=217(x), r1=121(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 121
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
