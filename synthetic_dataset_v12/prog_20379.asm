; DESCRIPTION: Composite: Sets a single black pixel at (486, 185) then Places a orange line segment connecting (496, 26) to (363, 219).
; PLAN: r0=486(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=496(x1), r6=26(y1), r7=363(x2), r8=219(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 185
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 496
LDI r6, 26
LDI r7, 363
LDI r8, 219
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
