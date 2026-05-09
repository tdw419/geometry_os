; DESCRIPTION: Composite: Creates a red rectangular region at (316, 157) spanning 97 by 73 pixels then Renders a black line between points (76, 247) and (276, 197).
; PLAN: r0=316(x), r1=157(y), r2=97(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=247(y1), r7=276(x2), r8=197(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 157
LDI r2, 97
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 247
LDI r7, 276
LDI r8, 197
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
