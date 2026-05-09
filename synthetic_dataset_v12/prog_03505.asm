; DESCRIPTION: Composite: Draws a yellow line from (159, 221) to (325, 209) then Sets a single red pixel at (321, 74).
; PLAN: r0=159(x1), r1=221(y1), r2=325(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=74(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 221
LDI r2, 325
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 74
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
