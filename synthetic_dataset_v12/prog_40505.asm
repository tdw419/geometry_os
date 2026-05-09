; DESCRIPTION: Composite: Places a orange line segment connecting (159, 7) to (221, 49) then Creates a yellow circular shape at (313, 152) with radius 52 then Creates a green rectangular region at (349, 109) spanning 98 by 91 pixels.
; PLAN: r0=159(x1), r1=7(y1), r2=221(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=152(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=349(x), r11=109(y), r12=98(width), r13=91(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 7
LDI r2, 221
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 152
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 349
LDI r11, 109
LDI r12, 98
LDI r13, 91
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
