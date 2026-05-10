; DESCRIPTION: Creates a purple circular shape at (181, 164) with radius 79.
; PLAN: r0=181(x), r1=164(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 164
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
