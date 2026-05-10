; DESCRIPTION: Composite: Creates a orange rectangular region at (332, 12) spanning 13 by 30 pixels then Places a purple line segment connecting (185, 61) to (322, 23) then Draws a magenta circle centered at (45, 149) with radius 13.
; PLAN: r0=332(x), r1=12(y), r2=13(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x1), r6=61(y1), r7=322(x2), r8=23(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=149(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 332
LDI r1, 12
LDI r2, 13
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 61
LDI r7, 322
LDI r8, 23
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 149
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
