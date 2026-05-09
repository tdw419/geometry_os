; DESCRIPTION: Composite: Places a black circle of radius 76 at center (389, 135) then Sets a single blue pixel at (219, 73) then Draws a black line from (469, 117) to (499, 226).
; PLAN: r0=389(x), r1=135(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=73(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=469(x1), r11=117(y1), r12=499(x2), r13=226(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 135
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 73
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 469
LDI r11, 117
LDI r12, 499
LDI r13, 226
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
