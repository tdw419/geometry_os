; DESCRIPTION: Composite: Creates a red rectangular region at (227, 5) spanning 31 by 64 pixels then Places a orange line segment connecting (117, 92) to (163, 133) then Creates a orange circular shape at (437, 146) with radius 63.
; PLAN: r0=227(x), r1=5(y), r2=31(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=92(y1), r7=163(x2), r8=133(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=146(y), r12=63(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 227
LDI r1, 5
LDI r2, 31
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 92
LDI r7, 163
LDI r8, 133
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 146
LDI r12, 63
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
