; DESCRIPTION: Composite: Places a white dot at position (347, 134) then Renders a red line between points (322, 11) and (55, 107) then Renders a green disk with center (215, 190) and radius 25.
; PLAN: r0=347(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=322(x1), r6=11(y1), r7=55(x2), r8=107(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=190(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 11
LDI r7, 55
LDI r8, 107
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 190
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
