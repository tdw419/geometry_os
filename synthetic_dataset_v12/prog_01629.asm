; DESCRIPTION: Composite: Renders a black line between points (19, 234) and (146, 119) then Sets a single green pixel at (221, 28) then Creates a black circular shape at (336, 105) with radius 56.
; PLAN: r0=19(x1), r1=234(y1), r2=146(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=336(x), r11=105(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 234
LDI r2, 146
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 336
LDI r11, 105
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
