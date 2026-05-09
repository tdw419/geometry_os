; DESCRIPTION: Composite: Sets a single red pixel at (337, 30) then Places a orange line segment connecting (26, 106) to (232, 147).
; PLAN: r0=337(x), r1=30(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=26(x1), r6=106(y1), r7=232(x2), r8=147(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 30
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 26
LDI r6, 106
LDI r7, 232
LDI r8, 147
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
