; DESCRIPTION: Creates a purple circular shape at (128, 184) with radius 42.
; PLAN: r0=128(x), r1=184(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 184
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
