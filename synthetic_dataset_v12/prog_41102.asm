; DESCRIPTION: Composite: Draws a yellow rectangle at (321, 51) with width 87 and height 82 then Sets a single yellow pixel at (49, 46) then Renders a black disk with center (461, 144) and radius 36.
; PLAN: r0=321(x), r1=51(y), r2=87(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=46(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=461(x), r11=144(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 51
LDI r2, 87
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 46
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 461
LDI r11, 144
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
