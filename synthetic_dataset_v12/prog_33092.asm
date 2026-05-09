; DESCRIPTION: Composite: Creates a blue rectangular region at (252, 123) spanning 52 by 22 pixels then Creates a blue circular shape at (345, 160) with radius 39 then Places a green line segment connecting (325, 1) to (448, 118).
; PLAN: r0=252(x), r1=123(y), r2=52(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=160(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=325(x1), r11=1(y1), r12=448(x2), r13=118(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 123
LDI r2, 52
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 160
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 325
LDI r11, 1
LDI r12, 448
LDI r13, 118
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
