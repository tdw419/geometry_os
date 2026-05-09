; DESCRIPTION: Composite: Creates a green rectangular region at (172, 113) spanning 118 by 47 pixels then Places a magenta line segment connecting (425, 172) to (0, 84).
; PLAN: r0=172(x), r1=113(y), r2=118(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x1), r6=172(y1), r7=0(x2), r8=84(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 113
LDI r2, 118
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 172
LDI r7, 0
LDI r8, 84
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
