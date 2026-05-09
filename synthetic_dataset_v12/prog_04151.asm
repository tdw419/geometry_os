; DESCRIPTION: Composite: Places a white 78x118 rectangle at position (390, 68) then Renders a green line between points (105, 107) and (83, 99) then Draws a black circle centered at (344, 127) with radius 77.
; PLAN: r0=390(x), r1=68(y), r2=78(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x1), r6=107(y1), r7=83(x2), r8=99(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=127(y), r12=77(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 68
LDI r2, 78
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 107
LDI r7, 83
LDI r8, 99
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 127
LDI r12, 77
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
