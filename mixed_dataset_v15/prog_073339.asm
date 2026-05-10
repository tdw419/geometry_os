; DESCRIPTION: Composite: Renders a orange line between points (171, 52) and (83, 66) then Places a purple dot at position (236, 105).
; PLAN: r0=171(x1), r1=52(y1), r2=83(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=105(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 52
LDI r2, 83
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 105
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
