; DESCRIPTION: Composite: Places a purple circle of radius 34 at center (431, 34) then Renders a black line between points (327, 101) and (302, 185) then Sets a single black pixel at (118, 212).
; PLAN: r0=431(x), r1=34(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x1), r6=101(y1), r7=302(x2), r8=185(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=118(x), r11=212(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 431
LDI r1, 34
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 101
LDI r7, 302
LDI r8, 185
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 212
LDI r12, 0x000000
PSET r10, r11, r12
HALT
