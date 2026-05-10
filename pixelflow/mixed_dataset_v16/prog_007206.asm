; DESCRIPTION: Composite: Renders a white line between points (389, 92) and (266, 18) then Sets a single magenta pixel at (60, 183).
; PLAN: r0=389(x1), r1=92(y1), r2=266(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 92
LDI r2, 266
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
