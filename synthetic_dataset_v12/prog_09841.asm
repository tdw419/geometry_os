; DESCRIPTION: Composite: Places a yellow circle of radius 13 at center (189, 127) then Draws a orange line from (86, 222) to (353, 105) then Creates a magenta rectangular region at (150, 86) spanning 27 by 93 pixels.
; PLAN: r0=189(x), r1=127(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x1), r6=222(y1), r7=353(x2), r8=105(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=86(y), r12=27(width), r13=93(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 127
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 222
LDI r7, 353
LDI r8, 105
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 86
LDI r12, 27
LDI r13, 93
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
