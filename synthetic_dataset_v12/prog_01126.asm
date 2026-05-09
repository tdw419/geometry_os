; DESCRIPTION: Composite: Sets a single orange pixel at (322, 143) then Places a orange line segment connecting (422, 3) to (484, 33).
; PLAN: r0=322(x), r1=143(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=3(y1), r7=484(x2), r8=33(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 143
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 422
LDI r6, 3
LDI r7, 484
LDI r8, 33
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
