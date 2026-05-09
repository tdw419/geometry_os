; DESCRIPTION: Composite: Renders a black line between points (244, 203) and (296, 125) then Creates a green circular shape at (396, 107) with radius 36 then Creates a orange rectangular region at (139, 93) spanning 24 by 109 pixels.
; PLAN: r0=244(x1), r1=203(y1), r2=296(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=107(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x), r11=93(y), r12=24(width), r13=109(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 203
LDI r2, 296
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 107
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 93
LDI r12, 24
LDI r13, 109
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
