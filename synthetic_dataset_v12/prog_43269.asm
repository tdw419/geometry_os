; DESCRIPTION: Composite: Draws a yellow line from (483, 155) to (207, 193) then Sets a single yellow pixel at (65, 59).
; PLAN: r0=483(x1), r1=155(y1), r2=207(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=59(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 483
LDI r1, 155
LDI r2, 207
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 59
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
