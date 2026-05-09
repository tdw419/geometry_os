; DESCRIPTION: Creates a purple circular shape at (355, 185) with radius 68.
; PLAN: r0=355(x), r1=185(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 185
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
