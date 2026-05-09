; DESCRIPTION: Composite: Renders a orange line between points (265, 249) and (212, 110) then Sets a single yellow pixel at (29, 24).
; PLAN: r0=265(x1), r1=249(y1), r2=212(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=24(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 265
LDI r1, 249
LDI r2, 212
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 24
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
