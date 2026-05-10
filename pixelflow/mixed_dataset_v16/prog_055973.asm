; DESCRIPTION: Composite: Draws a black rectangle at (155, 59) with width 45 and height 48 then Creates a white circular shape at (111, 122) with radius 78 then Draws a orange line from (314, 122) to (66, 33).
; PLAN: r0=155(x), r1=59(y), r2=45(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=122(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x1), r11=122(y1), r12=66(x2), r13=33(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 59
LDI r2, 45
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 122
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 122
LDI r12, 66
LDI r13, 33
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
