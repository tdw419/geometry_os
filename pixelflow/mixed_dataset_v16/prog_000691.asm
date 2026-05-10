; DESCRIPTION: Composite: Places a yellow circle of radius 55 at center (369, 55) then Creates a red rectangular region at (90, 141) spanning 97 by 40 pixels then Draws a orange line from (447, 7) to (115, 45).
; PLAN: r0=369(x), r1=55(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x), r6=141(y), r7=97(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=447(x1), r11=7(y1), r12=115(x2), r13=45(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 55
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 141
LDI r7, 97
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 7
LDI r12, 115
LDI r13, 45
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
