; DESCRIPTION: Composite: Places a blue line segment connecting (389, 166) to (449, 229) then Places a orange dot at position (280, 55) then Renders a orange disk with center (163, 145) and radius 41.
; PLAN: r0=389(x1), r1=166(y1), r2=449(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=55(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=163(x), r11=145(y), r12=41(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 389
LDI r1, 166
LDI r2, 449
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 55
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 163
LDI r11, 145
LDI r12, 41
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
