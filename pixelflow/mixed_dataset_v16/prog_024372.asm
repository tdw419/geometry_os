; DESCRIPTION: Composite: Sets a single blue pixel at (388, 79) then Creates a yellow circular shape at (342, 176) with radius 72 then Places a orange line segment connecting (318, 123) to (269, 72).
; PLAN: r0=388(x), r1=79(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=176(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x1), r11=123(y1), r12=269(x2), r13=72(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 79
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 342
LDI r6, 176
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 123
LDI r12, 269
LDI r13, 72
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
