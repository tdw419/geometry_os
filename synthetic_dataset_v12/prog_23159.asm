; DESCRIPTION: Composite: Sets a single black pixel at (176, 137) then Draws a purple line from (395, 190) to (187, 66).
; PLAN: r0=176(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=395(x1), r6=190(y1), r7=187(x2), r8=66(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 395
LDI r6, 190
LDI r7, 187
LDI r8, 66
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
