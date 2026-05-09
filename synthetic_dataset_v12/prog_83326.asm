; DESCRIPTION: Composite: Renders a white line between points (185, 252) and (469, 230) then Places a blue dot at position (359, 125) then Renders a blue disk with center (347, 136) and radius 15.
; PLAN: r0=185(x1), r1=252(y1), r2=469(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=125(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=347(x), r11=136(y), r12=15(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 185
LDI r1, 252
LDI r2, 469
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 125
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 347
LDI r11, 136
LDI r12, 15
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
