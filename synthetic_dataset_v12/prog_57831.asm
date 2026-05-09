; DESCRIPTION: Composite: Draws a red line from (93, 64) to (83, 105) then Sets a single magenta pixel at (96, 87).
; PLAN: r0=93(x1), r1=64(y1), r2=83(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=87(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 64
LDI r2, 83
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 87
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
