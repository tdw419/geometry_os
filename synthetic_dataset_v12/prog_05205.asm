; DESCRIPTION: Composite: Draws a yellow circle centered at (161, 118) with radius 53 then Places a orange line segment connecting (312, 32) to (59, 142) then Places a purple 119x59 rectangle at position (332, 112).
; PLAN: r0=161(x), r1=118(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x1), r6=32(y1), r7=59(x2), r8=142(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=112(y), r12=119(width), r13=59(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 118
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 32
LDI r7, 59
LDI r8, 142
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 112
LDI r12, 119
LDI r13, 59
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
