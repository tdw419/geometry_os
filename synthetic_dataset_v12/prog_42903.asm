; DESCRIPTION: Draws a black line from (249, 169) to (483, 6).
; PLAN: r0=249(x1), r1=169(y1), r2=483(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 169
LDI r2, 483
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
