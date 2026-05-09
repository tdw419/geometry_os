; DESCRIPTION: Composite: Sets a single cyan pixel at (64, 216) then Renders a purple disk with center (389, 201) and radius 36.
; PLAN: r0=64(x), r1=216(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=201(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 216
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 201
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
