; DESCRIPTION: Composite: Draws a white circle centered at (82, 130) with radius 78 then Renders a orange line between points (359, 208) and (321, 160) then Creates a white rectangular region at (38, 96) spanning 118 by 17 pixels.
; PLAN: r0=82(x), r1=130(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x1), r6=208(y1), r7=321(x2), r8=160(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=38(x), r11=96(y), r12=118(width), r13=17(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 130
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 208
LDI r7, 321
LDI r8, 160
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 96
LDI r12, 118
LDI r13, 17
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
