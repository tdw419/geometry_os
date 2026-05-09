; DESCRIPTION: Composite: Sets a single red pixel at (83, 57) then Places a black line segment connecting (33, 170) to (61, 26).
; PLAN: r0=83(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=33(x1), r6=170(y1), r7=61(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 33
LDI r6, 170
LDI r7, 61
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
