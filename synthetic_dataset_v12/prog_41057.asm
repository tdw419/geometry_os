; DESCRIPTION: Composite: Places a orange circle of radius 68 at center (247, 99) then Draws a red rectangle at (89, 58) with width 66 and height 80 then Renders a blue line between points (17, 127) and (357, 6).
; PLAN: r0=247(x), r1=99(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=58(y), r7=66(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=17(x1), r11=127(y1), r12=357(x2), r13=6(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 99
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 58
LDI r7, 66
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 127
LDI r12, 357
LDI r13, 6
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
