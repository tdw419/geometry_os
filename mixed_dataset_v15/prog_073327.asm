; DESCRIPTION: Creates a purple circular shape at (323, 182) with radius 33.
; PLAN: r0=323(x), r1=182(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 182
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
