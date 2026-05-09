; DESCRIPTION: Composite: Creates a black rectangular region at (178, 155) spanning 97 by 49 pixels then Places a magenta line segment connecting (15, 134) to (233, 78).
; PLAN: r0=178(x), r1=155(y), r2=97(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=134(y1), r7=233(x2), r8=78(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 155
LDI r2, 97
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 134
LDI r7, 233
LDI r8, 78
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
