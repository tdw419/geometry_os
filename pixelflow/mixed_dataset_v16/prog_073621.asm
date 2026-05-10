; DESCRIPTION: Draws a black line from (451, 85) to (36, 90).
; PLAN: r0=451(x1), r1=85(y1), r2=36(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 85
LDI r2, 36
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
