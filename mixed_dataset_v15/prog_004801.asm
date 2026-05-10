; DESCRIPTION: Composite: Draws a red circle centered at (105, 117) with radius 18 then Creates a black rectangular region at (207, 163) spanning 108 by 87 pixels then Places a blue line segment connecting (317, 147) to (20, 88).
; PLAN: r0=105(x), r1=117(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=163(y), r7=108(width), r8=87(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x1), r11=147(y1), r12=20(x2), r13=88(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 117
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 163
LDI r7, 108
LDI r8, 87
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 147
LDI r12, 20
LDI r13, 88
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
