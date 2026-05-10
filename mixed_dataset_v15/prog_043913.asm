; DESCRIPTION: Composite: Creates a blue rectangular region at (297, 133) spanning 99 by 69 pixels then Places a red dot at position (88, 103) then Creates a yellow circular shape at (432, 84) with radius 61.
; PLAN: r0=297(x), r1=133(y), r2=99(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=432(x), r11=84(y), r12=61(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 133
LDI r2, 99
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 432
LDI r11, 84
LDI r12, 61
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
