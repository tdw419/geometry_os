; DESCRIPTION: Composite: Creates a purple circular shape at (49, 131) with radius 36 then Creates a yellow rectangular region at (409, 22) spanning 94 by 30 pixels then Draws a black line from (373, 154) to (105, 41).
; PLAN: r0=49(x), r1=131(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=22(y), r7=94(width), r8=30(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=373(x1), r11=154(y1), r12=105(x2), r13=41(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 131
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 22
LDI r7, 94
LDI r8, 30
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 154
LDI r12, 105
LDI r13, 41
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
