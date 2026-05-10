; DESCRIPTION: Composite: Creates a green circular shape at (430, 112) with radius 25 then Sets a single blue pixel at (357, 186).
; PLAN: r0=430(x), r1=112(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=186(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 430
LDI r1, 112
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 186
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
