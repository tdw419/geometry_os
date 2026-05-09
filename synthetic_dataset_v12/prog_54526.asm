; DESCRIPTION: Composite: Creates a orange rectangular region at (296, 72) spanning 118 by 11 pixels then Draws a purple line from (126, 218) to (131, 68).
; PLAN: r0=296(x), r1=72(y), r2=118(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=218(y1), r7=131(x2), r8=68(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 72
LDI r2, 118
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 218
LDI r7, 131
LDI r8, 68
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
