; DESCRIPTION: Composite: Sets a single red pixel at (497, 49) then Draws a red line from (60, 184) to (396, 33) then Draws a blue circle centered at (58, 160) with radius 38.
; PLAN: r0=497(x), r1=49(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=60(x1), r6=184(y1), r7=396(x2), r8=33(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=58(x), r11=160(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 497
LDI r1, 49
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 60
LDI r6, 184
LDI r7, 396
LDI r8, 33
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 160
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
