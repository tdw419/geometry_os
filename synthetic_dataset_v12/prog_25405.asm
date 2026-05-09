; DESCRIPTION: Composite: Draws a black circle centered at (359, 162) with radius 60 then Creates a yellow rectangular region at (13, 99) spanning 17 by 90 pixels then Sets a single blue pixel at (390, 15).
; PLAN: r0=359(x), r1=162(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=99(y), r7=17(width), r8=90(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=15(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 162
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 99
LDI r7, 17
LDI r8, 90
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 15
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
