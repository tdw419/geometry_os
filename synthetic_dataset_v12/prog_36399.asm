; DESCRIPTION: Composite: Sets a single purple pixel at (315, 105) then Places a green line segment connecting (322, 206) to (347, 212) then Draws a yellow rectangle at (340, 26) with width 72 and height 69.
; PLAN: r0=315(x), r1=105(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=322(x1), r6=206(y1), r7=347(x2), r8=212(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=26(y), r12=72(width), r13=69(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 105
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 206
LDI r7, 347
LDI r8, 212
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 26
LDI r12, 72
LDI r13, 69
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
