; DESCRIPTION: Composite: Renders a purple line between points (351, 188) and (405, 241) then Creates a yellow rectangular region at (25, 150) spanning 14 by 17 pixels then Creates a black circular shape at (83, 94) with radius 42.
; PLAN: r0=351(x1), r1=188(y1), r2=405(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=150(y), r7=14(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x), r11=94(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 188
LDI r2, 405
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 150
LDI r7, 14
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 94
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
