; DESCRIPTION: Composite: Creates a yellow rectangular region at (275, 29) spanning 92 by 27 pixels then Creates a purple circular shape at (93, 50) with radius 28 then Places a black line segment connecting (119, 18) to (181, 233).
; PLAN: r0=275(x), r1=29(y), r2=92(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=50(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x1), r11=18(y1), r12=181(x2), r13=233(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 29
LDI r2, 92
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 50
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 18
LDI r12, 181
LDI r13, 233
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
