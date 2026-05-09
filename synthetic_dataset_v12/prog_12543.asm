; DESCRIPTION: Composite: Draws a red line from (175, 235) to (355, 146) then Creates a green rectangular region at (211, 145) spanning 88 by 97 pixels.
; PLAN: r0=175(x1), r1=235(y1), r2=355(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=145(y), r7=88(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 235
LDI r2, 355
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 145
LDI r7, 88
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
