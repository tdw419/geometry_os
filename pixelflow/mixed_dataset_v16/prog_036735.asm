; DESCRIPTION: Composite: Places a orange line segment connecting (386, 107) to (122, 251) then Sets a single red pixel at (489, 249).
; PLAN: r0=386(x1), r1=107(y1), r2=122(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=249(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 107
LDI r2, 122
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 249
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
