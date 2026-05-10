; DESCRIPTION: Composite: Renders a yellow line between points (414, 4) and (25, 107) then Places a yellow dot at position (26, 176) then Creates a white circular shape at (352, 111) with radius 63.
; PLAN: r0=414(x1), r1=4(y1), r2=25(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=176(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=352(x), r11=111(y), r12=63(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 4
LDI r2, 25
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 176
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 352
LDI r11, 111
LDI r12, 63
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
