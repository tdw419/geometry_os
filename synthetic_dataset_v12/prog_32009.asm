; DESCRIPTION: Composite: Places a red line segment connecting (232, 250) to (170, 61) then Places a blue dot at position (45, 98).
; PLAN: r0=232(x1), r1=250(y1), r2=170(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=98(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 250
LDI r2, 170
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 98
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
