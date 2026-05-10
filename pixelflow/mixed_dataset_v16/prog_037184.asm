; DESCRIPTION: Composite: Sets a single yellow pixel at (114, 2) then Places a black line segment connecting (314, 74) to (190, 75).
; PLAN: r0=114(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=314(x1), r6=74(y1), r7=190(x2), r8=75(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 2
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 314
LDI r6, 74
LDI r7, 190
LDI r8, 75
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
