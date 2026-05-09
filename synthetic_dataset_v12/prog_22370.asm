; DESCRIPTION: Composite: Renders a white line between points (310, 100) and (471, 83) then Draws a black rectangle at (287, 43) with width 23 and height 116 then Creates a orange circular shape at (296, 69) with radius 66.
; PLAN: r0=310(x1), r1=100(y1), r2=471(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=43(y), r7=23(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=69(y), r12=66(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 310
LDI r1, 100
LDI r2, 471
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 43
LDI r7, 23
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 69
LDI r12, 66
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
