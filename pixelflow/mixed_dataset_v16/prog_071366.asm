; DESCRIPTION: Composite: Places a orange circle of radius 15 at center (147, 49) then Places a purple line segment connecting (493, 214) to (37, 6) then Creates a red rectangular region at (51, 61) spanning 78 by 81 pixels.
; PLAN: r0=147(x), r1=49(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x1), r6=214(y1), r7=37(x2), r8=6(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=61(y), r12=78(width), r13=81(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 49
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 214
LDI r7, 37
LDI r8, 6
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 61
LDI r12, 78
LDI r13, 81
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
