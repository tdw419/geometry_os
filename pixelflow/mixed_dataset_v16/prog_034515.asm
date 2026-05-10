; DESCRIPTION: Composite: Sets a single red pixel at (47, 13) then Renders a red disk with center (383, 185) and radius 46.
; PLAN: r0=47(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=185(y), r7=46(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 13
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 383
LDI r6, 185
LDI r7, 46
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
