; DESCRIPTION: Composite: Draws a magenta line from (296, 138) to (241, 115) then Sets a single purple pixel at (52, 155).
; PLAN: r0=296(x1), r1=138(y1), r2=241(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=155(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 138
LDI r2, 241
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 155
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
