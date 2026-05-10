; DESCRIPTION: Composite: Renders a orange line between points (0, 48) and (436, 26) then Sets a single orange pixel at (22, 30) then Places a red circle of radius 53 at center (83, 155).
; PLAN: r0=0(x1), r1=48(y1), r2=436(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=30(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=83(x), r11=155(y), r12=53(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 48
LDI r2, 436
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 30
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 83
LDI r11, 155
LDI r12, 53
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
