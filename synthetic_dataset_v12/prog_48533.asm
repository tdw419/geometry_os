; DESCRIPTION: Composite: Draws a magenta rectangle at (88, 4) with width 107 and height 38 then Places a orange circle of radius 20 at center (402, 234) then Renders a white line between points (137, 74) and (270, 248).
; PLAN: r0=88(x), r1=4(y), r2=107(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=234(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x1), r11=74(y1), r12=270(x2), r13=248(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 4
LDI r2, 107
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 234
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 74
LDI r12, 270
LDI r13, 248
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
