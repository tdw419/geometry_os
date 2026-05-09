; DESCRIPTION: Composite: Sets a single blue pixel at (200, 18) then Places a purple line segment connecting (494, 137) to (268, 89).
; PLAN: r0=200(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=494(x1), r6=137(y1), r7=268(x2), r8=89(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 18
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 494
LDI r6, 137
LDI r7, 268
LDI r8, 89
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
