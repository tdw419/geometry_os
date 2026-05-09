; DESCRIPTION: Composite: Draws a purple rectangle at (259, 8) with width 92 and height 120 then Draws a magenta line from (366, 122) to (342, 118).
; PLAN: r0=259(x), r1=8(y), r2=92(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x1), r6=122(y1), r7=342(x2), r8=118(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 8
LDI r2, 92
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 122
LDI r7, 342
LDI r8, 118
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
