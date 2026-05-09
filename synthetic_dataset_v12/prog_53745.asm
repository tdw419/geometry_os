; DESCRIPTION: Composite: Places a purple line segment connecting (83, 12) to (348, 58) then Places a orange dot at position (364, 191) then Creates a black circular shape at (302, 139) with radius 28.
; PLAN: r0=83(x1), r1=12(y1), r2=348(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=191(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=139(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 12
LDI r2, 348
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 191
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 302
LDI r11, 139
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
