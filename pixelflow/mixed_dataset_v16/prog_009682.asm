; DESCRIPTION: Composite: Draws a blue circle centered at (118, 86) with radius 29 then Places a black dot at position (11, 138) then Places a green line segment connecting (142, 250) to (496, 25).
; PLAN: r0=118(x), r1=86(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=138(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=142(x1), r11=250(y1), r12=496(x2), r13=25(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 86
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 138
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 142
LDI r11, 250
LDI r12, 496
LDI r13, 25
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
