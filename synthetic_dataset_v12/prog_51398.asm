; DESCRIPTION: Composite: Renders a magenta line between points (481, 61) and (232, 66) then Sets a single blue pixel at (443, 135).
; PLAN: r0=481(x1), r1=61(y1), r2=232(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=135(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 481
LDI r1, 61
LDI r2, 232
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 135
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
