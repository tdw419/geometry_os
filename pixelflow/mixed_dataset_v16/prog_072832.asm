; DESCRIPTION: Composite: Sets a single yellow pixel at (389, 51) then Renders a white disk with center (382, 102) and radius 52.
; PLAN: r0=389(x), r1=51(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=102(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 389
LDI r1, 51
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 382
LDI r6, 102
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
