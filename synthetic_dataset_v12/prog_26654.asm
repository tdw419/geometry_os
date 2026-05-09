; DESCRIPTION: Composite: Draws a magenta rectangle at (389, 121) with width 118 and height 105 then Sets a single blue pixel at (74, 245) then Places a white line segment connecting (466, 137) to (12, 149).
; PLAN: r0=389(x), r1=121(y), r2=118(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=466(x1), r11=137(y1), r12=12(x2), r13=149(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 121
LDI r2, 118
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 466
LDI r11, 137
LDI r12, 12
LDI r13, 149
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
