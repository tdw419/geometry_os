; DESCRIPTION: Composite: Places a purple line segment connecting (307, 61) to (496, 22) then Draws a magenta rectangle at (317, 169) with width 34 and height 40 then Draws a blue circle centered at (93, 176) with radius 80.
; PLAN: r0=307(x1), r1=61(y1), r2=496(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=169(y), r7=34(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x), r11=176(y), r12=80(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 61
LDI r2, 496
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 169
LDI r7, 34
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 176
LDI r12, 80
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
