; DESCRIPTION: Composite: Renders a orange line between points (178, 20) and (248, 212) then Draws a red circle centered at (233, 106) with radius 36 then Creates a black rectangular region at (288, 90) spanning 21 by 94 pixels.
; PLAN: r0=178(x1), r1=20(y1), r2=248(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=106(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=288(x), r11=90(y), r12=21(width), r13=94(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 20
LDI r2, 248
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 106
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 288
LDI r11, 90
LDI r12, 21
LDI r13, 94
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
