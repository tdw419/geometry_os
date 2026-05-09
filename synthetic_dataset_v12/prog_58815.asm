; DESCRIPTION: Composite: Creates a orange circular shape at (160, 172) with radius 56 then Places a yellow line segment connecting (350, 136) to (130, 25) then Creates a yellow rectangular region at (293, 84) spanning 24 by 103 pixels.
; PLAN: r0=160(x), r1=172(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x1), r6=136(y1), r7=130(x2), r8=25(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=84(y), r12=24(width), r13=103(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 172
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 136
LDI r7, 130
LDI r8, 25
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 84
LDI r12, 24
LDI r13, 103
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
