; DESCRIPTION: Composite: Draws a red line from (167, 252) to (252, 62) then Creates a green rectangular region at (127, 126) spanning 90 by 118 pixels.
; PLAN: r0=167(x1), r1=252(y1), r2=252(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=126(y), r7=90(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 252
LDI r2, 252
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 126
LDI r7, 90
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
