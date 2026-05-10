; DESCRIPTION: Composite: Draws a red rectangle at (366, 183) with width 59 and height 70 then Renders a orange disk with center (262, 91) and radius 46 then Renders a yellow line between points (245, 122) and (471, 244).
; PLAN: r0=366(x), r1=183(y), r2=59(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=91(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x1), r11=122(y1), r12=471(x2), r13=244(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 183
LDI r2, 59
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 91
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 122
LDI r12, 471
LDI r13, 244
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
