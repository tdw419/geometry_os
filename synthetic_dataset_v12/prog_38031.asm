; DESCRIPTION: Creates a purple circular shape at (191, 126) with radius 29.
; PLAN: r0=191(x), r1=126(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 126
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
