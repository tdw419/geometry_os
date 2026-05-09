; DESCRIPTION: Composite: Sets a single blue pixel at (501, 76) then Draws a blue line from (1, 225) to (351, 12) then Creates a yellow rectangular region at (37, 109) spanning 43 by 46 pixels.
; PLAN: r0=501(x), r1=76(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=1(x1), r6=225(y1), r7=351(x2), r8=12(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=109(y), r12=43(width), r13=46(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 501
LDI r1, 76
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 1
LDI r6, 225
LDI r7, 351
LDI r8, 12
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 109
LDI r12, 43
LDI r13, 46
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
