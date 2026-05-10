; DESCRIPTION: Composite: Places a black dot at position (153, 113) then Places a red 25x104 rectangle at position (47, 148) then Places a blue line segment connecting (192, 245) to (322, 163).
; PLAN: r0=153(x), r1=113(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=148(y), r7=25(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x1), r11=245(y1), r12=322(x2), r13=163(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 113
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 47
LDI r6, 148
LDI r7, 25
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 245
LDI r12, 322
LDI r13, 163
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
