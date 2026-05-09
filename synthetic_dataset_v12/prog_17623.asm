; DESCRIPTION: Composite: Renders a green disk with center (351, 98) and radius 10 then Creates a white rectangular region at (41, 84) spanning 79 by 67 pixels then Places a blue line segment connecting (200, 174) to (123, 183).
; PLAN: r0=351(x), r1=98(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=84(y), r7=79(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x1), r11=174(y1), r12=123(x2), r13=183(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 98
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 84
LDI r7, 79
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 174
LDI r12, 123
LDI r13, 183
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
