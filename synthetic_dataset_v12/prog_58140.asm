; DESCRIPTION: Composite: Draws a yellow rectangle at (425, 123) with width 12 and height 48 then Places a blue line segment connecting (232, 22) to (332, 43) then Renders a magenta disk with center (454, 139) and radius 18.
; PLAN: r0=425(x), r1=123(y), r2=12(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x1), r6=22(y1), r7=332(x2), r8=43(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=139(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 425
LDI r1, 123
LDI r2, 12
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 22
LDI r7, 332
LDI r8, 43
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 139
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
