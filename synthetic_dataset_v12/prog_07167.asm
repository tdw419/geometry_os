; DESCRIPTION: Composite: Places a black line segment connecting (159, 86) to (450, 114) then Sets a single black pixel at (232, 72).
; PLAN: r0=159(x1), r1=86(y1), r2=450(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=72(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 86
LDI r2, 450
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 72
LDI r7, 0x000000
PSET r5, r6, r7
HALT
