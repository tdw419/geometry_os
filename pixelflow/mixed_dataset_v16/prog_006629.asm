; DESCRIPTION: Composite: Creates a green rectangular region at (428, 155) spanning 68 by 47 pixels then Draws a yellow line from (231, 194) to (93, 176).
; PLAN: r0=428(x), r1=155(y), r2=68(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x1), r6=194(y1), r7=93(x2), r8=176(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 155
LDI r2, 68
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 194
LDI r7, 93
LDI r8, 176
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
