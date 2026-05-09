; DESCRIPTION: Composite: Draws a purple line from (44, 126) to (20, 188) then Renders a orange disk with center (424, 203) and radius 13 then Sets a single blue pixel at (241, 167).
; PLAN: r0=44(x1), r1=126(y1), r2=20(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=203(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=167(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 126
LDI r2, 20
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 203
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 167
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
