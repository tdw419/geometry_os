; DESCRIPTION: Composite: Renders a orange line between points (441, 1) and (71, 152) then Creates a blue rectangular region at (288, 136) spanning 25 by 67 pixels then Draws a purple circle centered at (24, 200) with radius 18.
; PLAN: r0=441(x1), r1=1(y1), r2=71(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=136(y), r7=25(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=24(x), r11=200(y), r12=18(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 441
LDI r1, 1
LDI r2, 71
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 136
LDI r7, 25
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 200
LDI r12, 18
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
