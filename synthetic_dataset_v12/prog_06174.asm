; DESCRIPTION: Composite: Sets a single green pixel at (447, 148) then Draws a orange line from (108, 246) to (87, 77) then Places a black circle of radius 28 at center (211, 90).
; PLAN: r0=447(x), r1=148(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=108(x1), r6=246(y1), r7=87(x2), r8=77(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=90(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 447
LDI r1, 148
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 108
LDI r6, 246
LDI r7, 87
LDI r8, 77
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 90
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
