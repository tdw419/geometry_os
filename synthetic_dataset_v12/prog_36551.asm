; DESCRIPTION: Composite: Draws a orange line from (359, 203) to (24, 161) then Sets a single green pixel at (390, 53).
; PLAN: r0=359(x1), r1=203(y1), r2=24(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=53(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 359
LDI r1, 203
LDI r2, 24
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 53
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
