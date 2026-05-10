; DESCRIPTION: Composite: Draws a orange line from (331, 217) to (422, 197) then Creates a white rectangular region at (0, 94) spanning 90 by 84 pixels then Draws a magenta circle centered at (34, 89) with radius 13.
; PLAN: r0=331(x1), r1=217(y1), r2=422(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=94(y), r7=90(width), r8=84(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x), r11=89(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 217
LDI r2, 422
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 94
LDI r7, 90
LDI r8, 84
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 89
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
