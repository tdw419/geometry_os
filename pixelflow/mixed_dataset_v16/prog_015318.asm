; DESCRIPTION: Composite: Places a blue line segment connecting (495, 85) to (67, 98) then Sets a single red pixel at (483, 193).
; PLAN: r0=495(x1), r1=85(y1), r2=67(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=193(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 495
LDI r1, 85
LDI r2, 67
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 193
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
