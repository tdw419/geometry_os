; DESCRIPTION: Composite: Creates a blue rectangular region at (179, 80) spanning 45 by 101 pixels then Places a orange line segment connecting (247, 20) to (511, 71) then Draws a green circle centered at (411, 106) with radius 13.
; PLAN: r0=179(x), r1=80(y), r2=45(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x1), r6=20(y1), r7=511(x2), r8=71(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=106(y), r12=13(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 80
LDI r2, 45
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 20
LDI r7, 511
LDI r8, 71
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 106
LDI r12, 13
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
