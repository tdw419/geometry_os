; DESCRIPTION: Composite: Draws a orange rectangle at (440, 130) with width 29 and height 91 then Draws a blue circle centered at (388, 45) with radius 16 then Places a black line segment connecting (7, 20) to (109, 148).
; PLAN: r0=440(x), r1=130(y), r2=29(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=45(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=7(x1), r11=20(y1), r12=109(x2), r13=148(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 130
LDI r2, 29
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 45
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 7
LDI r11, 20
LDI r12, 109
LDI r13, 148
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
