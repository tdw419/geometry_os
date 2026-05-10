; DESCRIPTION: Composite: Draws a red line from (206, 252) to (19, 122) then Draws a purple rectangle at (17, 71) with width 40 and height 24 then Creates a black circular shape at (129, 160) with radius 59.
; PLAN: r0=206(x1), r1=252(y1), r2=19(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=71(y), r7=40(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=129(x), r11=160(y), r12=59(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 252
LDI r2, 19
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 71
LDI r7, 40
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 160
LDI r12, 59
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
