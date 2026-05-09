; DESCRIPTION: Composite: Places a orange line segment connecting (134, 54) to (149, 117) then Creates a purple circular shape at (104, 107) with radius 64 then Creates a magenta rectangular region at (12, 29) spanning 12 by 72 pixels.
; PLAN: r0=134(x1), r1=54(y1), r2=149(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=107(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=12(x), r11=29(y), r12=12(width), r13=72(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 54
LDI r2, 149
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 107
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 12
LDI r11, 29
LDI r12, 12
LDI r13, 72
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
