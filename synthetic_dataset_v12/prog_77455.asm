; DESCRIPTION: Composite: Draws a green line from (4, 134) to (47, 92) then Creates a black rectangular region at (7, 97) spanning 45 by 112 pixels then Draws a yellow circle centered at (157, 145) with radius 37.
; PLAN: r0=4(x1), r1=134(y1), r2=47(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=97(y), r7=45(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x), r11=145(y), r12=37(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 134
LDI r2, 47
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 97
LDI r7, 45
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 145
LDI r12, 37
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
