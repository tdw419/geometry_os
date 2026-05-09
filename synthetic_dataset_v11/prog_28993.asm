; DESCRIPTION: Creates a purple circular shape at (140, 126) with radius 24.
; PLAN: r0=140(x), r1=126(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 126
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
