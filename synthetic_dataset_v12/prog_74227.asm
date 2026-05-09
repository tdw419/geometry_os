; DESCRIPTION: Composite: Renders a magenta line between points (280, 91) and (476, 189) then Draws a green rectangle at (295, 112) with width 20 and height 60 then Creates a blue circular shape at (377, 104) with radius 69.
; PLAN: r0=280(x1), r1=91(y1), r2=476(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=112(y), r7=20(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x), r11=104(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 91
LDI r2, 476
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 112
LDI r7, 20
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 104
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
