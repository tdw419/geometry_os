; DESCRIPTION: Composite: Sets a single white pixel at (84, 76) then Creates a white circular shape at (170, 186) with radius 47.
; PLAN: r0=84(x), r1=76(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=186(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 84
LDI r1, 76
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 186
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
