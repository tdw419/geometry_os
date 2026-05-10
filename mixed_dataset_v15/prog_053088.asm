; DESCRIPTION: Composite: Draws a black line from (185, 234) to (357, 41) then Draws a magenta circle centered at (312, 124) with radius 69 then Places a black dot at position (396, 11).
; PLAN: r0=185(x1), r1=234(y1), r2=357(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=124(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=11(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 234
LDI r2, 357
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 124
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 11
LDI r12, 0x000000
PSET r10, r11, r12
HALT
