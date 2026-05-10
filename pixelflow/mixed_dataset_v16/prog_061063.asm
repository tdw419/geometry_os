; DESCRIPTION: Composite: Creates a purple rectangular region at (264, 141) spanning 89 by 37 pixels then Draws a red line from (321, 83) to (139, 52).
; PLAN: r0=264(x), r1=141(y), r2=89(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=83(y1), r7=139(x2), r8=52(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 141
LDI r2, 89
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 83
LDI r7, 139
LDI r8, 52
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
