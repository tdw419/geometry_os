; DESCRIPTION: Renders a black line between points (145, 190) and (363, 105).
; PLAN: r0=145(x1), r1=190(y1), r2=363(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 190
LDI r2, 363
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
