; DESCRIPTION: Composite: Places a orange 114x66 rectangle at position (314, 145) then Renders a black line between points (428, 0) and (372, 98) then Creates a white circular shape at (40, 92) with radius 26.
; PLAN: r0=314(x), r1=145(y), r2=114(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x1), r6=0(y1), r7=372(x2), r8=98(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=92(y), r12=26(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 145
LDI r2, 114
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 0
LDI r7, 372
LDI r8, 98
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 92
LDI r12, 26
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
