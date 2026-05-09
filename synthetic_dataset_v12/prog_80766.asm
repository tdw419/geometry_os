; DESCRIPTION: Composite: Draws a blue line from (37, 178) to (323, 238) then Sets a single black pixel at (390, 64) then Renders a yellow disk with center (132, 171) and radius 35.
; PLAN: r0=37(x1), r1=178(y1), r2=323(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=64(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=171(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 178
LDI r2, 323
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 64
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 132
LDI r11, 171
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
