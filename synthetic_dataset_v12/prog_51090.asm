; DESCRIPTION: Composite: Places a orange 43x12 rectangle at position (63, 235) then Sets a single black pixel at (211, 156) then Renders a purple disk with center (369, 76) and radius 68.
; PLAN: r0=63(x), r1=235(y), r2=43(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=156(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=369(x), r11=76(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 63
LDI r1, 235
LDI r2, 43
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 156
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 369
LDI r11, 76
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
