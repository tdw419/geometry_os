; DESCRIPTION: Composite: Creates a yellow rectangular region at (312, 136) spanning 22 by 39 pixels then Creates a green circular shape at (49, 197) with radius 49 then Places a blue line segment connecting (310, 200) to (186, 22).
; PLAN: r0=312(x), r1=136(y), r2=22(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=197(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x1), r11=200(y1), r12=186(x2), r13=22(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 136
LDI r2, 22
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 197
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 200
LDI r12, 186
LDI r13, 22
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
