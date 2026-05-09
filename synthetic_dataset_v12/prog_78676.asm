; DESCRIPTION: Composite: Sets a single yellow pixel at (285, 217) then Renders a purple disk with center (151, 110) and radius 67.
; PLAN: r0=285(x), r1=217(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=110(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 217
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 151
LDI r6, 110
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
