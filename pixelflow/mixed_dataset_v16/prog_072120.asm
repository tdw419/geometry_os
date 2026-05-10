; DESCRIPTION: Composite: Renders a purple line between points (484, 219) and (339, 183) then Places a black dot at position (442, 94) then Places a orange circle of radius 33 at center (155, 134).
; PLAN: r0=484(x1), r1=219(y1), r2=339(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=94(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=155(x), r11=134(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 219
LDI r2, 339
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 94
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 155
LDI r11, 134
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
