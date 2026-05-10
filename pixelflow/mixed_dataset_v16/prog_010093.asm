; DESCRIPTION: Composite: Draws a green circle centered at (124, 156) with radius 75 then Sets a single red pixel at (334, 118).
; PLAN: r0=124(x), r1=156(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=118(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 124
LDI r1, 156
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 118
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
