; DESCRIPTION: Composite: Creates a green rectangular region at (350, 90) spanning 84 by 17 pixels then Creates a green circular shape at (132, 178) with radius 20 then Draws a orange line from (376, 237) to (413, 56).
; PLAN: r0=350(x), r1=90(y), r2=84(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=178(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x1), r11=237(y1), r12=413(x2), r13=56(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 90
LDI r2, 84
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 178
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 237
LDI r12, 413
LDI r13, 56
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
