; DESCRIPTION: Composite: Renders a orange disk with center (428, 191) and radius 27 then Draws a green rectangle at (183, 172) with width 17 and height 22 then Places a yellow line segment connecting (93, 2) to (115, 8).
; PLAN: r0=428(x), r1=191(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=172(y), r7=17(width), r8=22(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x1), r11=2(y1), r12=115(x2), r13=8(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 191
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 172
LDI r7, 17
LDI r8, 22
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 2
LDI r12, 115
LDI r13, 8
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
