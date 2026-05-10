; DESCRIPTION: Composite: Creates a purple circular shape at (230, 110) with radius 58 then Draws a orange rectangle at (251, 154) with width 77 and height 94 then Draws a purple line from (125, 188) to (38, 107).
; PLAN: r0=230(x), r1=110(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=154(y), r7=77(width), r8=94(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=125(x1), r11=188(y1), r12=38(x2), r13=107(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 110
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 154
LDI r7, 77
LDI r8, 94
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 188
LDI r12, 38
LDI r13, 107
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
