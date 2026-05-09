; DESCRIPTION: Composite: Draws a yellow line from (208, 180) to (247, 43) then Sets a single yellow pixel at (393, 82) then Places a yellow circle of radius 62 at center (190, 129).
; PLAN: r0=208(x1), r1=180(y1), r2=247(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=82(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=129(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 208
LDI r1, 180
LDI r2, 247
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 82
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 190
LDI r11, 129
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
