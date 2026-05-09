; DESCRIPTION: Composite: Sets a single blue pixel at (432, 217) then Renders a blue disk with center (250, 60) and radius 52.
; PLAN: r0=432(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=60(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 432
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 250
LDI r6, 60
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
