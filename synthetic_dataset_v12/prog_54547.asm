; DESCRIPTION: Composite: Renders a purple disk with center (430, 176) and radius 28 then Draws a white rectangle at (154, 159) with width 91 and height 73 then Places a yellow line segment connecting (222, 4) to (164, 246).
; PLAN: r0=430(x), r1=176(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=159(y), r7=91(width), r8=73(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x1), r11=4(y1), r12=164(x2), r13=246(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 176
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 159
LDI r7, 91
LDI r8, 73
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 4
LDI r12, 164
LDI r13, 246
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
