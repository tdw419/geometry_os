; DESCRIPTION: Composite: Draws a purple rectangle at (124, 79) with width 100 and height 24 then Draws a blue circle centered at (275, 175) with radius 68 then Draws a black line from (113, 144) to (183, 62).
; PLAN: r0=124(x), r1=79(y), r2=100(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=175(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x1), r11=144(y1), r12=183(x2), r13=62(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 79
LDI r2, 100
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 175
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 144
LDI r12, 183
LDI r13, 62
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
