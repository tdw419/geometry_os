; DESCRIPTION: Composite: Draws a black line from (369, 47) to (202, 170) then Creates a green rectangular region at (381, 56) spanning 110 by 116 pixels then Places a black circle of radius 53 at center (118, 148).
; PLAN: r0=369(x1), r1=47(y1), r2=202(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=56(y), r7=110(width), r8=116(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=118(x), r11=148(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 47
LDI r2, 202
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 56
LDI r7, 110
LDI r8, 116
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 148
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
