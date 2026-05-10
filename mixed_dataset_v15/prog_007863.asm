; DESCRIPTION: Composite: Renders a black line between points (407, 60) and (138, 132) then Places a white dot at position (167, 217) then Renders a white disk with center (195, 136) and radius 49.
; PLAN: r0=407(x1), r1=60(y1), r2=138(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=217(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=136(y), r12=49(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 60
LDI r2, 138
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 217
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 195
LDI r11, 136
LDI r12, 49
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
