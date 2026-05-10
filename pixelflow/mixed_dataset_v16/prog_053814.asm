; DESCRIPTION: Composite: Renders a magenta line between points (362, 118) and (315, 159) then Sets a single white pixel at (311, 161).
; PLAN: r0=362(x1), r1=118(y1), r2=315(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 118
LDI r2, 315
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
