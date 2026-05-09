; DESCRIPTION: Creates a purple circular shape at (203, 82) with radius 29.
; PLAN: r0=203(x), r1=82(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 82
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
