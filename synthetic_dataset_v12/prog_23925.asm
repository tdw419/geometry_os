; DESCRIPTION: Composite: Draws a green rectangle at (327, 116) with width 106 and height 88 then Creates a cyan circular shape at (255, 101) with radius 67 then Draws a blue line from (157, 181) to (402, 21).
; PLAN: r0=327(x), r1=116(y), r2=106(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=101(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=157(x1), r11=181(y1), r12=402(x2), r13=21(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 116
LDI r2, 106
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 101
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 157
LDI r11, 181
LDI r12, 402
LDI r13, 21
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
