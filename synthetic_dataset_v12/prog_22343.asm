; DESCRIPTION: Composite: Draws a red line from (160, 178) to (472, 71) then Creates a black rectangular region at (176, 41) spanning 13 by 75 pixels.
; PLAN: r0=160(x1), r1=178(y1), r2=472(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=41(y), r7=13(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 178
LDI r2, 472
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 41
LDI r7, 13
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
