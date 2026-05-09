; DESCRIPTION: Composite: Draws a purple rectangle at (4, 150) with width 119 and height 51 then Creates a magenta circular shape at (456, 163) with radius 23 then Places a orange line segment connecting (392, 167) to (238, 245).
; PLAN: r0=4(x), r1=150(y), r2=119(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=163(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=392(x1), r11=167(y1), r12=238(x2), r13=245(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 150
LDI r2, 119
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 163
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 392
LDI r11, 167
LDI r12, 238
LDI r13, 245
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
