; DESCRIPTION: Draws a black line from (251, 65) to (302, 145).
; PLAN: r0=251(x1), r1=65(y1), r2=302(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 65
LDI r2, 302
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
