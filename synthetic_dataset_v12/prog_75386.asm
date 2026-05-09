; DESCRIPTION: Composite: Sets a single purple pixel at (11, 203) then Creates a yellow circular shape at (95, 158) with radius 58.
; PLAN: r0=11(x), r1=203(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=158(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 203
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 95
LDI r6, 158
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
