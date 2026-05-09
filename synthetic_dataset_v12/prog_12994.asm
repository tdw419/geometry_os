; DESCRIPTION: Composite: Places a white dot at position (322, 228) then Draws a purple line from (149, 90) to (391, 147).
; PLAN: r0=322(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=90(y1), r7=391(x2), r8=147(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 90
LDI r7, 391
LDI r8, 147
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
