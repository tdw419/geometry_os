; DESCRIPTION: Composite: Renders a green box of size 22x78 starting at (248, 114) then Places a red line segment connecting (432, 37) to (393, 235) then Draws a orange circle centered at (189, 77) with radius 32.
; PLAN: r0=248(x), r1=114(y), r2=22(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=37(y1), r7=393(x2), r8=235(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=77(y), r12=32(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 114
LDI r2, 22
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 37
LDI r7, 393
LDI r8, 235
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 77
LDI r12, 32
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
