; DESCRIPTION: Composite: Draws a purple line from (455, 255) to (16, 80) then Draws a red rectangle at (388, 156) with width 109 and height 41.
; PLAN: r0=455(x1), r1=255(y1), r2=16(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=156(y), r7=109(width), r8=41(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 255
LDI r2, 16
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 156
LDI r7, 109
LDI r8, 41
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
