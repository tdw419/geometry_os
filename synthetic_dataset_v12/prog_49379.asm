; DESCRIPTION: Composite: Draws a yellow rectangle at (178, 90) with width 98 and height 74 then Renders a white line between points (20, 234) and (192, 196) then Draws a orange circle centered at (396, 155) with radius 78.
; PLAN: r0=178(x), r1=90(y), r2=98(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x1), r6=234(y1), r7=192(x2), r8=196(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=155(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 178
LDI r1, 90
LDI r2, 98
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 234
LDI r7, 192
LDI r8, 196
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 155
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
