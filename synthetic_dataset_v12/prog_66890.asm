; DESCRIPTION: Composite: Places a black dot at position (96, 163) then Renders a purple line between points (156, 45) and (341, 25) then Draws a white circle centered at (358, 126) with radius 64.
; PLAN: r0=96(x), r1=163(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=156(x1), r6=45(y1), r7=341(x2), r8=25(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=126(y), r12=64(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 96
LDI r1, 163
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 156
LDI r6, 45
LDI r7, 341
LDI r8, 25
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 126
LDI r12, 64
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
