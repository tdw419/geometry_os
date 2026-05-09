; DESCRIPTION: Composite: Draws a magenta circle centered at (80, 155) with radius 66 then Draws a blue rectangle at (189, 125) with width 37 and height 55 then Renders a white line between points (210, 135) and (255, 23).
; PLAN: r0=80(x), r1=155(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x), r6=125(y), r7=37(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x1), r11=135(y1), r12=255(x2), r13=23(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 155
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 125
LDI r7, 37
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 135
LDI r12, 255
LDI r13, 23
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
