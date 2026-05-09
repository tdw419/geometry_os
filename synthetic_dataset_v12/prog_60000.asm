; DESCRIPTION: Composite: Sets a single red pixel at (248, 182) then Draws a purple line from (414, 36) to (366, 124).
; PLAN: r0=248(x), r1=182(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=36(y1), r7=366(x2), r8=124(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 182
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 414
LDI r6, 36
LDI r7, 366
LDI r8, 124
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
