; DESCRIPTION: Creates a purple circular shape at (82, 87) with radius 40.
; PLAN: r0=82(x), r1=87(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 87
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
