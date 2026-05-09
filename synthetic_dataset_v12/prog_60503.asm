; DESCRIPTION: Composite: Creates a yellow circular shape at (321, 130) with radius 62 then Places a purple line segment connecting (159, 178) to (24, 77) then Draws a blue rectangle at (50, 136) with width 20 and height 95.
; PLAN: r0=321(x), r1=130(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x1), r6=178(y1), r7=24(x2), r8=77(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=50(x), r11=136(y), r12=20(width), r13=95(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 130
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 178
LDI r7, 24
LDI r8, 77
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 136
LDI r12, 20
LDI r13, 95
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
