; DESCRIPTION: Composite: Draws a yellow rectangle at (67, 206) with width 54 and height 13 then Creates a purple circular shape at (287, 84) with radius 41 then Draws a yellow line from (489, 68) to (323, 244).
; PLAN: r0=67(x), r1=206(y), r2=54(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=84(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x1), r11=68(y1), r12=323(x2), r13=244(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 206
LDI r2, 54
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 84
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 68
LDI r12, 323
LDI r13, 244
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
