; DESCRIPTION: Composite: Draws a blue circle centered at (278, 79) with radius 72 then Creates a green rectangular region at (258, 104) spanning 49 by 52 pixels then Draws a black line from (171, 132) to (48, 201).
; PLAN: r0=278(x), r1=79(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=104(y), r7=49(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x1), r11=132(y1), r12=48(x2), r13=201(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 79
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 104
LDI r7, 49
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 132
LDI r12, 48
LDI r13, 201
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
