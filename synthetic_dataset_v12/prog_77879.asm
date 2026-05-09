; DESCRIPTION: Composite: Draws a blue circle centered at (94, 203) with radius 37 then Sets a single blue pixel at (469, 250) then Renders a blue line between points (241, 160) and (233, 142).
; PLAN: r0=94(x), r1=203(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=250(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=241(x1), r11=160(y1), r12=233(x2), r13=142(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 203
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 250
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 241
LDI r11, 160
LDI r12, 233
LDI r13, 142
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
