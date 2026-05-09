; DESCRIPTION: Draws a black line from (362, 165) to (378, 145).
; PLAN: r0=362(x1), r1=165(y1), r2=378(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 165
LDI r2, 378
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
