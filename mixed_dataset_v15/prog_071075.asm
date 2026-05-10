; DESCRIPTION: Draws a black line from (216, 112) to (363, 211).
; PLAN: r0=216(x1), r1=112(y1), r2=363(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 112
LDI r2, 363
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
