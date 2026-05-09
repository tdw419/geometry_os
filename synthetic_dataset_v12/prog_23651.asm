; DESCRIPTION: Composite: Creates a green rectangular region at (53, 121) spanning 61 by 40 pixels then Draws a orange line from (472, 63) to (225, 176) then Draws a orange circle centered at (265, 148) with radius 10.
; PLAN: r0=53(x), r1=121(y), r2=61(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x1), r6=63(y1), r7=225(x2), r8=176(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=148(y), r12=10(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 53
LDI r1, 121
LDI r2, 61
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 63
LDI r7, 225
LDI r8, 176
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 148
LDI r12, 10
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
