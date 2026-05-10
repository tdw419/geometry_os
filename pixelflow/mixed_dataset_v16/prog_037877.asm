; DESCRIPTION: Composite: Places a magenta line segment connecting (407, 203) to (505, 105) then Renders a green box of size 118x94 starting at (380, 90) then Draws a yellow circle centered at (76, 71) with radius 35.
; PLAN: r0=407(x1), r1=203(y1), r2=505(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=90(y), r7=118(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=71(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 203
LDI r2, 505
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 90
LDI r7, 118
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 71
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
