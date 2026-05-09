; DESCRIPTION: Composite: Draws a white rectangle at (88, 158) with width 72 and height 73 then Draws a purple line from (416, 34) to (206, 110).
; PLAN: r0=88(x), r1=158(y), r2=72(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x1), r6=34(y1), r7=206(x2), r8=110(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 158
LDI r2, 72
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 34
LDI r7, 206
LDI r8, 110
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
