; DESCRIPTION: Composite: Places a orange line segment connecting (341, 9) to (313, 248) then Creates a green circular shape at (204, 120) with radius 75 then Creates a green rectangular region at (149, 165) spanning 45 by 19 pixels.
; PLAN: r0=341(x1), r1=9(y1), r2=313(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=120(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=165(y), r12=45(width), r13=19(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 9
LDI r2, 313
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 120
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 165
LDI r12, 45
LDI r13, 19
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
