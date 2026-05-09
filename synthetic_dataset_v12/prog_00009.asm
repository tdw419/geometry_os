; DESCRIPTION: Composite: Places a black line segment connecting (410, 254) to (324, 85) then Places a orange dot at position (382, 142) then Creates a blue circular shape at (136, 108) with radius 61.
; PLAN: r0=410(x1), r1=254(y1), r2=324(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=142(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=136(x), r11=108(y), r12=61(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 254
LDI r2, 324
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 142
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 136
LDI r11, 108
LDI r12, 61
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
