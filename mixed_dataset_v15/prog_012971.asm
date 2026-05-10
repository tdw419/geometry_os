; DESCRIPTION: Composite: Draws a green rectangle at (179, 88) with width 81 and height 97 then Draws a black circle centered at (369, 167) with radius 36 then Places a magenta line segment connecting (373, 252) to (341, 144).
; PLAN: r0=179(x), r1=88(y), r2=81(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x), r6=167(y), r7=36(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x1), r11=252(y1), r12=341(x2), r13=144(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 88
LDI r2, 81
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 167
LDI r7, 36
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 252
LDI r12, 341
LDI r13, 144
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
