; DESCRIPTION: Creates a purple circular shape at (109, 143) with radius 72.
; PLAN: r0=109(x), r1=143(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 143
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
