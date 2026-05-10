; DESCRIPTION: Composite: Renders a magenta line between points (429, 114) and (411, 212) then Sets a single magenta pixel at (84, 66).
; PLAN: r0=429(x1), r1=114(y1), r2=411(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=66(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 429
LDI r1, 114
LDI r2, 411
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 66
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
