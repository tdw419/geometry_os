; DESCRIPTION: Composite: Draws a purple line from (302, 1) to (470, 174) then Creates a red circular shape at (314, 77) with radius 25 then Creates a white rectangular region at (169, 26) spanning 30 by 101 pixels.
; PLAN: r0=302(x1), r1=1(y1), r2=470(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=77(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=26(y), r12=30(width), r13=101(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 1
LDI r2, 470
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 77
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 26
LDI r12, 30
LDI r13, 101
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
