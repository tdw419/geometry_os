; DESCRIPTION: Composite: Creates a white rectangular region at (254, 22) spanning 115 by 117 pixels then Draws a blue line from (353, 34) to (132, 163).
; PLAN: r0=254(x), r1=22(y), r2=115(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x1), r6=34(y1), r7=132(x2), r8=163(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 22
LDI r2, 115
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 34
LDI r7, 132
LDI r8, 163
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
