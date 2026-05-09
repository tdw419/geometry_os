; DESCRIPTION: Composite: Sets a single blue pixel at (192, 216) then Places a purple circle of radius 75 at center (287, 140).
; PLAN: r0=192(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=140(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 192
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 140
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
