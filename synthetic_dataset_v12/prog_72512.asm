; DESCRIPTION: Composite: Draws a blue circle centered at (134, 181) with radius 47 then Draws a red rectangle at (182, 99) with width 89 and height 45 then Places a orange line segment connecting (315, 64) to (357, 143).
; PLAN: r0=134(x), r1=181(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=99(y), r7=89(width), r8=45(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x1), r11=64(y1), r12=357(x2), r13=143(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 181
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 99
LDI r7, 89
LDI r8, 45
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 64
LDI r12, 357
LDI r13, 143
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
