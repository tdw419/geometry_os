; DESCRIPTION: Composite: Draws a purple rectangle at (216, 148) with width 49 and height 68 then Draws a magenta line from (41, 231) to (183, 77).
; PLAN: r0=216(x), r1=148(y), r2=49(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x1), r6=231(y1), r7=183(x2), r8=77(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 148
LDI r2, 49
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 231
LDI r7, 183
LDI r8, 77
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
