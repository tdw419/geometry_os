; DESCRIPTION: Composite: Renders a purple line between points (95, 212) and (260, 147) then Places a magenta dot at position (49, 86) then Renders a black disk with center (286, 122) and radius 71.
; PLAN: r0=95(x1), r1=212(y1), r2=260(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=86(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=122(y), r12=71(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 212
LDI r2, 260
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 86
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 286
LDI r11, 122
LDI r12, 71
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
