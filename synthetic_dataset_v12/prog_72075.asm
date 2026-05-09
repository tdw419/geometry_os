; DESCRIPTION: Composite: Creates a orange rectangular region at (328, 123) spanning 87 by 39 pixels then Draws a yellow circle centered at (429, 50) with radius 22 then Places a black line segment connecting (225, 68) to (65, 99).
; PLAN: r0=328(x), r1=123(y), r2=87(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x), r6=50(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=225(x1), r11=68(y1), r12=65(x2), r13=99(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 123
LDI r2, 87
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 50
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 225
LDI r11, 68
LDI r12, 65
LDI r13, 99
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
