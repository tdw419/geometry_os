; DESCRIPTION: Composite: Draws a blue line from (391, 71) to (3, 95) then Sets a single yellow pixel at (299, 152) then Creates a black circular shape at (204, 176) with radius 34.
; PLAN: r0=391(x1), r1=71(y1), r2=3(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=152(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=204(x), r11=176(y), r12=34(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 71
LDI r2, 3
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 152
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 204
LDI r11, 176
LDI r12, 34
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
