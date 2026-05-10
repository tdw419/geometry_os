; DESCRIPTION: Creates a purple circular shape at (248, 176) with radius 78.
; PLAN: r0=248(x), r1=176(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 176
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
