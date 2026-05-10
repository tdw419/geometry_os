; DESCRIPTION: Composite: Draws a white rectangle at (417, 214) with width 54 and height 41 then Draws a orange line from (359, 124) to (366, 23).
; PLAN: r0=417(x), r1=214(y), r2=54(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x1), r6=124(y1), r7=366(x2), r8=23(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 214
LDI r2, 54
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 124
LDI r7, 366
LDI r8, 23
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
