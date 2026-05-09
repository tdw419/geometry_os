; DESCRIPTION: Composite: Places a cyan dot at position (266, 250) then Places a orange line segment connecting (323, 2) to (159, 216) then Creates a magenta circular shape at (122, 105) with radius 46.
; PLAN: r0=266(x), r1=250(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=2(y1), r7=159(x2), r8=216(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=105(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 266
LDI r1, 250
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 2
LDI r7, 159
LDI r8, 216
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 105
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
