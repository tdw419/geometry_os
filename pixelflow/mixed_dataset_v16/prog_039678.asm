; DESCRIPTION: Composite: Renders a orange line between points (403, 187) and (133, 154) then Sets a single blue pixel at (158, 87) then Places a blue circle of radius 53 at center (203, 131).
; PLAN: r0=403(x1), r1=187(y1), r2=133(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=87(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=203(x), r11=131(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 187
LDI r2, 133
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 87
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 131
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
