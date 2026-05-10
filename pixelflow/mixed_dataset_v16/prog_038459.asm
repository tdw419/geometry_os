; DESCRIPTION: Composite: Draws a purple circle centered at (325, 125) with radius 64 then Draws a blue line from (400, 83) to (62, 245) then Draws a orange rectangle at (43, 136) with width 44 and height 69.
; PLAN: r0=325(x), r1=125(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x1), r6=83(y1), r7=62(x2), r8=245(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=43(x), r11=136(y), r12=44(width), r13=69(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 125
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 83
LDI r7, 62
LDI r8, 245
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 136
LDI r12, 44
LDI r13, 69
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
