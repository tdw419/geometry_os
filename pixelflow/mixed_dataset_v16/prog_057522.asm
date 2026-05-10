; DESCRIPTION: Composite: Draws a blue circle centered at (432, 115) with radius 40 then Places a purple dot at position (49, 158) then Places a blue line segment connecting (314, 84) to (487, 116).
; PLAN: r0=432(x), r1=115(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=158(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=314(x1), r11=84(y1), r12=487(x2), r13=116(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 115
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 158
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 84
LDI r12, 487
LDI r13, 116
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
