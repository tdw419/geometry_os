; DESCRIPTION: Creates a purple circular shape at (439, 143) with radius 69.
; PLAN: r0=439(x), r1=143(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 143
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
