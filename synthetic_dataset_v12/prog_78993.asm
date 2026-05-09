; DESCRIPTION: Composite: Draws a purple line from (489, 81) to (343, 57) then Draws a cyan rectangle at (25, 148) with width 76 and height 91 then Creates a black circular shape at (100, 117) with radius 54.
; PLAN: r0=489(x1), r1=81(y1), r2=343(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=148(y), r7=76(width), r8=91(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=117(y), r12=54(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 81
LDI r2, 343
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 148
LDI r7, 76
LDI r8, 91
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 117
LDI r12, 54
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
