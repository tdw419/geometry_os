; DESCRIPTION: Composite: Creates a white rectangular region at (47, 35) spanning 68 by 100 pixels then Draws a blue line from (276, 213) to (117, 94).
; PLAN: r0=47(x), r1=35(y), r2=68(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=213(y1), r7=117(x2), r8=94(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 35
LDI r2, 68
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 213
LDI r7, 117
LDI r8, 94
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
