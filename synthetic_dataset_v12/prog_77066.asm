; DESCRIPTION: Composite: Draws a orange line from (353, 13) to (377, 79) then Draws a magenta rectangle at (185, 104) with width 84 and height 80 then Creates a white circular shape at (188, 135) with radius 64.
; PLAN: r0=353(x1), r1=13(y1), r2=377(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=104(y), r7=84(width), r8=80(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=188(x), r11=135(y), r12=64(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 13
LDI r2, 377
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 104
LDI r7, 84
LDI r8, 80
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 135
LDI r12, 64
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
