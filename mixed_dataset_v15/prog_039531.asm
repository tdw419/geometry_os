; DESCRIPTION: Composite: Draws a white rectangle at (71, 88) with width 86 and height 104 then Renders a blue line between points (168, 123) and (274, 151) then Renders a orange disk with center (324, 72) and radius 54.
; PLAN: r0=71(x), r1=88(y), r2=86(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x1), r6=123(y1), r7=274(x2), r8=151(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=72(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 88
LDI r2, 86
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 123
LDI r7, 274
LDI r8, 151
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 72
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
