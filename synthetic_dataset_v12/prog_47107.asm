; DESCRIPTION: Composite: Draws a orange line from (35, 161) to (378, 55) then Sets a single orange pixel at (340, 108) then Places a white circle of radius 18 at center (402, 204).
; PLAN: r0=35(x1), r1=161(y1), r2=378(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=108(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=402(x), r11=204(y), r12=18(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 35
LDI r1, 161
LDI r2, 378
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 108
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 402
LDI r11, 204
LDI r12, 18
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
