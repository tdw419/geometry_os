; DESCRIPTION: Places a purple line segment connecting (193, 243) to (51, 230).
; PLAN: r0=193(x1), r1=243(y1), r2=51(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 243
LDI r2, 51
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
