; DESCRIPTION: Composite: Draws a blue line from (498, 48) to (229, 59) then Creates a magenta rectangular region at (353, 10) spanning 108 by 29 pixels then Places a yellow circle of radius 34 at center (283, 121).
; PLAN: r0=498(x1), r1=48(y1), r2=229(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=10(y), r7=108(width), r8=29(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=283(x), r11=121(y), r12=34(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 498
LDI r1, 48
LDI r2, 229
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 10
LDI r7, 108
LDI r8, 29
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 121
LDI r12, 34
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
