; DESCRIPTION: Composite: Draws a black line from (373, 227) to (369, 247) then Places a purple circle of radius 19 at center (370, 26) then Creates a purple rectangular region at (276, 170) spanning 101 by 70 pixels.
; PLAN: r0=373(x1), r1=227(y1), r2=369(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=26(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=276(x), r11=170(y), r12=101(width), r13=70(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 227
LDI r2, 369
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 26
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 276
LDI r11, 170
LDI r12, 101
LDI r13, 70
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
