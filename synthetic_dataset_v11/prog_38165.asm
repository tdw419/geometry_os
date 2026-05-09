; DESCRIPTION: Draws a purple line from (114, 51) to (184, 80).
; PLAN: r0=114(x1), r1=51(y1), r2=184(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 51
LDI r2, 184
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
