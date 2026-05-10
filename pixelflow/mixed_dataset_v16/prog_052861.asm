; DESCRIPTION: Composite: Draws a blue line from (182, 189) to (311, 119) then Creates a blue rectangular region at (170, 75) spanning 101 by 41 pixels.
; PLAN: r0=182(x1), r1=189(y1), r2=311(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=75(y), r7=101(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 189
LDI r2, 311
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 75
LDI r7, 101
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
