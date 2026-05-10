; DESCRIPTION: Composite: Renders a black line between points (386, 37) and (350, 22) then Creates a orange rectangular region at (353, 91) spanning 97 by 118 pixels then Draws a black circle centered at (298, 147) with radius 19.
; PLAN: r0=386(x1), r1=37(y1), r2=350(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=91(y), r7=97(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=298(x), r11=147(y), r12=19(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 386
LDI r1, 37
LDI r2, 350
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 91
LDI r7, 97
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 147
LDI r12, 19
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
