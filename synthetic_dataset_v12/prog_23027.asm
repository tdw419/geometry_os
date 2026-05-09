; DESCRIPTION: Creates a purple circular shape at (173, 76) with radius 60.
; PLAN: r0=173(x), r1=76(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 76
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
