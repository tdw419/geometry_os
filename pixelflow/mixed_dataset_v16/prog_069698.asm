; DESCRIPTION: Creates a purple circular shape at (121, 215) with radius 23.
; PLAN: r0=121(x), r1=215(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 215
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
