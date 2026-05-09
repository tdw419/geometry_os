; DESCRIPTION: Draws a black line from (293, 134) to (483, 131).
; PLAN: r0=293(x1), r1=134(y1), r2=483(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 134
LDI r2, 483
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
