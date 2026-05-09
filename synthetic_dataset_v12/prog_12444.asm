; DESCRIPTION: Composite: Places a orange line segment connecting (378, 20) to (266, 204) then Sets a single orange pixel at (332, 232) then Places a white circle of radius 78 at center (164, 122).
; PLAN: r0=378(x1), r1=20(y1), r2=266(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=232(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=164(x), r11=122(y), r12=78(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 378
LDI r1, 20
LDI r2, 266
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 232
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 164
LDI r11, 122
LDI r12, 78
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
