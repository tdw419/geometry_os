; DESCRIPTION: Composite: Sets a single yellow pixel at (75, 38) then Renders a purple disk with center (442, 83) and radius 58.
; PLAN: r0=75(x), r1=38(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=83(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 38
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 442
LDI r6, 83
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
