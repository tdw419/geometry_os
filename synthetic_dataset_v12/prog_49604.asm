; DESCRIPTION: Draws a black line from (390, 161) to (112, 180).
; PLAN: r0=390(x1), r1=161(y1), r2=112(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 161
LDI r2, 112
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
