; DESCRIPTION: Composite: Draws a orange line from (233, 131) to (31, 11) then Sets a single green pixel at (469, 207) then Creates a green rectangular region at (281, 23) spanning 71 by 112 pixels.
; PLAN: r0=233(x1), r1=131(y1), r2=31(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=207(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=23(y), r12=71(width), r13=112(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 131
LDI r2, 31
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 207
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 281
LDI r11, 23
LDI r12, 71
LDI r13, 112
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
