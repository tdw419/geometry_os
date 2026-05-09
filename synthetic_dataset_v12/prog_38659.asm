; DESCRIPTION: Composite: Draws a red circle centered at (378, 110) with radius 68 then Places a orange line segment connecting (159, 182) to (4, 82).
; PLAN: r0=378(x), r1=110(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x1), r6=182(y1), r7=4(x2), r8=82(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 110
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 182
LDI r7, 4
LDI r8, 82
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
