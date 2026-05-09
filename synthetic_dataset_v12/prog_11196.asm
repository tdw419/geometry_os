; DESCRIPTION: Creates a purple circular shape at (143, 94) with radius 30.
; PLAN: r0=143(x), r1=94(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 94
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
