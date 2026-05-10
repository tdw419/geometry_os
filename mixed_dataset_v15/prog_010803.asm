; DESCRIPTION: Composite: Draws a red circle centered at (109, 199) with radius 35 then Sets a single red pixel at (205, 205).
; PLAN: r0=109(x), r1=199(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=205(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 199
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 205
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
