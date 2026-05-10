; DESCRIPTION: Composite: Draws a red line from (122, 81) to (81, 149) then Draws a purple rectangle at (9, 148) with width 119 and height 69.
; PLAN: r0=122(x1), r1=81(y1), r2=81(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=148(y), r7=119(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 122
LDI r1, 81
LDI r2, 81
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 148
LDI r7, 119
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
