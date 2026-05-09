; DESCRIPTION: Composite: Creates a magenta rectangular region at (366, 103) spanning 86 by 63 pixels then Draws a red line from (172, 246) to (172, 149).
; PLAN: r0=366(x), r1=103(y), r2=86(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=246(y1), r7=172(x2), r8=149(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 103
LDI r2, 86
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 246
LDI r7, 172
LDI r8, 149
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
