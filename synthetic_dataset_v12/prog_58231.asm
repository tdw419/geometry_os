; DESCRIPTION: Composite: Sets a single green pixel at (510, 107) then Places a black line segment connecting (430, 102) to (414, 38).
; PLAN: r0=510(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=430(x1), r6=102(y1), r7=414(x2), r8=38(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 430
LDI r6, 102
LDI r7, 414
LDI r8, 38
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
