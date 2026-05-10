; DESCRIPTION: Composite: Places a red line segment connecting (272, 158) to (263, 7) then Creates a magenta rectangular region at (144, 97) spanning 79 by 105 pixels then Renders a green disk with center (412, 149) and radius 26.
; PLAN: r0=272(x1), r1=158(y1), r2=263(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=97(y), r7=79(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=149(y), r12=26(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 158
LDI r2, 263
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 97
LDI r7, 79
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 149
LDI r12, 26
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
