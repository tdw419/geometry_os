; DESCRIPTION: Composite: Draws a orange rectangle at (108, 159) with width 66 and height 25 then Draws a purple line from (307, 136) to (276, 19) then Creates a magenta circular shape at (110, 72) with radius 29.
; PLAN: r0=108(x), r1=159(y), r2=66(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x1), r6=136(y1), r7=276(x2), r8=19(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=110(x), r11=72(y), r12=29(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 159
LDI r2, 66
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 136
LDI r7, 276
LDI r8, 19
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 72
LDI r12, 29
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
