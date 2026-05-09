; DESCRIPTION: Composite: Creates a blue rectangular region at (475, 111) spanning 29 by 106 pixels then Draws a purple line from (130, 162) to (161, 61).
; PLAN: r0=475(x), r1=111(y), r2=29(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=162(y1), r7=161(x2), r8=61(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 111
LDI r2, 29
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 162
LDI r7, 161
LDI r8, 61
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
