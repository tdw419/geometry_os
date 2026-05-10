; DESCRIPTION: Composite: Places a orange line segment connecting (430, 186) to (189, 232) then Places a red 60x13 rectangle at position (312, 72) then Places a white circle of radius 52 at center (247, 94).
; PLAN: r0=430(x1), r1=186(y1), r2=189(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=72(y), r7=60(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=247(x), r11=94(y), r12=52(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 186
LDI r2, 189
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 72
LDI r7, 60
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 94
LDI r12, 52
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
