; DESCRIPTION: Composite: Places a purple dot at position (322, 200) then Draws a black line from (147, 207) to (296, 155) then Renders a magenta disk with center (324, 89) and radius 66.
; PLAN: r0=322(x), r1=200(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=207(y1), r7=296(x2), r8=155(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=89(y), r12=66(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 322
LDI r1, 200
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 207
LDI r7, 296
LDI r8, 155
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 89
LDI r12, 66
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
