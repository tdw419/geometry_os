; DESCRIPTION: Composite: Places a purple dot at position (415, 30) then Places a blue circle of radius 15 at center (318, 184) then Places a orange line segment connecting (407, 9) to (272, 161).
; PLAN: r0=415(x), r1=30(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=184(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x1), r11=9(y1), r12=272(x2), r13=161(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 30
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 184
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 9
LDI r12, 272
LDI r13, 161
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
