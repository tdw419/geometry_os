; DESCRIPTION: Composite: Creates a magenta circular shape at (438, 214) with radius 41 then Draws a blue rectangle at (178, 155) with width 72 and height 96 then Renders a orange line between points (49, 99) and (392, 16).
; PLAN: r0=438(x), r1=214(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=155(y), r7=72(width), r8=96(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x1), r11=99(y1), r12=392(x2), r13=16(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 214
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 155
LDI r7, 72
LDI r8, 96
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 99
LDI r12, 392
LDI r13, 16
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
