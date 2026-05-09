; DESCRIPTION: Composite: Places a black line segment connecting (61, 146) to (423, 233) then Places a orange dot at position (442, 182) then Creates a yellow rectangular region at (62, 88) spanning 78 by 53 pixels.
; PLAN: r0=61(x1), r1=146(y1), r2=423(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=182(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=62(x), r11=88(y), r12=78(width), r13=53(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 146
LDI r2, 423
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 182
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 62
LDI r11, 88
LDI r12, 78
LDI r13, 53
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
