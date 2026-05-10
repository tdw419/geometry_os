; DESCRIPTION: Composite: Places a magenta line segment connecting (444, 114) to (97, 159) then Creates a purple rectangular region at (462, 41) spanning 29 by 83 pixels then Renders a black disk with center (397, 170) and radius 36.
; PLAN: r0=444(x1), r1=114(y1), r2=97(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=41(y), r7=29(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=397(x), r11=170(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 114
LDI r2, 97
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 41
LDI r7, 29
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 170
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
