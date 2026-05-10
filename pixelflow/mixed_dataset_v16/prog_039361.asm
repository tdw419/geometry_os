; DESCRIPTION: Composite: Renders a black line between points (88, 23) and (408, 105) then Places a purple circle of radius 41 at center (275, 197) then Sets a single magenta pixel at (264, 159).
; PLAN: r0=88(x1), r1=23(y1), r2=408(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=197(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x), r11=159(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 23
LDI r2, 408
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 197
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 159
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
