; DESCRIPTION: Composite: Draws a orange circle centered at (441, 109) with radius 54 then Renders a black line between points (449, 239) and (315, 199) then Sets a single magenta pixel at (33, 62).
; PLAN: r0=441(x), r1=109(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x1), r6=239(y1), r7=315(x2), r8=199(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=62(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 109
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 239
LDI r7, 315
LDI r8, 199
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 62
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
