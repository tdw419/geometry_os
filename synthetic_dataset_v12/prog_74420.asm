; DESCRIPTION: Composite: Renders a orange disk with center (428, 112) and radius 78 then Sets a single black pixel at (63, 170) then Places a red line segment connecting (105, 136) to (97, 167).
; PLAN: r0=428(x), r1=112(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=105(x1), r11=136(y1), r12=97(x2), r13=167(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 112
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 105
LDI r11, 136
LDI r12, 97
LDI r13, 167
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
