; DESCRIPTION: Composite: Creates a red rectangular region at (75, 84) spanning 45 by 29 pixels then Renders a purple line between points (408, 178) and (311, 38).
; PLAN: r0=75(x), r1=84(y), r2=45(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x1), r6=178(y1), r7=311(x2), r8=38(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 84
LDI r2, 45
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 178
LDI r7, 311
LDI r8, 38
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
