; DESCRIPTION: Composite: Draws a orange line from (360, 158) to (274, 250) then Places a purple dot at position (366, 106) then Creates a black circular shape at (299, 85) with radius 11.
; PLAN: r0=360(x1), r1=158(y1), r2=274(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=106(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=85(y), r12=11(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 158
LDI r2, 274
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 106
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 299
LDI r11, 85
LDI r12, 11
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
