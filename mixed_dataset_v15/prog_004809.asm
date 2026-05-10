; DESCRIPTION: Composite: Places a orange line segment connecting (80, 109) to (431, 96) then Sets a single white pixel at (390, 87).
; PLAN: r0=80(x1), r1=109(y1), r2=431(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=87(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 109
LDI r2, 431
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 87
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
