; DESCRIPTION: Composite: Renders a orange line between points (490, 105) and (152, 161) then Sets a single green pixel at (408, 51) then Places a red circle of radius 24 at center (181, 149).
; PLAN: r0=490(x1), r1=105(y1), r2=152(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=51(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=181(x), r11=149(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 490
LDI r1, 105
LDI r2, 152
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 51
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 181
LDI r11, 149
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
