; DESCRIPTION: Creates a purple circular shape at (276, 110) with radius 65.
; PLAN: r0=276(x), r1=110(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 110
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
