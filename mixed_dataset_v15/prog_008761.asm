; DESCRIPTION: Composite: Renders a black disk with center (351, 108) and radius 77 then Sets a single red pixel at (40, 218) then Renders a black box of size 10x105 starting at (248, 35).
; PLAN: r0=351(x), r1=108(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=218(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=248(x), r11=35(y), r12=10(width), r13=105(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 108
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 218
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 248
LDI r11, 35
LDI r12, 10
LDI r13, 105
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
