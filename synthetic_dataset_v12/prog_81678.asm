; DESCRIPTION: Composite: Draws a orange circle centered at (429, 102) with radius 53 then Sets a single yellow pixel at (217, 13) then Renders a black line between points (429, 211) and (129, 211).
; PLAN: r0=429(x), r1=102(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=13(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=429(x1), r11=211(y1), r12=129(x2), r13=211(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 102
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 13
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 429
LDI r11, 211
LDI r12, 129
LDI r13, 211
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
