; DESCRIPTION: Composite: Sets a single black pixel at (276, 218) then Renders a black line between points (451, 109) and (221, 52).
; PLAN: r0=276(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=451(x1), r6=109(y1), r7=221(x2), r8=52(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 451
LDI r6, 109
LDI r7, 221
LDI r8, 52
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
