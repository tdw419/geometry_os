; DESCRIPTION: Composite: Places a orange line segment connecting (124, 120) to (266, 215) then Sets a single yellow pixel at (390, 86).
; PLAN: r0=124(x1), r1=120(y1), r2=266(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=86(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 124
LDI r1, 120
LDI r2, 266
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 86
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
