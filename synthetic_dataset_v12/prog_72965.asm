; DESCRIPTION: Composite: Creates a magenta circular shape at (191, 98) with radius 75 then Sets a single red pixel at (341, 136).
; PLAN: r0=191(x), r1=98(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=136(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 98
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 136
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
