; DESCRIPTION: Composite: Renders a black line between points (249, 75) and (311, 34) then Places a magenta dot at position (497, 84).
; PLAN: r0=249(x1), r1=75(y1), r2=311(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=84(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 75
LDI r2, 311
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 84
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
