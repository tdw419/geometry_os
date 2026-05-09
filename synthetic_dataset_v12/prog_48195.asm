; DESCRIPTION: Composite: Draws a black rectangle at (240, 121) with width 33 and height 119 then Renders a magenta disk with center (411, 194) and radius 28 then Places a blue line segment connecting (67, 178) to (128, 121).
; PLAN: r0=240(x), r1=121(y), r2=33(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=194(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x1), r11=178(y1), r12=128(x2), r13=121(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 121
LDI r2, 33
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 194
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 178
LDI r12, 128
LDI r13, 121
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
