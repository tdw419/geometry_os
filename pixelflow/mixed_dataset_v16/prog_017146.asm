; DESCRIPTION: Composite: Places a purple line segment connecting (261, 244) to (477, 226) then Places a white dot at position (115, 232) then Draws a white circle centered at (55, 28) with radius 26.
; PLAN: r0=261(x1), r1=244(y1), r2=477(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=232(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=55(x), r11=28(y), r12=26(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 244
LDI r2, 477
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 232
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 55
LDI r11, 28
LDI r12, 26
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
