; DESCRIPTION: Composite: Places a green line segment connecting (123, 126) to (36, 217) then Renders a red disk with center (203, 200) and radius 54 then Draws a magenta rectangle at (10, 161) with width 91 and height 38.
; PLAN: r0=123(x1), r1=126(y1), r2=36(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=200(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=10(x), r11=161(y), r12=91(width), r13=38(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 126
LDI r2, 36
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 200
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 10
LDI r11, 161
LDI r12, 91
LDI r13, 38
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
