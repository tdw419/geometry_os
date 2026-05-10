; DESCRIPTION: Composite: Sets a single green pixel at (353, 43) then Creates a blue rectangular region at (338, 4) spanning 104 by 97 pixels then Places a purple line segment connecting (147, 227) to (6, 83).
; PLAN: r0=353(x), r1=43(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=4(y), r7=104(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x1), r11=227(y1), r12=6(x2), r13=83(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 43
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 338
LDI r6, 4
LDI r7, 104
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 227
LDI r12, 6
LDI r13, 83
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
