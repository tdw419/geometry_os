; DESCRIPTION: Composite: Draws a orange rectangle at (94, 241) with width 112 and height 15 then Creates a blue circular shape at (49, 73) with radius 10 then Places a white line segment connecting (163, 111) to (34, 51).
; PLAN: r0=94(x), r1=241(y), r2=112(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=73(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x1), r11=111(y1), r12=34(x2), r13=51(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 241
LDI r2, 112
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 73
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 111
LDI r12, 34
LDI r13, 51
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
