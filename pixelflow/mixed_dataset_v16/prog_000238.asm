; DESCRIPTION: Composite: Draws a red line from (24, 147) to (355, 84) then Creates a white rectangular region at (8, 64) spanning 118 by 78 pixels.
; PLAN: r0=24(x1), r1=147(y1), r2=355(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=8(x), r6=64(y), r7=118(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 147
LDI r2, 355
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 64
LDI r7, 118
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
