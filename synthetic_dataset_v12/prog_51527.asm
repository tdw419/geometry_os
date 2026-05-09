; DESCRIPTION: Composite: Draws a magenta rectangle at (62, 147) with width 58 and height 108 then Creates a orange circular shape at (205, 84) with radius 62 then Places a purple line segment connecting (295, 48) to (419, 77).
; PLAN: r0=62(x), r1=147(y), r2=58(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=84(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x1), r11=48(y1), r12=419(x2), r13=77(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 147
LDI r2, 58
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 84
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 48
LDI r12, 419
LDI r13, 77
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
