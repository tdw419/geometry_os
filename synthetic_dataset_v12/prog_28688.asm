; DESCRIPTION: Composite: Places a black 98x93 rectangle at position (9, 129) then Renders a orange line between points (251, 203) and (77, 141) then Draws a purple circle centered at (308, 109) with radius 57.
; PLAN: r0=9(x), r1=129(y), r2=98(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=203(y1), r7=77(x2), r8=141(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=109(y), r12=57(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 129
LDI r2, 98
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 203
LDI r7, 77
LDI r8, 141
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 109
LDI r12, 57
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
