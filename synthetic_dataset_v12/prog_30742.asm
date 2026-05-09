; DESCRIPTION: Composite: Creates a magenta rectangular region at (182, 123) spanning 10 by 41 pixels then Draws a purple line from (16, 40) to (116, 14).
; PLAN: r0=182(x), r1=123(y), r2=10(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=40(y1), r7=116(x2), r8=14(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 123
LDI r2, 10
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 40
LDI r7, 116
LDI r8, 14
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
