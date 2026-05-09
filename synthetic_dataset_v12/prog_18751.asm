; DESCRIPTION: Composite: Draws a red line from (314, 89) to (389, 193) then Sets a single purple pixel at (474, 222) then Renders a yellow disk with center (275, 82) and radius 79.
; PLAN: r0=314(x1), r1=89(y1), r2=389(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=222(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=82(y), r12=79(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 89
LDI r2, 389
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 222
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 275
LDI r11, 82
LDI r12, 79
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
