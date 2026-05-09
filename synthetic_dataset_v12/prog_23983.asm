; DESCRIPTION: Composite: Creates a green rectangular region at (319, 100) spanning 73 by 96 pixels then Places a red line segment connecting (118, 140) to (24, 141).
; PLAN: r0=319(x), r1=100(y), r2=73(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=140(y1), r7=24(x2), r8=141(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 100
LDI r2, 73
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 140
LDI r7, 24
LDI r8, 141
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
