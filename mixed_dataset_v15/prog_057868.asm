; DESCRIPTION: Composite: Draws a orange line from (49, 61) to (88, 29) then Sets a single magenta pixel at (312, 235) then Places a yellow circle of radius 41 at center (342, 96).
; PLAN: r0=49(x1), r1=61(y1), r2=88(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=235(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=96(y), r12=41(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 61
LDI r2, 88
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 235
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 96
LDI r12, 41
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
