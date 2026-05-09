; DESCRIPTION: Composite: Places a red line segment connecting (7, 18) to (122, 140) then Draws a orange circle centered at (375, 216) with radius 10 then Creates a purple rectangular region at (80, 37) spanning 11 by 94 pixels.
; PLAN: r0=7(x1), r1=18(y1), r2=122(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=216(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x), r11=37(y), r12=11(width), r13=94(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 7
LDI r1, 18
LDI r2, 122
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 216
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 37
LDI r12, 11
LDI r13, 94
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
