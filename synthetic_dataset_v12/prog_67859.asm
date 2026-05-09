; DESCRIPTION: Composite: Places a white dot at position (496, 191) then Renders a purple line between points (52, 43) and (122, 165) then Creates a yellow rectangular region at (432, 157) spanning 58 by 20 pixels.
; PLAN: r0=496(x), r1=191(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=43(y1), r7=122(x2), r8=165(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=432(x), r11=157(y), r12=58(width), r13=20(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 191
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 43
LDI r7, 122
LDI r8, 165
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 157
LDI r12, 58
LDI r13, 20
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
