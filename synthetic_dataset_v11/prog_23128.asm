; DESCRIPTION: Creates a purple circular shape at (120, 85) with radius 39.
; PLAN: r0=120(x), r1=85(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 85
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
