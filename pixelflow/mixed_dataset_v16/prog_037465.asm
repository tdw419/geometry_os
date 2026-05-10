; DESCRIPTION: Composite: Draws a purple circle centered at (253, 119) with radius 38 then Sets a single white pixel at (116, 162).
; PLAN: r0=253(x), r1=119(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=162(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 119
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 162
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
