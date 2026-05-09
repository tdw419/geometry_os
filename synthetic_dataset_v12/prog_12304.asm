; DESCRIPTION: Creates a purple circular shape at (380, 71) with radius 34.
; PLAN: r0=380(x), r1=71(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 71
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
