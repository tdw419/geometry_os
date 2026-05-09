; DESCRIPTION: Composite: Draws a orange line from (117, 149) to (229, 41) then Creates a white rectangular region at (332, 57) spanning 36 by 117 pixels.
; PLAN: r0=117(x1), r1=149(y1), r2=229(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=57(y), r7=36(width), r8=117(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 149
LDI r2, 229
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 57
LDI r7, 36
LDI r8, 117
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
