; DESCRIPTION: Composite: Creates a blue rectangular region at (445, 82) spanning 26 by 13 pixels then Draws a magenta line from (56, 144) to (122, 248) then Creates a purple circular shape at (461, 160) with radius 25.
; PLAN: r0=445(x), r1=82(y), r2=26(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x1), r6=144(y1), r7=122(x2), r8=248(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=461(x), r11=160(y), r12=25(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 445
LDI r1, 82
LDI r2, 26
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 144
LDI r7, 122
LDI r8, 248
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 461
LDI r11, 160
LDI r12, 25
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
