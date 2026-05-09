; DESCRIPTION: Composite: Draws a orange circle centered at (270, 138) with radius 64 then Draws a black rectangle at (41, 13) with width 83 and height 109 then Renders a purple line between points (203, 136) and (208, 94).
; PLAN: r0=270(x), r1=138(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=13(y), r7=83(width), r8=109(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x1), r11=136(y1), r12=208(x2), r13=94(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 138
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 13
LDI r7, 83
LDI r8, 109
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 136
LDI r12, 208
LDI r13, 94
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
