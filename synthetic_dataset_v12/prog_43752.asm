; DESCRIPTION: Composite: Draws a green line from (510, 245) to (379, 65) then Sets a single blue pixel at (59, 121) then Renders a black disk with center (396, 187) and radius 10.
; PLAN: r0=510(x1), r1=245(y1), r2=379(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=121(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=396(x), r11=187(y), r12=10(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 245
LDI r2, 379
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 121
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 187
LDI r12, 10
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
