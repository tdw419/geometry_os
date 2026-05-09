; DESCRIPTION: Composite: Sets a single purple pixel at (359, 216) then Draws a orange line from (7, 227) to (37, 183).
; PLAN: r0=359(x), r1=216(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=7(x1), r6=227(y1), r7=37(x2), r8=183(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 216
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 227
LDI r7, 37
LDI r8, 183
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
