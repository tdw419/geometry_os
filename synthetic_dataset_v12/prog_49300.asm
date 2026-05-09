; DESCRIPTION: Composite: Draws a orange line from (477, 69) to (331, 98) then Creates a purple circular shape at (475, 40) with radius 26 then Creates a white rectangular region at (165, 50) spanning 66 by 98 pixels.
; PLAN: r0=477(x1), r1=69(y1), r2=331(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=40(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=165(x), r11=50(y), r12=66(width), r13=98(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 69
LDI r2, 331
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 40
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 165
LDI r11, 50
LDI r12, 66
LDI r13, 98
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
