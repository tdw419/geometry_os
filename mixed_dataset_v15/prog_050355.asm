; DESCRIPTION: Composite: Draws a red circle centered at (379, 101) with radius 67 then Places a purple dot at position (106, 87) then Places a orange line segment connecting (138, 97) to (88, 2).
; PLAN: r0=379(x), r1=101(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=87(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=138(x1), r11=97(y1), r12=88(x2), r13=2(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 101
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 87
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 138
LDI r11, 97
LDI r12, 88
LDI r13, 2
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
