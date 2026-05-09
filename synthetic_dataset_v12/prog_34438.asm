; DESCRIPTION: Composite: Creates a red rectangular region at (311, 152) spanning 117 by 40 pixels then Places a white line segment connecting (155, 96) to (344, 4).
; PLAN: r0=311(x), r1=152(y), r2=117(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x1), r6=96(y1), r7=344(x2), r8=4(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 152
LDI r2, 117
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 96
LDI r7, 344
LDI r8, 4
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
