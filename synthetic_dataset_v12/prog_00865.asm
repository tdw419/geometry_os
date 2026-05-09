; DESCRIPTION: Draws a black line from (363, 87) to (163, 4).
; PLAN: r0=363(x1), r1=87(y1), r2=163(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 87
LDI r2, 163
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
