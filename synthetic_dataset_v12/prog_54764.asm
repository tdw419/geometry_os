; DESCRIPTION: Composite: Places a yellow dot at position (189, 78) then Draws a blue circle centered at (235, 60) with radius 15 then Renders a red line between points (414, 242) and (498, 135).
; PLAN: r0=189(x), r1=78(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=60(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=414(x1), r11=242(y1), r12=498(x2), r13=135(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 78
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 235
LDI r6, 60
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 414
LDI r11, 242
LDI r12, 498
LDI r13, 135
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
