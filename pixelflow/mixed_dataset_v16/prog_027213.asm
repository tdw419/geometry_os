; DESCRIPTION: Composite: Draws a white line from (159, 245) to (147, 98) then Creates a orange circular shape at (457, 173) with radius 46 then Sets a single red pixel at (155, 175).
; PLAN: r0=159(x1), r1=245(y1), r2=147(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=173(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=175(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 245
LDI r2, 147
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 173
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 175
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
