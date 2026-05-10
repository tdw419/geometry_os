; DESCRIPTION: Composite: Places a white dot at position (300, 232) then Places a orange 54x106 rectangle at position (378, 78) then Creates a purple circular shape at (94, 113) with radius 58.
; PLAN: r0=300(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=78(y), r7=54(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=113(y), r12=58(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 78
LDI r7, 54
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 113
LDI r12, 58
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
