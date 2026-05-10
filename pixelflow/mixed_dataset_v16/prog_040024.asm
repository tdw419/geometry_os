; DESCRIPTION: Composite: Places a purple circle of radius 37 at center (211, 142) then Sets a single blue pixel at (307, 76) then Draws a blue line from (180, 232) to (468, 122).
; PLAN: r0=211(x), r1=142(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=76(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=180(x1), r11=232(y1), r12=468(x2), r13=122(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 142
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 76
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 232
LDI r12, 468
LDI r13, 122
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
