; DESCRIPTION: Composite: Draws a black line from (36, 94) to (177, 122) then Sets a single magenta pixel at (74, 122).
; PLAN: r0=36(x1), r1=94(y1), r2=177(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=122(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 36
LDI r1, 94
LDI r2, 177
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 122
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
