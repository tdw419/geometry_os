; DESCRIPTION: Creates a purple circular shape at (192, 180) with radius 42.
; PLAN: r0=192(x), r1=180(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 180
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
