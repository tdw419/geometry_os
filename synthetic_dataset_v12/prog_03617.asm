; DESCRIPTION: Composite: Draws a orange rectangle at (291, 199) with width 95 and height 56 then Draws a orange line from (321, 169) to (130, 84).
; PLAN: r0=291(x), r1=199(y), r2=95(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=169(y1), r7=130(x2), r8=84(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 199
LDI r2, 95
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 169
LDI r7, 130
LDI r8, 84
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
