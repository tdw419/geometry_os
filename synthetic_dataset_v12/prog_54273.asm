; DESCRIPTION: Composite: Creates a green rectangular region at (469, 155) spanning 36 by 89 pixels then Sets a single green pixel at (343, 38) then Draws a black line from (381, 36) to (32, 105).
; PLAN: r0=469(x), r1=155(y), r2=36(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=38(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=381(x1), r11=36(y1), r12=32(x2), r13=105(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 155
LDI r2, 36
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 38
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 381
LDI r11, 36
LDI r12, 32
LDI r13, 105
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
