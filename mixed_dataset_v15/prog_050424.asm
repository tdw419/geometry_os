; DESCRIPTION: Composite: Draws a red rectangle at (31, 82) with width 44 and height 113 then Renders a black disk with center (244, 102) and radius 58 then Renders a orange line between points (499, 245) and (124, 72).
; PLAN: r0=31(x), r1=82(y), r2=44(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=102(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=499(x1), r11=245(y1), r12=124(x2), r13=72(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 82
LDI r2, 44
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 102
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 499
LDI r11, 245
LDI r12, 124
LDI r13, 72
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
