; DESCRIPTION: Composite: Places a orange circle of radius 15 at center (147, 179) then Places a white dot at position (153, 180) then Places a magenta line segment connecting (426, 238) to (389, 203).
; PLAN: r0=147(x), r1=179(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=180(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=426(x1), r11=238(y1), r12=389(x2), r13=203(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 179
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 180
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 426
LDI r11, 238
LDI r12, 389
LDI r13, 203
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
