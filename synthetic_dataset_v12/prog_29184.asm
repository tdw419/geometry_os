; DESCRIPTION: Composite: Places a black line segment connecting (270, 66) to (56, 117) then Draws a orange rectangle at (287, 97) with width 106 and height 80.
; PLAN: r0=270(x1), r1=66(y1), r2=56(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=97(y), r7=106(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 66
LDI r2, 56
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 97
LDI r7, 106
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
