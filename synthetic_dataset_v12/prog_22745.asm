; DESCRIPTION: Composite: Creates a blue rectangular region at (85, 71) spanning 81 by 75 pixels then Places a purple line segment connecting (344, 117) to (260, 12).
; PLAN: r0=85(x), r1=71(y), r2=81(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=117(y1), r7=260(x2), r8=12(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 71
LDI r2, 81
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 117
LDI r7, 260
LDI r8, 12
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
