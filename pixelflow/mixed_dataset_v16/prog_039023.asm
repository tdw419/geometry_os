; DESCRIPTION: Composite: Draws a purple line from (276, 78) to (444, 91) then Draws a yellow rectangle at (430, 117) with width 77 and height 66.
; PLAN: r0=276(x1), r1=78(y1), r2=444(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=117(y), r7=77(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 78
LDI r2, 444
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 117
LDI r7, 77
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
