; DESCRIPTION: Creates a purple circular shape at (122, 65) with radius 57.
; PLAN: r0=122(x), r1=65(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 65
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
