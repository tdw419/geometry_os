; DESCRIPTION: Composite: Draws a green line from (343, 127) to (291, 243) then Sets a single red pixel at (315, 149).
; PLAN: r0=343(x1), r1=127(y1), r2=291(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=149(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 127
LDI r2, 291
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 149
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
