; DESCRIPTION: Composite: Draws a cyan line from (511, 204) to (315, 71) then Sets a single black pixel at (10, 102) then Creates a yellow circular shape at (385, 101) with radius 38.
; PLAN: r0=511(x1), r1=204(y1), r2=315(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=102(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=101(y), r12=38(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 511
LDI r1, 204
LDI r2, 315
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 102
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 385
LDI r11, 101
LDI r12, 38
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
