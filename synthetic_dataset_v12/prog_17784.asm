; DESCRIPTION: Composite: Draws a blue line from (43, 89) to (251, 48) then Sets a single white pixel at (2, 72).
; PLAN: r0=43(x1), r1=89(y1), r2=251(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=72(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 89
LDI r2, 251
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 72
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
