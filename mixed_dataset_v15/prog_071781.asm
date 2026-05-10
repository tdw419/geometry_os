; DESCRIPTION: Composite: Creates a orange rectangular region at (367, 57) spanning 86 by 70 pixels then Renders a green line between points (316, 84) and (395, 163).
; PLAN: r0=367(x), r1=57(y), r2=86(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x1), r6=84(y1), r7=395(x2), r8=163(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 57
LDI r2, 86
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 84
LDI r7, 395
LDI r8, 163
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
