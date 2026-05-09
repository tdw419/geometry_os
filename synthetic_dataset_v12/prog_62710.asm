; DESCRIPTION: Creates a purple circular shape at (87, 173) with radius 62.
; PLAN: r0=87(x), r1=173(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 173
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
