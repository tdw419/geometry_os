; DESCRIPTION: Composite: Sets a single purple pixel at (75, 51) then Renders a orange disk with center (314, 191) and radius 26.
; PLAN: r0=75(x), r1=51(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=191(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 51
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 314
LDI r6, 191
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
