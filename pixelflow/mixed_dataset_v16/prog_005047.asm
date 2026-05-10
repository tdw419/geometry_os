; DESCRIPTION: Composite: Places a black 14x104 rectangle at position (472, 108) then Sets a single black pixel at (136, 34) then Creates a black circular shape at (451, 63) with radius 30.
; PLAN: r0=472(x), r1=108(y), r2=14(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=34(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=451(x), r11=63(y), r12=30(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 472
LDI r1, 108
LDI r2, 14
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 34
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 451
LDI r11, 63
LDI r12, 30
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
