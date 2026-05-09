; DESCRIPTION: Composite: Sets a single purple pixel at (94, 10) then Renders a yellow disk with center (266, 102) and radius 76.
; PLAN: r0=94(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=102(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 102
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
