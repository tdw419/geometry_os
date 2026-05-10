; DESCRIPTION: Composite: Creates a purple rectangular region at (299, 20) spanning 85 by 15 pixels then Creates a orange circular shape at (38, 78) with radius 22 then Renders a orange line between points (152, 54) and (206, 247).
; PLAN: r0=299(x), r1=20(y), r2=85(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=78(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=152(x1), r11=54(y1), r12=206(x2), r13=247(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 20
LDI r2, 85
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 78
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 152
LDI r11, 54
LDI r12, 206
LDI r13, 247
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
