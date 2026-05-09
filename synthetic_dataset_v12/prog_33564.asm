; DESCRIPTION: Composite: Draws a yellow line from (177, 11) to (160, 101) then Sets a single green pixel at (265, 71).
; PLAN: r0=177(x1), r1=11(y1), r2=160(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=71(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 11
LDI r2, 160
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 71
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
