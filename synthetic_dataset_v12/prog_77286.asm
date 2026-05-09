; DESCRIPTION: Composite: Renders a black line between points (156, 212) and (147, 227) then Places a black dot at position (179, 136) then Renders a cyan disk with center (415, 153) and radius 76.
; PLAN: r0=156(x1), r1=212(y1), r2=147(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=136(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=153(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 212
LDI r2, 147
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 136
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 415
LDI r11, 153
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
