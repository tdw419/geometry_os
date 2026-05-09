; DESCRIPTION: Composite: Places a orange line segment connecting (34, 31) to (369, 91) then Places a magenta circle of radius 43 at center (119, 144) then Places a purple 48x68 rectangle at position (320, 26).
; PLAN: r0=34(x1), r1=31(y1), r2=369(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=144(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=320(x), r11=26(y), r12=48(width), r13=68(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 31
LDI r2, 369
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 144
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 320
LDI r11, 26
LDI r12, 48
LDI r13, 68
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
