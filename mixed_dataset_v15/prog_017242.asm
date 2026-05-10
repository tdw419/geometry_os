; DESCRIPTION: Composite: Places a yellow dot at position (237, 108) then Places a orange circle of radius 18 at center (105, 118) then Renders a orange line between points (354, 148) and (351, 185).
; PLAN: r0=237(x), r1=108(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=118(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x1), r11=148(y1), r12=351(x2), r13=185(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 108
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 105
LDI r6, 118
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 148
LDI r12, 351
LDI r13, 185
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
