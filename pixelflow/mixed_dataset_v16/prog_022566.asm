; DESCRIPTION: Composite: Places a orange line segment connecting (340, 95) to (145, 246) then Sets a single black pixel at (83, 233) then Draws a red circle centered at (329, 141) with radius 65.
; PLAN: r0=340(x1), r1=95(y1), r2=145(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=233(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=329(x), r11=141(y), r12=65(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 340
LDI r1, 95
LDI r2, 145
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 233
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 329
LDI r11, 141
LDI r12, 65
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
