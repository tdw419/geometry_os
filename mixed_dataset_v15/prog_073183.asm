; DESCRIPTION: Composite: Sets a single yellow pixel at (139, 242) then Renders a purple line between points (344, 11) and (260, 197).
; PLAN: r0=139(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=344(x1), r6=11(y1), r7=260(x2), r8=197(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 242
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 344
LDI r6, 11
LDI r7, 260
LDI r8, 197
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
