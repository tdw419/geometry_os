; DESCRIPTION: Composite: Renders a orange line between points (235, 102) and (400, 132) then Draws a black rectangle at (70, 122) with width 69 and height 23 then Draws a green circle centered at (438, 179) with radius 25.
; PLAN: r0=235(x1), r1=102(y1), r2=400(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=122(y), r7=69(width), r8=23(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=179(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 102
LDI r2, 400
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 122
LDI r7, 69
LDI r8, 23
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 179
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
