; DESCRIPTION: Composite: Places a yellow line segment connecting (203, 110) to (52, 58) then Places a magenta circle of radius 23 at center (236, 117) then Draws a magenta rectangle at (96, 47) with width 55 and height 76.
; PLAN: r0=203(x1), r1=110(y1), r2=52(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=117(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x), r11=47(y), r12=55(width), r13=76(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 110
LDI r2, 52
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 117
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 47
LDI r12, 55
LDI r13, 76
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
