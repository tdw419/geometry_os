; DESCRIPTION: Composite: Draws a yellow circle centered at (284, 52) with radius 31 then Creates a green rectangular region at (111, 83) spanning 38 by 119 pixels then Renders a orange line between points (94, 51) and (288, 115).
; PLAN: r0=284(x), r1=52(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=83(y), r7=38(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x1), r11=51(y1), r12=288(x2), r13=115(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 52
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 83
LDI r7, 38
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 51
LDI r12, 288
LDI r13, 115
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
