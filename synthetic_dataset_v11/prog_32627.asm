; DESCRIPTION: Creates a purple circular shape at (132, 85) with radius 19.
; PLAN: r0=132(x), r1=85(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 85
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
