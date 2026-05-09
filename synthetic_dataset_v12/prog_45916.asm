; DESCRIPTION: Composite: Draws a black line from (362, 44) to (110, 158) then Sets a single blue pixel at (19, 36).
; PLAN: r0=362(x1), r1=44(y1), r2=110(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=36(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 44
LDI r2, 110
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 36
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
