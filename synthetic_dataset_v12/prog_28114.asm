; DESCRIPTION: Creates a purple circular shape at (87, 172) with radius 66.
; PLAN: r0=87(x), r1=172(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 172
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
