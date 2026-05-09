; DESCRIPTION: Composite: Draws a black line from (474, 132) to (47, 223) then Renders a yellow box of size 20x101 starting at (84, 54) then Renders a green disk with center (156, 178) and radius 77.
; PLAN: r0=474(x1), r1=132(y1), r2=47(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=54(y), r7=20(width), r8=101(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=178(y), r12=77(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 474
LDI r1, 132
LDI r2, 47
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 54
LDI r7, 20
LDI r8, 101
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 178
LDI r12, 77
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
