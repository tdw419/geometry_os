; DESCRIPTION: Composite: Draws a black line from (420, 144) to (355, 109) then Draws a red rectangle at (7, 3) with width 115 and height 79.
; PLAN: r0=420(x1), r1=144(y1), r2=355(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=3(y), r7=115(width), r8=79(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 144
LDI r2, 355
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 3
LDI r7, 115
LDI r8, 79
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
