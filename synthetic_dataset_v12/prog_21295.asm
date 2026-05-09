; DESCRIPTION: Composite: Draws a green rectangle at (312, 75) with width 32 and height 22 then Draws a orange circle centered at (224, 175) with radius 73 then Places a green line segment connecting (491, 167) to (372, 37).
; PLAN: r0=312(x), r1=75(y), r2=32(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=175(y), r7=73(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=491(x1), r11=167(y1), r12=372(x2), r13=37(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 75
LDI r2, 32
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 175
LDI r7, 73
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 491
LDI r11, 167
LDI r12, 372
LDI r13, 37
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
