; DESCRIPTION: Composite: Creates a green rectangular region at (163, 34) spanning 78 by 15 pixels then Draws a yellow circle centered at (301, 171) with radius 46 then Draws a black line from (84, 55) to (120, 90).
; PLAN: r0=163(x), r1=34(y), r2=78(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=171(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x1), r11=55(y1), r12=120(x2), r13=90(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 34
LDI r2, 78
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 171
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 55
LDI r12, 120
LDI r13, 90
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
