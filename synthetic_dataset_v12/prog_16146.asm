; DESCRIPTION: Composite: Places a yellow dot at position (282, 111) then Draws a yellow line from (498, 84) to (161, 48) then Draws a purple circle centered at (85, 101) with radius 79.
; PLAN: r0=282(x), r1=111(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=498(x1), r6=84(y1), r7=161(x2), r8=48(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=101(y), r12=79(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 282
LDI r1, 111
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 498
LDI r6, 84
LDI r7, 161
LDI r8, 48
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 101
LDI r12, 79
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
