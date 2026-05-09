; DESCRIPTION: Composite: Places a blue line segment connecting (411, 99) to (65, 240) then Places a purple 91x23 rectangle at position (315, 100) then Places a yellow circle of radius 49 at center (408, 123).
; PLAN: r0=411(x1), r1=99(y1), r2=65(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=100(y), r7=91(width), r8=23(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=123(y), r12=49(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 411
LDI r1, 99
LDI r2, 65
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 100
LDI r7, 91
LDI r8, 23
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 123
LDI r12, 49
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
